*** Keywords ***
Get product warehouse remain
    [Documentation]     Get product warehouse remain
    [Arguments]         ${warehouse}        ${product_id}
    light_portal_product_warehouse_page.Quick search warehouse page          ${warehouse}
    light_portal_product_warehouse_page.Select warehouse by name             ${warehouse}
    light_portal_product_warehouse_page.Quick search warehouse page          ${product_id}
    ${remains}      light_portal_product_warehouse_page.Get product warehouse remain
    [Return]        ${remains}

Create warehouse and input require name
    [Documentation]     Create warehouse and input require name
    [Arguments]         ${warehouse_name}
    light_portal_product_warehouse_page.Click create warehouse button
    light_portal_common_keywords.Wait for jquery loading completed
    ${warehouse_code}=    light_portal_product_warehouse_page.Get warehouse code
    light_portal_product_warehouse_page.Input warehouse name    ${warehouse_name}
    light_portal_product_warehouse_page.Click save button on create warehouse page
    light_portal_common_keywords.Wait for jquery loading completed
    [Return]        ${warehouse_code}

Verify information of warehouse should be corrected
    [Documentation]     Verify information of warehouse should be corrected
    [Arguments]         ${warehouse_code}    ${warehouse_name}    ${warehouse_type}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_warehouse_page.Verify warehouse code should be corrected    ${warehouse_code}
    light_portal_product_warehouse_page.Verify warehouse name should be corrected    ${warehouse_name}
    light_portal_product_warehouse_page.Verify warehouse type should be corrected    ${warehouse_type}

Edit infomation of warehouse be kebab function
    [Documentation]     Edit infomation of warehouse be kebab function
    [Arguments]         ${warehouse_code}    ${warehouse_name}
    light_portal_common_keywords.Wait for jquery loading completed
    BuiltIn.Wait until keyword succeeds     3x   2s    light_portal_product_warehouse_page.Click kebab button by warehouse code     ${warehouse_code}
    light_portal_product_warehouse_page.Click edit button from kebab function
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_warehouse_page.Input edit warehouse name                ${warehouse_name}
    light_portal_product_warehouse_page.Click save button on edit page