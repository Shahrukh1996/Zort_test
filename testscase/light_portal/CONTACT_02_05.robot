*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST CONTACT 02 05
    [Tags]           LIGHT_WEIGHT  CONTACT  CONTACT_02_05
    [Documentation]  ทดสอบรายละเอียดผู้ติดต่อ
    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    Log  [สร้าง 1 รายการผู้ติดต่อ]
            light_portal_home_features.Goto target page  ${tc_205 ['pre_data'] ['contact_page']}
            light_portal_contact___list_page.Click add contact
            ${code_contact}=  light_portal_contact___teature.Create contact list  ${tc_205 ['test_data'] ['add_contact']}
            light_portal_contact___list_page.Click detail contact  ${code_contact}
    Log  [สร้าง 1 รายการซื้อ]
            light_portal_contact___detail_page.Click buy in product
            ${name_buy}=  light_portal_contact___teature.Create buy list  ${tc_205 ['test_data'] ['add_buy'][0]}
            light_portal_common_keywords.Wait for jquery loading completed
    Log  [สร้าง 2 รายการขาย]
            light_portal_contact___detail_page.Click sell out product
            ${name_sell0}=  light_portal_contact___teature.Create sell list  ${tc_205 ['test_data'] ['add_sell'][0]}
            light_portal_common_keywords.Wait for jquery loading completed
            light_portal_contact___detail_page.Click sell out product
            ${name_sell1}=  light_portal_contact___teature.Create sell list  ${tc_205 ['test_data'] ['add_sell'][1]}
            light_portal_common_keywords.Wait for jquery loading completed
    Log  [ตรวจสอบข้อมูลพื้นฐาน]
            light_portal_contact___teature.Verify data contact detail  ${code_contact}  ${tc_205 ['test_data'] ['add_contact']}
    Log  [ตรวจสอบสรุปยอดขาย]
            light_portal_contact___detail_page.Check summarize of sales this year  ${tc_205 ['test_data'] ['summarize_sell'] ['this_year']}
            light_portal_contact___detail_page.Check summarize of sales this month  ${tc_205 ['test_data'] ['summarize_sell'] ['this_month']}
    Log  [ตรวจสอบกราฟยอดขาย]
            light_portal_contact___teature.Verify graph contact detail  ${tc_205 ['test_data'] ['graph_detail'] ['product']}
            light_portal_contact___detail_page.Click select graph category
            light_portal_contact___teature.Verify graph contact detail  ${tc_205 ['test_data'] ['graph_detail'] ['category']}
    Log  [ตรวจสอบตารางรายการซื้อขาย]
            light_portal_contact___teature.Verify table contact detail  ${name_buy}  ซื้อเข้า  ${tc_205 ['test_data'] ['add_buy'][0] ['payment_data'] ['amount']}
            light_portal_contact___teature.Verify table contact detail  ${name_sell0}  ขายออก  ${tc_205 ['test_data'] ['add_sell'][0] ['payment_data'] ['amount']}
    Log  [ตรวจสอบค้นหารายการซื้อขาย]
            light_portal_contact___detail_page.Quick search list  ${name_sell1}
            light_portal_contact___teature.Verify table contact detail  ${name_sell1}  ขายออก  ${tc_205 ['test_data'] ['add_sell'][1] ['payment_data'] ['amount']}