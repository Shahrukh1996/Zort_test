*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can create variant product normally
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_106
    [Documentation]  Test can create variant product normally

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto variant list page
    light_portal_variant_list_page.Click create product on variant list page
    light_portal_variant_list_page.Wait until main id is ready
    ${main_product_id}=  light_portal_variant_list_page.Get main product id
    light_portal_variant_list_features.Click okay button on error popup
    light_portal_variant_list_features.Input require data on add variant list page  ${variant_page['group_name']['name']}  ${variant_page['type']['color']}
    light_portal_variant_list_features.Input more variant type on add variant list page  ${2}  ${variant_page['type']['size']}
    light_portal_variant_list_page.Click save button on create product on variant list page
    light_portal_variant_list_features.Delete variant data by name and verify data is deleted  ${main_product_id}  ${variant_page['group_name']['name']}  ${variant_page['confirm']}