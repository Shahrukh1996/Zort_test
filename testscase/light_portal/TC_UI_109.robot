*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can search variant product from code and name
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_109
    [Documentation]  Test can search variant product from code and name

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto variant list page
    light_portal_variant_list_features.Verify search product by code on variant page should be corrected  ${variant_page['product_code']}  ${variant_page['product_name']}
    light_portal_variant_list_features.Verify search product by name on variant page should be corrected  ${variant_page['product_code']}  ${variant_page['product_name']}