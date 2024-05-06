*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test click commmand button can redirect to return sell list page
    [Tags]           LIGHT_WEIGHT  TC2  TC_24
    [Documentation]   Test click commmand button can redirect to return sell list page
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Go to detail sell list page
    light_portal_view_sell_list_page.Click advance search
    light_portal_view_sell_list_features.Input advance search  ${tc_24['search_id']}  ${tc_24['search_customer']}  ${tc_24['search_product']}  ${tc_24['search_refer']}  ${tc_24['search_shipping']}
    light_portal_view_sell_list_page.Click select from shipping date
    light_portal_common_keywords.Click select datepicker date month and year  ${tc_24['datetime']['day']}  ${tc_24['datetime']['month']}  ${tc_24['datetime']['year']}
    light_portal_view_sell_list_page.Click select to shipping date
    light_portal_common_keywords.Click select datepicker date month and year  ${tc_24['datetime']['day']}  ${tc_24['datetime']['month']}  ${tc_24['datetime']['year']}
    light_portal_view_sell_list_features.Clear advance search checkbox
    light_portal_view_sell_list_page.Click checkbox wait payment of payment status
    light_portal_view_sell_list_page.Click checkbox wait transfer of transfer product
    light_portal_common_keywords.Scroll to top of page
    light_portal_view_sell_list_page.Click confirm advance search
    light_portal_view_sell_list_page.click select order by code list  ${tc_24['search_id']}
    light_portal_detail_sell_list_page.Click command button
    light_portal_detail_sell_list_page.Click return product command
    light_portal_return_sell_list_page.Verify return sell list page title