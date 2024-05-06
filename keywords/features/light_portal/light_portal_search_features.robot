*** Keywords ***
Advanced search by warehouse
    [Documentation]    ค้นหาคลังแบบขั้นสูง
    [Arguments]        ${test_data}
    light_portal_search_page.Click add advanced search by warehouse
    light_portal_search_page.Input data for advanced search by warehouse         ${test_data ['advancedSearch']}
    light_portal_search_page.Click confirm advanced search by warehouse

Quick search by category
    [Documentation]    ค้นหาหมวดหมู่แบบรวดเร็ว
    [Arguments]        ${category_name}
    light_portal_search_page.Click add quick search by category
    light_portal_search_page.Input data for quick search by category             ${category_name}

Quick search by set product
    [Documentation]    ค้นหาสินค้าชุดแบบรวดเร็ว
    [Arguments]        ${bundle_name}
    light_portal_search_page.Click add quick search by set product
    light_portal_search_page.Input data for quick search by set product          ${bundle_name}