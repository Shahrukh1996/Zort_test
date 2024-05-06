
*** Variables ***
&{light_portal_sell_edit_page__button}               confirm_edit=//button[text()='บันทึก']

&{light_portal_sell_edit_page___information__text}   dealer_information=//label[text()='ตัวแทนจำหน่าย ']
&{light_portal_sell_edit_page___information__input}  refer=//label[text()='อ้างอิง']/ancestor::div[@class='row']//input[@id='refname']
...                                                  funnel=//label[text()='ช่องทางการขาย']/ancestor::div[@class='row']//input[@id='saleschannel']


*** Keywords ***
Click confirm update of sell edit
    [Documentation]  คลิกปุ่ม 'บันทึก' หน้า (แก้ไขรายการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_edit_page__button.confirm_edit}
        light_portal_common_keywords.Wait for jquery loading completed

Input data information of sell edit
    [Arguments]      ${information_data}
    [Documentation]  กรอกข้อมูล 'การขาย' หน้า (แก้ไขรายการขาย)
        FOR  ${index}  IN  @{information_data.keys()}
                SeleniumLibrary.Input text  ${light_portal_sell_edit_page___information__input.${index}}  ${information_data ['${index}']}
                Sleep  2s
                SeleniumLibrary.Click element  ${light_portal_sell_edit_page___information__text.dealer_information}
        END