*** Keywords ***
Verify cannot add category without name of category
    [Documentation]     Verify cannot add category without name of category
    light_portal_product_category_page.Click save add category
    light_portal_product_category_page.Verify fail add category with empty name
    light_portal_product_category_page.Click close fail add category popup

Input product category name and save
    [Documentation]     Input product category name and save
    [Arguments]         ${name}
    light_portal_product_category_page.Input add category name       ${name}
    light_portal_product_category_page.Click save add category

Click edit category name using kebab menu
    [Documentation]     Click edit category name using kebab name
    [Arguments]         ${name}
    light_portal_product_category_page.Click kebab menu by category name             ${name}
    light_portal_product_category_page.Click kebab menu edit by category name        ${name}

Click view detail category using kebab menu
    [Documentation]     Click view detail category using kebab menu
    [Arguments]         ${name}
    light_portal_product_category_page.Click kebab menu by category name             ${name}
    light_portal_product_category_page.Click kebab menu view by category name        ${name}

Click delete category using kebab menu and close zortout website
    [Documentation]     Click delete category using kebab menu and close zortout website
    [Arguments]         ${name}
    light_portal_product_category_page.Click kebab menu by category name             ${name}
    light_portal_product_category_page.Click kebab menu delete by category name      ${name}
    light_portal_product_category_page.Click confirm delete category                 ${name}
    light_portal_product_category_page.Verify category name should not visible       ${name}
    light_portal_common_keywords.Close zortout website