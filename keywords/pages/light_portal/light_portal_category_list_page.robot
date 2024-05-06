*** Variables ***
&{xpt_category_list_text}       name_column=//tbody//td[@class='name']//span[text()='///CATEGORY_NAME///']
&{xpt_category_list_button}     add_list=//button[text()='เพิ่มหมวดหมู่']
...                             kebab_open=//tbody//td[@class='name']//span[text()='///CATEGORY_NAME///']/ancestor::tbody//td[@class='action']//div[@class='btn-etc dropdown']/i
...                             kebab_edit=//tbody//td[@class='name']//span[text()='///CATEGORY_NAME///']/ancestor::tr//div[@class='btn-etc dropdown open']//li/a[text()='แก้ไข']
...                             kebab_delete=//tbody//td[@class='name']//span[text()='///CATEGORY_NAME///']/ancestor::tr//div[@class='btn-etc dropdown open']//li/a[text()='ลบ']
...                             confirm_delete=//p[@id='confirmmsg' and contains(text(), 'ยืนยันการลบหมวดหมู่')]/ancestor::div[@class='modal-content']//div[@class='modal-footer ']//button[text()='ยืนยัน']


*** Keywords ***
Click create list
    [Documentation]    คลิกปุ่มกด 'เพิ่มหมวดหมู่'
    DobbyWebCommon.Click element when ready     ${xpt_category_list_button.add_list}

Click confirm delete list
    [Documentation]    คลิกปุ่มกด 'ยืนยันการลบหมวดหมู่'
    DobbyWebCommon.Click element when ready     ${xpt_category_list_button.confirm_delete}

Click kebab list
    [Arguments]        ${category_name}
    [Documentation]    คลิกปุ่มกด เคบับ (รายการ)
    &{str_replace_xpath}=    BuiltIn.Create dictionary    ///CATEGORY_NAME///=${category_name}
    ${xpt_new_xpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_category_list_button.kebab_open}    ${str_replace_xpath}
    light_portal_common_keywords.Auto keyword wait element  ${xpt_new_xpath}
    DobbyWebCommon.Click element when ready     ${xpt_new_xpath}

Click kebab edit
    [Arguments]        ${category_name}
    [Documentation]    คลิกปุ่มกด เคบับ (แก้ไข)
    &{str_replace_xpath}=    BuiltIn.Create dictionary    ///CATEGORY_NAME///=${category_name}
    ${xpt_new_xpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_category_list_button.kebab_edit}    ${str_replace_xpath}
    DobbyWebCommon.Click element when ready     ${xpt_new_xpath}

Click kebab delete
    [Arguments]        ${category_name}
    [Documentation]    คลิกปุ่มกด เคบับ (ลบ)
    &{str_replace_xpath}=    BuiltIn.Create dictionary    ///CATEGORY_NAME///=${category_name}
    ${xpt_new_xpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_category_list_button.kebab_delete}    ${str_replace_xpath}
    DobbyWebCommon.Click element when ready     ${xpt_new_xpath}

Verify delete category list
    [Arguments]        ${category_name}
    [Documentation]    เช็คชื่อรายการหมวดหมู่ เคส 'ลบ'
    &{str_replace_xpath}=    BuiltIn.Create dictionary    ///CATEGORY_NAME///=${category_name}
    ${xpt_new_xpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_category_list_text.name_column}    ${str_replace_xpath}
    DobbyWebCommon.Wait until element is visible except stale    ${xpt_new_xpath}

Verify success category list
    [Arguments]        ${category_name}
    [Documentation]    เช็คชื่อรายการหมวดหมู่ เคส 'สร้าง อัปเดต'
    &{str_replace_xpath}=    BuiltIn.Create dictionary    ///CATEGORY_NAME///=${category_name}
    ${xpt_new_xpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_category_list_text.name_column}    ${str_replace_xpath}
    SeleniumLibrary.Wait until element is not visible    ${xpt_new_xpath}
