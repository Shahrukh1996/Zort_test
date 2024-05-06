*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST TC UI 97
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_97
    [Documentation]  ทดสอบสินค้าชุด (สร้าง เปิดใช้งาน แก้ไข ค้นหา)

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}
    Log  [สร้างสินค้าชุด]
            light_portal_home_features.Goto target page  ${tc_97 ['pre_data'] ['product_set_page']}
            ${code_product_set_cre}=  light_portal_product_set___feature.Create product set  ${tc_97 ['test_data'] ['add_product_set']}
    Log  [เปิดใช้งานสินค้าชุด]
            light_portal_side_menu_bar.Click sub menu product set page
            light_portal_product_set___feature.Activate product set  ${code_product_set_cre}
     Log  [แก้ไขสินค้าชุด]
            light_portal_side_menu_bar.Click sub menu product set page
            ${code_product_set_ups}=  light_portal_product_set___feature.Update product set  ${code_product_set_cre}  ${tc_97 ['test_data'] ['edit_product_set']}
     Log  [ลบสินค้าชุด]
            light_portal_side_menu_bar.Click sub menu product set page
            light_portal_product_set___feature.Delete product set  ${code_product_set_ups}
     Log  [ตรวจสอบ ลบสินค้าชุด]
            light_portal_side_menu_bar.Click sub menu product set page
            light_portal_product_set___feature.Verify delete product set  ${code_product_set_ups}