*** Variables ***
${product_bundle_list_page.btn_add_bundle}              xpath=//button[text()='เพิ่มสินค้าเป็นชุดใหม่']
${product_bundle_list_page.btn_save_bundle}             id=tour_add
${product_bundle_list_page.lbl_require_error}           xpath=//p[text()='กรุณาใส่ข้อมูลให้ครบถ้วน']
${product_bundle_list_page.btn_close_error_popup}       xpath=//button[@onclick="closeErrorPopup();"]
${product_bundle_list_page.txt_add_bundle_name}         id=addbundlename
${product_bundle_list_page.txt_add_sell_price}          id=addbundlesellprice
${product_bundle_list_page.btn_datepicker}              xpath=//div[@data-date-format="d/m/yyyy"]
${product_bundle_list_page.lbl_max_date_31}             xpath=//td[text()='31']
${product_bundle_list_page.lbl_max_date_30}             xpath=//td[text()='30']
${product_bundle_list_page.lbl_max_date_29}             xpath=//td[text()='29']
${product_bundle_list_page.lbl_max_date_28}             xpath=//td[text()='28']
${product_bundle_list_page.lbl_disable_bundle}          xpath=//span[text()='bundlename']/parent::a/parent::div/parent::div/parent::div/parent::td/parent::tr//span[text()='ปิดการใช้งาน']
${product_bundle_list_page.lbl_bundle_name}             xpath=//span[text()='bundlename']
${product_bundle_list_page.btn_advance_search}          id=btn-advance-search
${product_bundle_list_page.txt_search_bundle_id}        id=searchcode
${product_bundle_list_page.txt_search_bundle_name}      id=searchname
${product_bundle_list_page.txt_search_min_price}        id=fromsellprice
${product_bundle_list_page.txt_search_max_price}        id=tosellprice
${product_bundle_list_page.btn_confirm_adv_search}      xpath=//input[@onclick="advanceSearch();"]
${product_bundle_list_page.lbl_bundle_id}               xpath=//span[text()='bundleid']
${product_bundle_list_page.btn_kebab_menu}              xpath=//span[text()='bundle_name']/ancestor::tr/td/div[@class='btn-etc dropdown']/i
${product_bundle_list_page.btn_kebab_edit_menu}         xpath=//td[@class='name']//span[text()='bundle_name']/ancestor::tr//td[contains(@class,'action')]//a[text()='แก้ไข']
${product_bundle_list_page.lbl_active_bundle}           xpath=//td[@class='name']//span[text()='bundle_name']/ancestor::tr//span[text()='เปิดการใช้งาน']
${product_bundle_list_page.btn_kebab_delete_menu}       xpath=//span[text()='bundle_name']/ancestor::tr/td/div[@class='btn-etc dropdown open']/ul/li/a[text()='ลบ']
${product_bundle_list_page.btn_confirm_delete_bundle}   xpath=//p[text()='ยืนยันการลบสินค้า bundle_name']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']

*** Keywords ***
Click add product bundle
    [Documentation]     Click add product bundle
    DobbyWebCommon.Click element when ready     ${product_bundle_list_page.btn_add_bundle}

Click save product bundle detail
    [Documentation]     Click save product bundle detail
    DobbyWebCommon.Click element when ready     ${product_bundle_list_page.btn_save_bundle}

Verify when require data is empty
    [Documentation]     Verify when require data is empty
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_list_page.lbl_require_error}

Click close error popup
    [Documentation]     Click close error popup
    DobbyWebCommon.Click element when ready     ${product_bundle_list_page.btn_close_error_popup}

Input bundle name using random letters
    [Documentation]     Input bundle name using random letters
    ${name}       String.Generate random string       12       [LETTERS][NUMBERS]
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_add_bundle_name}        ${name}
    [Return]        ${name}

Input bundle sell price
    [Documentation]     Input bundle sell price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_add_sell_price}         ${price}

Click select datepicker
    [Documentation]     Click select datepicker
    DobbyWebCommon.Click element when ready         ${product_bundle_list_page.btn_datepicker}

Select datepicker next month
    [Documentation]     Select datepicker next month
    DobbyWebCommon.Click element when ready     xpath=//div[@class='datetimepicker-days']//th[@class='switch']/following-sibling::th[@class='next']

Select datepicker this day
    [Documentation]     Select datepicker this day
    ${current_date}     BuiltIn.Get time        day     UTC+7
    ${current_date}     BuiltIn.Evaluate        int('${current_date}')
    ${max_date_31}         Run keyword and return status       SeleniumLibrary.Wait until element is visible   ${product_bundle_list_page.lbl_max_date_31}      timeout=10s
    ${max_date_30}         Run keyword and return status       SeleniumLibrary.Wait until element is visible   ${product_bundle_list_page.lbl_max_date_30}      timeout=10s
    ${max_date_29}         Run keyword and return status       SeleniumLibrary.Wait until element is visible   ${product_bundle_list_page.lbl_max_date_29}      timeout=10s
    ${max_date_28}         Run keyword and return status       SeleniumLibrary.Wait until element is visible   ${product_bundle_list_page.lbl_max_date_28}      timeout=10s
    ${current_date}     BuiltIn.Set variable if
    ...                 ${max_date_31} == False and ${current_date} == 31           30
    ...                 ${max_date_30} == False and ${current_date} == 30           29
    ...                 ${max_date_29} == False and ${current_date} == 29           28
    ...                 ${max_date_28}                                              ${current_date}
    DobbyWebCommon.Click element when ready     xpath=//td[(@class='day' or @class='day today active') and text()='${current_date}']

Verify disable product bundle
    [Documentation]     Verify disable product bundle
    [Arguments]         ${bundlename}
    ${locator}          String.Replace string       ${product_bundle_list_page.lbl_disable_bundle}      bundlename      ${bundlename}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Get product bundle id
    [Documentation]     Get product bundle id
    ${bundle_id}    SeleniumLibrary.Get value       id=addbundlecode
    [Return]        ${bundle_id}

Click view product bundle
    [Documentation]     Click view product bundle
    [Arguments]         ${name}
    ${locator}      String.Replace string       ${product_bundle_list_page.lbl_bundle_name}     bundlename      ${name}
    DobbyWebCommon.Click element when ready     ${locator}

Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready     ${product_bundle_list_page.btn_advance_search}

Input search bundle id
    [Documentation]     Input search bundle id
    [Arguments]     ${bundle_id}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_search_bundle_id}        ${bundle_id}

Input search bundle name
    [Documentation]     Input search bundle name
    [Arguments]     ${bundle_name}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_search_bundle_name}      ${bundle_name}

Input search minimun price
    [Documentation]     Input search minimun price
    [Arguments]     ${min_price}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_search_min_price}        ${min_price}

Input search maximum price
    [Documentation]     Input search maximum price
    [Arguments]     ${max_price}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_list_page.txt_search_max_price}        ${max_price}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready             ${product_bundle_list_page.btn_confirm_adv_search}

Verify search result bundle id
    [Documentation]     Verify search result bundle id
    [Arguments]     ${id}
    ${locator}      String.Replace string       ${product_bundle_list_page.lbl_bundle_id}       bundleid        ${id}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Verify search result bundle name
    [Documentation]     Verify search result bundle name
    [Arguments]     ${name}
    ${locator}      String.Replace string       ${product_bundle_list_page.lbl_bundle_name}     bundlename      ${name}
    DobbyWebCommon.Wait until element is visible except stale   ${locator}

Click kebab menu by bundle name
    [Documentation]     Click kebab menu by bundle name
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.btn_kebab_menu}      bundle_name     ${name}
    light_portal_common_keywords.Scroll to footer of page
    DobbyWebCommon.Click element when ready         ${locator}
    light_portal_common_keywords.Wait for jquery loading completed
    # light_portal_common_keywords.Wait until kebab menu is visible

Click kebab edit menu by bundle name
    [Documentation]     Click kebab edit menu by bundle name
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.btn_kebab_edit_menu}      bundle_name     ${name}
    DobbyWebCommon.Click element when ready         ${locator}

Verify active product bundle
    [Documentation]     Verify active product bundle
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.lbl_active_bundle}       bundle_name     ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click kebab delete menu by bundle name
    [Documentation]     Click kebab delete menu by bundle name
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.btn_kebab_delete_menu}      bundle_name     ${name}
    DobbyWebCommon.Click element when ready         ${locator}

Click confirm delete bundle
    [Documentation]     Click confirm delete bundle
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.btn_confirm_delete_bundle}      bundle_name     ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready         ${locator}

Verify product bundle should not visible
    [Documentation]     Verify product bundle should not visible
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${product_bundle_list_page.lbl_bundle_name}      bundlename     ${name}
    SeleniumLibrary.Wait until element is not visible       ${locator}