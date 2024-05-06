*** Variables ***
${edit_product_category_page.txt_category_name}         id=editcategoryname
${edit_product_category_page.btn_save_edit}             xpath=//button[@onclick="doUpdate();"]

*** Keywords ***
Input edit category name
    [Documentation]         Input edit category name
    [Arguments]             ${name}
    DobbyWebCommon.Input text to element when ready     ${edit_product_category_page.txt_category_name}     ${name}

Click save edit category name
    [Documentation]         Click save edit category name
    DobbyWebCommon.Click element when ready             ${edit_product_category_page.btn_save_edit}