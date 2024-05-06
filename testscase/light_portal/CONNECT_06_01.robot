*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONNECT 06 01
    [Tags]           LIGHT_WEIGHT  CONNECT  CONNECT_06_01
    [Documentation]  ทดสอบอัปเดตการเชื่อมต่อกับ (Marketplace)
    # เริ่มต้นทดสอบ
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # ทดสอบการอัปเดต
    light_portal_home_features.Goto target page  ${connect ['contect_06_01'] ['pre_data'] ['connect_list_page']}
    light_portal_connect___teature.Update marketplace of line myshop  ${connect ['contect_06_01'] ['test_data'] ['name']}