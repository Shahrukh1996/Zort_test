*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test return product list payment status
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_113
    [Documentation]  Test return product list payment status

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return buy list
    light_portal_return_buy_list_page.Click create return buy list
    ${return_buy_list_id}=  light_portal_add_return_buy_page.Get return buy list id
    light_portal_add_return_buy_page.Click select shipping date
    light_portal_common_keywords.Click select datepicker date month and year  ${tc_ui_113['shipping']['day']}  ${tc_ui_113['shipping']['month']}  ${tc_ui_113['shipping']['year']}
    light_portal_common_keywords.Click select hour from datepicker  ${tc_ui_113['shipping']['hour']}
    light_portal_common_keywords.Click select minute from datepicker  ${tc_ui_113['shipping']['minute']}
    light_portal_add_return_buy_features.Create return buy list  ${tc_ui_113}
    light_portal_detail_return_buy_features.Add payment  ${tc_ui_113['payment']['some_price']}  ${tc_ui_113['payment']['channel']}
    light_portal_detail_return_buy_page.Verify payment status  ${tc_ui_113['payment_status']['some_payment']}
    light_portal_side_menu_bar.Click return buy list
    light_portal_return_buy_list_features.Verify some payment status  ${return_buy_list_id}
    light_portal_return_buy_list_page.Select return buy list by id  ${return_buy_list_id}
    ${balance}=  light_portal_detail_return_buy_page.Get payment balance amount
    light_portal_detail_return_buy_features.Add payment  ${balance}    ${tc_ui_113['payment']['channel']}
    light_portal_detail_return_buy_page.Verify payment status  ${tc_ui_113['payment_status']['full_payment']}
    light_portal_side_menu_bar.Click return buy list
    light_portal_return_buy_list_features.Verify payment status  ${return_buy_list_id}  ${tc_ui_113['payment_status']['full_payment']}
    light_portal_return_buy_list_page.Select return buy list by id  ${return_buy_list_id}
    light_portal_detail_return_buy_page.Click delete paid  ${balance}
    light_portal_detail_return_buy_features.Add payment  ${tc_ui_113['payment']['over_price']}  ${tc_ui_113['payment']['channel']}
    light_portal_detail_return_buy_page.Verify payment status  ${tc_ui_113['payment_status']['over_payment']}
    light_portal_side_menu_bar.Click return buy list
    light_portal_return_buy_list_features.Verify payment status  ${return_buy_list_id}  ${tc_ui_113['payment_status']['over_payment']}