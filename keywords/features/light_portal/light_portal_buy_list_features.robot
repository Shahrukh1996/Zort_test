*** Keywords ***
Clear advance search checkbox
    [Documentation]     Clear advance search checkbox
    light_portal_buy___list_page.Click checkbox wait transfer of transfer product
    light_portal_buy___list_page.Click checkbox success of transfer product
    light_portal_buy___list_page.Click checkbox transfer some part of transfer product
    light_portal_buy___list_page.Click checkbox cancel of transfer product
    light_portal_buy___list_page.Click checkbox wait payment of payment status
    light_portal_buy___list_page.Click checkbox payment some part of payment status
    light_portal_buy___list_page.Click checkbox full payment of payment status
    light_portal_buy___list_page.Click checkbox cancel of payment status

Input advance search id customer prouduct and refer
    [Documentation]     Input advance search
    [Arguments]         ${id}   ${customer}     ${product}      ${refer}
    light_portal_buy___list_page.Input search buy list id                  ${id}
    light_portal_buy___list_page.Input search buy list customer name       ${customer}
    light_portal_buy___list_page.Input search buy list product             ${product}
    light_portal_buy___list_page.Input search buy list refer               ${refer}

Input information in advance search and confirm search
    [Documentation]     Input information in advance search and confirm search
    [Arguments]         ${id}    ${customer_name}    ${from_amount}    ${to_amount}    ${product_name}    ${phone}    ${email}    ${refer}    ${serial_number}
    light_portal_buy___list_page.Click advance search
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_buy___list_page.Input search buy list id                  ${id}
    light_portal_buy___list_page.Input search buy list customer name       ${customer_name}
    light_portal_buy___list_page.Input search buy list from amount         ${from_amount}
    light_portal_buy___list_page.Input search buy list to amount           ${to_amount}
    light_portal_buy___list_page.Input search buy list product             ${product_name}
    light_portal_buy___list_page.Input search buy list phone number        ${phone}
    light_portal_buy___list_page.Input search buy list email               ${email}
    light_portal_buy___list_page.Input search buy list refer               ${refer}
    light_portal_buy___list_page.Input search buy list serial number       ${serial_number}
    light_portal_buy___list_page.Click checkbox hidden search
    light_portal_buy___list_page.Click confirm advance search

Verify information afer search should be corrected
    [Documentation]     Verify information afer search should be corrected
    [Arguments]         ${date}    ${name_buy}    ${customer_name}    ${amount}    ${status}    ${warehouse}    ${payment_status}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_buy___list_page.Verify date should be corrected               ${date}
    light_portal_buy___list_page.Verify name buy should be corrected           ${name_buy}
    light_portal_buy___list_page.Verify customer name should be corrected      ${customer_name}
    light_portal_buy___list_page.Verify amount should be corrected             ${amount}
    light_portal_buy___list_page.Verify status should be corrected             ${status}
    light_portal_buy___list_page.Verify warehouse should be corrected          ${warehouse}
    light_portal_buy___list_page.Verify payment status should be corrected     ${payment_status}

Verify information afer quick search should be corrected
    [Documentation]     Verify information afer quick search should be corrected
    [Arguments]         ${detail}       ${code}
    light_portal_side_menu_bar.click view buy list
    light_portal_buy___list_page.Quick search by id                                                ${code}
    light_portal_buy___list_page.Verify date should be corrected                                   ${code}  ${detail['search_date']}
    light_portal_buy___list_page.Verify buy list code should be corrected                          ${code}
    light_portal_buy___list_page.Verify customer name should be corrected                          ${detail['contact_name']}
    light_portal_buy___list_page.Verify amount should be corrected                                 ${detail['product_price']}
    light_portal_buy___list_page.Verify status after quick search should be corrected              ${detail['search_status']}
    light_portal_buy___list_page.Verify warehouse should be corrected                              ${detail['search_warehouse']}
    light_portal_buy___list_page.Verify payment status after quick search should be corrected      ${detail['pay_status']}

Input data of create buy
    [Arguments]      ${add_buy}
    [Documentation]  กรอกข้อมูลสร้างรายการซื้อ
    FOR  ${index}  IN  @{add_buy.keys()}
        IF  '${index}' == 'information_data'
            ${name_buy}=  light_portal_buy___add_page.Input data section information  ${add_buy ['${index}']}
        ELSE IF  '${index}' == 'payment_data'
            light_portal_buy___add_page.Input data section payment
        ELSE IF  '${index}' == 'transfer_data'
            light_portal_buy___add_page.Input data section transfer  ${add_buy ['${index}']}
        ELSE IF  '${index}' == 'product_data'
            light_portal_buy___add_page.Input data section product  ${add_buy ['${index}']}
        END
    END
    [Return]  ${name_buy}