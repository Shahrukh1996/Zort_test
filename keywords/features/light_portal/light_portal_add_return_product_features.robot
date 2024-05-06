*** Keywords ***
Select product
    [Documentation]     Select product
    [Arguments]         ${product_id}
    light_portal_add_return_product_page.Click view product
    light_portal_add_return_product_page.Input product code or product name to search    ${product_id}
    light_portal_add_return_product_page.Click select product     ${product_id}

Select contact
    [Documentation]     Select contact
    [Arguments]         ${contact}
    light_portal_add_return_product_page.Click view contact
    light_portal_add_return_product_page.Input search contact        ${contact}
    light_portal_add_return_product_page.Click select contact        ${contact}

Create return product
    [Documentation]     Create return product
    [Arguments]     ${product_id}   ${contact}
    ${return_product_id}=    light_portal_add_return_product_page.Get return product id
    light_portal_add_return_product_features.Select product      ${product_id}
    light_portal_add_return_product_features.Select contact      ${contact}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_return_product_page.Click save return product
    [Return]        ${return_product_id}