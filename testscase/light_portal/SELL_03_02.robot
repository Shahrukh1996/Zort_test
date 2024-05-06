*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST SELL 03 02
    [Tags]           LIGHT_WEIGHT  SELL  SELL_03_02
    [Documentation]  ทดสอบ (บริการส่งสินค้า แบบรวมรายการ) และ (พิมพ์เอกสาร สติ๊กเกอร์ 4x6)

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}

    Log  [สร้าง 2 รายการขาย]
            light_portal_home_features.Goto target page  ${sell ['sell_03_02'] ['pre_data'] ['create_sell_page']}
            ${name_sell_1}=  light_portal_sell___feature.Create sell for sell list  ${sell ['sell_03_02'] ['test_data'] ['add_sell'][0]}
            light_portal_side_menu_bar.Click sub menu sell add page
            ${name_sell_2}=  light_portal_sell___feature.Create sell for sell list  ${sell ['sell_03_02'] ['test_data'] ['add_sell'][1]}

    Log  [เลือก 2 รายการขาย]
            light_portal_side_menu_bar.Click sub menu sell list page
            light_portal_sell___list_page.Select sell list by name  ${name_sell_1}
            light_portal_sell___list_page.Select sell list by name  ${name_sell_2}

    Log  [เลือกบริการส่งสินค้า]
            Sleep  2s
            light_portal_sell___list_page.Click delivery service
            light_portal_sell___list_page.Click delivery service choice all list
            light_portal_sell___feature.Input data of delivery service  ${sell ['sell_03_02'] ['test_data'] ['delivery_service']}
            light_portal_sell___list_page.Click confirm delivery service 1
            light_portal_sell___list_page.Select warehouse of delivery service  ${sell ['sell_03_02'] ['test_data'] ['delivery_service'] ['transport_detail']}
            light_portal_sell___list_page.Click confirm delivery service 2

    Log  [ตรวจสอบใบพิมพ์เอกสาร]
            Sleep  5s
            SeleniumLibrary.Switch window  NEW
            # light_portal_sell___feature.Verify print document for all list  ส่งสินค้าแบบรวมรายการ  ${sell ['sell_03_02'] ['test_data']}  ${name_sell_1}

    Log  [เลือก 2 รายการขาย]
            SeleniumLibrary.Switch window  MAIN
            Sleep  5s
            light_portal_side_menu_bar.Click sub menu sell list page
            light_portal_common_keywords.Wait for jquery loading completed
            light_portal_sell___list_page.Select sell list by name  ${name_sell_1}
            light_portal_sell___list_page.Select sell list by name  ${name_sell_2}

    Log  [เลือกพิมพ์เอกสารใบแปะกล่อง สติ๊กเกอร์ 4x6]
            Sleep  2s
            light_portal_sell___list_page.Click print document all
            light_portal_sell___list_page.Click print document choice print box
            light_portal_sell___list_page.Click size sticker
            light_portal_sell___list_page.Click confirm print document

    Log  [ตรวจสอบใบแปะกล่อง สติ๊กเกอร์ 4x6]
            Sleep  5s
            SeleniumLibrary.Switch window  NEW
            # light_portal_sell___feature.Verify print document for all list  ใบแปะกล่องแบบสติ๊กเกอร์  ${sell ['sell_03_02'] ['test_data']}  ${name_sell_1}