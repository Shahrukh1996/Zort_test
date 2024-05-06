*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test product pack with tracking number
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_73
    [Documentation]  Test product pack with tracking number

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto add sell list page
    light_portal_add_sell_list_features.Select product with top button  ${tc_73['product_id']}
    light_portal_add_sell_list_page.Input amount product  ${tc_73['amount']}
    ${sell_list_code}=  light_portal_add_sell_list_features.Click save sell list and get sell list code
    light_portal_home_features.Goto pack product page
    light_portal_pack_product_features.Verify input invalid transaction  ${tc_73['invalid_id']}
    light_portal_pack_product_features.Verify input transaction already pack product  ${tc_73['packed_id']}
    light_portal_pack_product_features.Input transaction and click pack product  ${sell_list_code}
    light_portal_pack_product_features.Input product id and product amount and select warehouse  ${tc_73['product_id']}  ${tc_73['pack_amount']}  ${tc_73['warehouse']}
    light_portal_pack_product_page.Click pack product with tracking number
    light_portal_pack_product_page.Click confirm pack product
    light_portal_pack_product_features.Input tracking number and save  ${tc_73['tracking_no']}
    light_portal_pack_product_page.Verify pack product success
    light_portal_pack_product_page.Click pack next product
    light_portal_pack_product_features.Input transaction and click pack product  ${sell_list_code}
    light_portal_pack_product_page.Verify some product have been packed
    light_portal_pack_product_features.Input product id and product amount and select warehouse  ${tc_73['product_id']}  ${tc_73['pack_amount']}  ${tc_73['warehouse']}
    light_portal_pack_product_page.Click pack product
    light_portal_pack_product_page.Verify pack product success