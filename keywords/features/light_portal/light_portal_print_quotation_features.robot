*** Keywords ***
Verify print quotation page
    [Documentation]     Verify print quotation page
    [Arguments]     ${contact}     ${product_id}
    light_portal_print_quotation_page.Verify print button should be visible
    light_portal_print_quotation_page.Verify display button should be visible
    light_portal_print_quotation_page.Verify save document button should be visible
    light_portal_print_quotation_page.Verify contact         ${contact}
    light_portal_print_quotation_page.Verify product         ${product_id}
    light_portal_print_quotation_page.Verify sign box

Verify print quotation tax invoice
    [Documentation]     Verify print quotation tax invoice
    [Arguments]     ${contact}     ${product_id}
    light_portal_print_quotation_page.Verify print button should be visible
    light_portal_print_quotation_page.Verify display button should be visible
    light_portal_print_quotation_page.Verify save document button should be visible
    light_portal_print_quotation_page.Verify invoice contact  ${contact}
    light_portal_print_quotation_page.Verify product         ${product_id}
    light_portal_print_quotation_page.Verify sign person