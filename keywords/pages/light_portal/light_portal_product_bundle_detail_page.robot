*** Variables ***
${product_bundle_detail_page.btn_add_prod}                  xpath=//a[@href="javascript:showAllProduct(1);"]
${product_bundle_detail_page.btn_select_prod}               xpath=//td[text()='product']/following-sibling::td//a[text()='เลือก']
${product_bundle_detail_page.input_amount_prod}             id=productnumber1
${product_bundle_detail_page.btn_save_bundle}               id=donebtn
${product_bundle_detail_page.lbl_bundle_name}               xpath=//h1[contains(text(),'bundlename')]
${product_bundle_detail_page.panel_remain_prod}             xpath=//h2[text()='สินค้าคงเหลือ']/parent::div/parent::div
${product_bundle_detail_page.panel_prod_sell}               xpath=//h2[text()='สินค้าพร้อมขาย ']/parent::div/parent::div
${product_bundle_detail_page.panel_sales_month}             xpath=//h2[text()='ยอดขายเดือนนี้ (บาท)']/parent::div/parent::div
${product_bundle_detail_page.panel_total_sales}             xpath=//span[text()='ยอดขาย']/parent::h2/parent::div/parent::div/parent::div
${product_bundle_detail_page.panel_inventory}               xpath=//span[text()='จำนวนสินค้าคงเหลือ รายคลัง']/parent::h2/parent::div/parent::div/parent::div
${product_bundle_detail_page.panel_prod_movement}           id=ProductTable
${product_bundle_detail_page.txt_search_product}            id=quicksearchproducttext
${product_bundle_detail_page.lbl_last_elelment_of_page}     xpath=//div[@class='modal-content']//td[contains(text(), 'สินค้า-ทดสอบ')]

*** Keywords ***
Click add product
    [Documentation]     Click add product
    DobbyWebCommon.Click element when ready     ${product_bundle_detail_page.btn_add_prod}

Click select product
    [Documentation]     Click select product
    [Arguments]         ${product}
    ${locator}          String.Replace string       ${product_bundle_detail_page.btn_select_prod}   product     ${product}
    DobbyWebCommon.Click element when ready     ${locator}

Input product amount
    [Documentation]     Input product amount
    [Arguments]         ${amount}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_detail_page.input_amount_prod}       ${amount}

Click save product buldle detail
    [Documentation]     Click save product buldle detail
    DobbyWebCommon.Click element when ready     ${product_bundle_detail_page.btn_save_bundle}

Verify bundle name
    [Documentation]     Verify bundle name
    [Arguments]         ${name}
    ${locator}          String.Replace string       ${product_bundle_detail_page.lbl_bundle_name}       bundlename      ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify remain product
    [Documentation]     Verify remain product
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_remain_prod}

Verify product ready to sell
    [Documentation]     Verify product ready to sell
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_prod_sell}

Verify sales this month
    [Documentation]     Verify sales this month
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_sales_month}

Verify total sales
    [Documentation]     Verify total sales
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_total_sales}

Verify inventory
    [Documentation]     Verify inventory
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_inventory}

Verify product movement
    [Documentation]     Verify product movement
    DobbyWebCommon.Wait until element is visible except stale       ${product_bundle_detail_page.panel_prod_movement}

Input product code or product name to search
    [Documentation]  Input product code or product name to search
    [Arguments]      ${product}
    DobbyWebCommon.Input text to element when ready     ${product_bundle_detail_page.txt_search_product}       ${product}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_common_keywords.Wait for jquery loading completed

Wait until last element of search product is displayed
    [Documentation]     Wait until last element of search product is displayed
    DobbyWebCommon.Wait until element is visible except stale        ${product_bundle_detail_page.lbl_last_elelment_of_page}