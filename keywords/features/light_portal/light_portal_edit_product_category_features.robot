*** Keywords ***
Input edit category name and click save
    [Documentation]         Input edit category name and click save
    [Arguments]             ${name}
    light_portal_edit_product_category_page.Input edit category name         ${name}
    light_portal_edit_product_category_page.Click save edit category name