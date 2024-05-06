*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can create edit and adjust amount of product
    [Tags]           LIGHT_WEIGHT  TC1  TC_03
    [Documentation]  Test user can create edit and adjust amount of product
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto target page  ${tc_03 ['pre_data'] ['add_product_page']}
    ${product_id}=  light_portal_add_product_list_features.Input and select data  ${tc_03}
    light_portal_product_list_features.Verify create product list  ${product_id}  ${tc_03}
    light_portal_product_list_page.Click select product list  ${product_id}  ${tc_03['name']}
    light_portal_detail_product_features.Verify product detail  ${product_id}  ${tc_03}
    light_portal_detail_product_features.Edit product name  ${tc_03['name_edit']}
    light_portal_side_menu_bar.Click sub menu  ${tc_03['pre_data'] ['productPage']}
    light_portal_product_list_page.Verify product list name  ${product_id}  ${tc_03['name_edit']}
    light_portal_product_list_page.Click select product list  ${product_id}  ${tc_03['name_edit']}
    light_portal_detail_product_features.Adjust amount of product  ${tc_03['warehouse']}  ${tc_03['remains_edit']}  ${tc_03['adjust_price']}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_side_menu_bar.Click sub menu  ${tc_03['pre_data'] ['productPage']}
    light_portal_product_list_page.Verify product list remain  ${product_id}  ${tc_03['remains_edit']}