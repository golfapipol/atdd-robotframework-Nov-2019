*** Settings ***
Library  FakerLibrary
Library  OperatingSystem

*** Test Cases ***
Generate credit card number
    Create File  data.csv  No.,Credit card,Email\n
    FOR  ${index}  IN RANGE  10
        ${data}=  Credit Card number
        ${email}=  Company Email
        Log To Console  ${data}
        Append To File  data.csv  ${index},${data},${email}\n
    END