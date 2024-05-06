*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test add edit and delete category
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_110
    [Documentation]  ทดสอบการ (สร้าง : แก้ไข : ลบ) รายการหมวดหมู่
    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}

    Log  [สร้าง : หมวดหมู่]
            light_portal_home_features.Goto target page  ${tc_110 ['pre_data']}
            ${category_name_add}=  light_portal_category_features.Add category list  ${tc_110 ['test_data']}
            light_portal_common_keywords.Wait for last element of any page is displayed
            light_portal_category_list_page.Verify success category list  ${category_name_add}

    Log  [แก้ไข : หมวดหมู่]
            light_portal_search_features.Quick search by category  ${category_name_add}
            ${category_name_edit}=  light_portal_category_features.Edit category list  ${tc_110 ['test_data']}  ${category_name_add}
            light_portal_common_keywords.Wait for last element of any page is displayed
            light_portal_category_list_page.Verify success category list  ${category_name_edit}
            
    Log  [ลบ : หมวดหมู่]
            light_portal_search_features.Quick search by category  ${category_name_edit}
            light_portal_category_features.Delete category list  ${category_name_edit}
            light_portal_category_list_page.Verify delete category list  ${category_name_edit}