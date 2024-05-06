*** Variables ***
${pack_product_page.input_transaction}          id=txt_transaction
${pack_product_page.btn_search_pack_product}    xpath=//input[@value='แพ็คสินค้า']
${pack_product_page.txt_popup_invalid}          xpath=//p[text()='หมายเลขรายการรอโอนไม่ถูกต้อง']
${pack_product_page.btn_close_error_popup}      xpath=//button[@onclick="closeErrorPopup();"]
${pack_product_page.txt_popup_already_pack}     xpath=//p[text()='รายการนี้ได้ถูกโอนสินค้าเรียบร้อยแล้ว']
${pack_product_page.select_warehouse}           id=warehouseid
${pack_product_page.input_prod_amount}          id=countProduct
${pack_product_page.input_prod_id}              id=productcode
${pack_product_page.txt_prod_amount}            xpath=//span[text()='สินค้าที่แพ็คแล้ว']/parent::h2/parent::div//td[text()='id']/following-sibling::td[text()='amount']
${pack_product_page.btn_pack_product}           xpath=//div[@id='packactionareatop']/button[contains(@onclick, 'confirmPickandpack(1)')]
${pack_product_page.btn_pack_prod_tracking}     xpath=//h2[contains(text(),'แพ็คสินค้า')]/parent::div/following-sibling::div//button[text()='แพ็คสินค้า + Tracking No']
${pack_product_page.btn_confirm_pack_prod}      xpath=//button[@onclick="closeconfirmPopup();"]/following-sibling::button[text()='ยืนยัน']
${pack_product_page.txt_pack_prod_success}      xpath=//h2[text()='การแพ็คสินค้าสำเร็จ']
${pack_product_page.btn_pack_next_prod}         xpath=//a[text()='แพ็ครายการต่อไป']
${pack_product_page.txt_some_prod_packed}       xpath=//font[text()='โอนสินค้าบางส่วน']
${pack_product_page.input_tracking_no}          id=trackingno
${pack_product_page.btn_save_tracking}          xpath=//button[text()='บันทึก']
${pack_product_page.btn_view_prod_list}         xpath=//a[text()='หน้ารายการขาย']

*** Keywords ***
Input transaction
    [Documentation]     Input transaction
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${pack_product_page.input_transaction}      ${id}

Click search pack product
    [Documentation]     Click pack product
    DobbyWebCommon.Click element when ready         ${pack_product_page.btn_search_pack_product}

Verify invalid transaction
    [Documentation]     Verify input invalid transaction
    DobbyWebCommon.Wait until element is visible except stale   ${pack_product_page.txt_popup_invalid}

Click close error popup
    [Documentation]     Click close error popup
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_close_error_popup}

Verify transaction already pack product
    [Documentation]     Verify transaction already pack product
    DobbyWebCommon.Wait until element is visible except stale       ${pack_product_page.txt_popup_already_pack}

Input product amount
    [Documentation]     Input product amount
    [Arguments]     ${amount}
    SeleniumLibrary.Double click element      ${pack_product_page.input_prod_amount}
    SeleniumLibrary.Press keys      None        DELETE
    DobbyWebCommon.Input text to element when ready     ${pack_product_page.input_prod_amount}     ${amount}

Select warehouse
    [Documentation]     Select warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Select option by label when ready     ${pack_product_page.select_warehouse}     ${warehouse}

Input product id
    [Documentation]     Input product id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${pack_product_page.input_prod_id}      ${id}

Verify amount of pack product
    [Documentation]     Verify pack product amount
    [Arguments]         ${id}       ${amount}
    ${Locator}=     String.Replace string          ${pack_product_page.txt_prod_amount}     id      ${id}
    ${Locator}=     String.Replace string          ${Locator}     amount      ${amount}
    DobbyWebCommon.Wait until element is visible except stale   ${Locator}

Click pack product
    [Documentation]     Click pack product
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_pack_product}

Click pack product with tracking number
    [Documentation]     Clcik pack product with tracking number
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_pack_prod_tracking}

Click confirm pack product
    [Documentation]     Click confirm pack product
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_confirm_pack_prod}

Input pack product tracking number
    [Documentation]     Input pack product tracking number
    [Arguments]         ${number}
    DobbyWebCommon.Input text to element when ready     ${pack_product_page.input_tracking_no}      ${number}

Click save tracking number
    [Documentation]     Click save tracking number
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_save_tracking}

Verify pack product success
    [Documentation]     Verify pack product success
    DobbyWebCommon.Wait until element is visible except stale       ${pack_product_page.txt_pack_prod_success}

Click pack next product
    [Documentation]     Click pack next product
    DobbyWebCommon.Click element when ready     ${pack_product_page.btn_pack_next_prod}

Verify some product have been packed
    [Documentation]     Verify some product have been packed
    DobbyWebCommon.Wait until element is visible except stale       ${pack_product_page.txt_some_prod_packed}

Click view product list
    [Documentation]     Click view product list
    Sleep  2s
    DobbyWebCommon.Click element when ready         ${pack_product_page.btn_view_prod_list}