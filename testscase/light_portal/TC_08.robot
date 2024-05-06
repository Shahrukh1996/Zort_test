*** Settings ***
Resource         ${CURDIR}/../../resources/import.robot
Test Teardown    light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test search for transfers the results can be displayed correctly
    [Tags]           LIGHT_WEIGHT  TC1  TC_08
    [Documentation]  Test search for transfers the results can be displayed correctly
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto product transfer list
    light_portal_product_transfer_list_page.Click advance search
    light_portal_product_transfer_list_features.Clear search advance checkbox
    light_portal_product_transfer_list_features.Input advance search  ${tc_08['search_number']}  ${tc_08['search_product']}  ${tc_08['search_warehouse']}  ${tc_08['search_user_id']}
    light_portal_product_transfer_list_page.Click checkbox transfer of type
    light_portal_product_transfer_list_page.Click checkbox success of status
    light_portal_product_transfer_list_page.Click confirm advance search
    light_portal_product_transfer_list_features.Verify search result  ${tc_08}