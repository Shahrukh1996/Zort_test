*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test printing return product A4 size document with tax invoice form
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_69
    [Documentation]  Test printing return product A4 size document with tax invoice form
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_page.Click create return product
    ${return_product_id}=  light_portal_add_return_product_features.Create return product  ${tc_69['product_id']}  ${tc_69['contact']}
    light_portal_home_features.Goto return product list page
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_return_product_list_page.Click kebab menu return product  ${return_product_id}
    light_portal_return_product_list_page.Click print return product  ${return_product_id}
    light_portal_return_product_list_page.Select paper size  ${tc_69['paper_size']}
    light_portal_return_product_list_page.Select format paper  ${tc_69['format_paper']}
    light_portal_print_return_product_features.Input print title and click confirm  ${tc_69['print_title']}
    light_portal_print_return_product_features.Verify print return product tax invoice  ${tc_69['contact']}  ${tc_69['product_id']}