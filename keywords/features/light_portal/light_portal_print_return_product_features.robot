*** Keywords ***

Verify print return product page
    [Documentation]     Verify print return product page
    [Arguments]     ${contact}     ${product_id}
    light_portal_print_return_product_page.Verify print button should be visible
    light_portal_print_return_product_page.Verify display button should be visible
    light_portal_print_return_product_page.Verify save document button should be visible
    light_portal_print_return_product_page.Verify contact         ${contact}
    light_portal_print_return_product_page.Verify product         ${product_id}
    light_portal_print_return_product_page.Verify sign box

Verify print return product tax invoice
    [Documentation]     Verify print return product tax invoice
    [Arguments]     ${contact}     ${product_id}
    light_portal_print_return_product_page.Verify share button should be visible
    light_portal_print_return_product_page.Verify print button should be visible
    light_portal_print_return_product_page.Verify display button should be visible
    light_portal_print_return_product_page.Verify save document button should be visible
    light_portal_print_return_product_page.Verify invoice contact  ${contact}
    light_portal_print_return_product_page.Verify product         ${product_id}
    light_portal_print_return_product_page.Verify sign person

Input print title and click confirm
    [Documentation]     Input print title and click confirm
    [Arguments]     ${title}
    light_portal_return_product_list_page.Input print title  ${title}
    light_portal_return_product_list_page.Click confirm print