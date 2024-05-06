*** Variables ***
${product_category_page.btn_add_category}               xpath=//button[text()='เพิ่มหมวดหมู่']
${product_category_page.btn_save_add_category}          xpath=//button[@onclick="insertCategory();"]
${product_category_page.lbl_add_category_fail}          xpath=//p[text()="กรุณาใส่ข้อมูลให้ครบถ้วน"]
${product_category_page.btn_close_fail_popup}           xpath=//button[@onclick="closeErrorPopup();"]
${product_category_page.txt_add_categoryname}           id=addcategoryname
${product_category_page.lbl_category_name}              xpath=//td[@class="name"]//span[text()='**NAME**']
${product_category_page.btn_kebab_by_name}              xpath=//td[@class="name"]//span[text()='**NAME**']/ancestor::tr//td[@class='action']//i
${product_category_page.btn_kebab_edit_by_name}         xpath=//td[@class="name"]//span[text()='**NAME**']/ancestor::tr//td[@class='action']//div[@class='btn-etc dropdown open']//a[text()='แก้ไข']
${product_category_page.btn_kebab_view_by_name}         xpath=//td[@class="name"]//span[text()='**NAME**']/ancestor::tr//td[@class='action']//a[text()='ดูภาพรวม']
${product_category_page.btn_kebab_delete_by_name}       xpath=//td[@class="name"]//span[text()='**NAME**']/ancestor::tr//td[@class='action']//a[text()='ลบ']
${product_category_page.txt_quick_search}               id=quicksearchtext
${product_category_page.btn_confirm_delete}             xpath=//p[text()='ยืนยันการลบหมวดหมู่ **NAME**']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']

*** Keywords ***
Click add category
    [Documentation]     Click add category
    DobbyWebCommon.Click element when ready             ${product_category_page.btn_add_category}

Click save add category
    [Documentation]     Click save add category
    DobbyWebCommon.Click element when ready             ${product_category_page.btn_save_add_category}

Verify fail add category with empty name
    [Documentation]     Verify fail add category with empty name
    DobbyWebCommon.Wait until element is visible except stale       ${product_category_page.lbl_add_category_fail}

Click close fail add category popup
    [Documentation]     Click close fail add category popup
    DobbyWebCommon.Click element when ready             ${product_category_page.btn_close_fail_popup}

Input add category name
    [Documentation]     Input add category name
    [Arguments]         ${name}
    DobbyWebCommon.Input text to element when ready     ${product_category_page.txt_add_categoryname}       ${name}

Verify category name
    [Documentation]     Verify category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.lbl_category_name}      **NAME**    ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click kebab menu by category name
    [Documentation]     Click kebab menu by category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.btn_kebab_by_name}      **NAME**    ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready             ${locator}

Click kebab menu edit by category name
    [Documentation]     Click kebab menu edit by category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.btn_kebab_edit_by_name}     **NAME**    ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready             ${locator}

Click kebab menu view by category name
    [Documentation]     Click kebab menu view by category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.btn_kebab_view_by_name}     **NAME**    ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready             ${locator}

Quick search category name
    [Documentation]     Quick search category name
    [Arguments]         ${text}
    DobbyWebCommon.Input text to element when ready     ${product_category_page.txt_quick_search}       ${text}
    SeleniumLibrary.Press keys      None      RETURN

Click kebab menu delete by category name
    [Documentation]     Click kebab menu delete by category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.btn_kebab_delete_by_name}     **NAME**    ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready             ${locator}

Click confirm delete category
    [Documentation]     Click confirm delete category
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.btn_confirm_delete}      **NAME**    ${name}
    DobbyWebCommon.Click element when ready             ${locator}

Verify category name should not visible
    [Documentation]     Verify category name should not visible
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${product_category_page.lbl_category_name}      **NAME**    ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}