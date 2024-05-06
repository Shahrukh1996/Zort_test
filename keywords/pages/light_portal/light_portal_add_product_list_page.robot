*** Variables ***
${add_product_list_page.txt_product_id}         id=code
${add_product_list_page.select_property}        id=varianttype
${add_product_list_page.btn_radio_type}         xpath=//span[text()='ประเภท']/ancestor::div[@class='row']//label[span[text()='**type**']]//input[@type='radio']
${add_product_list_page.txt_product_name}       id=addproductname
${add_product_list_page.select_category}        id=categoryid
${add_product_list_page.txt_purchase_price}     id=purchaseprice
${add_product_list_page.txt_sell_price}         id=sellprice
${add_product_list_page.txt_bring_price}        id=startstock
${add_product_list_page.select_warehouse}       id=addwarehouseid
${add_product_list_page.btn_save_list}          xpath=//div[@id='tour_add']//button[text()='บันทึก']

*** Keywords ***
Get product list id
    [Documentation]     Get product list id
    ${id}   DobbyWebCommon.Get value from element when ready        ${add_product_list_page.txt_product_id}
    [Return]        ${id}

Select property
    [Documentation]     Select property
    [Arguments]     ${property}
    DobbyWebCommon.Select option by label when ready    ${add_product_list_page.select_property}          ${property}

Click radio button of list type
    [Documentation]     Click radio button of list type
    [Arguments]         ${type}
    light_portal_common_keywords.Scroll to top of page
    ${locator}          String.Replace string           ${add_product_list_page.btn_radio_type}     **type**         ${type}
    DobbyWebCommon.Click element when ready             ${locator}

Input product name
    [Documentation]     Input product name
    [Arguments]         ${name}
    DobbyWebCommon.Input text to element when ready     ${add_product_list_page.txt_product_name}       ${name}

Select category
    [Documentation]     Select category
    [Arguments]         ${category}
    DobbyWebCommon.Select option by label when ready    ${add_product_list_page.select_category}        ${category}

Input purchase price
    [Documentation]     Input purchase price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${add_product_list_page.txt_purchase_price}        ${price}

Input sell price
    [Documentation]     Input sell price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${add_product_list_page.txt_sell_price}            ${price}

Input bring price
    [Documentation]     Input bring price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${add_product_list_page.txt_bring_price}           ${price}

Select warehouse
    [Documentation]     Select warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Select option by label when ready    ${add_product_list_page.select_warehouse}           ${warehouse}

Click save add product list
    [Documentation]     Click save add product list
    DobbyWebCommon.Click element when ready             ${add_product_list_page.btn_save_list}