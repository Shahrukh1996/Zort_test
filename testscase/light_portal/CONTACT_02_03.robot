*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONTACT 02 03
    [Tags]           LIGHT_WEIGHT  CONTACT  CONTACT_02_03
    [Documentation]  ทดสอบ (นำเข้าไฟล์) ผู้ติดต่อ
    # เริ่มต้นทดสอบ
        light_portal_common_keywords.Open zortout website
        light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # ทดสอบนำเข้าไฟล์
        light_portal_home_features.Goto target page  ${tc_203 ['pre_data'] ['contact_page']}
        light_portal_contact___list_page.Click add import contact
        light_portal_contact___list_page.Choose file contact
        light_portal_contact___list_page.Click confirm import contact
        # light_portal_common_keywords.Close toast success
        light_portal_common_keywords.Wait for jquery loading completed
        SeleniumLibrary.Reload page
        light_portal_contact___list_page.Quick search contact  ${tc_203 ['test_data'] ['import_contact'] ['information_data'] ['code']}
        light_portal_contact___teature.Verify contact list  nomall  1  ${tc_203 ['test_data'] ['import_contact'] ['information_data'] ['code']}  ${tc_203 ['test_data'] ['import_contact']}
    # ทดสอบลบรายการ
        ${indexID}=  light_portal_contact___list_page.Get indexID by code  ${tc_203 ['test_data'] ['import_contact'] ['information_data'] ['code']}
        light_portal_contact___list_page.Click delete contact  ${indexID}
        light_portal_contact___list_page.Click confirm popUp delete
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Check code contact at delete  ${tc_203 ['test_data'] ['import_contact'] ['information_data'] ['code']}