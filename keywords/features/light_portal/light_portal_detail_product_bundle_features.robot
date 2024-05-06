*** Keywords ***
Add product and input amount
    [Documentation]     Add product and input amount
    [Arguments]     ${name}     ${amount}
    light_portal_product_bundle_detail_page.Click add product
    # light_portal_product_bundle_detail_page.Wait until last element of search product is displayed
    light_portal_product_bundle_detail_page.Input product code or product name to search  ${name}
    light_portal_product_bundle_detail_page.Click select product  ${name}
    light_portal_product_bundle_detail_page.Input product amount  ${amount}

Verify bundle detail panel
    [Documentation]     Verify bundle detail panel
    light_portal_product_bundle_detail_page.Verify remain product
    light_portal_product_bundle_detail_page.Verify product ready to sell
    light_portal_product_bundle_detail_page.Verify sales this month
    light_portal_product_bundle_detail_page.Verify total sales
    light_portal_product_bundle_detail_page.Verify inventory
    light_portal_product_bundle_detail_page.Verify product movement