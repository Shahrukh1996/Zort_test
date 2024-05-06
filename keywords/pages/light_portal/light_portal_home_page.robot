*** Variables ***
${home_page.btn_close_adb}          xpath=//div[@id='marketingcontentModal']//button[@class='close']

*** Keywords ***

Click close adb popup
    [Documentation]  Click close adb popup
    SeleniumLibrary.Click element       ${home_page.btn_close_adb}

Verify popup and click close adb popup
    ${keyword_status}=  BuiltIn.Run keyword and return status  SeleniumLibrary.Wait until element is visible  ${home_page.btn_close_adb}  ${small_timeout}
    IF    ${keyword_status}
        SeleniumLibrary.Click element  ${home_page.btn_close_adb}
        SeleniumLibrary.Wait until element is not visible  ${home_page.btn_close_adb}
    END
    BuiltIn.Sleep  2s
    [Return]  ${keyword_status}
