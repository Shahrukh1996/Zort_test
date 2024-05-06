*** Variables ***
&{xpt_category_edit_input}      name=//label[text()='ชื่อหมวดหมู่']/following-sibling::div//input[@id='editcategoryname']
&{xpt_category_edit_button}     confirm_edit=//div[@class='form-group']//button[text()='บันทึก']


*** Keywords ***
Click confirm edit
    [Documentation]    คลิกปุ่มกด 'บันทึก'
    DobbyWebCommon.Click element when ready     ${xpt_category_edit_button.confirm_edit}

Input edit list
    [Arguments]        ${edit_category}
    [Documentation]    กรอกข้อมูลแก้ไข 'รายการหมวดหมู่'
    ${category_name}=    light_portal_common_keywords.Auto keyword random string    ${edit_category ['name']}
    DobbyWebCommon.Input text to element when ready     ${xpt_category_edit_input.name}    ${category_name}
    [Return]    ${category_name}