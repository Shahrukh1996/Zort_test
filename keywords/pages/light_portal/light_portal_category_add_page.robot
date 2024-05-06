*** Variables ***
&{xpt_category_add_input}       name=//label[text()='ชื่อหมวดหมู่']/following-sibling::div//input[@id='addcategoryname']
&{xpt_category_add_button}      confirm_create=//div[@id='categoryModal']//div[@class='modal-footer ']/button[text()='บันทึก']


*** Keywords ***
Click confirm create
    [Documentation]    คลิกปุ่มกด 'บันทึก'
    DobbyWebCommon.Click element when ready     ${xpt_category_add_button.confirm_create}

Input create list
    [Arguments]        ${add_category}
    [Documentation]    กรอกข้อมูลสร้างรายการ
    ${category_name}=    light_portal_common_keywords.Auto keyword random string    ${add_category ['name']}
    light_portal_common_keywords.Auto keyword clear input text       ${xpt_category_add_input.name}
    DobbyWebCommon.Input text to element when ready     ${xpt_category_add_input.name}    ${category_name}
    [Return]    ${category_name}