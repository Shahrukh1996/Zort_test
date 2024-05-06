*** Variables ***

# --- text --------->
&{light_portal_product_set_list___text}  pop_up___add_product_set=//div[@class='modal-dialog']//div[@class='modal-header']/h3[@id='myModalLabel' and text()='เพิ่มสินค้าเป็นชุดใหม่']
...                                      product_set_not_found=//div[@id='normaltable']/div[contains(normalize-space(.),'ไม่มีข้อมูล')]
# --- input --------->
&{light_portal_product_set_list___input}  quick_search=//input[@id='quicksearchtext' and @placeholder='ค้นหา']
# --- button --------->
&{light_portal_product_set_list___button}  add_product_set=//section[@id='main1']//div[@class='content']//button[text()='เพิ่มสินค้าเป็นชุดใหม่']
...                                        list=//div[@id='normaltable']//table/tbody//td[@class='id']/span[text()='**id**']/ancestor::tr/td[@class='name']//div[@class='bundle-tooltip tooltip-hover']/a/span


*** Keywords ***

Check product set not found
    [Documentation]  กดปุ่ม 'ไม่มีสินค้าชุด'
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_list___text.product_set_not_found}

Click create product set
    [Documentation]  กดปุ่ม 'สร้างสินค้าชุด'
        SeleniumLibrary.Click element  ${light_portal_product_set_list___button.add_product_set}
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_list___text.pop_up___add_product_set}

Click product set by code
    [Arguments]      ${code}
    [Documentation]  กดปุ่ม 'รายการสินค้าชุด' อิงตาม รหัส
        &{str_replace}=  BuiltIn.Create dictionary  **id**=${code}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_product_set_list___button.list}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_product_set___detail_page.Check header page

Input data for quick search by code
    [Arguments]      ${code}
    [Documentation]  กรอก 'รหัสสินค้าชุด'
        SeleniumLibrary.Input text  ${light_portal_product_set_list___input.quick_search}  ${code}