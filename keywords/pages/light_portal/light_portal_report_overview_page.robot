*** Variables ***
${report_overview_page.lbl_title_sales}             xpath=//span[text()='ยอดขายวันนี้ (บาท)']
${report_overview_page.lbl_info_sales}              xpath=//span[text()='ยอดขายวันนี้ (บาท)']/parent::h2/following-sibling::p//a
${report_overview_page.lbl_title_sales_month}       xpath=//span[contains(text(),'ยอดขายเดือนนี้')]
${report_overview_page.lbl_info_sales_month}        xpath=//span[contains(text(),'ยอดขายเดือนนี้')]/parent::h2/following-sibling::p//a
${report_overview_page.lbl_title_sales_year}        xpath=//span[text()='ยอดขายรวมทั้งปี (บาท)']
${report_overview_page.lbl_info_sales_year}         xpath=//span[text()='ยอดขายรวมทั้งปี (บาท)']/parent::h2/following-sibling::p//a
${report_overview_page.lbl_category_sell_title}     xpath=//span[text()='หมวดหมู่ขายดีปีนี้']
${report_overview_page.lbl_category_info_title}     xpath=//span[text()='หมวดหมู่ขายดีปีนี้']/parent::h2/following-sibling::p//a
${report_overview_page.lbl_compare_sales_title}     xpath=//span[text()='เปรียบเทียบยอดขาย ตั้งแต่ต้นปี (YTD)']
${report_overview_page.lbl_compare_sales_info}      xpath=//span[text()='เปรียบเทียบยอดขาย ตั้งแต่ต้นปี (YTD)']/parent::h2/following-sibling::p//span
${report_overview_page.lbl_sales_summary_title}     xpath=//span[text()='ยอดขายรวม']
${report_overview_page.lbl_sales_summary_chart}     id=sellingChart
${report_overview_page.btn_sales_summary_dropdown}      id=typeoption
${report_overview_page.lbl_dropdown_value}              xpath=//option[text()='**LABEL**']
${report_overview_page.lbl_sales_category_title}        xpath=//span[text()='ยอดขายตามหมวดหมู่']
${report_overview_page.lbl_remain_warehouse_title}      xpath=//span[text()='มูลค่าสินค้าคงเหลือรายคลัง']
${report_overview_page.lbl_remain_warehouse_chart}      id=productChart
${report_overview_page.btn_remain_warehouse_dropdown}   id=typeproductoption
${report_overview_page.lbl_remain_category_title}       xpath=//span[text()='มูลค่าสินค้าคงเหลือรายหมวดหมู่']
${report_overview_page.lbl_prod_movement_title}         xpath=//span[text()='สินค้าเคลื่อนไหวย้อนหลัง **TITLE**']
${report_overview_page.lbl_prod_movement_column}        xpath=//th[text()='**COLUMN**']
${report_overview_page.lbl_prod_movement_column_link}   xpath=//th//a[text()='**COLUMN**']
${report_overview_page.btn_prod_movement_dropdown}      id=movementtype
${report_overview_page.xpt_focus}                       xpath=//div[@id='MovementTable']//thead

*** Keywords ***
Verify sales title
    [Documentation]     Verify sales title
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_title_sales}

Verify sales info should be visible
    [Documentation]     Verify sales info should be visible
    ${text}     SeleniumLibrary.Get text            ${report_overview_page.lbl_info_sales}
    BuiltIn.Should not be empty     ${text}

Verify sales this month title
    [Documentation]     Verify sales this month title
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_title_sales_month}

Verify sales this month info should be visible
    [Documentation]     Verify sales this month info should be visible
    ${text}     SeleniumLibrary.Get text            ${report_overview_page.lbl_info_sales_month}
    BuiltIn.Should not be empty     ${text}

Verify sales this year title
    [Documentation]     Verify sales this year title
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_title_sales_year}

Verify sales this year info should be visible
    [Documentation]     Verify sales this year info should be visible
    ${text}     SeleniumLibrary.Get text            ${report_overview_page.lbl_info_sales_year}
    BuiltIn.Should not be empty     ${text}

Verify best category sell title
    [Documentation]     Verify best category sell title
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_category_sell_title}

Verify best category sell info should be visible
    [Documentation]     Verify best category sell info
    ${text}     SeleniumLibrary.Get text                ${report_overview_page.lbl_category_info_title}
    BuiltIn.Should not be empty     ${text}
    light_portal_home_features.Goto product category
    light_portal_product_category_page.Quick search category name    ${text}
    light_portal_product_category_page.Verify category name          ${text}

Verify compare sales since early year title
    [Documentation]     Verify compare sales since early year
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_compare_sales_title}

Verify compare sales since early year info should be visible
    [Documentation]     Verify compare sales since early year info should be visible
    ${text}     SeleniumLibrary.Get text                ${report_overview_page.lbl_compare_sales_info}
    BuiltIn.Should not be empty     ${text}

Verify sales summary
    [Documentation]     Verify sales summary
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_sales_summary_title}

Verify sales summary chart
    [Documentation]     Verify sales summary chart
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_sales_summary_chart}

Click sales summary dropdown
    [Documentation]     Click sales summary dropdown
    DobbyWebCommon.Click element when ready         ${report_overview_page.btn_sales_summary_dropdown}

Verify dropdown label
    [Documentation]     Verify dropdown label
    [Arguments]         ${label}
    ${locator}          String.Replace string       ${report_overview_page.lbl_dropdown_value}      **LABEL**       ${label}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Select sales summary dropdown by label
    [Documentation]     Select sales summary dropdown by label
    [Arguments]         ${label}
    DobbyWebCommon.Select option by label when ready        ${report_overview_page.btn_sales_summary_dropdown}       ${label}
    light_portal_common_keywords.Wait for jquery loading completed

Verify sales summary by category
    [Documentation]     Verify sales summary by category
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_sales_category_title}

Verify remain by warehouse
    [Documentation]     Verify remain by warehouse
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_remain_warehouse_title}

Verify remain by warehouse chart
    [Documentation]     Verify remain by warehouse chart
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_remain_warehouse_chart}

Click remain by warehouse dropdown
    [Documentation]     Click remain by warehouse dropdown
    DobbyWebCommon.Click element when ready         ${report_overview_page.btn_remain_warehouse_dropdown}

Select remain by warehouse label
    [Documentation]     Select remain by warehosue label
    [Arguments]         ${label}
    DobbyWebCommon.Select option by label when ready        ${report_overview_page.btn_remain_warehouse_dropdown}       ${label}
    light_portal_common_keywords.Wait for jquery loading completed

Verify remain by category title
    [Documentation]     Verify remain by category title
    DobbyWebCommon.Wait until element is visible except stale           ${report_overview_page.lbl_remain_category_title}

Verify product movement title
    [Documentation]     Verify product movement title
    [Arguments]         ${title}
    ${locator}          String.Replace string           ${report_overview_page.lbl_prod_movement_title}     **TITLE**   ${title}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Verify product movement column
    [Documentation]     Verify product movement column
    [Arguments]         ${column}
    ${locator}          String.Replace string       ${report_overview_page.lbl_prod_movement_column}    **COLUMN**      ${column}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Verify product movement column with link
    [Documentation]     Verify product movement column with link
    [Arguments]         ${column}
    ${locator}          String.Replace string       ${report_overview_page.lbl_prod_movement_column_link}   **COLUMN**  ${column}
    DobbyWebCommon.Wait until element is visible except stale           ${locator}

Click product movement dropdown
    [Documentation]     Click product movement dropdown
    SeleniumLibrary.Scroll element into view        ${report_overview_page.xpt_focus}
    DobbyWebCommon.Click element when ready         ${report_overview_page.btn_prod_movement_dropdown}

Select product movement by label
    [Documentation]     Select product movement by label
    [Arguments]         ${label}
    DobbyWebCommon.Select option by label when ready    ${report_overview_page.btn_prod_movement_dropdown}      ${label}
    light_portal_common_keywords.Wait for jquery loading completed