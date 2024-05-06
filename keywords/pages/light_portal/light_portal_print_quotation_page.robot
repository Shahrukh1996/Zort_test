*** Variables ***
${print_quotation_page.btn_print}       xpath=//input[@value='พิมพ์เอกสาร']
${print_quotation_page.btn_save_doc}    xpath=//a[text()=' จัดเก็บเอกสาร']
${print_quotation_page.btn_display}     xpath=//button[text()='การแสดงผล ']
${print_quotation_page.txt_contact}     xpath=//b[text()='ผู้ติดต่อ:']/parent::td/parent::tr/td[span[@class='contactcodearea']]
${print_quotation_page.txt_invoice_contact}     xpath=//span[text()='contact']
${print_quotation_page.txt_sign_line}   xpath=//div[@class='sign-line']
${print_quotation_page.txt_sign_person}     xpath=//div[@class='print-sign-person']
${print_quotation_page.txt_prod_id}     xpath=//td[text()='product_id']

*** Keywords ***
Verify print button should be visible
    [Documentation]     Verify print button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_quotation_page.btn_print}

Verify save document button should be visible
    [Documentation]     Verify save document button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_quotation_page.btn_save_doc}

Verify display button should be visible
    [Documentation]     Verify display button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_quotation_page.btn_display}

Verify contact
    [Documentation]     Verify contact
    [Arguments]     ${contact}
    ${txt_contact}=     DobbyWebCommon.Get text from element when ready     ${print_quotation_page.txt_contact}
    BuiltIn.Should contain     ${txt_contact}  ${contact}

Verify product
    [Documentation]     Verify product
    [Arguments]     ${product_id}
    ${locator}      String.Replace string       ${print_quotation_page.txt_prod_id}       product_id      ${product_id}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Verify sign box
    [Documentation]     Verify sign box
    SeleniumLibrary.Page should contain element   ${print_quotation_page.txt_sign_line}

Verify invoice contact
    [Documentation]     Verify invoice contact
    [Arguments]     ${contact}
    ${locator}      String.Replace string       ${print_quotation_page.txt_invoice_contact}       contact      ${contact}
    SeleniumLibrary.Page should contain element   ${locator}

Verify sign person
    [Documentation]     Verify sign person
    SeleniumLibrary.Page should contain element     ${print_quotation_page.txt_sign_person}
