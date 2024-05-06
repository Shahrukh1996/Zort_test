
*** Variables ***
&{xpt_date_input}    year=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-years']//th[@class='switch']/ancestor::table/tbody//span[text()='///YEAR///']
...                  month=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-months']//th[@class='switch']/ancestor::table/tbody//span[///MONTH///]
...                  day=//div[@class='datetimepicker-months']//th[@class='switch']/ancestor::table/tbody//span[///MONTH///]/ancestor::div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-days']//tbody//td[text()='///DAY///']
&{xpt_date_button}   select_day=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-days']//th[@class='switch']
...                  select_month=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-months']//th[@class='switch']
...                  select_year=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-years']//th[@class='switch']

&{xpt_login_input}   username=//input[@id='usernametxt']
...                  password=//input[@id='passwordtxt']
&{xpt_login_button}  login=//button[@onclick='login()']

&{xpt_time_input}    hour=//div[@class='datetimepicker-hours' and @style='display: block;']//span[contains(@class, 'hour') and text()='///HOUR///']
...                  minute=//div[@class='datetimepicker-minutes' and @style='display: block;']//span[contains(@class, 'minute') and text()='///MINUTE///']

&{xpt_toast_text}    element_toast_success=//div[@id='toast-container']
...                  title_toast_success=//div[@id='toast-container']//div[@class='toast-title']

${xpt_popUp_home_page}  //div[@id='marketingcontentModal']//button[@class='close']

${xpt_main_menu}        //ul[@id='sidenav']//a//span[text()='///main_menu///']
${xpt_sub_menu}         //ul[@id='sidenav']//a//span[text()='///main_menu///']/../following-sibling::ul[@class='collapse in']/li/a[text()='///sub_menu///']



*** Keywords ***
Open zortout website
    [Documentation]  เปิดเว็บแอปพลิเคชัน
    Set library search order  SeleniumLibrary
    SeleniumLibrary.Open browser  ${remoteUrl}  Chrome
    SeleniumLibrary.Maximize browser window

Close zortout website
    [Documentation]  ปิดเว็บแอปพลิเคชัน
    SeleniumLibrary.Close all browsers

Close toast success
    [Documentation]  ปิด toast success
    SeleniumLibrary.Click element  ${xpt_toast_text.title_toast_success}

Login to access
    [Documentation]  ลงทะเบียนเข้าใช้งาน
    [Arguments]    ${username}   ${password}
    SeleniumLibrary.Input text  ${xpt_login_input.username}  ${username}
    SeleniumLibrary.Input text  ${xpt_login_input.password}  ${password}
    SeleniumLibrary.Click element  ${xpt_login_button.login}
    common_keywords_middle_portal.Wait for jquery loading completed

Verify popup home page
    ${status}=  BuiltIn.Run keyword and return status  SeleniumLibrary.Wait until element is visible  ${xpt_popUp_home_page}  ${small_timeout}
    IF  ${status}
        SeleniumLibrary.Click element  ${xpt_popUp_home_page}
        SeleniumLibrary.Wait until element is not visible  ${xpt_popUp_home_page}
    END
    [Return]  ${status}

Goto target page
    [Arguments]      ${navbar_menu}
    [Documentation]  ไปยังหน้าทดสอบ
    common_keywords_middle_portal.Wait for jquery loading completed
    common_keywords_middle_portal.Click main menu  ${navbar_menu}
    Sleep  1s
    common_keywords_middle_portal.Click sub menu  ${navbar_menu}

Click main menu
    [Arguments]      ${navbar_menu}
    [Documentation]  คลิกหน้าเมนูหลัก
    ${new_xpath}=  String.Replace string  ${xpt_main_menu}  ///main_menu///  ${navbar_menu ['main_menu']}
    SeleniumLibrary.Click element  ${new_xpath}

Click sub menu
    [Arguments]      ${navbar_menu}
    [Documentation]  คลิกหน้าเมนูรอง
    ${new_xpath1}=  String.Replace string  ${xpt_sub_menu}  ///main_menu///  ${navbar_menu ['main_menu']}
    ${new_xpath2}=  String.Replace string  ${new_xpath1}  ///sub_menu///  ${navbar_menu ['sub_menu']}
    SeleniumLibrary.Click element  ${new_xpath2}

Get current day
    [Documentation]  Get current date
    ${current_date}  DateTime.Get current date  result_format=%d
    [Return]  ${current_date}

Get current month
    [Documentation]  Get current month
    ${current_month}  DateTime.Get current date  result_format=%m
    [Return]  ${current_month}

Get current year
    [Documentation]  Get current year
    ${current_year}  DateTime.Get current date  result_format=%Y
    ${current_year}  BuiltIn.Evaluate  ${current_year}+543
    [Return]  ${current_year}

Back to previous page
    [Documentation]  Back to previous page
    SeleniumLibrary.Go back

Scroll to header of page
    [Documentation]  เลื่อนไปยังบนสุดของหน้าเว็บฯ
    SeleniumLibrary.Execute javascript  window.scrollTo(0,0)

Scroll to footer of page
    [Documentation]  เลื่อนไปยังล่างสุดของหน้าเว็บฯ
    SeleniumLibrary.Execute javascript  window.scrollTo(0, document.body.scrollHeight)

Wait for jquery loading completed
    [Arguments]      ${timeout}=30
    [Documentation]  รอจนจบการทำงานของ jquery
    FOR     ${i}    IN RANGE    ${timeout}
        ${is_loading_complated}=  SeleniumLibrary.Execute javascript  return window.jQuery.active === 0;
        Exit for loop if  ${is_loading_complated}
        BuiltIn.Sleep  2s
    END

Auto keyword verify toast success
    [Documentation]  เช็ค toast success ในช่วง 5s
    common_keywords_middle_portal.Wait for jquery loading completed
    SeleniumLibrary.Wait until element is not visible  ${xpt_toast_text.element_toast_success}  timeout=5

Auto keyword random string
    [Arguments]  ${str_befor}
    [Documentation]  สุ่มอักขรธ 6 ตัว
    ${str_random}=  String.Generate random string  6  [LOWER][NUMBERS]
    ${str_after}=  BuiltIn.Set Variable  ${str_befor}${str_random}
    [Return]  ${str_after}

Auto keyword clear text
    [Arguments]      ${xpt_input}
    [Documentation]  เคลียร์ข้อมูลในช่องกรอก
    SeleniumLibrary.Wait until element is visible  ${xpt_input}
    SeleniumLibrary.Click element  ${xpt_input}
    ${value}=  SeleniumLibrary.Get element attribute  ${xpt_input}  value
    ${backspaces count}=  BuiltIn.Get length  ${value}
    Run Keyword If  """${value}""" != ''
    ...  BuiltIn.Repeat keyword  ${backspaces count +1}  SeleniumLibrary.Press keys  ${xpt_input}  \\08

Auto keyword datepicker
    [Arguments]      ${date}
    [Documentation]  เลือกวันเดือนปี datepicker
    SeleniumLibrary.Click element  ${xpt_date_button.select_day}
    SeleniumLibrary.Click element  ${xpt_date_button.select_month}
    FOR  ${keys}  IN  @{date.keys()}
        &{str_replace}=  BuiltIn.Create dictionary  ///DAY///=${date ['day']}  ///MONTH///=${date ['month']}  ///YEAR///=${date ['year']}
        ${new_xpath}=  common_keywords_middle_portal.Auto keyword replace string  ${xpt_date_input.${keys}}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
    END

Auto keyword timepicker
    [Arguments]      ${time}
    [Documentation]  เลือกเวลา timepicker
    FOR  ${keys}  IN  @{time.keys()}
        &{str_replace}=  BuiltIn.Create dictionary  ///MINUTE///=${time ['minute']}  ///HOUR///=${time ['hour']}
        ${new_xpath}=  common_keywords_middle_portal.Auto keyword replace string  ${xpt_time_input.${keys}}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
    END

Auto keyword replace string
    [Arguments]      ${xpt_change_befor}  ${str_data_change}
    [Documentation]  จัดการแปลง str
    ${xpt_result}=  Create list
    @{keys}=  Collections.Get dictionary keys  ${str_data_change}  sort_keys=${False}
    FOR  ${index}  IN  @{keys}
            IF  '${index}' == '${keys}[0]'
                ${xpt_change_after}=  String.Replace string  ${xpt_change_befor}  ${index}  ${str_data_change}[${index}]
                ${xpt_result}=  BuiltIn.Set variable  ${xpt_change_after}
            ELSE
                ${xpt_result}=  String.Replace string  ${xpt_result}  ${index}  ${str_data_change}[${index}]
            END
    END
    [Return]  ${xpt_result}