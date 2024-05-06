*** Keywords ***

Goto add sell list page
    [Documentation]   Goto add sell list page
    light_portal_side_menu_bar.Click sell list
    light_portal_side_menu_bar.Click create sell list
    light_portal_common_keywords.Wait for jquery loading completed

Go to detail sell list page
    [Documentation]   Goto add sell list page
    light_portal_side_menu_bar.Click sell list
    light_portal_side_menu_bar.Click view sell list
    light_portal_common_keywords.Wait for jquery loading completed

Goto quotation list page
    [Documentation]   Goto quotation list page
    light_portal_side_menu_bar.Click sell list
    light_portal_side_menu_bar.Click view quotation list
    light_portal_common_keywords.Wait for jquery loading completed

Goto return product list page
    [Documentation]   Goto return products page
    light_portal_side_menu_bar.Click sell list
    BuiltIn.Sleep  2s
    light_portal_side_menu_bar.Click view return product list
    light_portal_common_keywords.Wait for jquery loading completed

Goto pack product page
    [Documentation]     Goto pack product page
    light_portal_side_menu_bar.Click sell list
    light_portal_side_menu_bar.Click view pack product page
    SeleniumLibrary.Switch window     NEW
    light_portal_common_keywords.Wait for jquery loading completed

Goto product bundle page
    [Documentation]     Goto product bundle page
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click view product bundle
    light_portal_common_keywords.Wait for jquery loading completed

Goto product transfer list
    [Documentation]     Goto product transfer list
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click product transfer list
    light_portal_common_keywords.Wait for jquery loading completed

Goto product category
    [Documentation]     Goto product category
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click view product category
    light_portal_common_keywords.Wait for jquery loading completed

Goto add product list
    [Documentation]     Goto add product list
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click create product list
    light_portal_common_keywords.Wait for jquery loading completed

Goto product list
    [Documentation]     Goto product list
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click view product list
    light_portal_common_keywords.Wait for jquery loading completed

Goto buy list page
    [Documentation]     Goto buy list page
    light_portal_side_menu_bar.Click buy list
    light_portal_side_menu_bar.Click view buy list
    light_portal_common_keywords.Wait for jquery loading completed

Goto variant list page
    [Documentation]     Goto variant list page
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click variant list
    light_portal_common_keywords.Wait for jquery loading completed

Goto return buy list
    [Documentation]     Goto return buy list
    light_portal_side_menu_bar.Click buy list
    Sleep  2s
    light_portal_side_menu_bar.Click return buy list
    light_portal_common_keywords.Wait for jquery loading completed

Goto product warehouse page
    [Documentation]     Goto product warehouse page
    light_portal_side_menu_bar.Click product
    light_portal_side_menu_bar.Click product warehouse
    light_portal_common_keywords.Wait for jquery loading completed

Goto report sales page
    [Documentation]     Goto report sales page
    light_portal_side_menu_bar.Click report page
    light_portal_side_menu_bar.Click report sales list
    light_portal_common_keywords.Wait for jquery loading completed

Goto report overview page
    [Documentation]     Goto report overview page
    light_portal_side_menu_bar.Click report page
    light_portal_side_menu_bar.Click report overview

Goto add buy list page
    [Documentation]     Goto add buy list page
    light_portal_side_menu_bar.Click buy_list
    light_portal_side_menu_bar.Click add buy list

Goto target page
    [Arguments]      ${navbar_menu}
    [Documentation]  ไปยังหน้าทดสอบ
        light_portal_side_menu_bar.Click main menu  ${navbar_menu}
        light_portal_side_menu_bar.Click sub menu   ${navbar_menu}