*** Keywords ***
Verify when require data is empty
    [Documentation]     Verify when require data is empty
    light_portal_product_bundle_list_page.Click add product bundle
    light_portal_product_bundle_list_page.Click save product bundle detail
    light_portal_product_bundle_list_page.Verify when require data is empty
    light_portal_product_bundle_list_page.Click close error popup

Create product bundle
    [Documentation]     Create product bundle and return bundle name
    [Arguments]         ${price}
    ${name}     light_portal_product_bundle_list_page.Input bundle name using random letters
    light_portal_product_bundle_list_page.Input bundle sell price    ${price}
    # light_portal_product_bundle_list_page.Click select datepicker
    # product_bundle_list_page.Select datepicker next month
    # light_portal_product_bundle_list_page.Select datepicker this day
    light_portal_product_bundle_list_page.Click save product bundle detail
    [Return]            ${name}