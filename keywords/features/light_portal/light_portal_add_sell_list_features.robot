*** Keywords ***

Add refer and sales channel
    [Documentation]  Add refer and sales channel
    [Arguments]  ${refer}  ${sales_channel}
    ${sell_code}   light_portal_add_sell_list_page.Get sell list code
    light_portal_add_sell_list_page.Input refer           ${refer}
    light_portal_add_sell_list_page.Input saleschannel    ${sales_channel}
    [Return]   ${sell_code}

Select customer information in the system by customer name
    [Documentation]   Select customer information in the system by customer name
    [Arguments]   ${customer_name}
    light_portal_add_sell_list_page.Input customer name    ${customer_name}
    light_portal_add_sell_list_page.Click use suggestion data   ${customer_name}

Select product with top button
    [Documentation]  Select product with top button
    [Arguments]  ${product_name}
    light_portal_add_sell_list_page.Click select products top button
    # light_portal_add_sell_list_page.Wait until last element of search product is displayed
    light_portal_add_sell_list_page.Input product code or product name to search  ${product_name}
    light_portal_add_sell_list_page.Click select product by name   ${product_name}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_add_sell_list_page.Click submit select products

Input require field on sell datail without input payment type
    [Documentation]     Input only require data without payment
    [Arguments]     ${customer_name}    ${product_name}     ${shipping_channel}     ${transfer_type}
    light_portal_add_sell_list_page.Input customer name      ${customer_name}
    light_portal_add_sell_list_features.Select product with top button   ${product_name}
    light_portal_add_sell_list_page.Input shipping channel   ${shipping_channel}
    light_portal_add_sell_list_page.Click copy from customer data for recipient
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_sell_list_page.Click select transfer goods   ${transfer_type}

Input require field on sell datail with pay
    [Documentation]     Input only require data without payment
    [Arguments]     ${customer_code}    ${product_name}
    light_portal_common_keywords.Auto keyword select contact from system  ${customer_code}
    light_portal_add_sell_list_features.Select product with top button   ${product_name}

Input shipping channel and transfer type
    [Arguments]     ${shipping_channel}     ${transfer_type}
    light_portal_add_sell_list_page.Input shipping channel   ${shipping_channel}
    light_portal_add_sell_list_page.Click copy from customer data for recipient
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_sell_list_page.Click select transfer goods   ${transfer_type}

Input payment detail after get price on product detail with full price
    [Documentation]     Input number of price that get from product detail
    ${price}=   light_portal_add_sell_list_page.Get total price
    light_portal_add_sell_list_page.Click add payment
    light_portal_add_sell_list_page.Input payment price    ${price}
    light_portal_add_sell_list_page.Click payment submit

Input payment detail after get price on product detail with full and plus more half price
    [Documentation]     Input number of price that get from product detail
    ${price}=   light_portal_add_sell_list_page.Get total price
    ${half_price}   BuiltIn.Evaluate    ${price}/2
    ${final_price}  BuiltIn.Evaluate    ${price}+${half_price}
    light_portal_add_sell_list_page.Click add payment
    light_portal_add_sell_list_page.Input payment price    ${final_price}
    light_portal_add_sell_list_page.Click payment submit

Input payment detail after get price on product detail with half price
    [Documentation]     Input number of price that get from product detail
    ${price}=   light_portal_add_sell_list_page.Get total price
    ${half_price}   BuiltIn.Evaluate    ${price}/2
    light_portal_add_sell_list_page.Click add payment
    light_portal_add_sell_list_page.Input payment price    ${half_price}
    light_portal_add_sell_list_page.Click payment submit

Input payment detail after get price on product detail with double price
    [Documentation]     Input number of price that get from product detail
    ${price}=   add_sell_list_page.Get total price
    ${double_price}   BuiltIn.Evaluate    ${price}*2
    light_portal_add_sell_list_page.Click add payment
    light_portal_add_sell_list_page.Input payment price    ${double_price}
    light_portal_add_sell_list_page.Click payment submit

Click save sell list and get sell list code
    [Documentation]     Click save sell list and get sell list code
    ${code}=    light_portal_add_sell_list_page.Get sell list code
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_sell_list_page.Click save button and confirm to go to next page
    [Return]        ${code}

Add new sell list
    [Documentation]    สร้างรายการขาย
    [Arguments]        ${test_data}
    light_portal_common_keywords.Scroll to top of page
    light_portal_add_sell_list_page.Input data basic of sell list    ${test_data ['basic_data']}