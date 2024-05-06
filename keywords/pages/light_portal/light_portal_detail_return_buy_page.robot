*** Variables ***
${detail_return_buy_page.lbl_return_id}                     xpath=//div[text()='รายการ']/following-sibling::div[text()='**ID**']
${detail_return_buy_page.lbl_return_contact}                xpath=//div[text()='ชื่อผู้ติดต่อ']/following-sibling::div//a[text()='**ID**']
${detail_return_buy_page.lbl_return_product}                xpath=//div[@id='tour-transaction-product']//a[contains(text(),'**ID**')]
${detail_return_buy_page.lbl_return_shipping}               xpath=//h2[text()='การจัดส่งสินค้า']/following-sibling::p[text()='**SHIPPING**']
${detail_return_buy_page.lbl_return_discount}               xpath=//p[text()='ส่วนลด']/parent::div/following-sibling::div//p[text()='**DISCOUNT**']
${detail_return_buy_page.lbl_return_shipping_price}         xpath=//p[text()='ค่าส่ง (ที่เรียกเก็บจากผู้ติดต่อ)']/parent::div/following-sibling::div//p[text()='**PRICE**']
${detail_return_buy_page.lbl_return_description}            xpath=//span[text()='หมายเหตุ']/following-sibling::span//span[text()='**TEXT**']
${detail_return_buy_page.btn_transfer_some_product}         xpath=//button[@onclick='openPartialWarehousePopup();']//span[text()='โอนสินค้าบางส่วน']
${detail_return_buy_page.txt_amount_some_product}           id=remainingnumber1
${detail_return_buy_page.btn_save_transfer_some_prod}       xpath=//button[@onclick='updatePartialTransaction();' and text()='บันทึก']
${detail_return_buy_page.lbl_transfer_status}               xpath=//h2[text()='สถานะการโอนสินค้า']/following-sibling::p//span[text()='**STATUS**']
${detail_return_buy_page.btn_choose_file}                   id=fInsertFile
${detail_return_buy_page.btn_add_payment}                   xpath=//a[contains(text(),'ชำระเพิ่ม')]
${detail_return_buy_page.txt_payment_amount}                xpath=//input[@id='paymentamount']
${detail_return_buy_page.txt_payment_channel}               id=paymentname
${detail_return_buy_page.btn_save_payment}                  xpath=//button[text()='ยืนยันการชำระเงิน']
${detail_return_buy_page.lbl_payment_status}                xpath=//h2[text()='สถานะการชำระเงิน']/following-sibling::p//span[text()='**STATUS**']
${detail_return_buy_page.lbl_payment_balance}               xpath=//div[@id='tour-action-payment']//div[text()='ยอดคงเหลือที่ต้องชำระ']/following-sibling::div
${detail_return_buy_page.btn_delete_paid}                   xpath=//td[text()='**PRICE** บาท']/ancestor::tr//a[text()='ลบ']
${detail_return_buy_page.xpt_focus}                         xpath=//div[@id='conversationrow']

*** Keywords ***
Verify return buy list id
    [Documentation]     Verify return buy list id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_id}     **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list contact id
    [Documentation]     Verify return buy list contact id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_contact}     **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list product id
    [Documentation]     Verify return buy list product id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_product}     **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list shipping channel
    [Documentation]     Verify return buy list shipping channel
    [Arguments]         ${shipping}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_shipping}     **SHIPPING**      ${shipping}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list shipping discount
    [Documentation]     Verify return buy list discount
    [Arguments]         ${discount}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_discount}     **DISCOUNT**      ${discount}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list shipping price
    [Documentation]     Verify return buy list shipping price
    [Arguments]         ${price}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_shipping_price}     **PRICE**      ${price}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify return buy list description
    [Documentation]     Verify return buy list description
    [Arguments]         ${text}
    ${locator}          String.Replace string       ${detail_return_buy_page.lbl_return_description}     **TEXT**      ${text}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click transfer some product
    [Documentation]     Click transfer some product
    SeleniumLibrary.Scroll element into view            ${detail_return_buy_page.xpt_focus}
    DobbyWebCommon.Click element when ready             ${detail_return_buy_page.btn_transfer_some_product}

Input transfer some product amount
    [Documentation]     Input transfer some product amount
    [Arguments]         ${amount}
    light_portal_common_keywords.Auto keyword clear input text  ${detail_return_buy_page.txt_amount_some_product}
    DobbyWebCommon.Input text to element when ready     ${detail_return_buy_page.txt_amount_some_product}     ${amount}

Click save transfer some product
    [Documentation]     Click save transfer some product
    DobbyWebCommon.Click element when ready             ${detail_return_buy_page.btn_save_transfer_some_prod}

Verify transfer status
    [Documentation]     Verify transfer status
    [Arguments]         ${status}
    ${locator}          String.Replace string           ${detail_return_buy_page.lbl_transfer_status}       **STATUS**      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click choose file
    [Documentation]     Click choose file
    ${path}    OperatingSystem.Join path        ${CURDIR}/../../../resources/testdata/light_portal/slip_image.jpg
    DobbyWebCommon.Browse file when ready       ${detail_return_buy_page.btn_choose_file}        ${path}

Click add payment
    [Documentation]     Click add payment
    DobbyWebCommon.Click element when ready                 ${detail_return_buy_page.btn_add_payment}
    light_portal_common_keywords.Wait for jquery loading completed

Input payment amount
    [Documentation]     Input payment amount
    [Arguments]         ${amount}
    light_portal_common_keywords.Auto keyword clear input text           ${detail_return_buy_page.txt_payment_amount}
    DobbyWebCommon.Input text to element when ready         ${detail_return_buy_page.txt_payment_amount}                    ${amount}

Input payment channel
    [Documentation]     Input payment channel
    [Arguments]         ${channel}
    DobbyWebCommon.Input text to element when ready         ${detail_return_buy_page.txt_payment_channel}                  ${channel}

Click save payment
    [Documentation]     Click save payment
    DobbyWebCommon.Click element when ready                 ${detail_return_buy_page.btn_save_payment}

Verify payment status
    [Documentation]     Verify payment status
    [Arguments]         ${status}
    ${locator}          String.Replace string               ${detail_return_buy_page.lbl_payment_status}    **STATUS**      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Get payment balance amount
    [Documentation]     Get payment balance amount
    ${balance}      SeleniumLibrary.Get text                ${detail_return_buy_page.lbl_payment_balance}
    [Return]        ${balance}

Click delete paid
    [Documentation]     Click delete paid
    [Arguments]         ${price}
    ${locator}          String.Replace string       ${detail_return_buy_page.btn_delete_paid}   **PRICE**       ${price}
    DobbyWebCommon.Click element when ready         ${locator}