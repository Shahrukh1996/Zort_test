*** Keywords ***

Verify create sell successfully
    [Documentation]  Verify create sell successfully
    light_portal_detail_sell_list_page.Verify create sell list success
    light_portal_detail_sell_list_page.Click ok button

Verify top status
    [Documentation]  Verify top status
    [Arguments]  ${status_payment}  ${status_transfer}  ${delivery_channel}
    light_portal_detail_sell_list_page.Payment status should be   ${status_payment}
    light_portal_detail_sell_list_page.Product transfer status should be  ${status_transfer}
    light_portal_detail_sell_list_page.Shipping form should be            ${delivery_channel}

Verify info detail
    [Documentation]  Verify info detail
    [Arguments]  ${code}  ${list_type}  ${date}  ${refer}  ${sales_channel}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.data.list}          ${code}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.data.list_type}     ${list_type}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.data.ref}           ${refer}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.data.sales_funnel}  ${sales_channel}

Verify full customer detail
    [Documentation]  Verify full customer detail
    [Arguments]  ${user_name}  ${customer_name}  ${customer_no}  ${customer_tel}  ${employee_tel}  ${employee_email}  ${employee_address}  ${tax_identification_number}  ${branch_name}  ${branch_number}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.list_creator}        ${user_name}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.customer_name}       ${customer_name}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.customer_no}         ${customer_no}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.customer_tel}        ${customer_tel}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.employee_tel}        ${employee_tel}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.employee_email}      ${employee_email}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.employee_address}    ${employee_address}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.tax_identification_number}    ${tax_identification_number}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.branch_name}        ${branch_name}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.customer.branch_number}      ${branch_number}

Verify full detail product
    [Documentation]   Verify full detail product
    [Arguments]  ${product_name}  ${prodect_code}  ${prodect_amount}  ${prodect_unit_value}  ${prodect_unit_discount}  ${prodect_total_price}  ${all_price}
    light_portal_detail_sell_list_page.Verify product name              ${product_name}
    light_portal_detail_sell_list_page.Verify code by product name      ${prodect_code}          ${product_name}
    light_portal_detail_sell_list_page.Verify amount by product name    ${prodect_amount}        ${product_name}
    light_portal_detail_sell_list_page.Verify unit value by product name      ${prodect_unit_value}     ${product_name}
    light_portal_detail_sell_list_page.Verify unit discount by product name   ${prodect_unit_discount}    ${product_name}
    light_portal_detail_sell_list_page.Verify total price by product name     ${prodect_total_price}      ${product_name}
    light_portal_detail_sell_list_page.Total net price should be              ${all_price}

Verify full recipient information
    [Documentation]  Verify full recipient information
    [Arguments]   ${name}  ${phone_no}  ${email}  ${address}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.recipient_information.recipient_name}       ${name}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.recipient_information.recipient_tel}        ${phone_no}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.recipient_information.recipient_email}      ${email}
    light_portal_detail_sell_list_page.Detailed review of the topic should be    ${add_sell_page.recipient_information.recipient_address}    ${address}

Verify payment is successful after adding amount price
    [Documentation]     Verify payment is successful after adding amount price
    light_portal_detail_sell_list_page.Add amount payment
    light_portal_detail_sell_list_page.Click confirm payment

Verify number of goods transfer is corrected
    [Documentation]     Verify number of goods transfer is corrected
    [Arguments]     ${number}
    light_portal_detail_sell_list_page.Click transfer some products
    Sleep  2s
    light_portal_detail_sell_list_page.Change number of goods transfer       ${number}
    light_portal_detail_sell_list_page.Click save button on goods transfer page

Confirm transfer all goods
    [Documentation]     Confirm transfer all goods
    light_portal_detail_sell_list_page.Click transfer all goods
    light_portal_detail_sell_list_page.Click confirm transfer all goods

Verify cancel order on transfer session is confirmed
    [Documentation]     Verify cancel order on transfer session is confirmed
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_detail_sell_list_page.Click command button
    light_portal_detail_sell_list_page.Click cancel button on transfer page
    light_portal_common_keywords.Wait for jquery loading completed
    SeleniumLibrary.Reload page
    light_portal_sell___list_page.Click open advanced search
    Sleep  2s
    light_portal_sell___list_page.Click confirm advanced search
    light_portal_detail_sell_list_page.Check status cancel is confirmed

Choose sell list from file
    [Documentation]     Choose sell list from file
    light_portal_common_keywords.Scroll to header of page
    light_portal_detail_sell_list_page.Click import file button
    light_portal_detail_sell_list_page.Click choose file button
    light_portal_detail_sell_list_page.Click save button on import file page
    light_portal_common_keywords.Wait for jquery loading completed
    SeleniumLibrary.Reload page
    # light_portal_detail_sell_list_page.Click minimize tab task Manager

Verify order number should be corrected
    [Documentation]     Verify order number should be corrected
    [Arguments]     ${order_number}
    light_portal_detail_sell_list_page.Search from list      ${order_number}
    light_portal_detail_sell_list_page.Check order number    ${order_number}

Verify customer detail should be corrected
    [Arguments]     ${sell_number}     ${customer_name}     ${product_name}    ${shipment_channel}
    light_portal_detail_sell_list_page.Sell number on detail field should be     ${sell_number}
    light_portal_detail_sell_list_page.Customer name on detail field should be   ${customer_name}
    light_portal_detail_sell_list_page.Product name on detail field should be    ${product_name}
    light_portal_detail_sell_list_page.Shipment on detail field should be        ${shipment_channel}