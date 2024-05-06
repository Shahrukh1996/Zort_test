*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test payment status of return sell list
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_66
    [Documentation]  ทดสอบ สถานะชำระเงิน ของรับคืนสินค้า
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    light_portal_home_features.Goto target page  ${tc_66 ['pre_data'] ['return_sell_list_page']}
    light_portal_returnsell_list_page.Click create return sell list
    light_portal_returnsell_features.Add return sell list  ${tc_66 ['test_data'] ['add_return_sell']}
    light_portal_returnsell_features.Verify status payment by detail page  ${tc_66 ['expect_data'] ['status_payment'] ['waiting']}

    light_portal_returnsell_features.Payment by detail page  ${tc_66 ['test_data'] ['partial_payment']}
    light_portal_returnsell_features.Verify status payment by detail page  ${tc_66 ['expect_data'] ['status_payment'] ['partial']}

    light_portal_returnsell_features.Payment by detail page  ${tc_66 ['test_data'] ['over_payment']}
    light_portal_returnsell_features.Verify status payment by detail page  ${tc_66 ['expect_data'] ['status_payment'] ['over']}

    light_portal_returnsell_features.Delete payment by detail page  ${tc_66 ['test_data'] ['over_payment']}

    light_portal_returnsell_features.Payment by detail page  ${tc_66 ['test_data'] ['fully_payment']}
    light_portal_returnsell_features.Verify status payment by detail page  ${tc_66 ['expect_data'] ['status_payment'] ['fully']}