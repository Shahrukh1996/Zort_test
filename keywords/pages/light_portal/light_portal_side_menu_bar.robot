*** Variables ***
${side_menu_bar.sell_list}              id=tour-sellmenu
${side_menu_bar.create_sell_list}       xpath=//ul[@id='sell']//a[text()='สร้างรายการขาย']
${side_menu_bar.view_sell_list}         xpath=//ul[@id='sell']//a[text()='ดูรายการขาย']
${side_menu_bar.quotation_list}         xpath=//ul[@id='sell']//a[text()='ใบเสนอราคา']
${side_menu_bar.return_product_list}    xpath=//ul[@id='sell']//a[text()='รับคืนสินค้า']
${side_menu_bar.pack_product_page}      xpath=//ul[@id='sell']//a[text()='แพ็คสินค้า']
${side_menu_bar.product}                id=tour-productmenu
${side_menu_bar.product_bundle}         xpath=//ul[@id='product']//a[text()='สินค้าเป็นชุด']
${side_menu_bar.product_transfer_list}  xpath=//ul[@id='product']//a[text()='รายการโอนสินค้า']
${side_menu_bar.product_list}           xpath=//ul[@id='product']//a[text()='สินค้า']
${side_menu_bar.product_category}       xpath=//ul[@id='product']//a[text()='หมวดหมู่']
${side_menu_bar.add_product_list}       xpath=//ul[@id='product']//a[text()='เพิ่มสินค้า']
${side_menu_bar.product_warehouse}      xpath=//ul[@id='product']//a[text()='คลังสินค้า/สาขา']
${side_menu_bar.buy_list}               id=tour-buymenu
${side_menu_bar.view_buy_list}          xpath=//ul[@id='buy']//a[text()='ดูรายการซื้อ']
${side_menu_bar.return_buy_list}        xpath=//ul[@id='buy']//a[text()='คืนสินค้า']
${side_menu_bar.add_buy_list}           xpath=//ul[@id='buy']//a[text()='สร้างรายการซื้อ']
${side_menu_bar.receive_product}        xpath=//ul[@id='buy']//a[text()='รับสินค้า']
${side_menu_bar.variant_list}           xpath=//a[text()='สินค้าหลากคุณสมบัติ']
${side_menu_bar.report_list}            id=tour-reportmenu
${side_menu_bar.report_sales_list}      xpath=//ul[@id='report']//a[text()='ยอดขาย']
${side_menu_bar.report_overview}        xpath=//ul[@id="report"]//a[text()='ภาพรวม']
${side_menu_bar.main_menu}              xpath=//ul[@id='sidenav']//a//span[text()='///main_menu///']
${side_menu_bar.sub_menu}               xpath=//ul[@id='sidenav']//a//span[text()='///main_menu///']/../following-sibling::ul[@class='collapse in']/li/a[text()='///sub_menu///']

*** Keywords ***

Click sell list
    [Documentation]     Click sell list
    SeleniumLibrary.Click element  ${side_menu_bar.sell_list}

Click create sell list
    [Documentation]     Click create sell list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.create_sell_list}

Click view sell list
    [Documentation]     Click view sell list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.view_sell_list}

Click view quotation list
    [Documentation]     Click view quotation
    DobbyWebCommon.Click element when ready         ${side_menu_bar.quotation_list}

Click view return product list
    [Documentation]   Click view return product list
    SeleniumLibrary.Click element  ${side_menu_bar.return_product_list}

Click view pack product page
    [Documentation]     Click view pack product page
    DobbyWebCommon.Click element when ready         ${side_menu_bar.pack_product_page}

Click product
    [Documentation]     Click product
    DobbyWebCommon.Click element when ready           ${side_menu_bar.product}

Click view product list
    [Documentation]     Click view product list
    DobbyWebCommon.Click element when ready            ${side_menu_bar.product_list}

Click view product bundle
    [Documentation]     Click view product bundle
    DobbyWebCommon.Click element when ready         ${side_menu_bar.product_bundle}

Click product transfer list
    [Documentation]     Click product transfer list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.product_transfer_list}

Click view product category
    [Documentation]     Click view product category
    DobbyWebCommon.Click element when ready         ${side_menu_bar.product_category}

Click create product list
    [Documentation]     Click product transfer list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.add_product_list}

Click buy list
    [Documentation]     Click buy list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.buy_list}

Click view buy list
    [Documentation]     Click view buy list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.view_buy_list}

Click variant list
    [Documentation]     Click variant list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.variant_list}

Click return buy list
    [Documentation]     Click return buy list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.return_buy_list}

Click product warehouse
    [Documentation]     Click product warehouse
    DobbyWebCommon.Click element when ready         ${side_menu_bar.product_warehouse}

Click report page
    [Documentation]     Click product warehouse
    DobbyWebCommon.Click element when ready         ${side_menu_bar.report_list}

Click report sales list
    [Documentation]     Click product warehouse
    DobbyWebCommon.Click element when ready         ${side_menu_bar.report_sales_list}

Click report overview
    [Documentation]     Click report overview
    DobbyWebCommon.Click element when ready         ${side_menu_bar.report_overview}

Click add buy list
    [Documentation]     Click add buy list
    DobbyWebCommon.Click element when ready         ${side_menu_bar.add_buy_list}

Click receive product
    [Documentation]     Click receive product
    DobbyWebCommon.Click element when ready         ${side_menu_bar.receive_product}
    SeleniumLibrary.Switch window     NEW

Click main menu
    [Arguments]      ${navbar_menu}
    [Documentation]  คลิกหน้าเมนูหลัก
        ${xpt_main_menu}=  Replace String  ${side_menu_bar.main_menu}  ///main_menu///  ${navbar_menu ['main_menu']}
        light_portal_common_keywords.Auto keyword wait element  ${xpt_main_menu}
        SeleniumLibrary.Click element  ${xpt_main_menu}

Click sub menu
    [Arguments]      ${navbar_menu}
    [Documentation]  คลิกหน้าเมนูรอง
        ${xpt_sub_menu}=  Replace String  ${side_menu_bar.sub_menu}  ///main_menu///  ${navbar_menu ['main_menu']}
        ${xpt_sub_menus}=  Replace String  ${xpt_sub_menu}  ///sub_menu///  ${navbar_menu ['sub_menu']}
        light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
        SeleniumLibrary.Click element  ${xpt_sub_menus}
        light_portal_common_keywords.Wait for jquery loading completed

Click sub menu buy list page
    [Documentation]  คลิกหน้าเมนูรอง "ดูรายการซื้อ"
    ${xpt_sub_menu}=      Replace String        ${side_menu_bar.sub_menu}     ///main_menu///     รายการซื้อ
    ${xpt_sub_menus}=     Replace String        ${xpt_sub_menu}               ///sub_menu///      ดูรายการซื้อ
    light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
    SeleniumLibrary.Click element     ${xpt_sub_menus}
    light_portal_common_keywords.Wait for jquery loading completed

Click sub menu sell add page
    [Documentation]  คลิกหน้าเมนูรอง "สร้างรายการขาย"
    ${xpt_sub_menu}=      Replace String        ${side_menu_bar.sub_menu}     ///main_menu///     รายการขาย
    ${xpt_sub_menus}=     Replace String        ${xpt_sub_menu}               ///sub_menu///      สร้างรายการขาย
    light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
    SeleniumLibrary.Click element     ${xpt_sub_menus}
    light_portal_common_keywords.Wait for jquery loading completed

Click sub menu sell list page
    [Documentation]  คลิกหน้าเมนูรอง "ดูรายการขาย"
    ${xpt_sub_menu}=      Replace String        ${side_menu_bar.sub_menu}     ///main_menu///     รายการขาย
    ${xpt_sub_menus}=     Replace String        ${xpt_sub_menu}               ///sub_menu///      ดูรายการขาย
    light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
    SeleniumLibrary.Click element     ${xpt_sub_menus}
    light_portal_common_keywords.Wait for jquery loading completed

Click sub menu promotion list page
    [Documentation]  คลิกหน้าเมนูรอง "รายการโปรโมชัน"
    ${xpt_sub_menu}=      Replace String        ${side_menu_bar.sub_menu}     ///main_menu///     โปรโมชั่น
    ${xpt_sub_menus}=     Replace String        ${xpt_sub_menu}               ///sub_menu///      ของแถม
    light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
    SeleniumLibrary.Click element     ${xpt_sub_menus}
    light_portal_common_keywords.Wait for jquery loading completed

Click sub menu product set page
    [Documentation]  คลิกหน้าเมนูรอง "รายการสินค้าชุด"
    ${xpt_sub_menu}=      Replace String        ${side_menu_bar.sub_menu}     ///main_menu///     สินค้า
    ${xpt_sub_menus}=     Replace String        ${xpt_sub_menu}               ///sub_menu///      สินค้าเป็นชุด
    light_portal_common_keywords.Auto keyword wait element  ${xpt_sub_menus}
    SeleniumLibrary.Click element     ${xpt_sub_menus}
    light_portal_common_keywords.Wait for jquery loading completed