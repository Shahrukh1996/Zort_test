*** Variables ***
${print_return_product_page.btn_print}       xpath=//input[@value='พิมพ์เอกสาร']
${print_return_product_page.btn_save_doc}    xpath=//a[text()=' จัดเก็บเอกสาร']
${print_return_product_page.btn_display}     xpath=//button[text()='การแสดงผล ']
${print_return_product_page.txt_contact}     xpath=//table[@id='documentarea']//td[contains(text(),'contact')]
${print_return_product_page.txt_invoice_contact}     xpath=//span[text()='contact']
${print_return_product_page.txt_sign_line}   xpath=//div[@class='sign-line']
${print_return_product_page.txt_sign_person}     xpath=//div[@class='print-sign-person']
${print_return_product_page.txt_prod_id}     xpath=//td[text()='product_id']
${print_return_product_page.btn_share}      xpath=//a[text()='Share Link']

*** Keywords ***
Verify print button should be visible
    [Documentation]     Verify print button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_return_product_page.btn_print}

Verify save document button should be visible
    [Documentation]     Verify save document button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_return_product_page.btn_save_doc}

Verify display button should be visible
    [Documentation]     Verify display button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_return_product_page.btn_display}

Verify contact
    [Documentation]     Verify contact
    [Arguments]     ${contact}
    ${locator}      String.Replace string       ${print_return_product_page.txt_contact}       contact      ${contact}
    DobbyWebCommon.Wait until element is visible except stale     ${locator}

Verify product
    [Documentation]     Verify product
    [Arguments]     ${product_id}
    ${locator}      String.Replace string       ${print_return_product_page.txt_prod_id}       product_id      ${product_id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify sign box
    [Documentation]     Verify sign box
    SeleniumLibrary.Page should contain element   ${print_return_product_page.txt_sign_line}

Verify invoice contact
    [Documentation]     Verify invoice contact
    [Arguments]     ${contact}
    ${locator}      String.Replace string       ${print_return_product_page.txt_invoice_contact}       contact      ${contact}
    SeleniumLibrary.Page should contain element   ${locator}

Verify sign person
    [Documentation]     Verify sign person
    SeleniumLibrary.Page should contain element     ${print_return_product_page.txt_sign_person}

Verify share button should be visible
    [Documentation]     Verify share button should be visible
    DobbyWebCommon.Wait until element is visible except stale   ${print_return_product_page.btn_share}