*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST SELL 03 03
    [Tags]           LIGHT_WEIGHT  SELL  SELL_03_03
    [Documentation]  ทดสอบรายการขาย 'แชร์ลิงค์' และ 'พิมพ์เอกสารทั่วไป'

    Log  [เริ่มต้นทดสอบ]
           light_portal_common_keywords.Open zortout website
           light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}

    Log  [ค้นหารายการขาย]
           light_portal_home_features.Goto target page  ${sell ['sell_03_03'] ['pre_data'] ['sell_list_page']}
           light_portal_sell___list_page.Click open advanced search
           light_portal_sell___list_page.Click close advanced search
           light_portal_sell___feature.Quick search  ${sell ['sell_03_03'] ['test_data'] ['name_sell']}

    Log  [พิมพ์เอกสารจากหน้า list]
           light_portal_sell___feature.Print document list  ${sell ['sell_03_03'] ['test_data'] ['name_sell']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['size']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['form']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['toppic']}
           Sleep  5s
           SeleniumLibrary.Switch window  NEW
    Log  [ตรวจสอบเอกสาร]
           light_portal_sell___feature.Verify print doc a4 nomall in list  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['toppic']}
           SeleniumLibrary.Switch window  MAIN
           Sleep  5s

    Log  [พิมพ์เอกสารจากหน้า detail]
           light_portal_sell___feature.Print document detail  ${sell ['sell_03_03'] ['test_data'] ['name_sell']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['size']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['form']}  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['toppic']}
           Sleep  5s
           SeleniumLibrary.Switch window  NEW
    Log  [ตรวจสอบเอกสาร]
           light_portal_sell___feature.Verify print doc a4 nomall in detail  ${sell ['sell_03_03'] ['test_data'] ['print_doc_nomall'] ['toppic']}
           SeleniumLibrary.Switch window  MAIN
           Sleep  5s

    Log  [แชร์ลิงค์]
       #     light_portal_sell___detail_page.Click share link
           ${url}=  light_portal_sell___detail_page.Get share link
           SeleniumLibrary.Execute javascript  window.open('${url}')
           Sleep  5s
           SeleniumLibrary.Switch window  NEW
           
    Log  [ตรวจสอบแชร์ลิงค์]
           light_portal_sell___feature.Verify share link  ${sell ['sell_03_03'] ['test_data'] ['name_sell']}