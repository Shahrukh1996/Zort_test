*** Variables ***
&{xpt_list_button}  product_detail=//td[@class='id']/span[text()='**code**']/ancestor::tr/td[@class='name']//a



*** Keywords ***
Click product detail by code
    [Arguments]      ${code}
    [Documentation]  คลิกปุ่ม 'รายการสินค้า'
    SeleniumLibrary.Reload page
    common_keywords_middle_portal.Wait for jquery loading completed
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  common_keywords_middle_portal.Auto keyword replace string  ${xpt_list_button.product_detail}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}
    common_keywords_middle_portal.Wait for jquery loading completed