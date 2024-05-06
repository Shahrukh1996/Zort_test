*** Keywords ***
Add category list
    [Arguments]        ${test_data}
    [Documentation]    สร้างรายการหมวดหมู่
    light_portal_category_list_page.Click create list
    ${category_name_add}=    light_portal_category_add_page.Input create list    ${test_data ['add_category']}
    light_portal_category_add_page.Click confirm create
    [Return]    ${category_name_add}

Edit category list
    [Arguments]        ${test_data}    ${category_name}
    [Documentation]    แก้ไขรายการหมวดหมู่
    light_portal_category_list_page.Click kebab list                             ${category_name}
    Sleep  5s
    light_portal_category_list_page.Click kebab edit                             ${category_name}
    ${category_name_edit}=    light_portal_category_edit_page.Input edit list    ${test_data ['edit_category']}
    light_portal_category_edit_page.Click confirm edit
    [Return]    ${category_name_edit}

Delete category list
    [Arguments]        ${category_name}
    [Documentation]    ลบราบการหวมดหมู่
    light_portal_category_list_page.Click kebab list             ${category_name}
    light_portal_category_list_page.Click kebab delete           ${category_name}
    light_portal_category_list_page.Click confirm delete list