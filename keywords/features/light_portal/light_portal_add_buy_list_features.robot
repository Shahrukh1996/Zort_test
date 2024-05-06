*** Keywords ***
Add buy list with product id and product amount
    [Documentation]     Add buy list with product id and product amount
    [Arguments]         ${name}   ${amount}
    ${code}     light_portal_add_buy_list_page.Get buy list code
    light_portal_add_buy_list_page.Click add product
    light_portal_add_buy_list_page.Quick search product                  ${name}
    light_portal_add_buy_list_page.Click select product by name          ${name}
    light_portal_add_buy_list_page.Input product amount                  ${amount}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_buy_list_page.Click save buy list
    [Return]        ${code}

Input product contact vat shipping and warehouse then click save
    [Documentation]         Input product contact vat shipping and warehouse then click save
    [Arguments]     ${detail}
    light_portal_add_buy_list_page.Click add product
    light_portal_add_buy_list_page.Quick search product              ${detail['product_name']}
    light_portal_add_buy_list_page.Click select product by name      ${detail['product_name']}
    light_portal_add_buy_list_page.Input product amount              ${detail['product_amount']}
    ${code}     light_portal_add_buy_list_page.Get buy list code
    light_portal_add_buy_list_page.Click add contact
    light_portal_add_buy_list_page.Quick search contact              ${detail['contact_id']}
    light_portal_add_buy_list_page.Click select contact by id        ${detail['contact_id']}
    light_portal_add_buy_list_page.Select vat option                 ${detail['vat_option']}
    light_portal_add_buy_list_page.Input shipping channel            ${detail['shipping_channel']}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_buy_list_page.Select warehouse                  ${detail['warehouse']}
    light_portal_add_buy_list_page.Click save buy list
    [Return]        ${code}