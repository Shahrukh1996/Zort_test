*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test return product list transfer status
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_112
    [Documentation]  Test return product list transfer status

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return buy list
    light_portal_return_buy_list_page.Click create return buy list
    ${return_buy_list_id}=  light_portal_add_return_buy_page.Get return buy list id
    light_portal_add_return_buy_page.Click select shipping date
    light_portal_common_keywords.Click select datepicker date month and year  ${tc_ui_112['shipping']['day']}  ${tc_ui_112['shipping']['month']}  ${tc_ui_112['shipping']['year']}
    light_portal_common_keywords.Click select hour from datepicker  ${tc_ui_112['shipping']['hour']}
    light_portal_common_keywords.Click select minute from datepicker  ${tc_ui_112['shipping']['minute']}
    light_portal_add_return_buy_features.Create return buy list  ${tc_ui_112}
    light_portal_home_features.Goto target page  ${tc_ui_112 ['pre_data']}
    ${remains}=  light_portal_product_warehouse_features.Get product warehouse remain  ${tc_ui_112['warehouse']}  ${tc_ui_112['product_id']}
    light_portal_home_features.Goto return buy list
    light_portal_return_buy_list_page.Select return buy list by id  ${return_buy_list_id}
    light_portal_detail_return_buy_features.Transfer some product  ${tc_ui_112['transfer_amount']}
    light_portal_detail_return_buy_page.Verify transfer status  ${tc_ui_112['transfer_status']['some_transfer_status']}
    light_portal_home_features.Goto target page  ${tc_ui_112 ['pre_data']}
    ${current_remains}=  light_portal_product_warehouse_features.Get product warehouse remain  ${tc_ui_112['warehouse']}  ${tc_ui_112['product_id']}
    light_portal_product_warehouse_page.Verify remain should reduce after transfer product  ${tc_ui_112['transfer_amount']}  ${remains}  ${current_remains}
    ${remains}=  light_portal_product_warehouse_page.Get product warehouse remain
    light_portal_home_features.Goto return buy list
    light_portal_return_buy_list_page.Select return buy list by id  ${return_buy_list_id}
    light_portal_detail_return_buy_features.Transfer some product  ${tc_ui_112['transfer_amount']}
    light_portal_detail_return_buy_page.Verify transfer status  ${tc_ui_112['transfer_status']['all_transfer_status']}
    light_portal_home_features.Goto target page  ${tc_ui_112 ['pre_data']}
    ${current_remains}=  light_portal_product_warehouse_features.Get product warehouse remain  ${tc_ui_112['warehouse']}  ${tc_ui_112['product_id']}
    light_portal_product_warehouse_page.Verify remain should reduce after transfer product  ${tc_ui_112['transfer_amount']}  ${remains}  ${current_remains}