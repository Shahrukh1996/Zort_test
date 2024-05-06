*** Variables ***
${add_quotation_page.btn_view_prod}                 xpath=//table[@id='productrow'] //a[text()='เลือก']
${add_quotation_page.txt_saleschannel}              id=saleschannel
${add_quotation_page.btn_save_quotation}            xpath=//button[text()='บันทึก']
${add_quotation_page.txt_quotation_id}              id=number
${add_quotation_page.txt_customer_name}             id=customername
${add_quotation_page.btn_confirm}                   xpath=//div[@id='confirmModal']//button[contains(text(), 'ยืนยัน')]
${add_quotation_page.lbl_error_popup}               xpath=//p[@id="errormsg"][text()='กรุณาใส่ข้อมูลให้ครบถ้วน']
${add_quotation_page.btn_okay_on_error_popup}       xpath=//div[@id="errorModal"]//button[text()='ตกลง']
${add_quotation_page.txt_search_id}                 id=quicksearchtext
${add_quotation_page.lbl_status_quotation_id}       xpath=//section[@id="main1"]//div[contains(@title, 'บันทึก')][contains(text(), '///text///')]
${add_quotation_page.btn_command}                   xpath=//div[@id='TransactionTable']//i[@data-toggle='dropdown']
${add_quotation_page.list_name}                     xpath=//a[text()='///text///']
${add_quotation_page.btn_edit}                      xpath=//a[text()='///text///']/ancestor::tr/td[@class='action text-right']/div/ul/li/a[text()='แก้ไข']
${add_quotation_page.btn_add_more}                  xpath=//table[@id='productrow']//i[@class="fa fa-caret-up"]
${add_quotation_page.lbl_approve_status}            xpath=//p[@id="overview-stock"]//span[contains(text(), '///text///')]
${add_quotation_page.btn_approve}                   xpath=//section[@id="main1"]//a[contains(text(), 'อนุมัติ')]
${add_quotation_page.btn_save_on_approve_page}      xpath=//div[@id="transferModal"]//button[contains(text(), 'บันทึก')]
${add_quotation_page.btn_select_quotation_id}       xpath=//div[@id="TransactionTable"]//a[contains(text(),'///text///')]
${add_quotation_page.btn_view_contact}              xpath=//a[@href="javascript:showAllContact();"]
${add_quotation_page.btn_contact}                   xpath=//span[text()='contact']/parent::td/parent::tr/td/a[text()='เลือก']
${add_quotation_page.btn_product}                   xpath=//div[@id='productdialog']//div[contains(text(),'prod_id')]/parent::div/parent::div/parent::td/parent::tr//a[text()='เลือก']
${add_quotation_page.btn_notification}              id=notificationarea
${add_quotation_page.txt_search_product}            id=quicksearchproducttext
${add_quotation_page.txt_search_contact}            id=quicksearchcontacttext

*** Keywords ***
Click view product
    [Documentation]     Click view product
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_view_prod}
    light_portal_common_keywords.Wait for jquery loading completed

Click select product
    [Documentation]     Click select product
    [Arguments]     ${product_id}
    ${locator}      String.Replace string       ${add_quotation_page.btn_product}       prod_id      ${product_id}
    DobbyWebCommon.Click element when ready     ${locator}

Click view contact
    [Documentation]     Click view contact
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_view_contact}
    light_portal_common_keywords.Wait for jquery loading completed

Click select contact
    [Documentation]     Click select contact
    [Arguments]     ${contact}
    ${locator}      String.Replace string       ${add_quotation_page.btn_contact}       contact      ${contact}
    DobbyWebCommon.Click element when ready    ${locator}

Input sales channel
    [Documentation]     Input sales channel
    [Arguments]     ${saleschannel}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_saleschannel}      ${saleschannel}

Click save quotation
    [Documentation]     Click save quotation
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_save_quotation}
    light_portal_common_keywords.Wait for jquery loading completed

Get quotation id
    [Documentation]     Get quotation id
    ${quotation_id}=    SeleniumLibrary.Get value        ${add_quotation_page.txt_quotation_id}
    [Return]            ${quotation_id}

Input quotation id
    [Documentation]     Input quotation id
    [Arguments]     ${quotation_id}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_quotation_id}      ${quotation_id}

Input customer name
    [Documentation]     Input customer name
    [Arguments]     ${customer_code}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_customer_name}     ${customer_code}

Click confirm button
    [Documentation]     Click confirm button
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_confirm}

Search by quotation id
    [Documentation]     Search by quotation id
    [Arguments]     ${quotation_id}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_search_id}        ${quotation_id}

Popup is displayed when data not complete
    [Documentation]     Popup is displayed when data not complete
    DobbyWebCommon.Wait until element is visible except stale       ${add_quotation_page.lbl_error_popup}

Click okay button on error message popup
    [Documentation]     Click okay button on error message popup
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_okay_on_error_popup}

Check quotation id is created
    [Documentation]     Check quotation id is created
    [Arguments]     ${quotation_id}
    ${status_quotation_id_path}    Replace String      ${add_quotation_page.lbl_status_quotation_id}       ///text///      ${quotation_id}
    DobbyWebCommon.Wait until element is visible except stale       ${status_quotation_id_path}

Click more command
    [Documentation]     Click more command
    DobbyWebCommon.Wait until element is visible except stale       ${add_quotation_page.btn_notification}
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_command}

Click edit
    [Arguments]  ${quotation_id}
    [Documentation]     Click edit
    ${new_Xpath_kbub}    Replace String      ${add_quotation_page.list_name}       ///text///       ${quotation_id}
    DobbyWebCommon.Click element when ready     ${new_Xpath_kbub}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready     //div[@class='btn-group']/button/span[text()='คำสั่ง']
    DobbyWebCommon.Click element when ready     //div[@class='btn-group open']/ul[@class='dropdown-menu sub-nav']/li/a[text()='แก้ไข']

Add more amount of product
    [Documentation]     Add more amount of product
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_add_more}

Verify approve status
    [Documentation]     Verify approve status
    [Arguments]     ${status}
    ${status_approve_path}    Replace String      ${add_quotation_page.lbl_approve_status}       ///text///       ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${status_approve_path}

Click approve button
    [Documentation]     Click approve button
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_approve}

Click save on approve page
    [Documentation]     Click save on approve page
    DobbyWebCommon.Click element when ready     ${add_quotation_page.btn_save_on_approve_page}

Select by quotation code
    [Documentation]     Select by quotation code
    [Arguments]     ${quotation_id}
    ${quotation_id_selecter}    Replace String      ${add_quotation_page.btn_select_quotation_id}       ///text///       ${quotation_id}
    DobbyWebCommon.Click element when ready     ${quotation_id_selecter}

Input product code or product name to search
    [Documentation]  Input product code or product name to search
    [Arguments]      ${product}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_search_product}      ${product}
    SeleniumLibrary.Press keys      None        ENTER

Input search contact
    [Documentation]     Input search contact
    [Arguments]         ${contact}
    DobbyWebCommon.Input text to element when ready     ${add_quotation_page.txt_search_contact}        ${contact}
    SeleniumLibrary.Press keys      None        ENTER