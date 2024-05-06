*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test product pack with sell list code
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_80
    [Documentation]  Test product pack with sell list code

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto add sell list page
    light_portal_add_sell_list_features.Select product with top button  ${tc_80['product_id']}
    light_portal_add_sell_list_page.Input amount product  ${tc_80['amount']}
    light_portal_add_sell_list_page.Input tracking number  ${tc_80['tracking_no']}
    ${sell_list_code}=  light_portal_add_sell_list_features.Click save sell list and get sell list code
    light_portal_home_features.Goto pack product page
    light_portal_pack_product_features.Input transaction and click pack product  ${sell_list_code}
    light_portal_pack_product_features.Input product id and product amount and select warehouse  ${tc_80['product_id']}  ${tc_80['pack_amount']}  ${tc_80['warehouse']}
    light_portal_pack_product_page.Click pack product
    light_portal_pack_product_page.Verify pack product success
    light_portal_pack_product_page.Click view product list
    light_portal_view_sell_list_page.Click select order by code list  ${sell_list_code}
    light_portal_detail_sell_list_page.Verify tracking number  ${tc_80['tracking_no']}