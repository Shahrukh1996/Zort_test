*** Variables ***
${add_return_product_page.btn_view_prod}                    xpath=//table[@id='productrow'] //a[text()='เลือก']
${add_return_product_page.btn_product}                      xpath=//div[@id='productdialog']//div[contains(text(),'prod_id')]/parent::div/parent::div/parent::td/parent::tr//a[text()='เลือก']
${add_return_product_page.btn_view_contact}                 xpath=//a[@href="javascript:showAllContact();"]
${add_return_product_page.btn_contact}                      xpath=//span[text()='contact']/parent::td/parent::tr/td/a[text()='เลือก']
${add_return_product_page.btn_save_return_product}          xpath=//button[text()='บันทึก']
${add_return_product_page.txt_id}                           id=number
${add_return_product_page.txt_search_product}               id=quicksearchproducttext
${add_return_product_page.lbl_last_elelment_of_page}        xpath=//div[@class='modal-content']//div[contains(text(), 'สินค้า-ทดสอบ')]
${add_return_product_page.txt_search_contact}               id=quicksearchcontacttext

*** Keywords ***
Click view product
    [Documentation]     Click view product
    DobbyWebCommon.Click element when ready     ${add_return_product_page.btn_view_prod}
    light_portal_common_keywords.Wait for jquery loading completed

Click select product
    [Documentation]     Click select product
    [Arguments]     ${product_id}
    ${locator}      String.Replace string       ${add_return_product_page.btn_product}       prod_id      ${product_id}
    DobbyWebCommon.Click element when ready     ${locator}

Click view contact
    [Documentation]     Click view contact
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready     ${add_return_product_page.btn_view_contact}
    light_portal_common_keywords.Wait for jquery loading completed

Click select contact
    [Documentation]     Click select contact
    [Arguments]     ${contact}
    ${locator}      String.Replace string       ${add_return_product_page.btn_contact}       contact      ${contact}
    DobbyWebCommon.Click element when ready    ${locator}

Click save return product
    [Documentation]     Click save return product
    DobbyWebCommon.Click element when ready     ${add_return_product_page.btn_save_return_product}
    light_portal_common_keywords.Auto keyword wait element  //div[@class='content']//h1[contains(normalize-space(.),'รายละเอียดรายการรับคืนสินค้าเข้า')]

Get return product id
    [Documentation]     Get return product id
    ${id}=    SeleniumLibrary.Get value        ${add_return_product_page.txt_id}
    [Return]            ${id}

Input product code or product name to search
    [Arguments]      ${product}
    [Documentation]  Input product code or product name to search
        light_portal_common_keywords.Auto keyword clear input text  ${add_return_product_page.txt_search_product}
        DobbyWebCommon.Input text to element when ready  ${add_return_product_page.txt_search_product}  ${product}
        BuiltIn.Sleep  2s
        SeleniumLibrary.Press keys  None  ENTER

Wait until last element of search product is displayed
    [Documentation]     Wait until last element of search product is displayed
    DobbyWebCommon.Wait until element is visible except stale        ${add_return_product_page.lbl_last_elelment_of_page}

Input search contact
    [Documentation]     Input search contact
    [Arguments]         ${contact}
    light_portal_common_keywords.Auto keyword clear input text  ${add_return_product_page.txt_search_contact}
    DobbyWebCommon.Input text to element when ready     ${add_return_product_page.txt_search_contact}        ${contact}
    Sleep  2s
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_common_keywords.Wait for jquery loading completed