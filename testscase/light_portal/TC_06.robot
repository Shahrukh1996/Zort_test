*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can create transfer list and edit any detail of transfer data
    [Tags]           LIGHT_WEIGHT  TC1  TC_06
    [Documentation]  Test user can create transfer list and edit any detail of transfer data
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto product transfer list
    light_portal_product_transfer_list_page.Click create product transfer list
    light_portal_common_keywords.Wait for jquery loading completed
    ${id_transfer}=  light_portal_product_transfer_list_page.Get id when user create new transfer product list
    light_portal_product_transfer_list_features.Input require data when create product transfer list  ${tc_06['store_a']}  ${tc_06['store_b']}  ${tc_06['add_transfer_list']}
    light_portal_product_transfer_list_features.Verify require data should be corrected  ${tc_06['transfer_status_waiting']}  ${tc_06['store_a']}  ${tc_06['store_b']}
    light_portal_product_transfer_list_features.Goto edit page by clicking command button
    light_portal_product_transfer_list_features.Add product on edit data of transfer page  ${tc_06['product_id']}
    light_portal_product_transfer_list_features.Verify product id and amount should be corrected  ${tc_06['product_id']}  ${tc_06['product_amount_2']}