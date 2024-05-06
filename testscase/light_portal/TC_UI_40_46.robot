*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test user can create and approve quotation successfully
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_40_46
    [Documentation]  Test user can create and approve quotation successfully
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto quotation list page
    light_portal_quotation_list_page.Click create quotation
    ${quotation_id}=  light_portal_add_quotation_page.Get quotation id
    light_portal_add_quotation_features.Choose customer name from customer code  ${quotation['customaer_code']}
    light_portal_add_quotation_page.Input quotation id  ${EMPTY}
    light_portal_add_quotation_features.Verify popup when require data is incomplete
    light_portal_add_quotation_page.Input quotation id  ${quotation_id}
    light_portal_add_sell_list_features.Select product with top button  ${quotation['product_code']}
    light_portal_add_quotation_features.Save quotation and verify quotation id is created  ${quotation_id}
    light_portal_home_features.Goto quotation list page
    light_portal_add_quotation_features.Search quotaion id on quick search  ${quotation_id}
    light_portal_add_quotation_features.Edit quotation detail after create successfully  ${quotation_id}
    light_portal_side_menu_bar.Click sub menu  ${quotation ['pre_data'] ['quotation_page']}
    light_portal_add_quotation_page.Select by quotation code  ${quotation_id}
    light_portal_add_quotation_page.Verify approve status  ${quotation['status_waiting']}
    light_portal_add_quotation_page.Click approve button
    light_portal_add_quotation_page.Click save on approve page
    light_portal_add_quotation_page.Verify approve status  ${quotation['status_approved']}