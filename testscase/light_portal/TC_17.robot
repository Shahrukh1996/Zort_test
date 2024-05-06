*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can search sell list from advance search and verify deta should be corrected
    [Tags]           LIGHT_WEIGHT  TC2  TC_17
    [Documentation]  Test can search sell list from advance search and verify deta should be corrected
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto buy list page
    light_portal_buy_list_features.Input information in advance search and confirm search  ${tc_17['name_buy']}  ${tc_17['customer_name']}
    ...      ${tc_17['amount']}  ${tc_17['amount']}  ${tc_17['product_name']}  ${tc_17['phone']}  ${tc_17['email']}
    ...      ${tc_17['refer']}  ${tc_17['serial_number']}
    light_portal_buy_list_features.Verify information afer search should be corrected  ${tc_17['date']}  ${tc_17['name_buy']}
    ...      ${tc_17['customer_name']}  ${tc_17['amount']}  ${tc_17['success_status']}  ${tc_17['warehouse']}  ${tc_17['payment_status']}