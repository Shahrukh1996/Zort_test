*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can add more variant type on variant list page
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_107
    [Documentation]  Test can add more variant type on variant list page

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto variant list page
    light_portal_variant_list_features.Click edit by kebab function  ${variant_page['product_code']}  ${variant_page['product_name']}
    light_portal_variant_list_page.Input variant type on edit page  ${3}  ${variant_page['type']['white_color']}
    light_portal_variant_list_page.Input variant type on edit page  ${4}  ${variant_page['type']['black_color']}
    light_portal_variant_list_features.Confirm to save edit variant type  ${variant_page['confirm']}
    light_portal_variant_list_features.Click to goto view sumary page  ${variant_page['product_name']}
    ${result}=  light_portal_variant_list_features.Verify all data on variant product page should be display