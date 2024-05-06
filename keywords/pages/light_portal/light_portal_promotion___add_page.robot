*** Variables ***
&{light_portal_promotion_add___text}             focus_topic_product=//h2[text()='เมื่อขายสินค้า']
...                                              focus_con_cre_pro=//h1[contains(normalize-space(.),'เพิ่มโปรโมชั่นของแถม')]/ancestor::div[@class='content']//button[text()='บันทึก']
&{light_portal_promotion_add___input}            name=//label[text()='ชื่อโปรโมชั่น']/following-sibling::div/input[@id='name']
...                                              minimum=//label[text()='ยอดบิลขั้นต่ำ']/following-sibling::div/input[@id='mintotalprice']
...                                              start_order=//label[text()='ลำดับออเดอร์']/following-sibling::div/div/input[@id='orderstart']
...                                              end_order=//label[text()='ลำดับออเดอร์']/following-sibling::div/div/input[@id='orderend']
&{light_portal_promotion_add___button}           check_box_date=//label[text()='วันสิ้นสุด']/following-sibling::div/div/label[text()='ไม่มีที่สิ้นสุด']
...                                              check_box_order=//label[text()='ลำดับออเดอร์']/following-sibling::div/div/label[text()='ไม่กำหนด']
...                                              check_box_period=//label[text()='ช่วงเวลา']/following-sibling::div/div/label[text()='ไม่กำหนด']
...                                              add_product=//h2[text()='เมื่อขายสินค้า']/following-sibling::div//span[text()='เพิ่มสินค้า']
...                                              add_gift=//h2[text()='แถมสินค้า']/following-sibling::div//span[text()='เพิ่มสินค้า']
...                                              confirm_cre_pro=//h1[contains(normalize-space(.),'เพิ่มโปรโมชั่นของแถม')]/ancestor::div[@class='content']//button[text()='บันทึก']

&{light_portal_promotion_add___gift__input}      search_gift=//h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']//div[@id='productdialog']//input
&{light_portal_promotion_add___gift__button}     select_gift=//div[@class='table-view']//tbody//td/div/div[contains(normalize-space(.),'**gift**')]/ancestor::tr/td/a[text()='เลือก']

&{light_portal_promotion_add___product__input}   search_product=//h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']//div[@id='productdialog']//input
&{light_portal_promotion_add___product__button}  select_product=//div[@class='table-view']//tbody//td/div/div[contains(normalize-space(.),'**product**')]/ancestor::tr/td/a[text()='เลือก']


*** Keywords ***
Click add gift
    [Documentation]  กดปุ่ม 'เพิ่มของแถม'
        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.add_gift}
        light_portal_common_keywords.Wait for jquery loading completed

Click add product
    [Documentation]  กดปุ่ม 'เพิ่มสินค้า'
        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.add_product}
        light_portal_common_keywords.Wait for jquery loading completed

Click confirm create promotion
    [Documentation]  กดปุ่ม 'บันทีก'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.confirm_cre_pro}
        light_portal_promotion___detail_page.Check toppic promotion detail page

Click topic product
    [Documentation]  คลิกตำแหน่ง 'เมื่อซื้อสินค้า'
        SeleniumLibrary.Click element  ${light_portal_promotion_add___text.focus_topic_product}

Focus confirm create promotion
    [Documentation]  เลื่อนไปยัง 'บันทีก'
        SeleniumLibrary.Scroll Element Into View   ${light_portal_promotion_add___text.focus_con_cre_pro}

Search gift
    [Arguments]      ${name_gift}
    [Documentation]  ค้นหา 'ของแถม'
        SeleniumLibrary.Input text  ${light_portal_promotion_add___gift__input.search_gift}  ${name_gift}
        SeleniumLibrary.Press keys  None  RETURN

        &{str_replace}=  BuiltIn.Create dictionary  **gift**=${name_gift}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_add___gift__button.select_gift}  ${str_replace}
        light_portal_common_keywords.Auto keyword wait element  ${new_xpath}

Search product
    [Arguments]      ${name_product}
    [Documentation]  ค้นหา 'สินค้า'
        SeleniumLibrary.Input text  ${light_portal_promotion_add___product__input.search_product}  ${name_product}
        SeleniumLibrary.Press keys  None  RETURN

        &{str_replace}=  BuiltIn.Create dictionary  **product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_add___product__button.select_product}  ${str_replace}
        light_portal_common_keywords.Auto keyword wait element  ${new_xpath}

Select gift
    [Arguments]      ${name_gift}
    [Documentation]  เลือก 'ของแถม'
        &{str_replace}=  BuiltIn.Create dictionary  **gift**=${name_gift}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_add___gift__button.select_gift}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Select product
    [Arguments]      ${name_product}
    [Documentation]  เลือก 'สินค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_add___product__button.select_product}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Input information
    [Arguments]      ${information}
    [Documentation]  กรอกข้อมูล 'รายละเอียด'
        FOR  ${index}  IN  @{information.keys()}
            IF       '${index}' == 'name'
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_promotion_add___input.${index}}
                        ${name_promotion}=  light_portal_common_keywords.Auto keyword random string  ${information ['${index}']}
                        SeleniumLibrary.Input text  ${light_portal_promotion_add___input.${index}}  ${name_promotion}
            ELSE IF  '${index}' == 'date'
                        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.check_box_date}
            ELSE IF  '${index}' == 'period'
                        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.check_box_period}
            ELSE IF  '${index}' == 'order'
                        SeleniumLibrary.Click element  ${light_portal_promotion_add___button.check_box_order}
                        SeleniumLibrary.Input text  ${light_portal_promotion_add___input.start_order}  ${information ['${index}'] ['start']}
                        SeleniumLibrary.Input text  ${light_portal_promotion_add___input.end_order}  ${information ['${index}'] ['end']}
            ELSE IF  '${index}' == 'minimum'
                        SeleniumLibrary.Input text  ${light_portal_promotion_add___input.${index}}  clear
                        light_portal_promotion___add_page.Click topic product
                        SeleniumLibrary.Input text  ${light_portal_promotion_add___input.${index}}  ${information ['${index}']}
            END
        END
    [Return]  ${name_promotion}

Input product
    [Arguments]      ${product}
    [Documentation]  กรอกข้อมูล 'สินค้า'
        FOR  ${index}  IN  @{product}
            light_portal_promotion___add_page.Focus confirm create promotion
            light_portal_promotion___add_page.Click add product
            light_portal_promotion___add_page.Search product  ${index}
            light_portal_promotion___add_page.Select product  ${index}
        END

Input gift
    [Arguments]      ${gift}
    [Documentation]  กรอกข้อมูล 'ของแถม'
        FOR  ${index}  IN  @{gift}
            light_portal_promotion___add_page.Focus confirm create promotion
            light_portal_promotion___add_page.Click add gift
            light_portal_promotion___add_page.Search gift  ${index}
            light_portal_promotion___add_page.Select gift  ${index}
        END