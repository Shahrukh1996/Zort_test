*** Variables ***

# --- text --------->
&{light_portal_product_set_add___text}  popUp_select_product=//div[@id='allproductModal']//div[@class='modal-header']//h3[@id='myModalLabel2' and text()='เลือกสินค้า']
# --- input --------->
&{light_portal_product_set_add___input}  code=//div[@class='modal-dialog']//div[@class='modal-body']/div[@class='form-group']//span[@id='codename' and text()='รหัสสินค้า']/ancestor::div[@class='row']//input[@id='addbundlecode']
...                                      name=//div[@class='modal-dialog']//div[@class='modal-body']/div[@class='form-group']//label[text()='ชื่อสินค้า']/ancestor::div[@class='row']//input[@id='addbundlename']
...                                      price=//div[@class='modal-dialog']//div[@class='modal-body']/div[@class='form-group']//label[text()='ราคาขาย']/ancestor::div[@class='row']//input[@id='addbundlesellprice']
...                                      exp_date=//div[@class='modal-dialog']//div[@class='modal-body']/div[@class='form-group']//label[text()='กำหนดวันหมดอายุ']/ancestor::div[@class='row']//input[@id='addbundleexpiredate']
...                                      search_product=//div[@id='allproductModal']//div[@class='modal-body']//input[@id='quicksearchproducttext']
# --- button --------->
&{light_portal_product_set_add___button}  confirm_create=//div[@class='modal-dialog']//div[@class='modal-footer ']/button[@id='tour_add' and text()='บันทึก']
...                                       add_product=//table[@id='productrow']/tbody/tr[@id='prow**index**']//a[text()='เลือก']
...                                       new_product=//div[@class='table-view']/div[@class='total-summary-section']//span[text()='เพิ่มสินค้า']
...                                       confirm_product=//div[@id='productdialog']//tbody//tr/td[text()='**id**']/ancestor::tr//a[text()='เลือก']
...                                       confirm_add_product=//div[@id='menuProduct']/form/div/input[@value='บันทึก']


*** Keywords ***

Click confirm create
    [Documentation]  กดปุ่ม 'ยืนยันสร้างสินค้าชุด'
        SeleniumLibrary.Click element  ${light_portal_product_set_add___button.confirm_create}
        light_portal_common_keywords.Wait for jquery loading completed

Click confirm product
    [Documentation]  กดปุ่ม 'ยืนยันเลือกสินค้า'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_product_set_add___button.confirm_add_product}
        light_portal_common_keywords.Wait for jquery loading completed

Input data for create product set
    [Arguments]      ${add_product_set}
    [Documentation]  กรอกข้อมูล 'สร้างสินค้าชุด'
        FOR  ${keys}  IN  @{add_product_set.keys()}
            IF       '${keys}' == 'code'
                        Log  [กรอก 'รหัส' สินค้าชุด]
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_product_set_add___input.${keys}}
                        ${code_product_set}=  light_portal_common_keywords.Auto keyword random string  ${add_product_set.${keys}}
                        SeleniumLibrary.Input text  ${light_portal_product_set_add___input.${keys}}  ${code_product_set}

            ELSE IF  '${keys}' == 'name'
                        Log  [กรอก 'ชื่อ' สินค้าชุด]
                        SeleniumLibrary.Input text  ${light_portal_product_set_add___input.${keys}}  ${add_product_set.${keys}}

            ELSE IF  '${keys}' == 'price'
                        Log  [กรอก 'ราคาขาย' สินค้าชุด]
                        SeleniumLibrary.Input text  ${light_portal_product_set_add___input.${keys}}  ${add_product_set.${keys}}

            ELSE IF  '${keys}' == 'exp_date'
                        Log  [กรอก 'วันหมดอายุ' สินค้าชุด]
                        SeleniumLibrary.Click element  ${light_portal_product_set_add___input.${keys}}
                        light_portal_common_keywords.Auto keyword datepicker  ${add_product_set.${keys}}
            END
        END
    [Return]  ${code_product_set}

Select product for create product set
    [Arguments]      ${product}
    [Documentation]  เลือก 'สินค้า' เข้าสินค้าชุด
    ${loop}=  BuiltIn.Set variable
        FOR  ${list}  IN  @{product}
                ${loop}=  BuiltIn.Evaluate  ${loop}+1
                IF  ${loop} != 1
                        Log  [เพิ่มสินค้า]
                        SeleniumLibrary.Click element  ${light_portal_product_set_add___button.new_product}
                END

                Log  [เลือกสินค้า]
                ${index}=  BuiltIn.Convert to string  ${loop}
                &{str_replace}=  BuiltIn.Create dictionary  **index**=${index}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_product_set_add___button.add_product}  ${str_replace}
                SeleniumLibrary.Click element  ${new_xpath}

                Log  [ค้นหาสินค้า]
                light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_add___text.popUp_select_product}
                Sleep  2s
                SeleniumLibrary.Input text  ${light_portal_product_set_add___input.search_product}  ${list}
                SeleniumLibrary.Press keys  None  ENTER

                Log  [ยืนยันสินค้า]
                &{str_replace}=  BuiltIn.Create dictionary  **id**=${list}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_product_set_add___button.confirm_product}  ${str_replace}
                light_portal_common_keywords.Auto keyword wait element  ${new_xpath}
                SeleniumLibrary.Click element  ${new_xpath}
        END