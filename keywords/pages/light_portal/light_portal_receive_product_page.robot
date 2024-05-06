*** Variables ***
${receive_product_page.panel_transfer_info}         xpath=//span[text()='รับสินค้าแล้ว']/parent::h2/parent::div//td[text()='**ID**']/following-sibling::td[text()='**AMOUNT**']
${receive_product_page.txt_buy_list_code}           id=txt_transaction
${receive_product_page.btn_receive_product}         xpath=//input[@value='รับสินค้าเข้า']
${receive_product_page.lbl_invalid_code}            xpath=//p[text()='หมายเลขรายการรอโอนไม่ถูกต้อง']
${receive_product_page.btn_close_error_popup}       xpath=//button[@onclick="closeErrorPopup();"]
${receive_product_page.lbl_already_transger_code}   xpath=//p[text()='รายการนี้ได้ถูกโอนสินค้าเรียบร้อยแล้ว']
${receive_product_page.select_transfer_warehouse}   id=warehouseid
${receive_product_page.txt_product_amount}          id=countProduct
${receive_product_page.txt_product_id}              id=productcode
${receive_product_page.btn_confirm_receive_prod}    xpath=//div[@id='packactionareatop']//button[text()='รับสินค้าเข้า']
${receive_product_page.btn_ok_receive_prod}         xpath=//span[text()='คุณตรวจรับสินค้าในรายการนี้บางส่วน ']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']
${receive_product_page.btn_continue_receive}        xpath=//a[text()='รับคืนรายการต่อไป']
${receive_product_page.lbl_transfer_some_part}      xpath=//div[contains(text(),'สถานะรายการ')]/following-sibling::div//font[text()='โอนสินค้าบางส่วน']
${receive_product_page.btn_goto_buy_list}           xpath=//a[text()='หน้ารายการซื้อ']

*** Keywords ***
Input buy list code
    [Documentation]     Input buy list code
    [Arguments]         ${code}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Input text to element when ready     ${receive_product_page.txt_buy_list_code}      ${code}

Click receive product
    [Documentation]     Click receive product
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_receive_product}

Verify invalid input buy list code
    [Documentation]     Verify invalid input buy list code
    DobbyWebCommon.Wait until element is visible except stale       ${receive_product_page.lbl_invalid_code}

Click close error popup
    [Documentation]     Click close error popup
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_close_error_popup}

Verify buy list already transfer
    [Documentation]     Verify buy list already transfer
    DobbyWebCommon.Wait until element is visible except stale       ${receive_product_page.lbl_already_transger_code}

Select transfer warehouse
    [Documentation]     Select transfer warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Select option by label when ready        ${receive_product_page.select_transfer_warehouse}      ${warehouse}

Input transfer product amount
    [Documentation]     Input transfer product amount
    [Arguments]         ${amount}
    SeleniumLibrary.Double click element        ${receive_product_page.txt_product_amount}
    SeleniumLibrary.Press keys      None        DELETE
    DobbyWebCommon.Input text to element when ready     ${receive_product_page.txt_product_amount}         ${amount}

Input transfer product id
    [Documentation]     Input transfer product id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${receive_product_page.txt_product_id}          ${id}
    light_portal_common_keywords.Wait for jquery loading completed

Verify that input transfer should be visible
    [Documentation]     Verify that input transfer should be visible
    [Arguments]         ${id}           ${amount}
    ${locator}          String.Replace string       ${receive_product_page.panel_transfer_info}     **ID**      ${id}
    ${locator}          String.Replace string       ${locator}          **AMOUNT**      ${amount}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click confirm receive product
    [Documentation]     Click confirm receive product
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_confirm_receive_prod}

Click ok confirm receive product
    [Documentation]     Click ok confirm receive product
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_ok_receive_prod}

Click continue receive product
    [Documentation]     Click continue receive product
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_continue_receive}

Verify transfer some part success
    [Documentation]     Click verify transfer some part success
    DobbyWebCommon.Wait until element is visible except stale       ${receive_product_page.lbl_transfer_some_part}

Click goto buy list page
    [Documentation]     Click goto buy list page
    DobbyWebCommon.Click element when ready             ${receive_product_page.btn_goto_buy_list}