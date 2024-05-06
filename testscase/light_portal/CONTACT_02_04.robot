*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONTACT 02 04
    [Tags]           LIGHT_WEIGHT  CONTACT  CONTACT_02_04
    [Documentation]  ทดสอบ (สร้าง เพิ่มถอดผู้ติดต่อ ลบ) หมวดหมู่
    # เริ่มต้นทดสอบ
        light_portal_common_keywords.Open zortout website
        light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # ทดสอบสร้าง 1 หมวดหมู่
        light_portal_home_features.Goto target page  ${tc_204 ['pre_data'] ['contact_page']}
        light_portal_contact___list_page.Click add category
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Input data of add category  ${tc_204 ['test_data'] ['category_contact'] ['name']}
        light_portal_contact___list_page.Click confirm add category
    # ทดสอบเพิ่ม 1 ผู้ติดต่อ
        light_portal_contact___list_page.Click category tab  ${tc_204 ['pre_data'] ['tab_total']}
        light_portal_contact___list_page.Quick search contact  ${tc_204 ['test_data'] ['category_contact'] ['code']}
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Click check box list by code  ${tc_204 ['test_data'] ['category_contact'] ['code']}
        light_portal_contact___list_page.Click add list to category
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Click select category  ${tc_204 ['test_data'] ['category_contact'] ['name']}
        light_portal_contact___list_page.Click confirm select category
        light_portal_common_keywords.Wait for jquery loading completed
    # ทดสอบถอนผู้ติดต่อ
        light_portal_contact___list_page.Click category tab  ${tc_204 ['pre_data'] ['tab_test']}
        light_portal_contact___list_page.Click check box list by code  ${tc_204 ['test_data'] ['category_contact'] ['code']}
        light_portal_contact___list_page.Click subtract from category
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Check list not found
    # ทดสอบลบหมวดหมู่
        light_portal_contact___list_page.Click overview category  ${tc_204 ['test_data'] ['category_contact'] ['name']}
        light_portal_contact___list_page.Click delete category
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_contact___list_page.Check category tab not found  ${tc_204 ['pre_data'] ['tab_test']}