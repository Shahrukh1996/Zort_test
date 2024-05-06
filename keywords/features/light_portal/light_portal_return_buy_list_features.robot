*** Keywords ***
Verify payment status
    [Documentation]         Verify payment status
    [Arguments]             ${id}       ${status}
    light_portal_return_buy_list_page.Quick search return buy list by id         ${id}
    light_portal_return_buy_list_page.Verify payment status                      ${id}       ${status}

Verify some payment status
    [Documentation]         Verify some payment status
    [Arguments]             ${id}
    light_portal_return_buy_list_page.Quick search return buy list by id         ${id}
    light_portal_return_buy_list_page.Verify some payment status                 ${id}

Input advance search and click confirm search
    [Documentation]     Input advance search and click confirm search
    [Arguments]         ${input}
    light_portal_return_buy_list_page.Input return buy list id       ${input['return_buy_id']}
    light_portal_return_buy_list_page.Select warehouse               ${input['warehouse']}
    light_portal_return_buy_list_page.Input search customer name     ${input['customer_name']}
    light_portal_return_buy_list_page.Input search minimum price     ${input['min_price']}
    light_portal_return_buy_list_page.Input search maximum price     ${input['max_price']}
    light_portal_return_buy_list_page.Input search product           ${input['product_id']}
    light_portal_return_buy_list_page.Input search telephone number  ${input['tel_number']}
    light_portal_return_buy_list_page.Input search email             ${input['email']}
    light_portal_return_buy_list_page.Input search refer name        ${input['refer']}
    light_portal_return_buy_list_page.Click confirm advance search
    light_portal_common_keywords.Wait for jquery loading completed