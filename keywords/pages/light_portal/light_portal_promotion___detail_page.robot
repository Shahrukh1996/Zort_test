*** Variables ***
&{light_portal_promotion_detail___text}             focus_con_exp_pro=//h1[contains(normalize-space(.),'รายละเอียดโปรโมชั่นกลุ่มสินค้า')]/ancestor::div[@class='content']//button[text()='บันทึก']
...                                                 toppic_promotion_detail_page=//section[@id='main1']/div[@class='content']//h1[contains(text(), 'รายละเอียดโปรโมชั่นของแถม')]
&{light_portal_promotion_detail___button}           edit_promotion=//span[text()='แก้ไข']
...                                                 expand_promotion=//div[text()='ลำดับออเดอร์']/following-sibling::div/a/span/i
...                                                 confirm_expand_promotion=//h1[contains(normalize-space(.),'รายละเอียดโปรโมชั่นกลุ่มสินค้า')]/ancestor::div[@class='content']//button[text()='บันทึก']

&{light_portal_promotion_detail___expand__input}    end_order=//div[text()='ลำดับออเดอร์']/following-sibling::div//input[@id='orderend']
...                                                 search_gift=//h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']//div[@id='productdialog']//input
&{light_portal_promotion_detail___expand__button}   edit_gift=//h2[text()='แถมสินค้า']/following-sibling::div//span[text()='เพิ่มสินค้า']
...                                                 select_gift=//div[@class='table-view']//tbody//td/div/div[contains(normalize-space(.),'**gift**')]/ancestor::tr/td/a[text()='เลือก']


*** Keywords ***
Focus confirm expand promotion
    [Documentation]  เลื่อนไปยัง 'บันทีก' ของ ขยายโปรโมชัน
        SeleniumLibrary.Scroll Element Into View   ${light_portal_promotion_detail___text.focus_con_exp_pro}

Check toppic promotion detail page
    [Documentation]  เช็คความพร้อม "หน้ารายละเอียดโปรโมชัน"
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_promotion_detail___text.toppic_promotion_detail_page}

Click edit promotion
    [Documentation]  กดปุ่ม 'แก้ไข'
        SeleniumLibrary.Click element  ${light_portal_promotion_detail___button.edit_promotion}
        light_portal_common_keywords.Wait for jquery loading completed

Click expand promotion
    [Documentation]  กดปุ่ม 'ขยายโปรฯ'
        SeleniumLibrary.Click element  ${light_portal_promotion_detail___button.expand_promotion}
        light_portal_common_keywords.Wait for jquery loading completed

Click confirm expand promotion
    [Documentation]  กดปุ่ม 'บันทีก'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_promotion_detail___button.confirm_expand_promotion}
        light_portal_common_keywords.Wait for jquery loading completed

Click edit gift of expand promotion
    [Documentation]  กดปุ่ม 'เพิ่มของแถม' ของ ขยายโปรโมชัน
        SeleniumLibrary.Click element  ${light_portal_promotion_detail___expand__button.edit_gift}
        light_portal_common_keywords.Wait for jquery loading completed

Search gift of expand promotion
    [Arguments]      ${name_gift}
    [Documentation]  ค้นหา 'ของแถม' ของ ขยายโปรโมชัน
        SeleniumLibrary.Input text  ${light_portal_promotion_detail___expand__input.search_gift}  ${name_gift}
        SeleniumLibrary.Press keys  None  RETURN

        &{str_replace}=  BuiltIn.Create dictionary  **gift**=${name_gift}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_detail___expand__button.select_gift}  ${str_replace}
        light_portal_common_keywords.Auto keyword wait element  ${new_xpath}

Select gift of expand promotion
    [Arguments]      ${name_gift}
    [Documentation]  เลือก 'ของแถม' ของ ขยายโปรโมชัน
        &{str_replace}=  BuiltIn.Create dictionary  **gift**=${name_gift}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_detail___expand__button.select_gift}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Input end order of expand promotion
    [Arguments]      ${end_order}
    [Documentation]  กรอกข้อมูล 'ออเดอร์สุดท้าย' ของ ขยายโปรโมชัน
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_promotion_detail___expand__input.end_order}
        SeleniumLibrary.Input text  ${light_portal_promotion_detail___expand__input.end_order}  ${end_order}

Input gift of expand promotion
    [Arguments]      ${gift}
    [Documentation]  กรอกข้อมูล 'รายละเอียดของแถม' ของ ขยายโปรโมชัน
        FOR  ${index}  IN  @{gift}
            light_portal_promotion___detail_page.Focus confirm expand promotion
            light_portal_promotion___detail_page.Click edit gift of expand promotion
            light_portal_promotion___detail_page.Search gift of expand promotion  ${index}
            light_portal_promotion___detail_page.Select gift of expand promotion  ${index}
        END