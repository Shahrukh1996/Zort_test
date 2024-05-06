*** Keywords ***
Input transaction and click pack product
    [Documentation]     Input transaction and click pack product
    [Arguments]     ${id}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_pack_product_page.Input transaction     ${id}
    light_portal_pack_product_page.Click search pack product

Verify input invalid transaction
    [Documentation]     Verify input invalid transaction
    [Arguments]     ${id}
    light_portal_pack_product_features.Input transaction and click pack product  ${id}
    light_portal_pack_product_page.Verify invalid transaction
    light_portal_pack_product_page.Click close error popup

Verify input transaction already pack product
    [Documentation]     Verify input transaction already pack product
    [Arguments]     ${id}
    light_portal_pack_product_features.Input transaction and click pack product  ${id}
    light_portal_pack_product_page.Verify transaction already pack product
    light_portal_pack_product_page.Click close error popup

Input product id and product amount and select warehouse
    [Documentation]     Input product id and product amount and select warehouse
    [Arguments]     ${id}       ${amount}       ${warehouse}
    light_portal_pack_product_page.Select warehouse     ${warehouse}
    light_portal_pack_product_page.Input product amount      ${amount}
    light_portal_pack_product_page.Input product id      ${id}
    light_portal_pack_product_page.Verify amount of pack product  ${id}      ${amount}

Input tracking number and save
    [Documentation]     Input tracking number and save
    [Arguments]     ${number}
    light_portal_pack_product_page.Input pack product tracking number  ${number}
    light_portal_pack_product_page.Click save tracking number