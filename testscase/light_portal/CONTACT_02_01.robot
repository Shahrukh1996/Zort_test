*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONTACT 02 01
    [Tags]           LIGHT_WEIGHT  CONTACT  CONTACT_02_01
    [Documentation]  ทดสอบรายการผู้ติดต่อ (สร้าง ค้นหาปกติ แก้ไข ปักถอดหมุด)
    # เริ่มต้นทดสอบ
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # ตรวจสอบสร้าง 1 รายการผู้ติดต่อ
    light_portal_home_features.Goto target page  ${tc_201 ['pre_data'] ['contact_page']}
    light_portal_contact___list_page.Click add contact
    ${code_contact}=  light_portal_contact___teature.Create contact list  ${tc_201 ['test_data'] ['add_contact']}
    light_portal_contact___teature.Verify contact list  nomall  1  ${code_contact}  ${tc_201 ['test_data'] ['add_contact']}
    # ตรวจสอบค้นหาแบบปกติ
    light_portal_contact___list_page.Quick search contact  ${code_contact}
    light_portal_contact___teature.Verify contact list  nomall  1  ${code_contact}  ${tc_201 ['test_data'] ['add_contact']}
    # ตรวจสอบแก้ไขรายการ
    ${indexID}=  light_portal_contact___list_page.Get indexID by code  ${code_contact}
    light_portal_contact___list_page.Click edit contact  ${indexID}
    light_portal_contact___teature.Update contact list  ${tc_201 ['test_data'] ['edit_contact']}
    light_portal_side_menu_bar.Click sub menu  ${tc_201 ['pre_data'] ['contact_page']}
    light_portal_contact___teature.Verify contact list  nomall  1  ${code_contact}  ${tc_201 ['test_data'] ['edit_contact']}
    # # ตรวจสอบปักหมุดรายการ
    # ${indexID}  ${code_contact}=  light_portal_contact___list_page.Get indexID and code by indexNo  ${tc_201 ['test_data'] ['pin_contact'] ['indexNo'] ['un_pin']}
    # light_portal_contact___list_page.Click pin it contact  ${indexID}
    # light_portal_common_keywords.Wait for jquery loading completed
    # SeleniumLibrary.Reload page
    # light_portal_contact___list_page.Check contact list for pin  ${tc_201 ['test_data'] ['pin_contact'] ['indexNo'] ['pin_in']}  ${code_contact}
    # # ตรวจสอบถอดหมุดรายการ
    # light_portal_contact___list_page.Click un pin contact  ${indexID}
    # light_portal_common_keywords.Wait for jquery loading completed
    # SeleniumLibrary.Reload page
    # light_portal_contact___list_page.Check contact list for pin  ${tc_201 ['test_data'] ['pin_contact'] ['indexNo'] ['un_pin']}  ${code_contact}