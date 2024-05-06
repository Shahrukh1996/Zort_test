*** Variables ***
${product_list_page.btn_import_file}                xpath=//button[text()='นำเข้าไฟล์ (Excel)']
${product_list_page.select_import_type}             id=importtype
${product_list_page.btn_choose_file}                id=fFile
${product_list_page.btn_save_import_file}           id=btnsave
${product_list_page.lbl_product_id}                 xpath=//td[@class="id"]//span[text()='**id**']
${product_list_page.lbl_product_name}               xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[@class="name"]//span[text()='**name**']
${product_list_page.lbl_product_category}           xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//small[text()='**category**']
${product_list_page.lbl_tag}                        xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[@class="name"]//span[text()='**tag**']
${product_list_page.lbl_purchase_price}             xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[contains(@class,'buy')]//span[text()='**buy**']
${product_list_page.lbl_sell_price}                 xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[contains(@class,'sell')]//span[text()='**sell**']
${product_list_page.lbl_remain}                     xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[contains(@class,'remain')]//span[text()='**remain**']
${product_list_page.lbl_ready_for_sell}             xpath=//td[@class="id"]//span[text()='**id**']/ancestor::tr//td[contains(@class,'ready')]//span[text()='**ready**']
${product_list_page.txt_quick_search}               id=quicksearchtext
${product_list_page.btn_select_prod_name}           xpath=//td[@class='name']//span[text()='**NAME**']
${product_list_page.btn_advance_search}             xpath=//a[text()='ค้นหาขั้นสูง']
${product_list_page.btn_checkbox_product}           xpath=//span[text()='สินค้า']/parent::label//input[@type='checkbox']
${product_list_page.btn_checkbox_service}           xpath=//span[text()='บริการ']/parent::label//input[@type='checkbox']
${product_list_page.txt_search_id}                  id=searchcode
${product_list_page.txt_search_name}                id=searchname
${product_list_page.txt_search_min_sell}            id=fromsellprice
${product_list_page.txt_search_min_purchase}        id=frompurchaseprice
${product_list_page.select_search_warehouse}        id=searchwarehouseid
${product_list_page.select_search_category}         id=searchcategoryid
${product_list_page.txt_search_tag}                 xpath=//div[contains(@class,'search')]//label[text()='Tag สินค้า']/following-sibling::div//input
${product_list_page.btn_confirm_search}             xpath=//input[@onclick="advanceSearch();"]

*** Keywords ***
Click import file product
    [Documentation]     Click import file product
    DobbyWebCommon.Click element when ready                     ${product_list_page.btn_import_file}

Select import type
    [Documentation]     Select import type
    [Arguments]         ${type}
    DobbyWebCommon.Select option by label when ready            ${product_list_page.select_import_type}           ${type}

Choose import file
    [Documentation]     Choose import file
    ${path}    OperatingSystem.Join path        ${CURDIR}/../../../resources/testdata/light_portal/product_template.xlsx
    DobbyWebCommon.Browse file when ready       ${product_list_page.btn_choose_file}            ${path}

Click save import file
    [Documentation]     Click save import file
    DobbyWebCommon.Click element when ready         ${product_list_page.btn_save_import_file}
    light_portal_common_keywords.Wait for jquery loading completed

Verify product list id
    [Documentation]     Verify product list id
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${product_list_page.lbl_product_id}     **id**         ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list name
    [Documentation]     Verify product list name
    [Arguments]         ${id}       ${name}
    ${locator}          String.Replace string       ${product_list_page.lbl_product_name}     **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **name**         ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list category
    [Documentation]     Verify product list category
    [Arguments]         ${id}       ${category}
    ${locator}          String.Replace string       ${product_list_page.lbl_product_category}     **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **category**         ${category}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list tag
    [Documentation]     Verify product list tag
    [Arguments]         ${id}       ${tag}
    ${locator}          String.Replace string       ${product_list_page.lbl_tag}                    **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **tag**         ${tag}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list purchase price
    [Documentation]     Verify product list purchase price
    [Arguments]         ${id}       ${buy}
    ${locator}          String.Replace string       ${product_list_page.lbl_purchase_price}         **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **buy**         ${buy}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list sell price
    [Documentation]     Verify product list sell price
    [Arguments]         ${id}       ${sell}
    ${locator}          String.Replace string       ${product_list_page.lbl_sell_price}             **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **sell**         ${sell}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list remain
    [Documentation]     Verify product list remain
    [Arguments]         ${id}       ${remain}
    ${locator}          String.Replace string       ${product_list_page.lbl_remain}                 **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **remain**         ${remain}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list ready for sell
    [Documentation]     Verify product list ready for sell
    [Arguments]         ${id}       ${ready}
    ${locator}          String.Replace string       ${product_list_page.lbl_ready_for_sell}         **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **ready**         ${ready}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click select product list
    [Documentation]     Click select product list by name
    [Arguments]         ${id}       ${name}
    ${locator}          String.Replace string       ${product_list_page.lbl_product_name}     **id**           ${id}
    ${locator}          String.Replace string       ${locator}      **name**         ${name}
    DobbyWebCommon.Click element when ready         ${locator}

Verify delete product should be not visible
    [Documentation]     Verify delete product should be not visible
    [Arguments]         ${id}
    ${locator}          String.Replace string       ${product_list_page.lbl_product_id}     **id**         ${id}
    SeleniumLibrary.Wait until element is not visible       ${locator}

Input quick search and enter
    [Documentation]     Input quick search and enter
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_quick_search}       ${id}
    SeleniumLibrary.Press keys      None        RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready         ${product_list_page.btn_advance_search}
Click checkbox type product
    [Documentation]     Click checkbox type product
    DobbyWebCommon.Click element when ready         ${product_list_page.btn_checkbox_product}

Click checkbox type service
    [Documentation]     Click checkbox type service
    DobbyWebCommon.Click element when ready         ${product_list_page.btn_checkbox_service}

Input advance search id
    [Documentation]     Input advance search id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_search_id}           ${id}

Input advance search product name
    [Documentation]     Input advance search product name
    [Arguments]         ${name}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_search_name}           ${name}

Input advance search min sell price
    [Documentation]     Input advance search min sell price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_search_min_sell}        ${price}

Input advance search min purchase price
    [Documentation]     Input advance search min purchase price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_search_min_purchase}    ${price}

Select advance search warehouse
    [Documentation]     Select advance search warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Select option by label when ready        ${product_list_page.select_search_warehouse}        ${warehouse}

Select advance search category
    [Documentation]     Select advance search category
    [Arguments]         ${category}
    DobbyWebCommon.Select option by label when ready        ${product_list_page.select_search_category}         ${category}

Input advance search tag
    [Documentation]     Input advance search tag
    [Arguments]         ${tag}
    DobbyWebCommon.Input text to element when ready     ${product_list_page.txt_search_tag}         ${tag}
    SeleniumLibrary.Press keys          None        RETURN

Click confirm advance search
    [Documentation]     Click confirm advance search
    light_portal_common_keywords.Scroll to top of page
    DobbyWebCommon.Click element when ready         ${product_list_page.btn_confirm_search}

Click select product by name
    [Documentation]     Click select product by name
    [Arguments]         ${name}
    ${locator}          String.Replace string       ${product_list_page.btn_select_prod_name}       **NAME**      ${name}
    DobbyWebCommon.Click element when ready         ${locator}