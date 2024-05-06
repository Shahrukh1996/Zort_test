*** Settings ***
Resource         ${CURDIR}/../../resources/import.robot
Test Teardown    light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test return product list advance search
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_117
    [Documentation]  Test return product list advance search

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return buy list
    light_portal_return_buy_list_page.Click advance search
    light_portal_return_buy_list_features.Input advance search and click confirm search  ${tc_ui_117}
    light_portal_return_buy_list_page.Verify return buy list id  ${tc_ui_117['return_buy_id']}
    light_portal_return_buy_list_page.Verify return buy list refer name  ${tc_ui_117['refer']}
    light_portal_return_buy_list_page.Verify return buy list customer name  ${tc_ui_117['customer_name']}