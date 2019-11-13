*** Settings ***
Library  FakerLibrary

*** Test Cases ***
Generate credit card number
    Set Variable  start  1
    FOR  ${start}  IN RANGE  10
        ${data}=  Credit Card number
        Log To Console  ${data}
    END