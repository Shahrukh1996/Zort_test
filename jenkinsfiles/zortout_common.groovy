//This is a common function for runner            
//Global runner config

retryprefix = "--prerunmodifier DataDriver.rerunfailed:output.xml  --output rerun.xml -r rerunreport.html"
max_retry = 1
max_retry_connect_docker = 2

def runTestWithRetry(concurrent, exclude, include, hagridVersion, testcase_folder, project){
    def retry_connect_to_docker = true
    try {
        echo "connecting to docker"
        withCredentials([usernamePassword( credentialsId: 'zortout_docker', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
            bat """
                docker login -u $USER -p $PASSWORD
                docker version
            """
            echo "Login success"
            retry_connect_to_docker = false
        }
    }
    catch (err) {
        for(int i=0; i<max_retry_connect_docker; i++) {
            if (retry_connect_to_docker) {
                echo "retry count ${i} connecting"
                sleep(60)
                try {
                    withCredentials([usernamePassword( credentialsId: 'zortout_docker', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
                        bat """
                            docker login -u $USER -p $PASSWORD
                            docker version
                        """
                        echo "Login success"
                        retry_connect_to_docker = false
                    }
                }
                catch (err2) {
                    echo "retry connecting to docker again"
                }
            }
        }
    }
    try {
            bat """
                docker run -m 4G --cpus="2.0" --name robotframework_docker_${project}_$BUILD_NUMBER \
                -v /dev/shm:/dev/shm \
                -v $WORKSPACE:/reports \
                -v $WORKSPACE:${testcase_folder} \
                -e PABOT_OPTIONS=--pabotlib \
                -e ROBOT_THREADS=${concurrent} \
                -e ROBOT_TESTS_DIR=${testcase_folder} \
                -e ROBOT_OPTIONS="${include} ${exclude} --outputdir /reports" \
                zortoutjenkins/rbf-with-browser:${hagridVersion}
            """
    }
    catch (err) {
        def needRetry = true
        for(int i =0; i<max_retry; i++) {
            if (needRetry) {
                bat "docker stop robotframework_docker_${project}_$BUILD_NUMBER"
                bat "docker rm -f robotframework_docker_${project}_$BUILD_NUMBER"
                echo "removed container robotframework_docker_${project}_$BUILD_NUMBER"
                try{
                    bat """
                        docker run -m 4G --cpus="2.0" --name robotframework_docker_${project}_$BUILD_NUMBER \
                        -v /dev/shm:/dev/shm \
                        -v $WORKSPACE:/reports \
                        -v $WORKSPACE:${testcase_folder} \
                        -e PABOT_OPTIONS="--pabotlib --prerunmodifier DataDriver.rerunfailed:/reports/output.xml --output rerun.xml -r rerunreport.html" \
                        -e ROBOT_THREADS=${concurrent} \
                        -e ROBOT_TESTS_DIR=${testcase_folder} \
                        -e ROBOT_OPTIONS="--outputdir /reports" \
                        zortoutjenkins/rbf-with-browser:${hagridVersion}
                        dir
                    """
                }
                catch (err2){
                    echo "Nothing need to implement"
                }
                try{
                    bat 'python -m robot.rebot -r final_report -o final_report --merge output.xml  rerun.xml'
                }
                catch (err3) {
                    echo "Nothing need to implement"
                }
                try {
                    bat """
                    echo 'Merged result done'
                    rename report.html first_report.html
                    rename output.xml first_output.xml
                    rename final_report.xml output.xml
                    rename final_report.html report.html
                    echo 'Rename result done'
                    dir
                    """
                }
                catch (err4){
                    echo "nothing to rename"
                }
            }
        }
    }
}

def notify_result_to_dumbledore(report_html_file,output_xml_file){
    try{
        bat """
            curl --location --request POST 'http://125.26.15.143:21000/upload_result' \
                --form 'report_html_file=@"${report_html_file}"' \
                --form 'output_xml_file=@"${output_xml_file}"' \
                --form 'job_name="${JOB_NAME}"' \
                --form 'build_url="${BUILD_URL}"' \
                --form 'build_number="${BUILD_NUMBER}"' \
                --form 'branch_name="${GIT_BRANCH}"' \
                --form 'log_type="robot"'
        """
    }
    catch(err){
        echo "error while notify_result_to_dumbledore"
    }
}

def notify_result_to_lark(webhook){
    def failed_count = tm('${ROBOT_FAILED}').toInteger()
    def passed_count = tm('${ROBOT_PASSED}').toInteger()
    def robotlog = "${BUILD_URL}" + "/report/log.html"
    robotlog = robotlog.replaceAll( '192.168.31.3:8080', '171.103.241.242:8080' )
    bat """
    curl -X POST -H "Content-Type: application/json" -d "{\\"msg_type\\":\\"post\\",\\"content\\":{\\"post\\":{\\"en_us\\":{\\"title\\":\\"${JOB_NAME}#${BUILD_NUMBER}\\",\\"content\\":[[{\\"tag\\":\\"text\\",\\"text\\":\\"**BRANCH**:${GIT_BRANCH}\\"}],[{\\"tag\\":\\"text\\",\\"text\\":\\"Passed:${passed_count}\\"}],[{\\"tag\\":\\"text\\",\\"text\\":\\"Failed:${failed_count}\\"}],[{\\"tag\\":\\"text\\",\\"text\\":\\"after${currentBuild.durationString}\\"}],[{\\"tag\\":\\"a\\",\\"text\\":\\"(Report)\\",\\"href\\":\\"${robotlog}\\"}]]}}}}" ${webhook}
    """
}

return this