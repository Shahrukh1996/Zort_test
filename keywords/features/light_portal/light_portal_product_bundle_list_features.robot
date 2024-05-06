*** Keywords ***
Input advance search
    [Documentation]     Input advance search
    [Arguments]         ${id}   ${name}     ${min_price}    ${max_price}
    light_portal_product_bundle_list_page.Input search bundle id         ${id}
    light_portal_product_bundle_list_page.Input search bundle name       ${name}
    light_portal_product_bundle_list_page.Input search minimun price     ${min_price}
    light_portal_product_bundle_list_page.Input search maximum price     ${max_price}

Verify search result
    [Documentation]     Verify search result
    [Arguments]         ${id}   ${name}
    light_portal_product_bundle_list_page.Verify search result bundle id     ${id}
    light_portal_product_bundle_list_page.Verify search result bundle name   ${name}

Click kebab edit menu by by bundle name
    [Documentation]     Click kebab edit menu by by bundle name
    [Arguments]         ${name}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_bundle_list_page.Click kebab menu by bundle name            ${name}
    light_portal_product_bundle_list_page.Click kebab edit menu by bundle name       ${name}

Delete product bundle by bundle name and close zortout website
    [Documentation]     Delete product bundle by bundle name and close zortout website
    [Arguments]         ${name}
    light_portal_product_bundle_list_page.Click kebab menu by bundle name            ${name}
    light_portal_product_bundle_list_page.Click kebab delete menu by bundle name     ${name}
    light_portal_product_bundle_list_page.Click confirm delete bundle                ${name}
    light_portal_product_bundle_list_page.Verify product bundle should not visible   ${name}
    light_portal_common_keywords.Close zortout website