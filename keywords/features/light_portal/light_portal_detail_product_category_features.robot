*** Keywords ***
Verify product category detail panel should be visible
    [Documentation]         Verify product category detail panel should be visible
    [Arguments]             ${name}
    light_portal_detail_product_category_page.Verify category name       ${name}
    light_portal_detail_product_category_page.Verify category product remain panel
    light_portal_detail_product_category_page.Verify category product ready for sell panel
    light_portal_detail_product_category_page.Verify category last month sales panel
    light_portal_detail_product_category_page.Verify category this month sales panel
    light_portal_detail_product_category_page.Verify category total sales panel
    light_portal_detail_product_category_page.Verify category best sell of past 7 days panel
    light_portal_detail_product_category_page.Verify category inventory panel
    light_portal_detail_product_category_page.Verify category product movement panel