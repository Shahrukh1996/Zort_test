*** Keywords ***
Input edit product bundle sell price and click active bundle
    [Documentation]     Input edit product bundle sell price and click active bundle
    [Arguments]         ${price}
    light_portal_edit_product_bundle_page.Input edit sell price      ${price}
    light_portal_edit_product_bundle_page.Click active product bundle
    light_portal_edit_product_bundle_page.Click confirm active product bundle

Verify all edit field should be disable
    [Documentation]     Verify all edit field should be disable
    light_portal_edit_product_bundle_page.Verify input bundle id should be disable
    light_portal_edit_product_bundle_page.Verify input bundle name should be disable
    light_portal_edit_product_bundle_page.Verify input bundle sell price should be disable
    light_portal_edit_product_bundle_page.Verify input bundle expire date should be disable