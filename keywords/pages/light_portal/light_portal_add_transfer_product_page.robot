*** Variables ***
${add_transfer_product_page.lbl_title_page}             xpath=//h1[contains(text(),'สร้างรายการโอนสินค้า')]

*** Keywords ***
Verify title add transfer product page
    [Documentation]     Verify title add transfer product page
    DobbyWebCommon.Wait until element is visible except stale       ${add_transfer_product_page.lbl_title_page}