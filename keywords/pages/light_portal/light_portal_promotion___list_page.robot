*** Variables ***
&{light_protal_promotion_list___button}  add_promotion=//div[@class='container-fluid']//button[text()='สร้างโปรโมชั่น']
...                                      list_promotion=(//tbody/tr/td//span[text()='**promotion**'])[last()]
...                                      kebab=(//tbody/tr/td//span[contains(@title,'**promotion**')]/ancestor::tr/td[@class='action text-right']/div[@class='btn-etc dropdown']/i)[last()]
...                                      kebab_del_pro=(//tbody/tr/td//span[contains(@title,'**promotion**')]/ancestor::tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']//ul//a[text()='ลบ'])[last()]
...                                      confirm_del_pro=//p[contains(text(),'ยืนยันการลบโปรโมชั่น') and @id='confirmmsg']/ancestor::div[@class='modal-content']//button[text()='ยืนยัน']


*** Keywords ***
Click create promotion
    [Documentation]  กดปุ่ม 'สร้างโปรโมชัน'
        SeleniumLibrary.Click element  ${light_protal_promotion_list___button.add_promotion}
        light_portal_common_keywords.Wait for jquery loading completed

Click list promotion by name
    [Arguments]      ${name_promotion}
    [Documentation]  กดเลือก 'โปรโมชัน' อิงจาก 'ชื่อ'
        &{str_replace}=  BuiltIn.Create dictionary  **promotion**=${name_promotion}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_protal_promotion_list___button.list_promotion}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_common_keywords.Wait for jquery loading completed

Click delete promotion by name
    [Arguments]      ${name_promotion}
    [Documentation]  ลบ 'โปรโมชัน' โดยอิงจาก 'ชื่อ'
        light_portal_common_keywords.Scroll to header of page
        light_portal_common_keywords.Auto keyword remove dom chat support
        Sleep  5s
        &{str_replace_1}=  BuiltIn.Create dictionary  **promotion**=${name_promotion}
        ${kebab_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_protal_promotion_list___button.kebab}  ${str_replace_1}
        SeleniumLibrary.Click element  ${kebab_xpath}
        &{str_replace_2}=  BuiltIn.Create dictionary  **promotion**=${name_promotion}
        ${kebab_del_pro_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_protal_promotion_list___button.kebab_del_pro}  ${str_replace_2}
        SeleniumLibrary.Click element  ${kebab_del_pro_xpath}
        Sleep  5s
        SeleniumLibrary.Click element  ${light_protal_promotion_list___button.confirm_del_pro}
        light_portal_common_keywords.Wait for jquery loading completed