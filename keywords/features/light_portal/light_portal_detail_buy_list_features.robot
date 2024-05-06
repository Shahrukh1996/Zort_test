*** Keywords ***
Verify create buy list detail
    [Documentation]     Verify create buy list detail
    [Arguments]         ${detail}       ${id}   ${tc_14 ['create_date']}
    light_portal_detail_buy_list_page.Verify buy list id         ${id}
    light_portal_detail_buy_list_page.Verify contact id          ${detail['contact_id']}
    light_portal_detail_buy_list_page.Verify payment status      ${detail['payment_status']}
    light_portal_detail_buy_list_page.Verify transfer status     ${detail['transfer_status']}
    light_portal_detail_buy_list_page.Verify product name        ${detail['product_name']}
    light_portal_detail_buy_list_page.Verify shipping channel    ${detail['shipping_channel']}
    light_portal_detail_buy_list_page.Verify create day          ${tc_14 ['create_date'] ['day']}
    light_portal_detail_buy_list_page.Verify create month        ${tc_14 ['create_date'] ['month']}
    light_portal_detail_buy_list_page.Verify create year         ${tc_14 ['create_date'] ['year']}