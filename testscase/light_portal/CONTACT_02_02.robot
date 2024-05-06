*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONTACT 02 02
    [Tags]           LIGHT_WEIGHT  CONTACT  CONTACT_02_02
    [Documentation]  ทดสอบ (ค้นหาแบบขั้นสูง) ผู้ติดต่อ
    # เริ่มต้นทดสอบ
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # ตรวจสอบค้นหาแบบขั้นสูง
    light_portal_home_features.Goto target page  ${tc_202 ['pre_data'] ['contact_page']}
    light_portal_contact___list_page.Click advanced search contact
    light_portal_contact___list_page.Input data of advanced search contact  ${tc_202 ['test_data'] ['advanced_search'] ['information_data']}
    light_portal_common_keywords.Scroll to header of page
    light_portal_contact___list_page.Click confirm advanced search contact
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_contact___teature.Verify contact list  hiding  1  ${tc_202 ['test_data'] ['advanced_search'] ['information_data'] ['code']}  ${tc_202 ['test_data'] ['advanced_search']}