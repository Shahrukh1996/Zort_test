*** Variables ***

# --- text --------->
&{light_portal_product_set_edit___text}  header_page=//div[@class='content']//h1[contains(normalize-space(.),'แก้ไข')]
# --- input --------->
&{light_portal_product_set_edit___input}  code=//label[text()='รหัสสินค้า']/ancestor::div[@class='form-group']//input[@id='editbundlecode']
...                                       name=//label[text()='ชื่อสินค้า']/ancestor::div[@class='form-group']//input[@id='editbundlename']
...                                       price=//label[text()='ราคาขาย']/ancestor::div[@class='form-group']//input[@id='sellprice']
...                                       exp_date=//label[text()='กำหนดวันหมดอายุ']/ancestor::div[@class='form-group']//input[@id='editexpriredate']
# --- button --------->
&{light_portal_product_set_edit___button}  confirm_edit=//div[text()='เปิดการใช้งาน']/ancestor::div[@class='form-group']//button[text()='บันทึก']


*** Keywords ***

Check header page
    [Documentation]  เช็คความพร้อม 'หน้าแก้ไขสินค้าชุด'
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_edit___text.header_page}

Click confirm edit
    [Documentation]  กดปุ่ม 'ยืนยันแก้ไขสินค้าชุด'
        SeleniumLibrary.Click element  ${light_portal_product_set_edit___button.confirm_edit}
        light_portal_common_keywords.Wait for jquery loading completed

Input data for edit product set
    [Arguments]      ${edit_product_set}
    [Documentation]  กรอกข้อมูล 'แก้ไขสินค้าชุด'
        FOR  ${keys}  IN  @{edit_product_set.keys()}
            IF       '${keys}' == 'code'
                        Log  [กรอก 'รหัส' สินค้าชุด]
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_product_set_edit___input.${keys}}
                        ${code_product_set_ups}=  light_portal_common_keywords.Auto keyword random string  ${edit_product_set.${keys}}
                        SeleniumLibrary.Input text  ${light_portal_product_set_edit___input.${keys}}  ${code_product_set_ups}
            ELSE IF  '${keys}' == 'name'
                        Log  [กรอก 'ชื่อ' สินค้าชุด]
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_product_set_edit___input.${keys}}
                        SeleniumLibrary.Input text  ${light_portal_product_set_edit___input.${keys}}  ${edit_product_set.${keys}}
            ELSE IF  '${keys}' == 'price'
                        Log  [กรอก 'ราคาขาย' สินค้าชุด]
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_product_set_edit___input.${keys}}
                        SeleniumLibrary.Input text  ${light_portal_product_set_edit___input.${keys}}  ${edit_product_set.${keys}}
            ELSE IF  '${keys}' == 'exp_date'
                        Log  [กรอก 'วันหมดอายุ' สินค้าชุด]
                        SeleniumLibrary.Click element  ${light_portal_product_set_edit___input.${keys}}
                        light_portal_common_keywords.Auto keyword datepicker  ${edit_product_set.${keys}}
            END
        END
    [Return]  ${code_product_set_ups}