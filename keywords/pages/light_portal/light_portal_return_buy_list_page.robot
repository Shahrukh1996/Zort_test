*** Variables ***
${return_buy_list_page.lbl_page_title}          xpath=//h1[contains(text(),'สร้างรายการคืนสินค้า')]
${return_buy_list_page.btn_create_return}       xpath=//button[text()='สร้าง']
${return_buy_list_page.btn_kebab_menu}          xpath=//td[@class='name']//a[text()='**ID**']/ancestor::tr//td[contains(@class,'action')]//i
${return_buy_list_page.btn_kebab_menu_edit}     xpath=//td[@class='name']//a[text()='**ID**']/ancestor::tr//td[contains(@class,'action')]//a[text()='แก้ไข']
${return_buy_list_page.lbl_reference}           xpath=//td[@class='name']//a[text()='**ID**']/ancestor::tr//td[@class='customer' and contains(text(),'**REFER**')]
${return_buy_list_page.btn_select_return_list}       xpath=//td[@class="name"]//a[text()='**ID**']
${return_buy_list_page.txt_quick_search}        id=quicksearchtext
${return_buy_list_page.lbl_payment_status}              xpath=//a[text()='**ID**']/ancestor::tr//td[contains(@class,'payment')]//span[text()='**STATUS**']
${return_buy_list_page.lbl_some_payment_status}         xpath=//a[text()='**ID**']/ancestor::tr//td[contains(@class,'payment')]//u[text()='ชำระบางส่วน']
${return_buy_list_page.btn_advance_search}      id=btn-switch-filter
${return_buy_list_page.txt_search_id}           id=searchnumber
${return_buy_list_page.btn_select_warehouse}           xpath=//button[@data-id="searchwarehouseid"]
${return_buy_list_page.select_warehouse_name}           xpath=//button[@data-id="searchwarehouseid"]//span[text()='**WAREHOUSE**']
${return_buy_list_page.txt_search_customer}             id=searchcustomername
${return_buy_list_page.txt_search_min_price}            id=fromamount
${return_buy_list_page.txt_search_max_price}            id=toamount
${return_buy_list_page.txt_search_product}              id=searchproduct
${return_buy_list_page.txt_search_tel_number}           id=searchcustomerphone
${return_buy_list_page.txt_search_email}                id=searchcustomeremail
${return_buy_list_page.txt_search_refer}                id=searchrefname
${return_buy_list_page.btn_confirm_search}              xpath=//h3[text()='ค้นหาขั้นสูง']/following-sibling::div//input[@onclick="advanceSearch();"]
${return_buy_list_page.lbl_return_id}                   xpath=//td[@class='name']//a[text()='**ID**']
${return_buy_list_page.lbl_refer_name}                  xpath=//td[@class='customer' and contains(text(),'**REFER**')]
${return_buy_list_page.lbl_customer_name}               xpath=//td[@class='channel']//a[text()='**CUSTOMER**']

*** Keywords ***
Verify return buy list page title
    [Documentation]     Verify return buy list title
    DobbyWebCommon.Wait until element is visible except stale       ${return_buy_list_page.lbl_page_title}

Click create return buy list
    [Documentation]     Click create return buy list
    DobbyWebCommon.Click element when ready         ${return_buy_list_page.btn_create_return}

Click kebab menu by return id
    [Documentation]     Click kebab menu by return id
    [Arguments]         ${id}
    ${locator}          String.Replace string        ${return_buy_list_page.btn_kebab_menu}      **ID**      ${id}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready         ${locator}
    light_portal_common_keywords.Wait until kebab menu is visible

Click kebab menu edit by return id
    [Documentation]     Click kebab menu edit by return id
    [Arguments]         ${id}
    ${locator}          String.Replace string        ${return_buy_list_page.btn_kebab_menu_edit}      **ID**      ${id}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready         ${locator}

Verify reference with return buy id
    [Documentation]     Verify reference with return buy id
    [Arguments]         ${id}       ${refer}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_reference}       **ID**          ${id}
    ${locator}          String.Replace string           ${locator}                                  **REFER**       ${refer}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Select return buy list by id
    [Documentation]     Select return buy list by id
    [Arguments]         ${id}
    ${locator}          String.Replace string           ${return_buy_list_page.btn_select_return_list}      **ID**      ${id}
    DobbyWebCommon.Click element when ready             ${locator}

Quick search return buy list by id
    [Documentation]      Quick search return buy list by id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready         ${return_buy_list_page.txt_quick_search}        ${id}
    SeleniumLibrary.Press keys          None        RETURN

Verify payment status
    [Documentation]     Verify payment status
    [Arguments]         ${id}       ${status}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_payment_status}      **ID**      ${id}
    ${locator}          String.Replace string           ${locator}                  **STATUS**          ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify some payment status
    [Documentation]     Verify payment status
    [Arguments]         ${id}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_some_payment_status}      **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready             ${return_buy_list_page.btn_advance_search}

Input return buy list id
    [Documentation]     Input return buy list id
    [Arguments]         ${id}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_id}               ${id}

Select warehouse
    [Documentation]     Select warehouse
    [Arguments]         ${warehouse}
    ${locator}          String.Replace string       ${return_buy_list_page.select_warehouse_name}       **WAREHOUSE**       ${warehouse}
    DobbyWebCommon.Click element when ready         ${return_buy_list_page.btn_select_warehouse}
    DobbyWebCommon.Click element when ready         ${locator}

Input search customer name
    [Documentation]     Input search customer name
    [Arguments]         ${customer}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_customer}         ${customer}

Input search minimum price
    [Documentation]     Input search minimum price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_min_price}        ${price}

Input search maximum price
    [Documentation]     Input search maximum price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_max_price}        ${price}

Input search product
    [Documentation]     Input search product
    [Arguments]         ${product}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_product}          ${product}

Input search telephone number
    [Documentation]     Input search telephone number
    [Arguments]         ${telephone}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_tel_number}       ${telephone}

Input search email
    [Documentation]     Input search email
    [Arguments]         ${email}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_email}            ${email}

Input search refer name
    [Documentation]     Input search refer name
    [Arguments]         ${refer}
    DobbyWebCommon.Input text to element when ready     ${return_buy_list_page.txt_search_refer}            ${refer}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready             ${return_buy_list_page.btn_confirm_search}

Verify return buy list id
    [Documentation]     Verify return buy list id
    [Arguments]         ${id}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_return_id}       **ID**      ${id}
    DobbyWebCommon.Wait until element is visible except stale        ${locator}

Verify return buy list refer name
    [Documentation]     Verify return buy list refer name
    [Arguments]         ${refer}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_refer_name}      **REFER**       ${refer}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Verify return buy list customer name
    [Documentation]     Verify return buy list customer name
    [Arguments]         ${customer}
    ${locator}          String.Replace string           ${return_buy_list_page.lbl_customer_name}   **CUSTOMER**    ${customer}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}