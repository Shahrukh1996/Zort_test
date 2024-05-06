*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test return product advance search
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_71
    [Documentation]  Test return product advance search
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto return product list page
    light_portal_return_product_list_page.Click advance search
    light_portal_return_product_list_features.Advance search  ${tc_71}
    light_portal_return_product_list_features.Verify advance search  ${tc_71}