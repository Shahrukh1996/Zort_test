*** Keywords ***
Verify cannot save without input require
    [Documentation]     Verify cannot save without input require
    light_portal_add_return_buy_page.Clear buy list id field
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_return_buy_page.Click save return buy list
    light_portal_add_return_buy_page.Verify popup error that save return list without input require
    light_portal_add_return_buy_page.Click close error popup input require

Create return buy list
    [Documentation]     Create return buy list
    [Arguments]         ${detail}
    light_portal_add_return_buy_page.Click view contact
    light_portal_add_return_buy_page.Quick search contact            ${detail['contact_id']}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_add_return_buy_page.Select contact by id            ${detail['contact_id']}
    light_portal_add_return_buy_page.Click select view product
    light_portal_add_return_buy_page.Quick search product            ${detail['product_id']}
    light_portal_add_return_buy_page.Select product by id            ${detail['product_id']}
    light_portal_add_return_buy_page.Input product amount            ${detail['product_amount']}
    light_portal_add_return_buy_page.Input shipping channel          ${detail['shipping_channel']}
    light_portal_add_return_buy_page.Input discount                  ${detail['discount']}
    light_portal_add_return_buy_page.Input shipping price            ${detail['shipping_price']}
    light_portal_add_return_buy_page.Input description               ${detail['description']}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_add_return_buy_page.Click save return buy list
    # light_portal_common_keywords.Close toast success