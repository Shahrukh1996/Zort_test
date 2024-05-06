*** Keywords ***
Quick search
    [Arguments]      ${sell_name}
    [Documentation]  ค้นหารวดเร็ว 'รายการขาย'
        light_portal_common_keywords.Scroll to header of page
        light_portal_sell___list_page.Input data for quick search by sell name  ${sell_name}
        Sleep  2s
        SeleniumLibrary.Press keys  None  ENTER
        light_portal_common_keywords.Wait for jquery loading completed

Print document list
    [Arguments]      ${name_sell}  ${size_doc}  ${form_doc}  ${toppic_doc}
    [Documentation]  พิมพ์เอกสาร 'รายการขาย' จากหน้า list
        light_portal_sell___list_page.Click check box by name  ${name_sell}
        light_portal_sell___list_page.Click print document all
        light_portal_sell___list_page.Click print document choice print doc
        light_portal_sell___list_page.Select print doc size    ${size_doc}
        light_portal_sell___list_page.Select print doc form    ${form_doc}
        light_portal_sell___list_page.Select print doc toppic  ${toppic_doc}
        light_portal_sell___list_page.Click confirm print doc

Print document detail
    [Arguments]      ${name_sell}  ${size_doc}  ${form_doc}  ${toppic_doc}
    [Documentation]  พิมพ์เอกสาร 'รายการขาย' จากหน้า detail
        light_portal_sell___list_page.Click sell list by name  ${name_sell}
        light_portal_sell___detail_page.Click print document all
        light_portal_sell___detail_page.Click print document choice print doc
        light_portal_sell___detail_page.Select print doc size    ${size_doc}
        light_portal_sell___detail_page.Select print doc form    ${form_doc}
        light_portal_sell___detail_page.Select print doc toppic  ${toppic_doc}
        light_portal_sell___detail_page.Click confirm print doc

Create sell for sell list
    [Arguments]      ${add_sell}
    [Documentation]  สร้างรายการขาย
        ${name_sell}=  light_portal_sell___feature.Input data for sell add  ${add_sell}
        light_portal_sell___add_page.Click confirm sell
    [Return]  ${name_sell}

Update sell for sell detail
    [Arguments]      ${edit_sell}
    [Documentation]  แก้ไขรายการขาย หน้า (หน้ารายละเอียดการขาย)
        light_portal_sell___detail_page.Click order of sell detail
        light_portal_sell___detail_page.Click edit of sell detail
        light_portal_sell___feature.Input data for sell edit  ${edit_sell}
        light_portal_sell___edit_page.Click confirm update of sell edit

Cancel sell for sell detail
    [Documentation]  ยกเลิกรายการขาย หน้า (หน้ารายละเอียดการขาย)
        light_portal_sell___detail_page.Click order of sell detail
        light_portal_sell___detail_page.Click cancel of sell detail
        Sleep  2s
        light_portal_sell___detail_page.Click confirm cancel of sell detail

Input data for sell add
    [Arguments]      ${add_sell}
    [Documentation]  กรอกข้อมูล 'สร้างรายการขาย'
        light_portal_common_keywords.Scroll to header of page
        FOR  ${index}  IN  @{add_sell.keys()}
            IF       '${index}' == 'information_data'
                        ${name_sell}=  light_portal_sell___add_page.Input data information of sell add  ${add_sell ['${index}']}
            ELSE IF  '${index}' == 'contact_data'
                        light_portal_sell___add_page.Input data contact of sell add    ${add_sell ['${index}']}    
            ELSE IF  '${index}' == 'product_data'
                        light_portal_sell___add_page.Input data product of sell add    ${add_sell ['${index}']}
            ELSE IF  '${index}' == 'recipient_data'
                        light_portal_sell___add_page.Input data recipient of sell add  ${add_sell ['${index}']}
            ELSE IF  '${index}' == 'shipping_data'
                        light_portal_sell___add_page.Input data shipping of sell add   ${add_sell ['${index}']}
            ELSE IF  '${index}' == 'transfer_data'
                        light_portal_sell___add_page.Input data transfer of sell add   ${add_sell ['${index}']}
            ELSE IF  '${index}' == 'payment_data'
                        light_portal_sell___add_page.Input data payment of sell add
            END
        END
    [Return]  ${name_sell}

Input data for sell edit
    [Arguments]      ${edit_sell}
    [Documentation]  กรอกข้อมูล 'แก้ไขรายการขาย'
        light_portal_common_keywords.Scroll to header of page
        Sleep  2s
        FOR  ${index}  IN  @{edit_sell.keys()}
            IF  '${index}' == 'information_data'
                    light_portal_sell___edit_page.Input data information of sell edit  ${edit_sell ['${index}']}   
            END
        END

Input data of delivery service
    [Arguments]      ${delivery_service}
    [Documentation]  กรอกข้อมูล 'บริการขนส่ง'
        light_portal_sell___list_page.Input data section transport channel  ${delivery_service ['transport_data']}
        FOR  ${index}  IN  @{delivery_service.keys()}
            IF       '${index}' == 'sender_data'
                        light_portal_sell___list_page.Input data section sender information  ${delivery_service ['${index}']}
            ELSE IF  '${index}' == 'recipient_data'
                        light_portal_sell___list_page.Input data section recipient information  ${delivery_service ['${index}']}
            END
        END

Create sell list
    [Arguments]      ${add_sell}
    [Documentation]  สร้าง 'รายการขาย'
        light_portal_sell___list_page.Click create sell
        ${name_sell}=  light_portal_sell___feature.Input data for create sell  ${add_sell}
        light_portal_sell___add_page.Click confirm sell
    [Return]  ${name_sell}

Delete sell list
    [Arguments]      ${name_sell}
    [Documentation]  ลบ 'รายการขาย'
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_sell___list_page.Click kbub list  ${name_sell}
    light_portal_sell___list_page.Click kbub delete  ${name_sell}
    light_portal_sell___list_page.Click confirm delete

Input data for create sell
    [Arguments]      ${add_sell}
    [Documentation]  กรอกข้อมูล 'สร้างรายการขาย'
        light_portal_common_keywords.Auto keyword remove dom chat support
        light_portal_common_keywords.Scroll to header of page
        FOR  ${keys}  IN  @{add_sell.keys()}
            IF       '${keys}' == 'information'
                        FOR  ${index_information}  IN  @{add_sell ['${keys}'].keys()}
                            IF       '${index_information}' == 'name'
                                        ${name_sell}=  light_portal_common_keywords.Auto keyword input name information  ${add_sell ['${keys}'] ['${index_information}']}
                            ELSE IF  '${index_information}' == 'create_date'
                                        light_portal_common_keywords.Auto keyword select create date information  ${add_sell ['${keys}'] ['${index_information}']}
                            ELSE IF  '${index_information}' == 'expire_date'
                                        light_portal_common_keywords.Auto keyword select expire date information  ${add_sell ['${keys}'] ['${index_information}']}
                            ELSE IF  '${index_information}' == 'refer'
                                        Log  ยังไม่ได้เพิ่มฟังก์ชัน
                            ELSE IF  '${index_information}' == 'funnel'
                                        light_portal_sell___add_page.Input funnel information  ${add_sell ['${keys}'] ['${index_information}']}
                            ELSE IF  '${index_information}' == 'tax'
                                        Log  ยังไม่ได้เพิ่มฟังก์ชัน
                            ELSE IF  '${index_information}' == 'dealer'
                                        Log  ยังไม่ได้เพิ่มฟังก์ชัน
                            END
                            Sleep  1s
                            light_portal_sell___add_page.Click element dealer
                        END
            ELSE IF  '${keys}' == 'contact'
                        Log  [เพิ่มข้อมูล : ผู้ติดต่อ]
                        IF       '${add_sell ['${keys}'] ['choice']}' == 'custom'
                                    light_portal_common_keywords.Auto keyword input contact by custom  ${add_sell ['${keys}'] ['detail']}
                        ELSE IF  '${add_sell ['${keys}'] ['choice']}' == 'system'
                                    light_portal_common_keywords.Auto keyword select contact from system  ${add_sell ['${keys}'] ['detail'] ['code']}
                        END
            ELSE IF  '${keys}' == 'product'
                        IF       '${add_sell ['${keys}'] ['choice']}' == 'custom'
                                    FOR  ${list}  IN  @{add_sell ['${keys}'] ['detail'].keys()}
                                            light_portal_common_keywords.Auto keyword input product by custom  ${list}  ${add_sell ['${keys}'] ['detail'][${list}]}
                                    END
                        ELSE IF  '${add_sell ['${keys}'] ['choice']}' == 'single'
                                    FOR  ${list}  IN  @{add_sell ['${keys}'] ['detail'].keys()}
                                            light_portal_common_keywords.Auto keyword select product from single list  ${list}  ${add_sell ['${keys}'] ['detail'][${list}] ['name']}
                                    END
                        ELSE IF  '${add_sell ['${keys}'] ['choice']}' == 'multi'
                                    FOR  ${list}  IN  @{add_sell ['${keys}'] ['detail'].keys()}
                                        light_portal_common_keywords.Auto keyword select product from multi list  ${add_sell ['${keys}'] ['detail'][${list}] ['name']}
                                    END
                        ELSE IF  '${add_sell ['${keys}'] ['choice']}' == 'test'
                                    FOR  ${list}  IN  @{add_sell ['${keys}'] ['detail'].keys()}
                                        light_portal_common_keywords.Auto keyword select product from single list  ${list}  ${add_sell ['${keys}'] ['detail'][${list}] ['name']}
                                        light_portal_common_keywords.Auto keyword select product from multi list  ${add_sell ['${keys}'] ['detail'][${list}] ['name']}
                                    END
                        END
            ELSE IF  '${keys}' == 'delivery'
                        light_portal_common_keywords.Auto keyword input channel delivery  ${add_sell ['${keys}'] ['channel']}
                        light_portal_common_keywords.Auto keyword click pay on destination
                        light_portal_common_keywords.Auto keyword input description delivery  ${add_sell ['${keys}'] ['description']}
            ELSE IF  '${keys}' == 'payment'
                        Log  ยังไม่ได้เพิ่มฟังก์ชัน
            ELSE IF  '${keys}' == 'transfer'
                        IF       '${add_sell ['${keys}'] ['choice']}' == 'now'
                                    light_portal_common_keywords.Auto keyword select transfer from now  ${add_sell ['${keys}'] ['detail'] ['store']}
                        ELSE IF  '${add_sell ['${keys}'] ['choice']}' == 'wait'
                                    light_portal_common_keywords.Auto keyword select transfer from wait  ${add_sell ['${keys}'] ['detail'] ['store']}
                        END
            END
            Sleep  2s
        END
    [Return]  ${name_sell}

Verify sell list
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบ 'รายการขาย'
    light_portal_sell___list_page.Check column cre date         ${expect ['date']}
    light_portal_sell___list_page.Check column name             ${expect ['name']}
    light_portal_sell___list_page.Check column contact          ${expect ['contact']}
    light_portal_sell___list_page.Check column funnel           ${expect ['funnel']}
    light_portal_sell___list_page.Check column deli date        
    light_portal_sell___list_page.Check column price            ${expect ['total_price']}
    light_portal_sell___list_page.Check column status payment   ${expect ['status_payment']}
    light_portal_sell___list_page.Check column status transfer  ${expect ['status_transfer']}

Verify sell detail
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบ 'รายละเอียดการขาย'
        light_portal_sell___detail_page.Check main status payment   ${expect ['main_status_payment']}
        light_portal_sell___detail_page.Check main status transfer  ${expect ['main_status_transfer']}
        light_portal_sell___detail_page.Check main status delivery  ${expect ['main_status_delivery']}
        light_portal_sell___detail_page.Check sub status payment    ${expect ['sub_status_payment']}
        light_portal_sell___detail_page.Check sub status transfer   ${expect ['sub_status_transfer']}
        light_portal_sell___detail_page.Check data information      ${expect ['information']}
        light_portal_sell___detail_page.Check data contact          ${expect ['contact']}
        light_portal_sell___detail_page.Check data product          ${expect ['product']}
        light_portal_sell___detail_page.Check data delivery         ${expect ['delivery']}
        light_portal_sell___detail_page.Check data recipient        ${expect ['recipient']}

Verify log sell list
    [Arguments]      ${name_sell}  ${log_sell}
    [Documentation]  ตรวจสอบ 'log' ของรายการขาย
        light_portal_sell___detail_page.Check data of log sell list  ${name_sell}  ${log_sell ['user']}  ${log_sell ['detail'] ['add']}
        light_portal_sell___detail_page.Check data of log sell list  ${name_sell}  ${log_sell ['user']}  ${log_sell ['detail'] ['edit']}
        light_portal_sell___detail_page.Check data of log sell list  ${name_sell}  ${log_sell ['user']}  ${log_sell ['detail'] ['payment']}
        light_portal_sell___detail_page.Check data of log sell list  ${name_sell}  ${log_sell ['user']}  ${log_sell ['detail'] ['Transfer']}
        light_portal_sell___detail_page.Check data of log sell list  ${name_sell}  ${log_sell ['user']}  ${log_sell ['detail'] ['cancel']}

Verify status expire date
    [Arguments]      ${sell_name}
    [Documentation]  ตรวจสอบ 'วันหมดอายุ' ของรายการขาย
        light_portal_sell___list_page.Check expire date column payment   ${sell_name}
        light_portal_sell___list_page.Check expire date column transfer  ${sell_name}

Verify print document for all list
    [Arguments]      ${choice_print}  ${test_data}  ${name_sell_1}
    [Documentation]  ตรวจสอบ 'พิมพ์เอกสาร' แบบ 'รวมรายการ'
        light_portal_sell___list_page.Check overall paper
        light_portal_sell___list_page.Check outer paper      ${choice_print}
        light_portal_sell___list_page.Check inner paper
        light_portal_sell___list_page.Check header paper     ${choice_print}  ${test_data}  ${name_sell_1}
        light_portal_sell___list_page.Check sender paper     ${choice_print}  ${test_data}
        light_portal_sell___list_page.Check recipient paper  ${choice_print}  ${test_data}
        light_portal_sell___list_page.Check sortation paper  ${choice_print}  ${test_data}
        light_portal_sell___list_page.Check order paper

Verify share link
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบความถูกต้อง 'แชร์ลิงค์'
    light_portal_sell___detail_page.Check share link for toppic  ${expect}

Verify print doc a4 nomall in list
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบความถูกต้อง 'พิมพ์เอกสาร A4 แบบทั่วไป' จากหน้า list
    light_portal_sell___list_page.Check nomall toppic  ${expect}

Verify print doc a4 nomall in detail
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบความถูกต้อง 'พิมพ์เอกสาร A4 แบบทั่วไป' จากหน้า detail
    light_portal_sell___detail_page.Check nomall toppic  ${expect}

Verify print doc a4 invoice in list
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบความถูกต้อง 'พิมพ์เอกสาร A4 แบบใบกำกับ' จากหน้า list
    light_portal_sell___list_page.Check invoice toppic  ${expect}

Verify print doc a4 invoice in detail
    [Arguments]      ${expect}
    [Documentation]  ตรวจสอบความถูกต้อง 'พิมพ์เอกสาร A4 แบบใบกำกับ' จากหน้า detail
    light_portal_sell___detail_page.Check invoice toppic  ${expect}

Function serial for sell list
    [Arguments]      ${serial_sell}
    [Documentation]  ฟังก์ชัน serial on ของรายการขาย
    light_portal_sell___list_page.Click list by name  ${serial_sell ['name_sell']}
    light_portal_sell___detail_page.Focus note product
    FOR  ${index}  IN  @{serial_sell ['serial']}  
        light_portal_sell___detail_page.Click serial product  ${serial_sell ['name_product']}
        light_portal_sell___detail_page.Select serial of serial number  ${serial_sell ['serial'][${index}] ['serial_on']}
    END