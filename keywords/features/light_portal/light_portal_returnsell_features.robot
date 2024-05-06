*** Keywords ***
Add return sell list
    [Arguments]        ${add_return_sell}
    [Documentation]    'สร้าง' รายการรับคืนสินค้า
    light_portal_common_keywords.Scroll to top of page
    light_portal_returnsell_add_page.Input data basic        ${add_return_sell ['basic']}
    light_portal_returnsell_add_page.Input data contact      ${add_return_sell ['contact']}
    light_portal_returnsell_add_page.Input data product      ${add_return_sell ['product']}
    light_portal_common_keywords.Scroll to bottom of page
    light_portal_returnsell_add_page.Click confirm create list
    light_portal_common_keywords.Close toast success
    light_portal_common_keywords.Wait for jquery loading completed

Payment by detail page
    [Arguments]        ${payment_data}
    [Documentation]    'ชำระเงิน' รายการรับคืนสินค้า
    light_portal_returnsell_detail_page.Click add payment
    light_portal_returnsell_detail_page.Input data payment    ${payment_data}
    light_portal_returnsell_detail_page.Click comfirm payment
    light_portal_common_keywords.Wait for jquery loading completed

Verify status payment by detail page
    [Arguments]        ${status}
    [Documentation]    ตรวจสอบสถานะ 'ชำระเงิน'
    light_portal_returnsell_detail_page.Check main status payment    ${status}
    light_portal_returnsell_detail_page.Check sub status payment     ${status}

Delete payment by detail page
    [Arguments]        ${data}
    [Documentation]    'ลบ' รายการชำระเงิน
    light_portal_returnsell_detail_page.Click delete payment    ${data}
    light_portal_common_keywords.Wait for jquery loading completed