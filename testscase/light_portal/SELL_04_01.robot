*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST SELL 04 01
    [Tags]           LIGHT_WEIGHT  SELL  SELL_04_01
    [Documentation]  ทดสอบการแสดง log ของรายการขาย

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    Log  [สร้างรายการขาย]
            light_portal_home_features.Goto target page  ${sell ['sell_04_01'] ['pre_data'] ['create_sell_page']}
            ${name_sell}=  light_portal_sell___feature.Create sell for sell list  ${sell ['sell_04_01'] ['test_data'] ['add_sell']}
    
    Log  [แก้ไขรายการขาย]
            light_portal_sell___feature.Update sell for sell detail  ${sell ['sell_04_01'] ['test_data'] ['edit_sell']}
    
    Log  [ชำระเงิน]
            light_portal_sell___detail_page.Payment of sell detail
    
    Log  [โอนสินค้า]
            light_portal_sell___detail_page.Transfer of sell detail
    
    Log  [ยกเลิกรายการขาย]
            light_portal_sell___feature.Cancel sell for sell detail
    
    Log  [ตรวจสอบการแสดง log]
            light_portal_sell___list_page.Click sell list by name  ${name_sell}
            light_portal_sell___detail_page.Click log sell list of sell detail
            SeleniumLibrary.Switch window  NEW
            light_portal_sell___feature.Verify log sell list  ${name_sell}  ${sell ['sell_04_01'] ['expect_data'] ['log_sell']}