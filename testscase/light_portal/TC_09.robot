*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST TC 09
    [Tags]           LIGHT_WEIGHT  TC1  TC_09
    [Documentation]  (สร้าง ลบ) รายการขายแบบปกติ
    
    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    
    Log  [สร้างรายการ]
            light_portal_home_features.Goto target page  ${tc_09 ['pre_data'] ['sell_list_page']}
            ${add_sell}=  BuiltIn.Set Variable  ${tc_09 ['test_data'] ['add_sell'][0]}
            ${name_sell}=  light_portal_sell___feature.Create sell list  ${add_sell}
    
    Log  [ตรวจสอบรายละเอียด]
            ${expect_add_sell}=  BuiltIn.Set Variable  ${tc_09 ['expect_data'] ['add_sell']}
            Collections.Set to dictionary  ${expect_add_sell ['in_detail'] ['information']}  name=${name_sell}
            light_portal_sell___feature.Verify sell detail  ${expect_add_sell ['in_detail']}
    
    Log  [ไปยังหน้า รายการขาย]
            light_portal_side_menu_bar.Click sub menu sell list page
    
    Log  [ค้นหารายการ]
            light_portal_sell___list_page.Click open advanced search
            light_portal_sell___feature.Quick search  ${name_sell}
            light_portal_common_keywords.Scroll to footer of page
    
    Log  [ตรวจสอบรายการ]
            Collections.Set to dictionary  ${expect_add_sell ['in_list']}  name=${name_sell}
            light_portal_sell___feature.Verify sell list  ${expect_add_sell ['in_list']}
    
    Log  [ลบรายการ]
            light_portal_sell___feature.Delete sell list  ${name_sell}
    
    Log  [ตรวจสอบการลบ]
            light_portal_sell___feature.Quick search  ${name_sell}
            light_portal_sell___list_page.Check delete sell list
    





    # # ลบคลังสินค้า
    # light_portal_home_features.Goto target page  ${tc_09 ['pre_data'] ['warehouse_list_page']}
    # FOR  ${index}  IN RANGE  3
    #     SeleniumLibrary.Input text  //input[@id='quicksearchtext']  คลัง-ทดสอบ-แก้ไข
    #     SeleniumLibrary.Press keys  None  ENTER
    #     light_portal_common_keywords.Auto keyword remove dom chat support
    #     Sleep  2s
    #     SeleniumLibrary.Click element  (//td//span[text()='คลัง-ทดสอบ-แก้ไข']/ancestor::tr/td[@class='action']//i)[1]
    #     Sleep  5s
    #     SeleniumLibrary.Click element  (//td//span[text()='คลัง-ทดสอบ-แก้ไข']/ancestor::tr/td[@class='action']//ul/li/a[text()='ลบ'])[1]
    #     Sleep  1s
    #     SeleniumLibrary.Input text  //input[@id='confirmdeletetext']  confirm
    #     SeleniumLibrary.Click element  //input[@id='confirmdeletetext']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']
    #     Sleep  2s
    # END