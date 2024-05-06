*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can transfer goods in any condition
    [Tags]           LIGHT_WEIGHT  TC2  TC_12
    [Documentation]  Test can transfer goods in any condition
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto target page  ${tc_12 ['pre_data'] ['sell_add_page']}
    ${sell_code}=  light_portal_add_sell_list_features.Add refer and sales channel  ${sell_list_page['info']['refer']}  ${sell_list_page['info']['sales_channel']}

    light_portal_add_sell_list_features.Add new sell list  ${tc_12 ['add_sell_list'] ['test_data']}
    light_portal_add_sell_list_features.Input require field on sell datail with pay  ${sell_list_page['customer']['code']}  ${sell_list_page['product']['name']}
    light_portal_add_sell_list_features.Input payment detail after get price on product detail with full price
    light_portal_add_sell_list_features.Input shipping channel and transfer type  ${sell_list_page['test_status']}  ${sell_list_page['transfer_type']}

    light_portal_add_sell_list_page.Click save button and confirm to go to next page
    light_portal_detail_sell_list_page.Click edit data payment
    light_portal_add_sell_list_page.Change amount product  ${sell_list_page['product']['amount_2']}
    light_portal_detail_sell_list_page.Click save after change data
    light_portal_detail_sell_list_features.Verify payment is successful after adding amount price
    light_portal_detail_sell_list_features.Verify top status  ${sell_list_page['status_payment_full']}  ${sell_list_page['status_transfer_waiting']}  ${sell_list_page['test_status']}

    light_portal_detail_sell_list_features.Verify number of goods transfer is corrected  ${sell_list_page['product']['amount_1']}
    light_portal_detail_sell_list_features.Verify top status  ${sell_list_page['status_payment_full']}  ${sell_list_page['status_transfer_partial_goods']}  ${sell_list_page['test_status']}

    light_portal_detail_sell_list_features.Confirm transfer all goods
    light_portal_detail_sell_list_features.Verify top status  ${sell_list_page['status_payment_full']}  ${sell_list_page['status_success']}  ${sell_list_page['test_status']}

    light_portal_detail_sell_list_features.Verify cancel order on transfer session is confirmed