*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can search sell list and verify deta should be corrected
    [Tags]           LIGHT_WEIGHT  TC2  TC_13
    [Documentation]  Test can search sell list and verify deta should be corrected
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Go to detail sell list page
    light_portal_detail_sell_list_page.Click into search advance page
    light_portal_detail_sell_list_page.Search on advance page by name  ${detail_sell_list_page['name_of_order_on_advance_search_page']}
    light_portal_detail_sell_list_page.Check cod box on search advance page
    light_portal_detail_sell_list_page.Check hiden list box on search advance page
    light_portal_detail_sell_list_page.Click search button on advance search page
    light_portal_detail_sell_list_page.Check order on advance search page  ${detail_sell_list_page['name_of_order_on_advance_search_page']}