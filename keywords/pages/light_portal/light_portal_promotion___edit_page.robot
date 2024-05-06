*** Variables ***
&{light_portal_promotion_edit___text}                 focus_con_edit_pro=//h1[contains(normalize-space(.),'แก้ไขโปรโมชั่นของแถม')]/ancestor::div[@class='content']//button[text()='บันทึก']
&{light_portal_promotion_edit___button}               confirm_edit_pro=//h1[contains(normalize-space(.),'แก้ไขโปรโมชั่นของแถม')]/ancestor::div[@class='content']//button[text()='บันทึก']

&{light_portal_promotion_edit___information__text}    focus_topic_product=
&{light_portal_promotion_edit___information__input}   name=
...                                                   minimum=
...                                                   start_order=
...                                                   end_order=
&{light_portal_promotion_edit___information__button}  check_box_date=
...                                                   check_box_order=
...                                                   check_box_period=

&{light_portal_promotion_edit___gift__input}          search_gift=//h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']//div[@id='productdialog']//input
&{light_portal_promotion_edit___gift__button}         edit_gift=//h2[text()='แถมสินค้า']/following-sibling::div//span[text()='เพิ่มสินค้า']
...                                                   select_gift=//div[@class='table-view']//tbody//td/div/div[contains(normalize-space(.),'**gift**')]/ancestor::tr/td/a[text()='เลือก']

&{light_portal_promotion_edit___product__input}       search_product=//h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']//div[@id='productdialog']//input
&{light_portal_promotion_edit___product__button}      edit_product=//h2[text()='เมื่อขายสินค้า']/following-sibling::div//span[text()='เพิ่มสินค้า']
...                                                   select_product=//div[@class='table-view']//tbody//td/div/div[contains(normalize-space(.),'**product**')]/ancestor::tr/td/a[text()='เลือก']
...                                                   delete_promotion=//table[@id='pb-table']/tbody//td[@class='productname']/p[text()='**product**']/ancestor::tr//td[@class='action']//i


*** Keywords ***
Click confirm update promotion
    [Documentation]  กดปุ่ม 'บันทีก'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_promotion_edit___button.confirm_edit_pro}
        light_portal_common_keywords.Wait for jquery loading completed

Click delete product
    [Arguments]      ${name_product}
    [Documentation]  กดปุ่ม 'ลบสินค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_edit___product__button.delete_promotion}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Click edit gift
    [Documentation]  กดปุ่ม 'เพิ่มของแถม'
        SeleniumLibrary.Click element  ${light_portal_promotion_edit___gift__button.edit_gift}
        light_portal_common_keywords.Wait for jquery loading completed

Click edit product
    [Documentation]  กดปุ่ม 'เพิ่มสินค้า'
        SeleniumLibrary.Click element  ${light_portal_promotion_edit___product__button.edit_product}
        light_portal_common_keywords.Wait for jquery loading completed

Click topic product
    [Documentation]  คลิกตำแหน่ง 'เมื่อซื้อสินค้า'
        SeleniumLibrary.Click element  ${light_portal_promotion_edit___information__text.focus_topic_product}

Focus confirm update promotion
    [Documentation]  เลื่อนไปยัง 'บันทีก'
        SeleniumLibrary.Scroll Element Into View   ${light_portal_promotion_edit___text.focus_con_edit_pro}

Search gift
    [Arguments]      ${name_gift}
    [Documentation]  ค้นหา 'ของแถม'
        SeleniumLibrary.Input text  ${light_portal_promotion_edit___gift__input.search_gift}  ${name_gift}
        SeleniumLibrary.Press keys  None  RETURN
        light_portal_common_keywords.Wait for jquery loading completed

Search product
    [Arguments]      ${name_product}
    [Documentation]  ค้นหา 'สินค้า'
        SeleniumLibrary.Input text  ${light_portal_promotion_edit___product__input.search_product}  ${name_product}
        SeleniumLibrary.Press keys  None  RETURN
        light_portal_common_keywords.Wait for jquery loading completed

Select gift
    [Arguments]      ${name_gift}
    [Documentation]  เลือก 'ของแถม'
        &{str_replace}=  BuiltIn.Create dictionary  **gift**=${name_gift}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_edit___gift__button.select_gift}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Select product
    [Arguments]      ${name_product}
    [Documentation]  เลือก 'สินค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_promotion_edit___product__button.select_product}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Input information
    [Arguments]      ${information}
    [Documentation]  กรอกข้อมูล 'รายละเอียด'
        FOR  ${index}  IN  @{information.keys()}
            IF       '${index}' == 'name'
                        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_promotion_edit___information__input.${index}}
                        SeleniumLibrary.Input text  ${light_portal_promotion_edit___information__input.${index}}  ${information ['${index}']}
            ELSE IF  '${index}' == 'date'
                        SeleniumLibrary.Click element  ${light_portal_promotion_edit___information__button.check_box_date}
            ELSE IF  '${index}' == 'period'
                        SeleniumLibrary.Click element  ${light_portal_promotion_edit___information__button.check_box_period}
            ELSE IF  '${index}' == 'order'
                        SeleniumLibrary.Click element  ${light_portal_promotion_edit___information__button.check_box_order}
                        SeleniumLibrary.Input text     ${light_portal_promotion_edit___information__input.start_order}  ${information ['${index}'] ['start']}
                        SeleniumLibrary.Input text     ${light_portal_promotion_edit___information__input.end_order}    ${information ['${index}'] ['end']}
            ELSE IF  '${index}' == 'minimum'
                        SeleniumLibrary.Input text  ${light_portal_promotion_edit___information__input.${index}}  clear
                        light_portal_promotion___edit_page.Click topic product
                        SeleniumLibrary.Input text  ${light_portal_promotion_edit___information__input.${index}}  ${information ['${index}']}
            END
        END

Input product
    [Arguments]      ${product}
    [Documentation]  กรอกข้อมูล 'สินค้า'
        FOR  ${index}  IN  @{product}
            light_portal_promotion___edit_page.Focus confirm update promotion
            light_portal_promotion___edit_page.Click edit product
            light_portal_promotion___edit_page.Search product  ${index}
            light_portal_promotion___edit_page.Select product  ${index}
        END

Input gift
    [Arguments]      ${gift}
    [Documentation]  กรอกข้อมูล 'ของแถม'
        FOR  ${index}  IN  @{gift}
            light_portal_promotion___edit_page.Focus confirm update promotion
            light_portal_promotion___edit_page.Click edit gift
            light_portal_promotion___edit_page.Search gift  ${index}
            light_portal_promotion___edit_page.Select gift  ${index}
        END