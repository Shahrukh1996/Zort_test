*** Variables ***
${edit_return_buy_list_page.txt_edit_refer}             id=refname
${edit_return_buy_list_page.btn_save_edit}              xpath=//button[text()='บันทึก']

*** Keywords ***
Input edit reference
    [Documentation]     Input edit reference
    [Arguments]         ${refer}
    DobbyWebCommon.Input text to element when ready         ${edit_return_buy_list_page.txt_edit_refer}     ${refer}

Click save edit
    [Documentation]     Click save edit
    DobbyWebCommon.Click element when ready                 ${edit_return_buy_list_page.btn_save_edit}