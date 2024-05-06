*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test command button can link to the any page
    [Tags]           LIGHT_WEIGHT  TC2  TC_23
    [Documentation]   Test command button can link to the any page
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto target page  ${tc_23 ['pre_data'] ['product_list_page']}
    light_portal_product_list_features.Click advance search and clear checkbox
    light_portal_product_list_page.Click checkbox type product
    light_portal_product_list_features.Input advance search id name minimum price and tag  ${tc_23}
    light_portal_product_list_features.Select advance search warehouse and category  ${tc_23['search_warehouse']}  ${tc_23['search_category']}
    light_portal_product_list_page.Click confirm advance search
    light_portal_product_list_page.Click select product by name  ${tc_23['search_name']}
    light_portal_detail_product_features.Click command buy product and verify buy product page should be visible
    light_portal_detail_product_features.Click command sell product and verify sell product page should be visible
    light_portal_detail_product_features.Click command transfer product and verify transfer product page should be visible