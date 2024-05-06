*** Keywords ***
Verify import result
    [Documentation]     Verify import result
    [Arguments]     ${product}
    light_portal_product_list_page.Verify product list id                ${product.product_id}
    light_portal_product_list_page.Verify product list name              ${product.product_id}   ${product.product_name}
    light_portal_product_list_page.Verify product list category          ${product.product_id}   ${product.product_category}
    light_portal_product_list_page.Verify product list tag               ${product.product_id}   ${product.product_tag}
    light_portal_product_list_page.Verify product list purchase price    ${product.product_id}   ${product.purchase_price}
    light_portal_product_list_page.Verify product list sell price        ${product.product_id}   ${product.sell_price}
    light_portal_product_list_page.Verify product list remain            ${product.product_id}   ${product.remains}
    light_portal_product_list_page.Verify product list ready for sell    ${product.product_id}   ${product.ready_for_sell}

Verify create product list
    [Documentation]     Verify create product list
    [Arguments]     ${product_id}   ${product}
    light_portal_common_keywords.Wait for jquery loading completed
    SeleniumLibrary.Reload page
    light_portal_product_list_page.Verify product list id                ${product_id}
    light_portal_product_list_page.Verify product list name              ${product_id}   ${product.name}
    light_portal_product_list_page.Verify product list purchase price    ${product_id}   ${product.purchase_price}
    light_portal_product_list_page.Verify product list sell price        ${product_id}   ${product.sell_price}
    light_portal_product_list_page.Verify product list remain            ${product_id}   ${product.remains}
    light_portal_product_list_page.Verify product list ready for sell    ${product_id}   ${product.ready_for_sell}

Clear advance search checkbox
    [Documentation]     Clear advance search checkbox
    light_portal_product_list_page.Click checkbox type product
    light_portal_product_list_page.Click checkbox type service

Input advance search id name minimum price and tag
    [Documentation]     Input advance search id name minimum price and tag
    [Arguments]         ${info}
    light_portal_product_list_page.Input advance search id                       ${info['search_id']}
    light_portal_product_list_page.Input advance search product name             ${info['search_name']}
    light_portal_product_list_page.Input advance search min sell price           ${info['search_min_sell']}
    light_portal_product_list_page.Input advance search min purchase price       ${info['search_min_purchase']}
    light_portal_product_list_page.Input advance search tag                      ${info['search_tag']}

Select advance search warehouse and category
    [Documentation]     Select advance search warehouse and category
    [Arguments]         ${warehouse}        ${category}
    light_portal_product_list_page.Select advance search warehouse       ${warehouse}
    light_portal_product_list_page.Select advance search category        ${category}

Click advance search and clear checkbox
    [Documentation]     Click advance search and clear checkbox
    light_portal_product_list_page.Click advance search
    light_portal_product_list_features.Clear advance search checkbox