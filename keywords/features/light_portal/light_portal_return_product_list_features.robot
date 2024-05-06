*** Keywords ***
Advance search
    [Documentation]     Advance search
    [Arguments]     ${data}
    light_portal_return_product_list_page.Input search return product number  ${data['return_prod_number']}
    light_portal_return_product_list_page.Input search customer name    ${data['customer_name']}
    light_portal_return_product_list_page.Input search low value        ${data['low_value']}
    light_portal_return_product_list_page.Input search high value       ${data['high_value']}
    light_portal_return_product_list_page.Input search product id        ${data['product_id']}
    light_portal_return_product_list_page.Input search telephone number  ${data['tel_number']}
    light_portal_return_product_list_page.Input search email             ${data['cumtomer_email']}
    light_portal_return_product_list_page.Input search refer             ${data['refer']}
    light_portal_return_product_list_features.Select warehouse           ${data['warehouse']}
    light_portal_return_product_list_page.Click confirm advance search

Select warehouse
    [Documentation]     Select warehouse
    [Arguments]     ${warehouse}
    light_portal_return_product_list_page.Click search warehouse dropdown
    light_portal_return_product_list_page.Select search warehouse        ${warehouse}

Verify advance search
    [Documentation]     Verify advance search
    [Arguments]     ${data}
    light_portal_return_product_list_page.Verify search return product id    ${data['return_prod_number']}
    light_portal_return_product_list_page.Verify search refer                ${data['refer']}
    light_portal_return_product_list_page.Verify search customer name        ${data['customer_name']}

Verify popup when require data is incomplete
    [Documentation]     Verify popup when require data is incomplete
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_return_product_list_page.Click save return product
    light_portal_return_product_list_page.Popup is displayed when data not complete
    light_portal_return_product_list_page.Click okay button on error message popup

Select product with top button
    [Documentation]     Select product with top button
    [Arguments]  ${product_name}
    light_portal_return_product_list_page.Click select products top button
    light_portal_return_product_list_page.Wait until last element of search product is displayed
    light_portal_return_product_list_page.Input product code or product name to search  ${product_name}
    light_portal_return_product_list_page.Click select product by name       ${product_name}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_return_product_list_page.Click submit select products

Save and verify created return id
    [Documentation]     Save and verify created return id
    [Arguments]     ${return_id}
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_return_product_list_page.Click save return product
    light_portal_return_product_list_page.Check return id is created     ${return_id}

Verify top status
    [Documentation]     Verify top status
    [Arguments]     ${status_payment}      ${status_transfer}
    light_portal_return_product_list_page.Payment status should be               ${status_payment}
    light_portal_return_product_list_page.Product transfer status should be      ${status_transfer}

Search return id on quick search
    [Documentation]     Search return id on quick search
    [Arguments]      ${return_id}
    light_portal_return_product_list_page.Search by return id       ${return_id}
    SeleniumLibrary.Press keys      None        ENTER
    ${new_xpath}=    Replace String      //td[@class='name-buy-return']//a[text()='///text///']       ///text///       ${return_id}
    light_portal_common_keywords.Auto keyword wait element  ${new_xpath}

Edit return detail after create successfully
    [Documentation]     Edit return detail after create successfully
    [Arguments]     ${shopping_channel}  ${return_id}
    light_portal_return_product_list_page.Click more command  ${return_id}
    light_portal_return_product_list_page.Click edit
    light_portal_return_product_list_page.Input shipping channel     ${shopping_channel}
    light_portal_return_product_list_page.Click save return product

Verify shipping channel should be corrected
    [Documentation]     Verify shipping channel should be corrected
    [Arguments]     ${return_id}    ${shipping_channel}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_features.Search return id on quick search       ${return_id}
    light_portal_return_product_list_page.Select by return code      ${return_id}
    light_portal_return_product_list_page.Verify shipping channel    ${shipping_channel}

Select product with top button and input amount product
    [Documentation]     Select product with top button and input amount product
    [Arguments]     ${product_name}     ${amount}
    light_portal_return_product_list_page.Click select products top button
    light_portal_return_product_list_page.Input product code or product name to search  ${product_name}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_return_product_list_page.Click select product by name       ${product_name}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_return_product_list_page.Click submit select products
    light_portal_return_product_list_page.Input amount product  ${amount}

Verify number of goods transfer is corrected
    [Documentation]     Verify number of goods transfer is corrected
    [Arguments]     ${number}
    light_portal_return_product_list_page.Click transfer some products
    light_portal_return_product_list_page.Change number of goods transfer    ${number}
    light_portal_return_product_list_page.Click save button on goods transfer page

Input payment and verify status should be corrected
    [Documentation]     Input payment and verify status should be corrected
    [Arguments]     ${payment_amount}       ${payment_status}       ${transfer_status}
    light_portal_return_product_list_page.Click add more payment
    light_portal_return_product_list_page.Input amount payment       ${payment_amount}
    light_portal_return_product_list_page.Click confirm payment data
    light_portal_return_product_list_features.Verify top status      ${payment_status}       ${transfer_status}
