*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test printing return product A4 size document with tax invoice form
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_68
    [Documentation]  Test printing return product A4 size document with general format
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_page.Click create return product
    ${return_product_id}=  light_portal_add_return_product_features.Create return product  ${tc_68['product_id']}  ${tc_68['contact']}
    light_portal_home_features.Goto return product list page
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_return_product_list_page.Click kebab menu return product  ${return_product_id}
    light_portal_return_product_list_page.Click print return product  ${return_product_id}
    light_portal_return_product_list_page.Select paper size  ${tc_68['paper_size']}
    light_portal_return_product_list_page.Select format paper  ${tc_68['format_paper']}
    light_portal_print_return_product_features.Input print title and click confirm   ${tc_68['print_title']}
    light_portal_print_return_product_features.Verify print return product page  ${tc_68['contact']}  ${tc_68['product_id']}