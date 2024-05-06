*** Variables ***
${view_sell_list_page.lbl_order_code}            xpath=//div[@id='TransactionTable']//td//a[.='$code']
${view_sell_list_page.btn_advance_search}       id=btn-switch-filter
${view_sell_list_page.txt_search_number}        id=searchnumber
${view_sell_list_page.txt_search_customer}      id=searchcustomername
${view_sell_list_page.txt_search_product}       id=searchproduct
${view_sell_list_page.txt_search_refer}         id=searchrefname
${view_sell_list_page.txt_search_shipping}      id=searchshippingchannel
${view_sell_list_page.btn_search_confirm}       xpath=//h3[text()='ค้นหาขั้นสูง']/parent::div//input[@value='ค้นหา']
${view_sell_list_page.btn_transfer_wait}                xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='รอโอนสินค้า']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_success}             xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='สำเร็จ']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_some_part}           xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='โอนบางส่วน']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_cancel}              xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='ยกเลิก']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_expire}              xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='ยกเลิก (หมดอายุ)']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_wait_shipping}       xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='รอส่งสินค้า']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_shipping}            xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='กำลังส่งสินค้า']]//input[@type='checkbox']
${view_sell_list_page.btn_transfer_cancel_shipping}     xpath=//h3[text()='การโอนสินค้า | การจัดส่ง']/following-sibling::label[span[text()='ยกเลิกการส่งสินค้า']]//input[@type='checkbox']
${view_sell_list_page.btn_payment_wait}                 xpath=//h3[text()=' สถานะการชำระเงิน']/following-sibling::label[span[text()='รอการชำระเงิน']]//input[@type='checkbox']
${view_sell_list_page.btn_payment_some_part}            xpath=//h3[text()=' สถานะการชำระเงิน']/following-sibling::label[span[text()='ชำระบางส่วน']]//input[@type='checkbox']
${view_sell_list_page.btn_payment_full}                 xpath=//h3[text()=' สถานะการชำระเงิน']/following-sibling::label[span[text()='ชำระครบ']]//input[@type='checkbox']
${view_sell_list_page.btn_payment_cancel}               xpath=//h3[text()=' สถานะการชำระเงิน']/following-sibling::label[span[text()='ยกเลิก']]//input[@type='checkbox']
${view_sell_list_page.btn_from_shipping_date}           xpath=//input[@name='fromshippingdate']/parent::div[@data-date-format="d/m/yyyy"]
${view_sell_list_page.btn_to_shipping_date}             xpath=//input[@name='toshippingdate']/parent::div[@data-date-format="d/m/yyyy"]

*** Keywords ***

Click select order by code list
    [Documentation]   Click select order by code list
    [Arguments]   ${code}
    ${lbl_order_code}         String.Replace string          ${view_sell_list_page.lbl_order_code}     $code     ${code}
    DobbyWebCommon.Click element when ready                  ${lbl_order_code}

Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready                 ${view_sell_list_page.btn_advance_search}

Input search number
    [Documentation]     Input search number
    [Arguments]         ${number}
    DobbyWebCommon.Input text to element when ready     ${view_sell_list_page.txt_search_number}             ${number}

Input search customer name
    [Documentation]     Input search customer name
    [Arguments]         ${customer}
    DobbyWebCommon.Input text to element when ready     ${view_sell_list_page.txt_search_customer}          ${customer}

Input search product
    [Documentation]     Input search product
    [Arguments]         ${product}
    DobbyWebCommon.Input text to element when ready     ${view_sell_list_page.txt_search_product}           ${product}

Input search refer
    [Documentation]     Input search refer
    [Arguments]         ${refer}
    DobbyWebCommon.Input text to element when ready     ${view_sell_list_page.txt_search_refer}             ${refer}

Input search shipping
    [Documentation]     Input search shipping
    [Arguments]         ${shipping}
    DobbyWebCommon.Input text to element when ready     ${view_sell_list_page.txt_search_shipping}          ${shipping}

Click checkbox wait transfer of transfer product
    [Documentation]     Click checkbox wait transfer of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_wait}

Click checkbox success of transfer product
    [Documentation]     Click checkbox success of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_success}

Click checkbox transfer some part of transfer product
    [Documentation]     Click checkbox transfer some part of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_some_part}

Click checkbox cancel of transfer product
    [Documentation]     Click checkbox cancel of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_cancel}

Click checkbox cancel and expire of transfer product
    [Documentation]     Click checkbox cancel and expire of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_expire}

Click checkbox wait shipping of transfer product
    [Documentation]     Click checkbox wait shipping of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_wait_shipping}

Click checkbox shipping of transfer product
    [Documentation]     Click checkbox shipping of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_shipping}

Click checkbox cancel shipping of transfer product
    [Documentation]     Click checkbox cancel shipping of transfer product
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_transfer_cancel_shipping}

Click checkbox wait payment of payment status
    [Documentation]     Click checkbox wait payment of payment status
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_payment_wait}

Click checkbox payment some part of payment status
    [Documentation]     Click checkbox payment some part of payment status
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_payment_some_part}

Click checkbox full payment of payment status
    [Documentation]     Click checkbox full payment of payment status
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_payment_full}

Click checkbox cancel of payment status
    [Documentation]     Click checkbox cancel of payment status
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_payment_cancel}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready     ${view_sell_list_page.btn_search_confirm}

Click select from shipping date
    [Documentation]     Click select from shipping date
    DobbyWebCommon.Click element when ready         ${view_sell_list_page.btn_from_shipping_date}

Click select to shipping date
    [Documentation]     Click select to shipping date
    DobbyWebCommon.Click element when ready         ${view_sell_list_page.btn_to_shipping_date}