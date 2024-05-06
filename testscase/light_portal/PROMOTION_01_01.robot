*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST PROMOTION 01 01
    [Tags]           LIGHT_WEIGHT  PROMOTION  PROMOTION_01_01
    [Documentation]  ทดสอบโปรโมชัน

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    Log  [สร้างโปรโมชัน]
            light_portal_home_features.Goto target page  ${promotion ['promotion_01_01'] ['pre_data'] ['promotion_list_page']}
            ${name_promotion_1}=  light_portal_promotion___feature.Create promotion list  ${promotion ['promotion_01_01'] ['test_data'] ['add_promotion']}
            light_portal_side_menu_bar.Click sub menu promotion list page
            ${name_promotion_2}=  light_portal_promotion___feature.Create promotion list  ${promotion ['promotion_01_01'] ['test_data'] ['add_promotion']}

    Log  [แก้ไขโปรโมชัน]
            light_portal_side_menu_bar.Click sub menu promotion list page
            light_portal_promotion___feature.Update promotion list  ${name_promotion_1}  ${promotion ['promotion_01_01'] ['test_data'] ['edit_promotion']}

    Log  [ขยายโปรโมชัน 2 รายการ]
            light_portal_side_menu_bar.Click sub menu promotion list page
            light_portal_promotion___feature.Expand promotion list  ${name_promotion_2}  ${promotion ['promotion_01_01'] ['test_data'] ['expand_promotion'][0]}
            light_portal_side_menu_bar.Click sub menu promotion list page
            light_portal_promotion___feature.Expand promotion list  ${name_promotion_2}  ${promotion ['promotion_01_01'] ['test_data'] ['expand_promotion'][1]}

    Log  [ลบโปรโมชัน]
            light_portal_side_menu_bar.Click sub menu promotion list page
            light_portal_promotion___list_page.Click delete promotion by name  ${name_promotion_1}
            light_portal_promotion___list_page.Click delete promotion by name  ${name_promotion_2}