*** Variables ***
&{xpt_returnsell_payment_text}          focus_element_zone_payment=//div[@id='tour-action-payment']
...                                     focus_element_title_payment=//div[@id='tour-action-payment']//h2[contains(., 'การชำระเงิน')]
...                                     focus_element_title_payment_popup=//h3[@id='myModalLabel' and text()='ชำระเงิน']
...                                     main_status_payment=//div[@id='tour-transaction-status']//h2[text()='สถานะการชำระเงิน']/following-sibling::p/span[text()='///STATUS///']
...                                     sub_status_payment=//h2[contains(., 'การชำระเงิน')]/ancestor::div[@id='tour-action-payment']//div[@id='showpayment']/span[text()='///STATUS///']
&{xpt_returnsell_payment_input}         amount=//label[text()='จำนวนเงิน']/ancestor::div[@class='row']//input[@id='paymentamount']
...                                     method=//label[text()='ช่องทางการชำระเงิน']/ancestor::div[@class='row']//input[@id='paymentname']
...                                     date_time=//input[@id='paymentdatetime']/..//span[@class='glyphicon glyphicon-calendar']
&{xpt_returnsell_payment_button}        add_payment=//div[@id='showpayment']/following-sibling::div/a/i
...                                     confirm_payment=//button[text()='ยืนยันการชำระเงิน']
...                                     delete_payment=//div[@id='tour-action-payment']//tbody//td[text()='///METHOD///']/parent::tr/td[contains(text(), '///AMOUNT/// บาท')]/ancestor::tr//a[text()='ลบ']


*** Keywords ***
Click add payment
    [Documentation]    กดปุ่ม 'ชำระเพิ่ม'
    SeleniumLibrary.Scroll element into view    ${xpt_returnsell_payment_text.focus_element_title_payment}
    DobbyWebCommon.Click element when ready     ${xpt_returnsell_payment_button.add_payment}

Click comfirm payment
    [Documentation]    กดปุ่ม 'ยืนยันการชำระเงิน'
    DobbyWebCommon.Click element when ready     ${xpt_returnsell_payment_button.confirm_payment}

Click delete payment
    [Arguments]        ${data}
    [Documentation]    กดปุ่ม 'ลบ' รายการชำระเงิน
    SeleniumLibrary.Scroll element into view    ${xpt_returnsell_payment_text.focus_element_zone_payment}
    &{str_replace}=     BuiltIn.Create dictionary    ///METHOD///=${data ['method']}    ///AMOUNT///=${data ['amount']}
    ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_payment_button.delete_payment}    ${str_replace}
    DobbyWebCommon.Click element when ready     ${new_xpath}

Check main status payment
    [Arguments]        ${status}
    [Documentation]    ตรวจสอบสถานะหลัก 'ชำระเงิน'
    light_portal_common_keywords.Scroll to header of page
    &{str_replace}=     BuiltIn.Create dictionary    ///STATUS///=${status}
    ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_payment_text.main_status_payment}    ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale    ${new_xpath}

Check sub status payment
    [Arguments]        ${status}
    [Documentation]    ตรวจสอบสถานะรอง 'ชำระเงิน'
    SeleniumLibrary.Scroll element into view    ${xpt_returnsell_payment_text.focus_element_title_payment}
    &{str_replace}=     BuiltIn.Create dictionary    ///STATUS///=${status}
    ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_payment_text.sub_status_payment}    ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale    ${new_xpath}

Input data payment
    [Arguments]        ${payment_data}
    [Documentation]    กรอกข้อมูลชำระเงิน
    FOR  ${index}  IN  @{payment_data.keys()}
        IF  '${index}' == 'date_time'
            DobbyWebCommon.Click element when ready    ${xpt_returnsell_payment_input.${index}}
            light_portal_common_keywords.Auto keyword datepicker    ${payment_data ['${index}'] ['date']}
            light_portal_common_keywords.Auto keyword timepicker    ${payment_data ['${index}'] ['time']}
        ELSE
            light_portal_common_keywords.Auto keyword clear input text       ${xpt_returnsell_payment_input.${index}}
            DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_payment_input.${index}}    ${payment_data ['${index}']}
            DobbyWebCommon.Click element when ready             ${xpt_returnsell_payment_text.focus_element_title_payment_popup}
        END
    END