*** Keywords ***
Input and select data
    [Documentation]     Input and select data and return list id
    [Arguments]         ${data}
    light_portal_common_keywords.Auto keyword remove dom chat support
    ${id}       light_portal_add_product_list_page.Get product list id
    light_portal_add_product_list_page.Select property                   ${data.property}
    light_portal_add_product_list_page.Click radio button of list type   ${data.type}
    light_portal_add_product_list_page.Input product name                ${data.name}
    light_portal_add_product_list_page.Select category                   ${data.category}
    light_portal_add_product_list_page.Input purchase price              ${data.purchase_price}
    light_portal_add_product_list_page.Input sell price                  ${data.sell_price}
    light_portal_add_product_list_page.Input bring price                 ${data.bring_price}
    light_portal_add_product_list_page.Select warehouse                  ${data.warehouse}
    light_portal_add_product_list_page.Click save add product list
    [Return]        ${id}