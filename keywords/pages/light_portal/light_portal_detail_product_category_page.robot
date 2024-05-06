*** Variables ***
${detail_product_category_page.lbl_category_name}           xpath=//h1[@class='title-page']//a[text()='**TITLE**']
${detail_product_category_page.panel_product_remain}        xpath=//h2[text()='สินค้าคงเหลือ (บาท)']/parent::div
${detail_product_category_page.panel_readdy_for_sell}       xpath=//h2[text()='สินค้าพร้อมขาย (บาท)']/parent::div
${detail_product_category_page.panel_last_month_sales}      xpath=//h2[text()='ยอดขายเดือนที่แล้ว (บาท)']/parent::div
${detail_product_category_page.panel_this_month_sales}      xpath=//h2[text()='ยอดขายเดือนนี้ (บาท)']/parent::div
${detail_product_category_page.panel_total_sales}           xpath=//span[text()='ยอดขาย']/parent::h2/parent::div/parent::div
${detail_product_category_page.panel_best_sale}             xpath=//span[text()='สินค้าขายดีย้อนหลัง 7 วัน']/parent::h2/parent::div/parent::div
${detail_product_category_page.panel_inventory}             xpath=//span[text()='มูลค่าสินค้าคงเหลือ รายคลัง']/parent::h2/parent::div/parent::div
${detail_product_category_page.panel_product_movement}      xpath=//span[text()='สินค้าเคลื่อนไหวทั้งหมด']/parent::h2/parent::div/parent::div/parent::div

*** Keywords ***
Verify category name
    [Documentation]     Verify category name
    [Arguments]         ${name}
    ${locator}          String.Replace string           ${detail_product_category_page.lbl_category_name}       **TITLE**       ${name}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Verify category product remain panel
    [Documentation]     Verify category product remain panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_product_remain}

Verify category product ready for sell panel
    [Documentation]     Verify category product ready for sell panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_readdy_for_sell}

Verify category last month sales panel
    [Documentation]     Verify category last month sales panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_last_month_sales}

Verify category this month sales panel
    [Documentation]     Verify category this month sales panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_this_month_sales}

Verify category total sales panel
    [Documentation]     Verify category total sales panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_total_sales}

Verify category best sell of past 7 days panel
    [Documentation]     Verify category best sell of past 7 days panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_best_sale}

Verify category inventory panel
    [Documentation]     Verify category inventory panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_inventory}

Verify category product movement panel
    [Documentation]     Verify category product movement panel
    DobbyWebCommon.Wait until element is visible except stale           ${detail_product_category_page.panel_product_movement}