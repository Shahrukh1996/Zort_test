*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can verify any transfer status
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_65
    [Documentation]  Test can verify any transfer status
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}    ${public_user['password']}
    light_portal_home_features.Goto target page  ${return_page ['pre_data'] ['return_sell_page']}
    light_portal_return_product_list_page.Click create return product button
    ${return_id}=  light_portal_return_product_list_page.Get return product id
    light_portal_return_product_list_features.Select product with top button and input amount product  ${return_page['product_code']}  ${sell_list_page['product']['amount_2']}
    light_portal_return_product_list_features.Save and verify created return id  ${return_id}
    light_portal_return_product_list_features.Verify number of goods transfer is corrected  ${sell_list_page['product']['amount_1']}
    light_portal_return_product_list_features.Verify top status  ${return_page['status_payment_waiting']}  ${return_page['status_transfer_partial_goods']}
    light_portal_return_product_list_features.Verify number of goods transfer is corrected  ${sell_list_page['product']['amount_1']}
    light_portal_return_product_list_features.Verify top status  ${return_page['status_payment_waiting']}  ${return_page['status_success']}