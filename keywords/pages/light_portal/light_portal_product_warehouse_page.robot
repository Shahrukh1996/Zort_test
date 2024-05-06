*** Variables ***
${product_warehouse_page.txt_quick_search}              id=quicksearchtext
${product_warehouse_page.btn_select_warehouse}          xpath=//td[@class="name"]//span[text()='**NAME**']
${product_warehouse_page.lbl_product_remain}            xpath=//td[contains(@class,'remain')]//span
${product_warehouse_page.btn_add_warehouse}             xpath=//div[@class='content']//button[text()='เพิ่มคลังสินค้า/สาขา']
${product_warehouse_page.txt_warehouse_name}            id=addwarehousename
${product_warehouse_page.txt_warehouse_code}            id=addwarehousecode
${product_warehouse_page.btn_save_create_warehouse}     xpath=//button[@onclick='insertWarehouse();'][text()='บันทึก']
${product_warehouse_page.btn_kebab}                     xpath=//td[@class='id']//span[text()='///text///']/ancestor-or-self::tr//td[@class='action']//i
${product_warehouse_page.ddl_kebab_menu}                xpath=//div[@class='btn-etc dropdown open']
${product_warehouse_page.btn_edit_from_kebab}           xpath=//td[@class="action"]//a[text()='แก้ไข']
${product_warehouse_page.txt_edit_warehouse_name}       id=editwarehousename
${product_warehouse_page.btn_save_on_edit_page}         xpath=//button[@onclick='doUpdate();'][text()='บันทึก']
${product_warehouse_page.lbl_warehouse_code}            xpath=//td[@class='id']/span[text()='///text///']
${product_warehouse_page.lbl_warehouse_name}            xpath=//td[@class='name']//span[text()='///text///']
${product_warehouse_page.lbl_warehouse_type}            xpath=//td[@class='type'][contains(text(),'///text///')]

*** Keywords ***
Quick search warehouse page
    [Documentation]         Quick search warehouse page
    [Arguments]             ${text}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Input text to element when ready     ${product_warehouse_page.txt_quick_search}      ${text}
    SeleniumLibrary.Press keys          None            RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Select warehouse by name
    [Documentation]         Select warehouse by name
    [Arguments]             ${warehouse}
    ${locator}              String.Replace string       ${product_warehouse_page.btn_select_warehouse}      **NAME**        ${warehouse}
    DobbyWebCommon.Click element when ready             ${locator}

Get product warehouse remain
    [Documentation]         Get product warehouse remain
    ${remains}      SeleniumLibrary.Get text            ${product_warehouse_page.lbl_product_remain}
    ${remains}      BuiltIn.Convert to integer          ${remains}
    [Return]        ${remains}

Verify remain should reduce after transfer product
    [Documentation]         Verify remain should reduce after transfer product
    [Arguments]             ${amount}       ${remains}          ${current_remains}
    ${remains}              BuiltIn.Evaluate                    ${remains}-${amount}
    BuiltIn.Should be equal                 ${remains}          ${current_remains}

Click create warehouse button
    [Documentation]         Click create warehouse button
    DobbyWebCommon.Click element when ready             ${product_warehouse_page.btn_add_warehouse}

Input warehouse name
    [Documentation]         Input warehouse name
    [Arguments]             ${warehouse_name}
    DobbyWebCommon.Input text to element when ready         ${product_warehouse_page.txt_warehouse_name}      ${warehouse_name}

Get warehouse code
    [Documentation]         Get warehouse code
    ${warehouse_code}       SeleniumLibrary.Get value       ${product_warehouse_page.txt_warehouse_code}
    [Return]        ${warehouse_code}

Click save button on create warehouse page
    [Documentation]         Click save button on create warehouse page
    DobbyWebCommon.Click element when ready    ${product_warehouse_page.btn_save_create_warehouse}

Click kebab button by warehouse code
    [Documentation]         Click kebab button by warehouse code
    [Arguments]             ${warehouse_code}
    ${locator}              String.Replace string       ${product_warehouse_page.btn_kebab}      ///text///        ${warehouse_code}
    DobbyWebCommon.Click element when ready             ${locator}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Wait until element is visible except stale       ${product_warehouse_page.ddl_kebab_menu}

Click edit button from kebab function
    [Documentation]         Click edit button from kebab function
    DobbyWebCommon.Click element when ready             ${product_warehouse_page.btn_edit_from_kebab}

Input edit warehouse name
    [Documentation]         Input edit warehouse name
    [Arguments]             ${warehouse_name}
    DobbyWebCommon.Input text to element when ready         ${product_warehouse_page.txt_edit_warehouse_name}      ${warehouse_name}

Click save button on edit page
    [Documentation]         Click save button on edit page
    DobbyWebCommon.Click element when ready             ${product_warehouse_page.btn_save_on_edit_page}

Verify warehouse code should be corrected
    [Documentation]         Verify warehouse code should be corrected
    [Arguments]             ${warehouse_code}
    ${locator}          String.Replace string       ${product_warehouse_page.lbl_warehouse_code}      ///text///      ${warehouse_code}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Verify warehouse name should be corrected
    [Documentation]         Verify warehouse name should be corrected
    [Arguments]             ${warehouse_name}
    ${locator}          String.Replace string       ${product_warehouse_page.lbl_warehouse_name}      ///text///      ${warehouse_name}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Verify warehouse type should be corrected
    [Documentation]         Verify warehouse type should be corrected
    [Arguments]             ${warehouse_type}
    ${locator}          String.Replace string       ${product_warehouse_page.lbl_warehouse_type}      ///text///      ${warehouse_type}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}