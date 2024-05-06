*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST PRODUCT 01 01
    [Tags]           LIGHT_WEIGHT  PRODUCT  PRODUCT_01_01
    [Documentation]  ทดสอบฟังก์ชัน (serial no)
    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    Log  [สร้างรายการสินค้า]
            light_portal_home_features.Goto target page  ${product ['product_01_01'] ['pre_data'] ['product_list_page']}
            ${add_product}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['add_product']}
            ${code_product}  ${name_product}=  light_portal_products___feature.Create product  ${add_product}  ${add_product ['information']}  ${add_product ['price']}  ${add_product ['setting']}  ${add_product ['warehouse']}
    
    Log  [สร้างรายการซื้อ]
            light_portal_home_features.Goto target page  ${product ['product_01_01'] ['pre_data'] ['buy_list_page']}
            ${add_buy}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['add_buy']}
            Collections.Set To Dictionary  ${add_buy ['product'][1]}  code=${code_product}  name=${name_product}
            ${name_buy}=  light_portal_buy___feature.Create buy  ${add_buy}  ${add_buy ['information']}  ${add_buy ['product']}
    
    Log  [เรียกใช้ฟังก์ serial ของรายการซื้อ]
            light_portal_side_menu_bar.Click sub menu buy list page
            ${serial_buy}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['serial_buy']}
            Collections.Set To Dictionary  ${serial_buy}  name=${name_buy}
            light_portal_buy___feature.Function serial for buy list  ${serial_buy}
    
    Log  [สร้างรายการขาย]
            light_portal_home_features.Goto target page  ${product ['product_01_01'] ['pre_data'] ['sell_list_page']}
            ${add_sell}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['add_sell'][0]}
            Collections.Set To Dictionary  ${add_sell ['product'] ['detail'][1]}  code=${code_product}  name=${name_product}
            ${name_sell}=  light_portal_sell___feature.Create sell list  ${add_sell}
    
    Log  [เรียกใช้ฟังก์ serial ของรายการขาย]
            light_portal_side_menu_bar.Click sub menu sell list page
            ${serial_sell}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['serial_sell']}
            Collections.Set To Dictionary  ${serial_sell}  name_sell=${name_sell}  name_product=${name_product}
            light_portal_sell___feature.Function serial for sell list  ${serial_sell}
    
    Log  [ตรวจสอบฟังก์ชัน 'serial' ของ 'รายการสินค้า']
            light_portal_home_features.Goto target page  ${product ['product_01_01'] ['pre_data'] ['product_list_page']}
            ${expect_serial_product}=  BuiltIn.Set Variable  ${product ['product_01_01'] ['test_data'] ['expect_serial_product']}
            Collections.Set To Dictionary  ${expect_serial_product}  name_product=${name_product}  name_sell=${name_sell}  name_buy=${name_buy}
            light_portal_products___feature.Verify function serial for product  ${expect_serial_product}