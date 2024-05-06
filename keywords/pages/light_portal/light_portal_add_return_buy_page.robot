*** Variables ***
${add_return_buy_page.txt_return_id}                        id=number
${add_return_buy_page.btn_save_return_list}                 xpath=//button[text()='บันทึก']
${add_return_buy_page.lbl_require_error}                    xpath=//p[text()='กรุณาใส่ข้อมูลให้ครบถ้วน']
${add_return_buy_page.btn_close_require_error_popup}        xpath=//p[text()='กรุณาใส่ข้อมูลให้ครบถ้วน']/ancestor::div[@class='modal-content']//button[text()='ตกลง']
${add_return_buy_page.btn_view_contact}                     xpath=//a[@href="javascript:showAllContact();"]//i
${add_return_buy_page.txt_search_contact}                   id=quicksearchcontacttext
${add_return_buy_page.btn_select_contact}                   xpath=//span[text()='**ID**']/ancestor::tr//a[text()='เลือก']
${add_return_buy_page.btn_view_product}                     xpath=//a[@href="javascript:showAllProduct(1);"]
${add_return_buy_page.txt_search_product}                   id=quicksearchproducttext
${add_return_buy_page.txt_search_return_buy}                xpath=//input[@id='quicksearchtext']
${add_return_buy_page.btn_select_product}                   xpath=//div[contains(text(),'**ID**')]/ancestor::tr//a[text()='เลือก']
${add_return_buy_page.txt_product_amount}                   id=productnumber1
${add_return_buy_page.txt_shipping_channel}                 id=shippingchannel
${add_return_buy_page.txt_discount}                         id=discounttext
${add_return_buy_page.txt_shipping_price}                   id=shippingamount
${add_return_buy_page.txt_description}                      id=description
${add_return_buy_page.btn_select_shipping_date}             xpath=//input[@name="shippingdate"]/parent::div
${add_return_buy_page.xpt_focus}                            xpath=//fieldset[@id='tour_warehousearea']/legend[contains(normalize-space(.),'คลังสินค้า/สาขา')]

** Keywords ***
Quick search return buy
    [Documentation]         Quick search return buy
    [Arguments]             ${return_buy_name}
    DobbyWebCommon.Input text to element when ready         ${add_return_buy_page.txt_search_return_buy}           ${return_buy_name}
    SeleniumLibrary.Press keys      None        RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Get return buy list id
    [Documentation]         Get return buy list id
    light_portal_common_keywords.Scroll to top of page
    ${return_buy_list_id}   SeleniumLibrary.Get value       ${add_return_buy_page.txt_return_id}
    [Return]            ${return_buy_list_id}

Clear buy list id field
    [Documentation]         Clear buy list id field
    SeleniumLibrary.Clear element text                      ${add_return_buy_page.txt_return_id}

Click save return buy list
    [Documentation]         Click save return buy list
    DobbyWebCommon.Click element when ready                 ${add_return_buy_page.btn_save_return_list}

Verify popup error that save return list without input require
    [Documentation]         Verify popup error that save return list without input require
    DobbyWebCommon.Wait until element is visible except stale       ${add_return_buy_page.lbl_require_error}

Click close error popup input require
    [Documentation]         Click close error popup input require
    DobbyWebCommon.Click element when ready                 ${add_return_buy_page.btn_close_require_error_popup}

Input return buy list id
    [Documentation]         Input return buy list id
    [Arguments]             ${id}
    DobbyWebCommon.Input text to element when ready         ${add_return_buy_page.txt_return_id}       ${id}

Click view contact
    [Documentation]         Click view contact
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready     ${add_return_buy_page.btn_view_contact}
    light_portal_common_keywords.Wait for jquery loading completed

Quick search contact
    [Documentation]         Quick search contact
    [Arguments]             ${contact}
    DobbyWebCommon.Input text to element when ready         ${add_return_buy_page.txt_search_contact}           ${contact}
    SeleniumLibrary.Press keys      None        RETURN

Select contact by id
    [Documentation]         Select contact by id
    [Arguments]             ${id}
    ${locator}              String.Replace string           ${add_return_buy_page.btn_select_contact}     **ID**      ${id}
    DobbyWebCommon.Click element when ready         ${locator}

Click select view product
    [Documentation]         Click select view product
    DobbyWebCommon.Click element when ready            ${add_return_buy_page.btn_view_product}
    light_portal_common_keywords.Wait for jquery loading completed

Quick search product
    [Documentation]         Quick search product
    [Arguments]             ${product}
    DobbyWebCommon.Input text to element when ready         ${add_return_buy_page.txt_search_product}           ${product}
    SeleniumLibrary.Press keys      None        RETURN

Select product by id
    [Documentation]         Select product by id
    [Arguments]             ${id}
    ${locator}              String.Replace string           ${add_return_buy_page.btn_select_product}     **ID**      ${id}
    DobbyWebCommon.Click element when ready         ${locator}

Input product amount
    [Documentation]         Input product amount
    [Arguments]             ${amount}
    DobbyWebCommon.Input text to element when ready         ${add_return_buy_page.txt_product_amount}       ${amount}

Input shipping channel
    [Documentation]         Input shipping channel
    [Arguments]             ${shipping}
    DobbyWebCommon.Input text to element when ready     ${add_return_buy_page.txt_shipping_channel}         ${shipping}

Input discount
    [Documentation]         Input discount
    [Arguments]             ${discount}
    DobbyWebCommon.Input text to element when ready     ${add_return_buy_page.txt_discount}                 ${discount}

Input shipping price
    [Documentation]         Input shipping price
    [Arguments]             ${price}
    DobbyWebCommon.Input text to element when ready     ${add_return_buy_page.txt_shipping_price}       ${price}

Input description
    [Documentation]         Input description
    [Arguments]             ${text}
    DobbyWebCommon.Input text to element when ready     ${add_return_buy_page.txt_description}         ${text}

Click select shipping date
    [Documentation]     Click select shipping date 	 
    SeleniumLibrary.Scroll element into view            ${add_return_buy_page.xpt_focus}
    DobbyWebCommon.Click element when ready             ${add_return_buy_page.btn_select_shipping_date}

Get previous date month and year
    [Documentation]         Get previous date month and year
    [Arguments]             ${amount}
    ${current_date}         DateTime.Get current date
    ${shipping_date}        DateTime.Subtract time from date            ${current_date}         ${amount} days  result_format=%d
    ${shipping_month}       DateTime.Subtract time from date            ${current_date}         ${amount} days  result_format=%m
    ${shipping_year}        DateTime.Subtract time from date            ${current_date}         ${amount} days  result_format=%Y
    ${shipping_year}        BuiltIn.Evaluate                            ${shipping_year}+543
    [Return]        ${shipping_date}    ${shipping_month}       ${shipping_year}
