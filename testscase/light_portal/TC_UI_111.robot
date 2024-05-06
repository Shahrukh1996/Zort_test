*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user create and edit return product list
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_111
    [Documentation]  Test user create and edit return product list

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto target page  ${tc_ui_111 ['pre_data'] ['retrun_buy_page']}
    light_portal_return_buy_list_page.Click create return buy list
    ${return_buy_list_id}=  light_portal_add_return_buy_page.Get return buy list id
    light_portal_add_return_buy_features.Verify cannot save without input require
    light_portal_add_return_buy_page.Input return buy list id  ${return_buy_list_id}
    light_portal_add_return_buy_page.Click select shipping date
    ${shipping_date}  ${shipping_month}  ${shipping_year}=  light_portal_add_return_buy_page.Get previous date month and year  ${tc_ui_111['previous_date']}
    light_portal_common_keywords.Click select datepicker date month and year  ${shipping_date}  ${shipping_month}  ${shipping_year}
    light_portal_common_keywords.Click select hour from datepicker  ${tc_ui_111['shipping']['hour']}
    light_portal_common_keywords.Click select minute from datepicker  ${tc_ui_111['shipping']['minute']}
    light_portal_add_return_buy_features.Create return buy list  ${tc_ui_111}
    light_portal_detail_return_buy_features.Verify return buy list detail  ${return_buy_list_id}  ${tc_ui_111}
    light_portal_side_menu_bar.click return buy list
    light_portal_add_return_buy_page.Quick search return buy  ${return_buy_list_id}
    light_portal_return_buy_list_page.Click kebab menu by return id  ${return_buy_list_id}
    light_portal_common_keywords.Scroll to footer of page
    light_portal_return_buy_list_page.Click kebab menu edit by return id  ${return_buy_list_id}
    light_portal_edit_return_buy_list_page.Input edit reference  ${tc_ui_111['reference']}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_edit_return_buy_list_page.Click save edit
    light_portal_return_buy_list_page.Verify reference with return buy id  ${return_buy_list_id}  ${tc_ui_111['reference']}