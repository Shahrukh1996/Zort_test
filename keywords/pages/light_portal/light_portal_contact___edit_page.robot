
*** Variables ***
&{xpath_eidt_information_input}  name=//div[@class='form-group']//label[text()='ชื่อ']/following-sibling::*/input[@id='editname']
...                              group=//div[@class='form-group']//label[text()='กลุ่มลูกค้า']/following-sibling::*/select[@id='tierpriceid']
...                              description=//div[@class='form-group']//label[text()='คำอธิบาย']/following-sibling::*/textarea[@id='description']
&{xpath_eidt_button}             confirm_contact=//div[@id='menuInfo']//div[@class='tabsbar-vertical__body']/button[text()='บันทึก']


*** Keywords ***
Click confirm edit contact
    [Documentation]  คลิกปุ่ม บันทึก
    DobbyWebCommon.Click element when ready  ${xpath_eidt_button.confirm_contact}

Input data section information
    [Arguments]      ${information_data}
    [Documentation]  กรอกข้อมูลส่วน ข้อมูล
    FOR  ${index}  IN  @{information_data.keys()}
        IF  '${index}' == 'group'
            SeleniumLibrary.Select from list by label  ${xpath_eidt_information_input.group}  ${information_data ['${index}']}
        ELSE
            light_portal_common_keywords.Auto keyword clear input text  ${xpath_eidt_information_input.${index}}
            DobbyWebCommon.Input text to element when ready  ${xpath_eidt_information_input.${index}}  ${information_data ['${index}']}
        END
    END