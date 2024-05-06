*** Variables ***
&{light_portal_connect_list___button}  list=//div[@id='IntegrationTable']//tbody//td//a/span[text()='**name**']


*** Keywords ***
Click marketplace list by name
    [Arguments]      ${name}
    [Documentation]  คลิกปุ่ม 'รายการ marketplace'
    &{str_replace}=  BuiltIn.Create dictionary  **name**=${name}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_connect_list___button.list}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}
    light_portal_common_keywords.Wait for jquery loading completed