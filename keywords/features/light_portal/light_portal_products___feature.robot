*** Keywords ***
Random string for data product
    [Documentation]  สุ่ม str ใช้สำหรับข้อมูลสินค้า
        ${random_str}=  light_portal_common_keywords.Auto keyword random string  -
    [Return]  ${random_str}

Create product
    [Arguments]      ${loop_data_product}  ${information}  ${price}  ${setting}  ${warehouse}
    [Documentation]  สร้างรายการสินค้า
        light_portal_products___list_page.Click create product
        ${name_product}=  light_portal_products___feature.Input data for create product  ${loop_data_product}  ${information}  ${price}  ${setting}  ${warehouse}
        light_portal_products___add_page.Click confirm create product
    [Return]  ${name_product}

Input data for create product
    [Arguments]      ${loop_data_product}  ${information}  ${price}  ${setting}  ${warehouse}
    [Documentation]  กรอกข้อมูล สร้างรายการสินค้า
        FOR  ${keys}  IN  @{loop_data_product.keys()}
            IF       '${keys}' == 'information'
                        ${random_str}=  light_portal_products___feature.Random string for data product
                        FOR  ${keys_information}  IN  @{loop_data_product ['${keys}'].keys()}
                            IF       '${keys_information}' == 'code'
                                        ${code_product}=  light_portal_products___add_page.Input code product  ${information ['${keys_information}']}  ${random_str}
                            ELSE IF  '${keys_information}' == 'name'
                                        ${name_product}=  light_portal_products___add_page.Input name product  ${information ['${keys_information}']}  ${random_str}
                            ELSE IF  '${keys_information}' == 'type'
                                        light_portal_products___add_page.Input type product      ${information ['${keys_information}']}
                            ELSE IF  '${keys_information}' == 'feature'
                                        light_portal_products___add_page.Input feature product   ${information ['${keys_information}']}
                            ELSE IF  '${keys_information}' == 'category'
                                        light_portal_products___add_page.Input category product  ${information ['${keys_information}']}
                            END
                            Sleep  1s
                        END
            ELSE IF  '${keys}' == 'price'
                        FOR  ${keys_price}  IN  @{loop_data_product ['${keys}'].keys()}
                            IF       '${keys_price}' == 'purchase'
                                        light_portal_products___add_page.Input purchase product  ${price ['${keys_price}']}
                            ELSE IF  '${keys_price}' == 'selling'
                                        light_portal_products___add_page.Input selling product   ${price ['${keys_price}']}
                            END
                            Sleep  1s
                        END
            ELSE IF  '${keys}' == 'setting'
                        FOR  ${keys_setting}  IN  @{loop_data_product ['${keys}'].keys()}
                            IF       '${keys_setting}' == 'serial'
                                        light_portal_products___add_page.Input serial product      ${setting ['${keys_setting}']}
                            ELSE IF  '${keys_setting}' == 'expiration'
                                        light_portal_products___add_page.Input expiration product  ${setting ['${keys_setting}']}
                            END
                            Sleep  1s
                        END
            ELSE IF  '${keys}' == 'warehouse'
                        FOR  ${keys_warehouse}  IN  @{loop_data_product ['${keys}'].keys()}
                            IF       '${keys_warehouse}' == 'amount'
                                        light_portal_products___add_page.Input amount product  ${warehouse ['${keys_warehouse}']}
                            ELSE IF  '${keys_warehouse}' == 'store'
                                        light_portal_products___add_page.Input store product   ${warehouse ['${keys_warehouse}']}
                            END
                            Sleep  1s
                        END
            END
        END
    [Return]  ${code_product}  ${name_product}

Verify function serial for product
    [Arguments]      ${expect_serial_product}
    [Documentation]  ตรวจสอบการทำงานฟังก์ชัน 'serial'
        light_portal_products___list_page.Click list by name  ${expect_serial_product ['name_product']}
        light_portal_products___detail_page.Click serial number
        FOR  ${index}  IN  @{expect_serial_product ['serial'].keys()}
                light_portal_products___detail_page.Check serial on  ${expect_serial_product}  ${expect_serial_product ['serial'][${index}] ['serial_on']}
        END