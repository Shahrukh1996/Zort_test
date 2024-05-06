*** Variables ***
&{light_portal_products_list___button}         add_product=//div[@id='addProductBtn']/button[text()='เพิ่มสินค้าใหม่']

&{light_portal_products_list___table__button}  list_product=//table/tbody/tr/td[@class='name']//a/span[text()='**name_product**']


*** Keywords ***
Click create product
    [Documentation]  กดปุ่ม 'สร้างสินค้า'
        SeleniumLibrary.Click element  ${light_portal_products_list___button.add_product}
        light_portal_common_keywords.Wait for jquery loading completed
        light_portal_common_keywords.Scroll to header of page

Click list by name
    [Arguments]      ${name_product}
    [Documentation]  คลิกปุ่ม 'รายการ' อิงจาก ชื่อ
        &{str_replace}=  BuiltIn.Create dictionary  **name_product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_products_list___table__button.list_product}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_common_keywords.Wait for jquery loading completed