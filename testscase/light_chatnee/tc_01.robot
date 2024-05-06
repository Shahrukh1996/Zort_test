*** Settings ***
# Resource         ${CURDIR}/../resources/import.robot
# Test Teardown    common_keywords.Close zortout website

*** Test Cases ***
Test case chatnee
    [Tags]           chatnee  chatnee_tc_01
    [Documentation]  test case chatnee
    Log to console  !!! test !!!