*** Keywords ***

Verify product detail
    [Documentation]     Verify product detail
    [Arguments]         ${product_id}       ${product}
    light_portal_detail_product_list_page.Verify product list id                     ${product_id}
    light_portal_detail_product_list_page.Verify product list name                   ${product.name}
    light_portal_detail_product_list_page.Verify product list purchase price         ${product.purchase_price}
    light_portal_detail_product_list_page.Verify product list sell price             ${product.sell_price}
    light_portal_detail_product_list_page.Verify product list remain                 ${product.remains}
    light_portal_detail_product_list_page.Verify product list ready for sell         ${product.ready_for_sell}

Edit product name
    [Documentation]     Edit product name
    [Arguments]         ${name}
    light_portal_detail_product_list_page.Click edit product
    light_portal_detail_product_list_page.Input edit product name                    ${name}
    light_portal_detail_product_list_page.Click save edit product

Adjust amount of product
    [Documentation]     Adjust amount of product
    [Arguments]         ${warehouse}    ${amount}   ${price}
    light_portal_detail_product_list_page.Click adjust product amount
    light_portal_detail_product_list_page.Click select product for adjust amount     ${warehouse}
    light_portal_detail_product_list_page.Input adjust amount                        ${amount}
    light_portal_detail_product_list_page.Input adjust price per piece               ${price}
    light_portal_detail_product_list_page.Click save adjust amount

Delete product and close zortout website
    [Documentation]     Delete product and close zortout website
    [Arguments]         ${id}
    light_portal_detail_product_list_page.Click delete product list
    light_portal_detail_product_list_page.Click comfirm delete product list
    light_portal_product_list_page.Verify delete product should be not visible               ${id}
    light_portal_common_keywords.Close zortout website

Click command buy product and verify buy product page should be visible
    [Documentation]     Click command buy product and verify buy product page should be visible
    light_portal_detail_product_list_page.Click command button
    light_portal_detail_product_list_page.Click command buy product
    light_portal_add_buy_list_page.Verify title add buy list page
    light_portal_common_keywords.Back to previous page

Click command sell product and verify sell product page should be visible
    [Documentation]     Click command sell product and verify sell product page should be visible
    light_portal_detail_product_list_page.Click command button
    light_portal_detail_product_list_page.Click command sell product
    light_portal_add_sell_list_page.Verify title add sell list page
    light_portal_common_keywords.Back to previous page

Click command transfer product and verify transfer product page should be visible
    [Documentation]     Click command transfer product and verify transfer product page should be visible
    light_portal_detail_product_list_page.Click command button
    light_portal_detail_product_list_page.Click command transfer product
    light_portal_add_transfer_product_page.Verify title add transfer product page
    light_portal_common_keywords.Back to previous page