*** Variables ***
&{xpt_returnsell_button}       add_list=//div[@id='addTransactionBtn']//button[text()='สร้าง']


*** Keywords ***
Click create return sell list
    [Documentation]    คลิกปุ่มกด 'สร้าง' รายการรับคืน
    DobbyWebCommon.Click element when ready     ${xpt_returnsell_button.add_list}