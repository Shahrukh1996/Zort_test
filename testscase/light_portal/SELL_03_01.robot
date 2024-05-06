*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST SELL 03 01
    [Tags]           LIGHT_WEIGHT  SELL  SELL_03_01
    [Documentation]  ทดสอบแก้ไขรายการขาย ด้วยจำนวนสินค้า 120 รายการ

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    Log  [เลือกรายการขาย]
            light_portal_home_features.Goto target page  ${sell ['sell_03_01'] ['pre_data'] ['sell_list_page']}
            light_portal_sell___list_page.Click open advanced search
            light_portal_sell___list_page.Click close advanced search
            light_portal_sell___feature.Quick search  ${sell ['sell_03_01'] ['test_data'] ['sell_list_name']}
            light_portal_sell___list_page.Click sell list by name  ${sell ['sell_03_01'] ['test_data'] ['sell_list_name']}

    Log  [แก้ไขรายการขาย]
            light_portal_sell___detail_page.Click order of sell detail
            light_portal_sell___detail_page.Click edit of sell detail
            light_portal_common_keywords.Scroll to footer of page
            light_portal_sell___edit_page.Click confirm update of sell edit
            light_portal_sell___detail_page.Click cancel edit contact of sell detail