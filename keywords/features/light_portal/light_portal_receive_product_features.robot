*** Keywords ***
Verify input invalid buy list code
    [Documentation]     Verify input invalid buy list code
    [Arguments]         ${code}
    light_portal_receive_product_page.Input buy list code            ${code}
    light_portal_receive_product_page.Click receive product
    light_portal_receive_product_page.Verify invalid input buy list code
    light_portal_receive_product_page.Click close error popup
    light_portal_common_keywords.Wait for jquery loading completed

Verify input already transfer code
    [Documentation]     Verify input already transfer code
    [Arguments]         ${code}
    light_portal_receive_product_page.Input buy list code            ${code}
    light_portal_receive_product_page.Click receive product
    light_portal_receive_product_page.Verify buy list already transfer
    light_portal_receive_product_page.Click close error popup
    light_portal_common_keywords.Wait for jquery loading completed

Input transfer info and click receive product
    [Documentation]     Input transfer info and click receive product
    [Arguments]         ${warehouse}    ${amount}   ${product_id}
    light_portal_receive_product_page.Select transfer warehouse          ${warehouse}
    light_portal_receive_product_page.Input transfer product amount      ${amount}
    light_portal_receive_product_page.Input transfer product id          ${product_id}
    light_portal_receive_product_page.Verify that input transfer should be visible       ${product_id}       ${amount}
    light_portal_receive_product_page.Click confirm receive product
