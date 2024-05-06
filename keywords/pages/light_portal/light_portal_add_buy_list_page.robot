*** Variables ***
${add_buy_list_page.txt_buy_list_code}          id=number
${add_buy_list_page.btn_add_product}            xpath=//a[@href="javascript:showAllProduct(1);"]
${add_buy_list_page.txt_quick_search}           id=quicksearchproducttext
${add_buy_list_page.btn_select_product}         xpath=//div[contains(text(),'**NAME**')]/ancestor::tr//a[text()='เลือก']
${add_buy_list_page.txt_product_amount}         id=productnumber1
${add_buy_list_page.btn_save_buy_list}          xpath=//button[text()='บันทึก']
${add_buy_list_page.btn_add_contact}            xpath=//a[@href="javascript:showAllContact();"]
${add_buy_list_page.txt_search_contact}         id=quicksearchcontacttext
${add_buy_list_page.btn_select_contact}         xpath=//span[contains(normalize-space(.),'(รหัส : **ID** )')]/ancestor::tr//a[text()='เลือก']
${add_buy_list_page.select_vat_option}          id=vattypeid
${add_buy_list_page.btn_date_transasction}      xpath=//input[@id="transactiondate"]/parent::div[@data-date-format="d/m/yyyy"]
${add_buy_list_page.txt_shipping_channel}       id=shippingchannel
${add_buy_list_page.btn_warehouse_dropdown}     xpath=//label[text()='รอโอนสินค้า']/following-sibling::div[@id="warehouseidarea0"]//button
${add_buy_list_page.btn_select_warehouse}       xpath=//label[text()='รอโอนสินค้า']/following-sibling::div[@id="warehouseidarea0"]//a[@role="option"]//span[text()='**WAREHOUSE**']
${add_buy_list_page.lbl_title_page}             xpath=//h1[contains(text(),'สร้างรายการซื้อ')]

*** Keywords ***
Get buy list code
    [Documentation]     Get buy list code
    ${code}     SeleniumLibrary.Get value        ${add_buy_list_page.txt_buy_list_code}
    [Return]            ${code}

Click add product
    [Documentation]     Click add product
    DobbyWebCommon.Click element when ready             ${add_buy_list_page.btn_add_product}
    light_portal_common_keywords.Wait for jquery loading completed

Quick search product
    [Documentation]     Quick search product
    [Arguments]         ${id}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Input text to element when ready     ${add_buy_list_page.txt_quick_search}       ${id}
    SeleniumLibrary.Press keys          None        RETURN

Click select product by name
    [Documentation]     Click select product by name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${add_buy_list_page.btn_select_product}     **NAME**      ${name}
    DobbyWebCommon.Click element when ready             ${locator}

Input product amount
    [Documentation]     Input product amount
    [Arguments]         ${amount}
    DobbyWebCommon.Input text to element when ready         ${add_buy_list_page.txt_product_amount}        ${amount}

Click save buy list
    [Documentation]     Click save buy list
    DobbyWebCommon.Click element when ready             ${add_buy_list_page.btn_save_buy_list}
    light_portal_common_keywords.Wait for jquery loading completed

Click add contact
    [Documentation]     Click add contact
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready             ${add_buy_list_page.btn_add_contact}
    light_portal_common_keywords.Wait for jquery loading completed

Quick search contact
    [Documentation]     Quick search contact
    [Arguments]         ${contact}
    DobbyWebCommon.Input text to element when ready     ${add_buy_list_page.txt_search_contact}       ${contact}
    SeleniumLibrary.Press keys      None        RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Click select contact by id
    [Documentation]     Click select contact by id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${add_buy_list_page.btn_select_contact}     **ID**      ${id}
    DobbyWebCommon.Click element when ready         ${locator}

Select vat option
    [Documentation]     Select vat option
    [Arguments]         ${vat}
    DobbyWebCommon.Select option by label when ready        ${add_buy_list_page.select_vat_option}        ${vat}

Click select transaction date month year
    [Documentation]     Click select transaction date month year 
    [Arguments]         ${create_date}    ${current_day}     ${current_month}    ${current_year}
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready         ${add_buy_list_page.btn_date_transasction}
    light_portal_common_keywords.Auto keyword datepicker  ${create_date}
    # light_portal_common_keywords.Click select datepicker date month and year  ${date}  ${month}  ${year}
    ${current_date}     BuiltIn.Set variable     ${current_day}/${current_month}/${current_year}

Input shipping channel
    [Documentation]     Input shipping channel
    [Arguments]         ${shipping}
    DobbyWebCommon.Input text to element when ready         ${add_buy_list_page.txt_shipping_channel}      ${shipping}

Select warehouse
    [Documentation]     Select warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Click element when ready         ${add_buy_list_page.btn_warehouse_dropdown}
    ${locator}          String.Replace string       ${add_buy_list_page.btn_select_warehouse}       **WAREHOUSE**       ${warehouse}
    DobbyWebCommon.Click element when ready         ${locator}

Verify title add buy list page
    [Documentation]     Verify title add buy list page
    DobbyWebCommon.Wait until element is visible except stale       ${add_buy_list_page.lbl_title_page}
