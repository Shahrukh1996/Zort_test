*** Keywords ***
Select product
    [Documentation]     Select product
    [Arguments]         ${product_id}
    light_portal_add_quotation_page.Click view product
    light_portal_add_quotation_page.Input product code or product name to search    ${product_id}
    light_portal_add_quotation_page.Click select product     ${product_id}

Select contact
    [Documentation]     Select contact
    [Arguments]         ${contact}
    light_portal_add_quotation_page.Click view contact
    light_portal_add_quotation_page.Input search contact     ${contact}
    light_portal_add_quotation_page.Click select contact     ${contact}

Create quotation
    [Documentation]     Create quotation
    [Arguments]     ${product_id}   ${contact}      ${saleschannel}
    ${quotation_id}=    light_portal_add_quotation_page.Get quotation id
    light_portal_add_quotation_features.Select product  ${product_id}
    light_portal_add_quotation_features.Select contact  ${contact}
    light_portal_add_quotation_page.Input sales channel  ${saleschannel}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_quotation_page.Click save quotation
    [Return]        ${quotation_id}

Choose customer name from customer code
    [Documentation]     Choose customer name from customer code
    [Arguments]     ${customer_code}
    light_portal_add_quotation_page.Input customer name      ${customer_code}
    SeleniumLibrary.Press keys      None        ARROW_DOWN
    SeleniumLibrary.Press keys      None        ENTER

Verify popup when require data is incomplete
    [Documentation]     Verify popup when require data is incomplete
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_quotation_page.Click save quotation
    light_portal_add_quotation_page.Popup is displayed when data not complete
    light_portal_add_quotation_page.Click okay button on error message popup

Search quotaion id on quick search
    [Documentation]     Search quotaion id on quick search
    [Arguments]      ${quotation_id}
    light_portal_add_quotation_page.Search by quotation id       ${quotation_id}
    SeleniumLibrary.Press keys      None        ENTER


Save quotation and verify quotation id is created
    [Documentation]     Save quotation and verify quotation id is created
    [Arguments]     ${quotation_id}
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_common_keywords.Scroll to footer of page
    light_portal_add_quotation_page.Click save quotation
    light_portal_add_quotation_page.Check quotation id is created    ${quotation_id}

Edit quotation detail after create successfully
    [Arguments]  ${quotation_id}
    [Documentation]     Edit quotation detail after create successfully
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_add_quotation_page.Click more command
    light_portal_common_keywords.Scroll to footer of page
    light_portal_add_quotation_page.Click edit  ${quotation_id}
    light_portal_add_quotation_page.Add more amount of product
    light_portal_add_quotation_page.Click save quotation