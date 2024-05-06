*** Variables ***
&{light_portal_products_detail___button}        serial_number=//span[text()='Serial Number']

&{light_portal_products_detail___serial__text}  serial_on=//div[@id='SerialNoTable']//table/tbody/tr/td[@class='id']/span[text()='**serial_on**']
...                                             name_sell=//div[@id='SerialNoTable']//table/tbody/tr/td[@class='id']/span[text()='**serial_on**']/ancestor::tr/td[@class='sell']/a[text()='**name_sell**']
...                                             name_buy=//div[@id='SerialNoTable']//table/tbody/tr/td[@class='id']/span[text()='**serial_on**']/ancestor::tr/td[@class='buy']/a[text()='**name_buy**']
...                                             store=//div[@id='SerialNoTable']//table/tbody/tr/td[@class='id']/span[text()='**serial_on**']/ancestor::tr/td[@class='warehouse' and contains(normalize-space(.),'**store**')]

*** Keywords ***
Click serial number
    [Documentation]  กดปุ่ม 'serial number'
        SeleniumLibrary.Click element  ${light_portal_products_detail___button.serial_number}
        light_portal_common_keywords.Wait for jquery loading completed

Check serial on
    [Arguments]      ${expect_serial_product}  ${serial_on}
    [Documentation]  เช็คข้อมูล 'serial number'

        &{serial_on_replace}=  BuiltIn.Create dictionary  **serial_on**=${serial_on}
        ${serial_on_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_products_detail___serial__text.serial_on}  ${serial_on_replace}
        SeleniumLibrary.Wait until element is visible  ${serial_on_xpath}

        &{name_sell_replace}=  BuiltIn.Create dictionary  **serial_on**=${serial_on}  **name_sell**=${expect_serial_product ['name_sell']}
        ${name_sell_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_products_detail___serial__text.name_sell}  ${name_sell_replace}
        SeleniumLibrary.Wait until element is visible  ${name_sell_xpath}

        &{name_buy_replace}=  BuiltIn.Create dictionary  **serial_on**=${serial_on}  **name_buy**=${expect_serial_product ['name_buy']}
        ${name_buy_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_products_detail___serial__text.name_buy}  ${name_buy_replace}
        SeleniumLibrary.Wait until element is visible  ${name_buy_xpath}

        &{store_replace}=  BuiltIn.Create dictionary  **serial_on**=${serial_on}  **store**=${expect_serial_product ['store']}
        ${store_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_products_detail___serial__text.store}  ${store_replace}
        SeleniumLibrary.Wait until element is visible  ${store_xpath}