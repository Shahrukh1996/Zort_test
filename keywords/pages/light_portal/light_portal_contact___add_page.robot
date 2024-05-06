
*** Variables ***
&{xpath_add_text}          information=//fieldset/legend[contains(normalize-space(.),'ข้อมูลผู้ติดต่อ')]
&{xpath_add_button}        confirm_contact=//div[@class='modal-content']/div[@class='modal-header']//h3[text()='เพิ่มผู้ติดต่อใหม่']/ancestor::div[@class='modal-content']/div[normalize-space(@class)='modal-footer']//button[text()='บันทึก']

&{xpath_basic_input}        group=//div[@class='form-group']//label[text()='กลุ่มลูกค้า']/following-sibling::div/select[@id='tierpriceid']
...                         code=//div[@class='form-group']//label[text()='รหัส']/following-sibling::div/input[@id='addcontactcode']
...                         name=//div[@class='form-group']//label[text()='ชื่อ']/following-sibling::div/input[@id='addname']
...                         taxpayer=//div[@class='form-group']//label[text()='เลขผู้เสียภาษี']/following-sibling::div/input[@id='addcontactidnumber']
...                         branch_name=//div[@class='form-group']//label[text()='ชื่อสาขา']/following-sibling::div/input[@id='addbranchname']
...                         branch_number=//div[@class='form-group']//label[text()='เลขที่สาขา']/following-sibling::div/input[@id='addbranchno']
...                         tag=//div[@class='form-group']//label[text()='Tag ผู้ติดต่อ']/following-sibling::div//input[@class='focus-visible']
&{xpath_basic_button}       check_box=//div[@class='form-group']//label[@for='tmpmerchantstatus']/input[@id='tmpmerchantstatus']
...                         tag=//div[@class='form-group']//label[text()='Tag ผู้ติดต่อ']/following-sibling::div//div[@class='bootstrap-tagsinput']

&{xpath_information_input}  telephone_number=//div[@class='form-group']//label[text()='เบอร์โทรศัพท์']/following-sibling::div/input[@id='addphone']
...                         mobile_number=//div[@class='form-group']//label[text()='เบอร์โทรศัพท์มือถือ']/following-sibling::div/input[@id='addmobile']
...                         fax_number=//div[@class='form-group']//label[text()='เบอร์โทรสาร']/following-sibling::div/input[@id='addfax']
...                         email=//div[@class='form-group']//label[text()='อีเมล']/following-sibling::div/input[@id='addemail']
...                         address=//div[@class='form-group']//label[text()='ที่อยู่']/following-sibling::div/textarea[@id='addaddress']
...                         contact=//div[@class='form-group']//label[text()='ชื่อผู้ติดต่อ']/following-sibling::div/input[@id='addcontactname']

&{xpath_socialmedia_input}  facebook=//div[@class='form-group']//label[contains(normalize-space(.),'Facebook')]/following-sibling::div/input[@id='addfacebook']
...                         line=//div[@class='form-group']//label[contains(normalize-space(.),'LINE')]/following-sibling::div/input[@id='addline']
...                         instagram=//div[@class='form-group']//label[contains(normalize-space(.),'Instagram')]/following-sibling::div/input[@id='addinstagram']


*** Keywords ***
Click check box
    [Documentation]  คลิกปุ่ม 'เช็คบล็อก'
    DobbyWebCommon.Click element when ready  ${xpath_basic_button.check_box}
    
Click confirm add contact
    [Documentation]  คลิกปุ่ม 'บันทึก'
    DobbyWebCommon.Click element when ready  ${xpath_add_button.confirm_contact}

Input data section basic
    [Arguments]      ${basic_data}
    [Documentation]  กรอกข้อมูลส่วน 'ผู้ติดต่อ'
    light_portal_contact___add_page.Click check box
    FOR  ${index}  IN  @{basic_data.keys()}
        IF  '${index}' == 'code'
            light_portal_common_keywords.Auto keyword clear input text  ${xpath_basic_input.${index}}
            ${code_data}=  light_portal_common_keywords.Auto keyword random string  ${basic_data ['${index}']}
            DobbyWebCommon.Input text to element when ready  ${xpath_basic_input.${index}}  ${code_data}
            ${code_contact}=  BuiltIn.Set Variable  ${code_data}
        ELSE IF  '${index}' == 'tag'
            DobbyWebCommon.Click element when ready  ${xpath_basic_button.${index}}
            DobbyWebCommon.Input text to element when ready  ${xpath_basic_input.${index}}  ${basic_data ['${index}']}
            DobbyWebCommon.Click element when ready  ${xpath_add_text.information}
        ELSE IF  '${index}' == 'group'
            SeleniumLibrary.Select from list by label  ${xpath_basic_input.group}  ${basic_data ['${index}']}
        ELSE
            DobbyWebCommon.Input text to element when ready  ${xpath_basic_input.${index}}  ${basic_data ['${index}']}
        END
    END
    [Return]  ${code_contact}

Input data section socialmedia
    [Arguments]      ${socialmedia_data}
    [Documentation]  กรอกข้อมูลส่วน 'สื่อออนไลน์'
    FOR  ${index}  IN  @{socialmedia_data.keys()}
        DobbyWebCommon.Input text to element when ready  ${xpath_socialmedia_input.${index}}  ${socialmedia_data ['${index}']}
    END
    
Input data section information
    [Arguments]      ${information_data}
    [Documentation]  กรอกข้อมูลส่วน 'ข้อมูลผู้ติดต่อ'
    FOR  ${index}  IN  @{information_data.keys()}
        DobbyWebCommon.Input text to element when ready  ${xpath_information_input.${index}}  ${information_data ['${index}']}
    END