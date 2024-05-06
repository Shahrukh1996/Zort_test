*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  common_keywords_middle_portal.Close zortout website

*** Test Cases ***
BC PRINT PRODUCT 001
    [Tags]           MIDDLE_WEIGHT  BC_PRINT_PRODUCT  BC_PRINT_PRODUCT_001
    [Documentation]  ทดสอบสร้างรายการที่มีบาร์โค้ด
    # เริ่มต้นทดสอบ
    common_keywords_middle_portal.Open zortout website
    common_keywords_middle_portal.Login to access  ${public_user ['username']}  ${public_user ['password']}
    common_keywords_middle_portal.Verify popup home page
    # สร้างรายการสินค้าแบบ ไม่มีบาร์โค้ด
    common_keywords_middle_portal.Goto target page  ${TC_001 ['pre_data'] ['product_page']}
    ${code_product_1}=  middle_portal_product_features.Create product list  ${TC_001 ['test_data'] ['add_product']}
    middle_portal_product_list_page.Click product detail by code  ${code_product_1}
    middle_portal_product_features.Verify barcode is not visible  ${code_product_1}
    # สร้างรายการสินค้าแบบ มีบาร์โค้ด
    common_keywords_middle_portal.Click sub menu  ${TC_001 ['pre_data'] ['product_page']}
    ${code_product_2}=  middle_portal_product_features.Create product list  ${TC_ALL ['test_data'] ['add_product']}
    middle_portal_product_list_page.Click product detail by code  ${code_product_2}
    middle_portal_product_features.Verify barcode is visible      ${code_product_2}