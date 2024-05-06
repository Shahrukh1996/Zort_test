*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can create and edit store and branch information
    [Tags]            LIGHT_WEIGHT  TC1  TC_01
    [Documentation]   Test user can create and edit store and branch information
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto product warehouse page
    ${warehouse_code}=  light_portal_product_warehouse_features.Create warehouse and input require name  ${tc_01['warehouse_01']}
    light_portal_product_warehouse_page.Quick search warehouse page  ${warehouse_code}
    light_portal_product_warehouse_features.Verify information of warehouse should be corrected  ${warehouse_code}  ${tc_01['warehouse_01']}  ${tc_01['warehouse_type']}
    light_portal_product_warehouse_features.Edit infomation of warehouse be kebab function  ${warehouse_code}  ${tc_01['warehouse_02']}
    light_portal_product_warehouse_features.Verify information of warehouse should be corrected  ${warehouse_code}  ${tc_01['warehouse_02']}  ${tc_01['warehouse_type']}