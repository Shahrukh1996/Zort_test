*** Variables ***
${buy_list_page.btn_advance_search}                 xpath=//a[text()='ค้นหาขั้นสูง']
${buy_list_page.txt_search_id}                      id=searchnumber
${buy_list_page.txt_search_cust_name}               id=searchcustomername
${buy_list_page.txt_search_product}                 id=searchproduct
${buy_list_page.txt_search_refer}                   id=searchrefname
${buy_list_page.btn_transfer_wait}                  xpath=//h3[text()='การโอนสินค้า']/following-sibling::label[span[text()='รอโอนสินค้า']]//input[@type='checkbox']
${buy_list_page.btn_transfer_success}               xpath=//h3[text()='การโอนสินค้า']/following-sibling::label[span[text()='สำเร็จ']]//input[@type='checkbox']
${buy_list_page.btn_transfer_some_part}             xpath=//h3[text()='การโอนสินค้า']/following-sibling::label[span[text()='โอนบางส่วน']]//input[@type='checkbox']
${buy_list_page.btn_transfer_cancel}                xpath=//h3[text()='การโอนสินค้า']/following-sibling::label[span[text()='ยกเลิก']]//input[@type='checkbox']
${buy_list_page.btn_payment_wait}                   xpath=//h3[text()='สถานะการชำระเงิน']/following-sibling::label[span[text()='รอการชำระเงิน']]//input[@type='checkbox']
${buy_list_page.btn_payment_some_part}              xpath=//h3[text()='สถานะการชำระเงิน']/following-sibling::label[span[text()='ชำระบางส่วน']]//input[@type='checkbox']
${buy_list_page.btn_payment_fully}                  xpath=//h3[text()='สถานะการชำระเงิน']/following-sibling::label[span[text()='ชำระครบ']]//input[@type='checkbox']
${buy_list_page.btn_payment_cancel}                 xpath=//h3[text()='สถานะการชำระเงิน']/following-sibling::label[span[text()='ยกเลิก']]//input[@type='checkbox']
${buy_list_page.btn_confirm_search}                 xpath=//h3[text()='ค้นหาขั้นสูง']/parent::div//input[@value='ค้นหา']
${buy_list_page.btn_select_buy_list}                xpath=//a[text()='id']
${buy_list_page.txt_quick_search}                   id=quicksearchtext
${buy_list_page.txt_status_transfer}                xpath=//a[text()='**CODE**']/ancestor::tr//td[contains(@class,'status')]//span[text()='**STATUS**']
${buy_list_page.btn_hidden_search}                  id=checkshowarchive
${buy_list_page.txt_from_amount}                    id=fromamount
${buy_list_page.txt_to_amount}                      id=toamount
${buy_list_page.txt_phone}                          id=searchcustomerphone
${buy_list_page.txt_email}                          id=searchcustomeremail
${buy_list_page.txt_serial_number}                  id=searchserialno
${buy_list_page.btn_search_by_advance_search}       id=checkshowarchive
${buy_list_page.lbl_date}                           xpath=//td[@class='name-buy']/div/a[contains(text(),'***CODE***')]/ancestor::tr/td[@class='date' and contains(text(),'***DATE***')]
${buy_list_page.lbl_name_buy}                       xpath=//td[@class='name-buy']//span[text()='///text///']
${buy_list_page.lbl_buy_list_code}                  xpath=//td[@class='name-buy']//a[text()='///text///']
${buy_list_page.lbl_customer_name}                  xpath=//td[@class='customer']//a[contains(text(),'///text///')]
${buy_list_page.lbl_amount}                         xpath=//td[contains(@class,'amount')][contains(text(),'///text///')]
${buy_list_page.lbl_status}                         xpath=//td[contains(@class,'status')]/span[contains(text(),'///text///')]
${buy_list_page.lbl_warehouse}                      xpath=//td[contains(@class,'status')]//span[contains(@class,'warehouse')][contains(text(),'///text///')]
${buy_list_page.lbl_payment_status}                 xpath=//td[contains(@class,'payment')]/span[contains(text(),'///text///')]
${buy_list_page.txt_payment_status}                 xpath=//td[contains(@class,'payment')]//u[text()='///text///']
${buy_list_page.txt_status}                         xpath=//td[contains(@class,'status')]//u[contains(text(),'///text///')]

&{light_portal_buy_list___button}                   add_buy=//button[@id='addTransactionBtn' and text()='สร้าง']

&{light_portal_buy_list___table__button}            list=//table/tbody/tr/td[@class='name-buy']//a[text()='**name_buy**']


*** Keywords ***
Click advance search
    [Documentation]         Click advance search
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_advance_search}

Input search buy list id
    [Documentation]     Input search buy list id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_search_id}             ${id}

Input search buy list customer name
    [Documentation]     Input search buy list customer name
    [Arguments]         ${name}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_search_cust_name}       ${name}

Input search buy list product
    [Documentation]     Input search buy list product
    [Arguments]         ${product}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_search_product}         ${product}

Input search buy list refer
    [Documentation]     Input search buy list refer
    [Arguments]         ${refer}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_search_refer}            ${refer}

Click checkbox wait transfer of transfer product
    [Documentation]     Click checkbox wait transfer of transfer product
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_transfer_wait}

Click checkbox success of transfer product
    [Documentation]     Click check box success of transfer product
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_transfer_success}

Click checkbox transfer some part of transfer product
    [Documentation]     Click checkbox transfer some part of transfer product
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_transfer_some_part}

Click checkbox cancel of transfer product
    [Documentation]     Click checkbox cancel of transfer product
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_transfer_cancel}

Click checkbox wait payment of payment status
    [Documentation]     Click checkbox wait payment of payment status
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_payment_wait}

Click checkbox payment some part of payment status
    [Documentation]     Click checkbox payment some part of payment status
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_payment_some_part}

Click checkbox full payment of payment status
    [Documentation]     Click checkbox full payment of payment status
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_payment_fully}

Click checkbox cancel of payment status
    [Documentation]     Click checkbox cancel of payment status
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_payment_cancel}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_confirm_search}

Click select buy list by id
    [Documentation]     Click select buy list by id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${buy_list_page.btn_select_buy_list}        id      ${id}
    DobbyWebCommon.Click element when ready         ${locator}

Quick search by id
    [Documentation]     Quick search by id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${buy_list_page.txt_quick_search}       ${id}
    SeleniumLibrary.Press keys          None        RETURN

Verify product status transfer
    [Documentation]     Verify product status transfer
    [Arguments]         ${code}     ${status}
    ${locator}          String.Replace string       ${buy_list_page.txt_status_transfer}        **CODE**      ${code}
    ${locator}          String.Replace string       ${locator}      **STATUS**          ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Input search buy list from amount
    [Documentation]     Input search buy list from amount
    [Arguments]         ${amount}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_from_amount}        ${amount}

Input search buy list to amount
    [Documentation]     Input search buy list from amount
    [Arguments]         ${amount}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_to_amount}          ${amount}

Input search buy list phone number
    [Documentation]     Input search buy list phone number
    [Arguments]         ${phone}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_phone}          ${phone}

Input search buy list email
    [Documentation]     Input search buy list email
    [Arguments]         ${email}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_email}          ${email}

Input search buy list serial number
    [Documentation]     Input search buy list serial number
    [Arguments]         ${serial_number}
    DobbyWebCommon.Input text to element when ready         ${buy_list_page.txt_serial_number}          ${serial_number}

Click checkbox hidden search
    [Documentation]     Click checkbox hidden search
    DobbyWebCommon.Click element when ready         ${buy_list_page.btn_hidden_search}

Verify date should be corrected
    [Documentation]     Verify product status transfer
    [Arguments]         ${code}  ${date}
    &{str_replace}=  BuiltIn.Create dictionary  ***CODE***=${code}  ***DATE***=${date}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${buy_list_page.lbl_date}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale       ${new_xpath}

Verify name buy should be corrected
    [Documentation]     Verify name buy should be corrected
    [Arguments]         ${name_buy}
    ${locator}          String.Replace string       ${buy_list_page.lbl_name_buy}      ///text///      ${name_buy}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify customer name should be corrected
    [Documentation]     Verify customer name should be corrected
    [Arguments]         ${customer_name}
    ${locator}          String.Replace string       ${buy_list_page.lbl_customer_name}      ///text///      ${customer_name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify amount should be corrected
    [Documentation]     Verify amount should be corrected
    [Arguments]         ${amount}
    ${locator}          String.Replace string       ${buy_list_page.lbl_amount}      ///text///      ${amount}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify status should be corrected
    [Documentation]     Verify status should be corrected
    [Arguments]         ${status}
    ${locator}          String.Replace string       ${buy_list_page.lbl_status}      ///text///      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify warehouse should be corrected
    [Documentation]     Verify warehouse should be corrected
    [Arguments]         ${warehouse}
    ${locator}          String.Replace string       ${buy_list_page.lbl_warehouse}      ///text///      ${warehouse}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify payment status should be corrected
    [Documentation]     Verify payment status should be corrected
    [Arguments]         ${payment_status}
    ${locator}          String.Replace string       ${buy_list_page.lbl_payment_status}      ///text///      ${payment_status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify buy list code should be corrected
    [Documentation]     Verify buy list code should be corrected
    [Arguments]         ${code}
    ${locator}          String.Replace string       ${buy_list_page.lbl_buy_list_code}      ///text///      ${code}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify payment status after quick search should be corrected
    [Documentation]     Verify payment status after quick search should be corrected
    [Arguments]         ${payment_status}
    ${locator}          String.Replace string       ${buy_list_page.txt_payment_status}      ///text///      ${payment_status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify status after quick search should be corrected
    [Documentation]     Verify status after quick search should be corrected
    [Arguments]         ${status}
    ${locator}          String.Replace string       ${buy_list_page.txt_status}      ///text///      ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click create buy
    [Documentation]  กดปุ่ม 'สร้างรายการซื้อ'
        SeleniumLibrary.Click element  ${light_portal_buy_list___button.add_buy}
        light_portal_common_keywords.Wait for jquery loading completed

Click list by name
    [Arguments]      ${name_buy}
    [Documentation]  คลิกปุ่ม 'รายการ' อิงจาก ชื่อ
        &{str_replace}=  BuiltIn.Create dictionary  **name_buy**=${name_buy}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_buy_list___table__button.list}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_common_keywords.Wait for jquery loading completed