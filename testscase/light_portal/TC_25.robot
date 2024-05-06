*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test click commmand button can redirect to return buy list page
    [Tags]           LIGHT_WEIGHT  TC2  TC_25
    [Documentation]  Test click commmand button can redirect to return buy list page
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto buy list page
    light_portal_buy___list_page.Click advance search
    light_portal_buy_list_features.Clear advance search checkbox
    light_portal_buy_list_features.Input advance search id customer prouduct and refer  ${tc_25['search_id']}  ${tc_25['search_customer']}  ${tc_25['search_product']}  ${tc_25['search_refer']}
    light_portal_buy___list_page.Click checkbox wait transfer of transfer product
    light_portal_buy___list_page.Click checkbox wait payment of payment status
    light_portal_buy___list_page.Click confirm advance search
    light_portal_buy___list_page.Click select buy list by id  ${tc_25['search_id']}
    light_portal_detail_buy_list_page.Click command button
    light_portal_detail_buy_list_page.Click return product
    light_portal_return_buy_list_page.Verify return buy list page title