*** Variables ***
${return_sell_list_page.lbl_page_title}      xpath=//h1[contains(text(),'สร้างรายการรับคืนสินค้า')]

*** Keywords ***
Verify return sell list page title
    [Documentation]     Verify return sell list page title
    DobbyWebCommon.Wait until element is visible except stale       ${return_sell_list_page.lbl_page_title}