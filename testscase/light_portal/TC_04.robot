*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_detail_product_features.Delete product and close zortout website  ${tc_04['product_id']}

*** Test Cases ***
Test system can create multiple product list by using file import
    [Tags]           LIGHT_WEIGHT  TC1  TC_04
    [Documentation]  Test system can create multiple product list by using file import
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto product list
    light_portal_product_list_page.Click import file product
    light_portal_product_list_page.Select import type  ${tc_04['import_type']}
    light_portal_product_list_page.Choose import file
    light_portal_product_list_page.Click save import file
    light_portal_product_list_page.Input quick search and enter  ${tc_04['product_id']}
    light_portal_common_keywords.Scroll to footer of page
    light_portal_product_list_features.Verify import result  ${tc_04}
    light_portal_product_list_page.Click select product list  ${tc_04['product_id']}  ${tc_04['product_name']}