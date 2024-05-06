*** Variables ***
${detail_buy_list_page.btn_command}             xpath=//span[text()='คำสั่ง']
${detail_buy_list_page.btn_return_prod}         xpath=//a[text()='คืนสินค้าออก']
${detail_buy_list_page.lbl_payment_status}      xpath=//h2[text()='สถานะการชำระเงิน']/following-sibling::p//span[text()='**STATUS**']
${detail_buy_list_page.lbl_transfer_status}     xpath=//h2[text()='สถานะการโอนสินค้า']/following-sibling::p//span[text()='**STATUS**']
${detail_buy_list_page.lbl_buy_list_id}         xpath=//div[text()='รายการ']//following-sibling::div[contains(text(),'**ID**')]
${detail_buy_list_page.lbl_contact_id}          xpath=//div[text()='รหัสผู้ติดต่อ']//following-sibling::div[contains(text(),'**ID**')]
${detail_buy_list_page.lbl_product_name}        xpath=//span[text()='สินค้า']/ancestor::div[@id="tour-transaction-product"]//a[text()='**NAME**']
${detail_buy_list_page.lbl_shipping_channel}    xpath=//div[text()='ช่องทางจัดส่ง']//following-sibling::div[contains(text(),'**SHIPPING**')]
${detail_buy_list_page.lbl_create_date}         xpath=//div[text()='วันที่']/following-sibling::div

*** Keywords ***
Click command button
    [Documentation]     Click command button
    DobbyWebCommon.Click element when ready         ${detail_buy_list_page.btn_command}

Click return product
    [Documentation]     Click return product
    DobbyWebCommon.Click element when ready         ${detail_buy_list_page.btn_return_prod}

Verify payment status
    [Documentation]     Verify payment status
    [Arguments]         ${status}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_payment_status}       **STATUS**      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify transfer status
    [Documentation]     Verify transfer status
    [Arguments]         ${status}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_transfer_status}     **STATUS**      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify buy list id
    [Documentation]     Verify buy list id
    [Arguments]         ${id}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_buy_list_id}     **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify contact id
    [Documentation]     Verify contact id
    [Arguments]         ${id}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_contact_id}       **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product name
    [Documentation]     Verify product name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_product_name}        **NAME**        ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify shipping channel
    [Documentation]     Verify shipping channel
    [Arguments]         ${shipping}
    ${locator}          String.Replace string           ${detail_buy_list_page.lbl_shipping_channel}    **SHIPPING**    ${shipping}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify create day
    [Documentation]     Verify create day
    [Arguments]             ${day}
    ${get_day}              SeleniumLibrary.Get text        ${detail_buy_list_page.lbl_create_date}
    ${get_day}              BuiltIn.Evaluate                '${get_day}'.split()
    ${day}                  BuiltIn.Evaluate                int('${day}')
    ${day}                  BuiltIn.Convert to string       ${day}
    BuiltIn.Should be equal     ${day}        ${get_day}[0]

Verify create month
    [Documentation]     Verify create month
    [Arguments]             ${month}
    ${get_month}            SeleniumLibrary.Get text        ${detail_buy_list_page.lbl_create_date}
    ${get_month}            BuiltIn.Evaluate                '${get_month}'.split()
    ${convert_month}        light_portal_common_keywords.Convert thai month to index  ${get_month}[1]
    &{str_replace}=         BuiltIn.Create dictionary  0=
    ${convert_months}       light_portal_common_keywords.Auto keyword replace string  ${convert_month}  ${str_replace}
    BuiltIn.Should be equal     ${month}        ${convert_months}

Verify create year
    [Documentation]     Verify create year
    [Arguments]             ${year}
    ${get_year}            SeleniumLibrary.Get text        ${detail_buy_list_page.lbl_create_date}
    ${get_year}            BuiltIn.Evaluate                '${get_year}'.split()
    ${year}                  BuiltIn.Convert to string       ${year}
    BuiltIn.Should be equal     ${year}        ${get_year}[2]