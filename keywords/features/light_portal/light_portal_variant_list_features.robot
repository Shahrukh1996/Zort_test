*** Keywords ***

Click okay button on error popup
    [Documentation]     When require data are not filled, error popup will display and need to click okay button to close it
    light_portal_variant_list_page.Click save button on create product on variant list page
    light_portal_variant_list_page.Popup is displayed when data not complete
    light_portal_variant_list_page.Click okay button on error message popup

Input require data on add variant list page
    [Arguments]     ${variant_group_name}    ${type}
    light_portal_variant_list_page.Input variant group name    ${variant_group_name}
    light_portal_variant_list_page.Input variant type with any field    ${1}    ${type}
    SeleniumLibrary.Press keys      None        SPACE

Input more variant type on add variant list page
    [Arguments]     ${order_of_type}    ${type}
    light_portal_variant_list_page.Click add variant type button
    light_portal_variant_list_page.Input variant type with any field    ${order_of_type}    ${type}

Delete variant data by name and verify data is deleted
    [Arguments]     ${product_code}     ${product_name}    ${confirm_word}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Search variant product    ${product_code}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_variant_list_page.Wait until product is visible  ${product_code}
    BuiltIn.Wait until keyword succeeds     2x    5s    light_portal_variant_list_page.Click kebab button on product list    ${product_name}
    light_portal_variant_list_page.Click delete on kebab function
    light_portal_variant_list_page.Type confirm to delete data    ${confirm_word}
    light_portal_variant_list_page.Click confirm button to confirm delete

Verify all data on variant product page should be display
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Verify inventories are displayed
    ${inventories_unit}=        light_portal_variant_list_page.Get inventories
    light_portal_variant_list_page.Verify ready to sell function is displayed
    ${ready_to_sell_unit}=      light_portal_variant_list_page.Get amount product ready to sell
    light_portal_variant_list_page.Verify total sales in last month is displayed
    ${sales_last_month_unit}=   light_portal_variant_list_page.Get total sales in last month
    light_portal_variant_list_page.Verify total sales in this month is displayed
    ${sales_this_month_unit}=   light_portal_variant_list_page.Get total sales in this month
    light_portal_variant_list_page.Verify total sales of all
    light_portal_variant_list_page.Verify best sales table is displayed
    light_portal_variant_list_page.Verify store inventory is displayed
    light_portal_variant_list_page.Verify all product is displayed
    [Return]    ${inventories_unit}    ${ready_to_sell_unit}    ${sales_last_month_unit}    ${sales_this_month_unit}

Click edit by kebab function
    [Arguments]     ${product_code}    ${product_name}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Search variant product    ${product_name}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_variant_list_page.Wait until product is visible     ${product_code}
    light_portal_variant_list_page.Click kebab button on product list    ${product_name}
    light_portal_variant_list_page.Click edit variant type on kebab function

Confirm to save edit variant type
    [Arguments]     ${confirm_word}
    light_portal_variant_list_page.Click save button on edit page
    light_portal_variant_list_page.Type confirm to edit data    ${confirm_word}
    light_portal_variant_list_page.Click confirm button to confirm edit

Click to goto view sumary page
    [Arguments]     ${product_name}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Search variant product    ${product_name}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_variant_list_page.Click kebab button on product list    ${product_name}
    light_portal_variant_list_page.Click view sumary on kebab function

Verify search product by code on variant page should be corrected
    [Arguments]     ${product_code}    ${product_name}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Search variant product    ${product_code}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_variant_list_page.Verify product code should be corrected    ${product_code}
    light_portal_variant_list_page.Verify product name should be corrected    ${product_name}

Verify search product by name on variant page should be corrected
    [Arguments]     ${product_code}    ${product_name}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_variant_list_page.Search variant product    ${product_name}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_variant_list_page.Verify product code should be corrected    ${product_code}
    light_portal_variant_list_page.Verify product name should be corrected    ${product_name}