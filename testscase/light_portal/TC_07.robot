*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can transfer partial goods and all goods successfully
    [Tags]           LIGHT_WEIGHT  TC1  TC_07
    [Documentation]  ทดสอบฟังก์ 'รายการโอนสินค้า' กรณี โอนสินค้า
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}
    light_portal_home_features.Goto product transfer list
    light_portal_product_transfer_list_page.Click create product transfer list
    light_portal_common_keywords.Wait for jquery loading completed
    ${id_transfer}=  light_portal_product_transfer_list_page.Get id when user create new transfer product list
    light_portal_product_transfer_list_features.Input origin store and destination store  ${tc_07 ['store_a']}  ${tc_07 ['store_b']}  ${tc_07 ['add_transfer_list']}
    light_portal_product_transfer_list_features.Add product by product code on transfer list page  ${tc_07 ['product_id']}
    light_portal_product_transfer_list_features.Click transfer partial goods and verify status chould be corrected  ${tc_07 ['transfer_status_partial_goods']}
    light_portal_product_transfer_list_features.Click transfer all goods and verify status should be corrected  ${tc_07 ['transfer_status_success']}
    light_portal_product_transfer_list_features.Cancel transfer product by transfer id and verify status should be corrected  ${id_transfer}
