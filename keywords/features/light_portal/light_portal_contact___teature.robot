*** Keywords ***
Input data of create contact
    [Arguments]      ${add_contact}
    [Documentation]  กรอกข้อมูล 'สร้างรายการผู้ติดต่อ'
    FOR  ${index}  IN  @{add_contact.keys()}
        IF  '${index}' == 'basic_data'
            ${code_contact}=  light_portal_contact___add_page.Input data section basic  ${add_contact ['basic_data']}
        ELSE IF  '${index}' == 'information_data'
            light_portal_contact___add_page.Input data section information  ${add_contact ['information_data']}
        ELSE IF  '${index}' == 'socialmedia_data'
            light_portal_contact___add_page.Input data section socialmedia  ${add_contact ['socialmedia_data']}
        END
    END
    [Return]  ${code_contact}

Input data of update contact
    [Arguments]      ${edit_contact}
    [Documentation]  กรอกข้อมูล 'แก้ไขรายการผู้ติดต่อ'
    FOR  ${index}  IN  @{edit_contact.keys()}
        IF  '${index}' == 'information_data'
            light_portal_contact___edit_page.Input data section information  ${edit_contact ['information_data']}
        END
    END

Verify contact list
    [Arguments]      ${type_list}  ${indexNo}  ${code}  ${contact_data}
    [Documentation]  ตรวจสอบ 'รายการผู้ติดต่อ'
    FOR  ${index_1}  IN  @{contact_data.keys()}
        FOR  ${index_2}  IN  @{contact_data ['${index_1}'].keys()}
            IF  '${index_2}' == 'code'
                light_portal_contact___list_page.Check code contact       ${type_list}  ${indexNo}  ${code}
            ELSE IF  '${index_2}' == 'name'
                light_portal_contact___list_page.Check name contact       ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'branch_name'
                light_portal_contact___list_page.Check branch contact     ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'facebook' or '${index_2}' == 'line' or '${index_2}' == 'instagram'
                light_portal_contact___list_page.Check social contact     ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'tag'
                light_portal_contact___list_page.Check tag contact        ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'taxpayer'
                light_portal_contact___list_page.Check taxpayer contact   ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'telephone_number'
                light_portal_contact___list_page.Check telephone contact  ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            ELSE IF  '${index_2}' == 'email'
                light_portal_contact___list_page.Check email contact      ${type_list}  ${indexNo}  ${contact_data ['${index_1}'] ['${index_2}']}
            END
        END
    END

Verify data contact detail
    [Arguments]      ${code}  ${contact_data}
    [Documentation]  ตรวจสอบ 'รายละเอียดข้อมูลผู้ติดต่อ'
    FOR  ${index_1}  IN  @{contact_data.keys()}
        FOR  ${index_2}  IN  @{contact_data ['${index_1}'].keys()}
            IF  '${index_2}' == 'code'
                light_portal_contact___detail_page.Check data contact  ${index_2}  ${code}
            ELSE IF  '${index_2}' != 'group' and '${index_2}' != 'tag' and '${index_2}' != 'contact' and '${index_2}' != 'code'
                light_portal_contact___detail_page.Check data contact  ${index_2}  ${contact_data ['${index_1}'] ['${index_2}']}
            END
        END
    END

Verify graph contact detail
    [Arguments]      ${data}
    [Documentation]  ตรวจสอบ 'รายละเอียดข้อมูลกราฟ'
    FOR  ${index}  IN  @{data}
        light_portal_contact___detail_page.Check graph contact  ${index}
    END

Verify table contact detail
    [Arguments]      ${code}  ${type}  ${amount}
    [Documentation]  ตรวจสอบ 'รายละเอียดข้อมูลตาราง'
    light_portal_contact___detail_page.Check table contact of type column  ${code}  ${type}
    light_portal_contact___detail_page.Check table contact of date column  ${code}
    light_portal_contact___detail_page.Check table contact of amount column  ${code}  ${amount}
    light_portal_contact___detail_page.Check table contact of payment column  ${code}
    light_portal_contact___detail_page.Check table contact of transfer column  ${code}


Create contact list
    [Arguments]      ${add_contact_data}
    [Documentation]  สร้างรายการ 'ผู้ติดต่อ'
    Sleep  2s
    # light_portal_common_keywords.Wait for jquery loading completed
    ${code_contact}=  light_portal_contact___teature.Input data of create contact  ${add_contact_data}
    light_portal_contact___add_page.Click confirm add contact
    light_portal_common_keywords.Wait for jquery loading completed
    [Return]  ${code_contact}

Update contact list
    [Arguments]      ${edit_contact_data}
    [Documentation]  แก้ไขรายการ 'ผู้ติดต่อ'
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_contact___teature.Input data of update contact  ${edit_contact_data}
    light_portal_contact___edit_page.Click confirm edit contact
    light_portal_common_keywords.Close toast success

Create buy list
    [Arguments]      ${add_buy_data}
    [Documentation]  สร้างรายการ 'ซื้อ'
    ${name_buy}=  light_portal_buy_list_features.Input data of create buy  ${add_buy_data}
    light_portal_buy___add_page.Click confirm buy
    light_portal_buy___add_page.Click confirm popUp add buy
    light_portal_buy___add_page.Click confirm popUp no change contact
    light_portal_buy___detail_page.Focus branch name contact
    light_portal_buy___detail_page.Click name contact of buy detail
    [Return]  ${name_buy}

Create sell list
    [Arguments]      ${add_sell_data}
    [Documentation]  สร้างรายการ 'ขาย'
    ${name_sell}=  light_portal_sell___feature.Input data for sell add  ${add_sell_data} 
    light_portal_sell___add_page.Click confirm sell
    light_portal_sell___add_page.Click confirm popUp add sell
    light_portal_sell___add_page.Click confirm popUp no change contact
    light_portal_sell___detail_page.Click name contact of sell detail
    [Return]  ${name_sell}