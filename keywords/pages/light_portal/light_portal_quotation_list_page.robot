*** Variables ***
${quotation_list_page.btn_create}       xpath=//button[text()='สร้าง']
${quotation_list_page.btn_print}        xpath=//span[text()='พิมพ์เอกสาร']
${quotation_list_page.btn_dropdown_print}   xpath=//span[text()='พิมพ์เอกสาร']/parent::button/parent::div//a[text()='พิมพ์เอกสาร']
${quotation_list_page.select_format_paper}  id=multiformatpaper
${quotation_list_page.btn_confirm_print}    xpath=//button[@onclick='doDownloadMultiPdf();']
${quotation_list_page.btn_check_box}        xpath=//a[text()='id']/parent::div/parent::td/parent::tr/td[@class='chk']//input
${quotation_list_page.btn_paper_size}           xpath=//label[text()='ขนาด']/parent::div/div/label[contains(.,'paper_size')]/input[@name='multisizepaper']

*** Keywords ***
Click create quotation
    [Documentation]    Click create quotation
    DobbyWebCommon.Click element when ready     ${quotation_list_page.btn_create}

Click check box
    [Documentation]     Click check box
    [Arguments]     ${id}
    ${locator}      String.Replace string       ${quotation_list_page.btn_check_box}       id      ${id}
    DobbyWebCommon.Click element when ready     ${locator}

Click print quotation
    [Documentation]     Click print quotation
    DobbyWebCommon.Click element when ready     ${quotation_list_page.btn_print}
    DobbyWebCommon.Click element when ready     ${quotation_list_page.btn_dropdown_print}

Select paper size
    [Documentation]     Select paper size
    [Arguments]         ${size}
    ${locator}      String.Replace string       ${quotation_list_page.btn_paper_size}       paper_size      ${size}
    DobbyWebCommon.Click element when ready     ${locator}

Select format paper
    [Documentation]     Select format paper
    [Arguments]         ${format}
    DobbyWebCommon.Select option by label when ready        ${quotation_list_page.select_format_paper}      ${format}

Click confirm print
    [Documentation]     Click confirm print
    DobbyWebCommon.Click element when ready     ${quotation_list_page.btn_confirm_print}
    Sleep  5s
    SeleniumLibrary.Switch window       NEW