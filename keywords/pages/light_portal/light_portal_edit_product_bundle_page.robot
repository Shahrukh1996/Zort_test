*** Variables ***
${edit_product_bundle_page.txt_sell_price}                  id=sellprice
${edit_product_bundle_page.btn_active_bundle}               xpath=//button[text()='บันทึก + เปิดการใช้งาน']
${edit_product_bundle_page.btn_confirm_active}              xpath=//p[text()='ยืนยันเปิดการใช้งาน']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']
${edit_product_bundle_page.txt_bundle_id_disable}           xpath=//input[@id='editbundlecode' and @disabled]
${edit_product_bundle_page.txt_bundle_name_disable}         xpath=//input[@id='editbundlename' and @disabled]
${edit_product_bundle_page.txt_bundle_price_disable}        xpath=//input[@id='sellprice' and @disabled]
${edit_product_bundle_page.txt_bundle_exp_date_disable}     xpath=//input[@id='editexpriredate' and @readonly]

*** Keywords ***
Input edit sell price
    [Documentation]     Input edit sell price
    [Arguments]         ${price}
    DobbyWebCommon.Input text to element when ready     ${edit_product_bundle_page.txt_sell_price}        ${price}

Click active product bundle
    [Documentation]     Click active product bundle
    DobbyWebCommon.Click element when ready             ${edit_product_bundle_page.btn_active_bundle}

Click confirm active product bundle
    [Documentation]     Click confirm active product bundle
    DobbyWebCommon.Click element when ready             ${edit_product_bundle_page.btn_confirm_active}

Verify input bundle id should be disable
    [Documentation]     Verify input bundle id should be disable
    DobbyWebCommon.Wait until element is visible except stale       ${edit_product_bundle_page.txt_bundle_id_disable}

Verify input bundle name should be disable
    [Documentation]     Verify input bundle name should be disable
    DobbyWebCommon.Wait until element is visible except stale       ${edit_product_bundle_page.txt_bundle_name_disable}

Verify input bundle sell price should be disable
    [Documentation]     Verify input bundle sell price should be disable
    DobbyWebCommon.Wait until element is visible except stale       ${edit_product_bundle_page.txt_bundle_price_disable}

Verify input bundle expire date should be disable
    [Documentation]     Verify input bundle expire date should be disable
    DobbyWebCommon.Wait until element is visible except stale       ${edit_product_bundle_page.txt_bundle_exp_date_disable}