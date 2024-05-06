*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  common_keywords_middle_portal.Close zortout website

*** Test Cases ***
BC PRINT PRODUCT 013
    [Tags]           MIDDLE_WEIGHT  BC_PRINT_PRODUCT  BC_PRINT_PRODUCT_013
    [Documentation]  ทดสอบพิมพ์เอกสาร (คิวอาร์โค้ด : 3 คอลัมน์ [STK])
    # เริ่มต้นทดสอบ
    common_keywords_middle_portal.Open zortout website
    common_keywords_middle_portal.Login to access  ${public_user ['username']}  ${public_user ['password']}
    common_keywords_middle_portal.Verify popup home page
    # สร้างรายการสินค้า
    common_keywords_middle_portal.Goto target page  ${TC_ALL ['pre_data'] ['product_page']}
    ${code_product}=  middle_portal_product_features.Create product list  ${TC_ALL ['test_data'] ['add_product']}
    # แก้ไขรายการสินค้า
    middle_portal_product_list_page.Click product detail by code  ${code_product}
    middle_portal_product_features.Update product list  ${code_product}  ${TC_ALL ['test_data'] ['edit_product']}
    # ทดสอบ พิมพ์เอกสาร
    middle_portal_product_features.Print barcode  ${TC_013 ['test_data'] ['print_barcode']}
    # ตรวจสอบ พิมพ์เอกสาร
    middle_portal_product_features.Verify print barcode  ${code_product}  ${TC_013 ['test_data'] ['expect_print_barcode']}