*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Suite Setup    api_portal_logistic_point___teature.Data from excel file


*** Test Cases ***
TEST LOGISTIC POINT FLASH
    [Tags]           LOGISTIC_POINT  LOGISTIC_POINT_FLASH
    [Documentation]  ทดสอบค่าขนส่ง [flashexpress]
    ...               > สามารถเลือก ZONE ที่ต้องการทดสอบ

    Log to console  ...
    api_portal_logistic_point___teature.Check delivery flashexpress  ZONE8