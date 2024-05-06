*** Keywords ***
Verify return buy list detail
    [Documentation]     Verify return buy list detail
    [Arguments]         ${id}       ${detail}
    light_portal_detail_return_buy_page.Verify return buy list id                    ${id}
    light_portal_detail_return_buy_page.Verify return buy list contact id            ${detail['contact_id']}
    light_portal_detail_return_buy_page.Verify return buy list product id            ${detail['product_id']}
    light_portal_detail_return_buy_page.Verify return buy list shipping channel      ${detail['shipping_channel']}
    light_portal_detail_return_buy_page.Verify return buy list shipping discount     ${detail['discount']}
    light_portal_detail_return_buy_page.Verify return buy list shipping price        ${detail['shipping_price']}
    light_portal_detail_return_buy_page.Verify return buy list description           ${detail['description']}

Transfer some product
    [Documentation]     Transfer some product
    [Arguments]         ${amount}
    light_portal_detail_return_buy_page.Click transfer some product
    light_portal_detail_return_buy_page.Input transfer some product amount           ${amount}
    light_portal_detail_return_buy_page.Click save transfer some product

Add payment
    [Documentation]     Add payment
    [Arguments]         ${amount}       ${channel}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_detail_return_buy_page.Click add payment
    light_portal_detail_return_buy_page.Input payment amount     ${amount}
    light_portal_detail_return_buy_page.Input payment channel    ${channel}
    light_portal_detail_return_buy_page.Click choose file
    light_portal_detail_return_buy_page.Click save payment