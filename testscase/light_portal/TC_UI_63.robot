*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can return product and edit shipping channel
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_63
    [Documentation]  Test user can return product and edit shipping channel
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_page.Click create return product button
    light_portal_common_keywords.Auto keyword remove dom chat support
    ${return_id}=  light_portal_return_product_list_page.Get return product id
    light_portal_return_product_list_page.Input return product id  ${EMPTY}
    light_portal_return_product_list_features.Verify popup when require data is incomplete
    light_portal_return_product_list_page.Input return product id  ${return_id}
    light_portal_return_product_list_features.Select product with top button  ${quotation['product_code']}
    light_portal_return_product_list_features.Save and verify created return id  ${return_id}
    light_portal_return_product_list_features.Verify top status  ${return_page['status_payment_waiting']}  ${return_page['status_transfer_waiting']}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_features.Search return id on quick search  ${return_id}
    light_portal_return_product_list_features.Edit return detail after create successfully  ${return_page['shipping_thaipost']}  ${return_id}
    light_portal_return_product_list_features.Verify shipping channel should be corrected  ${return_id}  ${return_page['shipping_thaipost']}