*** Keywords ***
Function serial for buy list
    [Arguments]      ${serial_buy}
    [Documentation]  ฟังก์ชัน serial on ของรายการซื้อ
    light_portal_buy___list_page.Click list by name  ${serial_buy ['name']}
    light_portal_buy___detail_page.Focus note product
    light_portal_buy___detail_page.Click serial product
    light_portal_buy___detail_page.Select warehouse of serial number  ${serial_buy ['store']}
    light_portal_buy___detail_page.Input serial of serial number  ${serial_buy ['serial']}
    light_portal_buy___detail_page.Click confirm of serial number

Create buy
    [Arguments]      ${loop_data_buy}  ${information}  ${product}
    [Documentation]  สร้างรายการซื้อ
        light_portal_buy___list_page.Click create buy
        ${name_buy}=  light_portal_buy___feature.Input data for create buy  ${loop_data_buy}  ${information}  ${product}
        light_portal_buy___add_page.Click confirm buy
    [Return]  ${name_buy}

Input data for create buy
    [Arguments]      ${loop_data_buy}  ${information}  ${product}
    [Documentation]  กรอกข้อมูล สร้างรายการซื้อ
        light_portal_common_keywords.Scroll to header of page
        FOR  ${keys}  IN  @{loop_data_buy.keys()}
            IF       '${keys}' == 'information'
                        FOR  ${keys_information}  IN  @{loop_data_buy ['${keys}'].keys()}
                            IF       '${keys_information}' == 'name'
                                        ${name_buy}=  light_portal_buy___add_page.Input name buy  ${information ['${keys_information}']}
                            ELSE IF  '${keys_information}' == 'date'
                                        light_portal_buy___add_page.Input date buy   ${information ['${keys_information}']}
                            ELSE IF  '${keys_information}' == 'refer'
                                        light_portal_buy___add_page.Input refer buy  ${information ['${keys_information}']}
                            ELSE IF  '${keys_information}' == 'tax'
                                        light_portal_buy___add_page.Input tax buy    ${information ['${keys_information}']}
                            END
                            Sleep  1s
                        END
            ELSE IF  '${keys}' == 'product'
                        FOR  ${keys_product_no}  IN  @{loop_data_buy ['${keys}'].keys()}
                            FOR  ${keys_product_data}  IN  @{loop_data_buy ['${keys}'][${keys_product_no}].keys()}
                                    light_portal_buy___add_page.Input product buy  ${keys_product_no}  ${keys_product_data}  ${product [${keys_product_no}] ['${keys_product_data}']}
                            END
                        END
            END
        END
    [Return]  ${name_buy}

Create buy list
    [Arguments]      ${add_buy}
    [Documentation]  สร้าง 'รายการซื้อ'
        light_portal_buy___list_page.Click create buy
        ${name_sell}=  light_portal_sell___feature.Input data for create sell  ${add_buy}
        light_portal_buy___list_page.Click confirm buy
    [Return]  ${name_sell}