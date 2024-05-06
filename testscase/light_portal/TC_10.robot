*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test create sell list from file
    [Tags]           LIGHT_WEIGHT  TC1  TC_10
    [Documentation]  Test create sell list from file
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Go to detail sell list page
    light_portal_detail_sell_list_page.Verify sell template on sell list data not visible on page  ${detail_sell_list_page['order_number_in_excel_file']}
    Sleep  5s
    light_portal_detail_sell_list_features.Choose sell list from file
    light_portal_detail_sell_list_features.Verify order number should be corrected  ${detail_sell_list_page['order_number_in_excel_file']}