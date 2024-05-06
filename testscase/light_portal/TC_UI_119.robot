*** Settings ***
Resource         ${CURDIR}/../../resources/import.robot
Test Teardown    light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test return product by code
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_119
    [Documentation]  Test return product by code

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto add buy list page
    ${code}=  light_portal_add_buy_list_features.Add buy list with product id and product amount  ${tc_ui_119['product_id']}  ${tc_ui_119['product_amount']}
    light_portal_side_menu_bar.Click receive product
    light_portal_receive_product_features.Verify input invalid buy list code  ${tc_ui_119['invalid_code']}
    light_portal_receive_product_features.Verify input already transfer code  ${tc_ui_119['transfer_code']}
    light_portal_receive_product_page.Input buy list code  ${code}
    light_portal_receive_product_page.Click receive product
    light_portal_receive_product_features.Input transfer info and click receive product  ${tc_ui_119['warehouse']}  ${tc_ui_119['transfer_amount']}  ${tc_ui_119['product_id']}
    light_portal_receive_product_page.Click ok confirm receive product
    light_portal_receive_product_page.Click continue receive product
    light_portal_receive_product_page.Input buy list code  ${code}
    light_portal_receive_product_page.Click receive product
    light_portal_receive_product_page.Verify transfer some part success
    light_portal_receive_product_features.Input transfer info and click receive product  ${tc_ui_119['warehouse']}  ${tc_ui_119['transfer_amount']}  ${tc_ui_119['product_id']}
    light_portal_receive_product_page.Click goto buy list page
    light_portal_side_menu_bar.Click view buy list
    light_portal_buy___list_page.Quick search by id  ${code}
    light_portal_buy___list_page.Verify product status transfer  ${code}  ${tc_ui_119['transfer_status']}