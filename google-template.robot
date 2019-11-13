*** Settings ***
Library  SeleniumLibrary
Library  String
Suite Setup  เปิดหน้าค้นหา
Suite Teardown  Close Browser
Test Teardown  กลับหน้าค้นหา
Test Template  Template ค้นหา google
*** Variables ***

*** Test Cases ***
TC001   pub ลาดพร้าว
TC002   iservice
*** Keywords ***
Template ค้นหา google
    [Arguments]  ${keyword}
    ทำการค้นหาคำว่า  keyword
    ต้องเจอผลลัพธ์


กลับหน้าค้นหา
    Go to  https://google.co.th

ต้องเจอผลลัพธ์
    # Solution 1
    Wait Until Element Contains  id:resultStats  ผลการค้นหาประมาณ${SPACE}
    Wait Until Element Contains  id:resultStats  ${SPACE}รายการ${SPACE}
    

ทำการค้นหาคำว่า
    [Arguments]  ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN
เปิดหน้าค้นหา
    Open Browser  https://google.co.th  browser=chrome  remote_url=http://localhost:4444/wd/hub  desired_capabilities=browserName:chrome
ต้องเจอผลลัพธ์ของ iservice
    # Solution 1
    Wait Until Element Contains  id:resultStats  ผลการค้นหาประมาณ${SPACE}
    Wait Until Element Contains  id:resultStats  ${SPACE}รายการ${SPACE}
    # Solution 2
    ${result}=  Get Text  id:resultStats
    @{words}=  Split String  ${result}  ${SPACE}
    Should Be Equal  ${words}[0]  ผลการค้นหาประมาณ
    Should Be Equal  ${words}[2]  รายการ

    # Click Result
    Page Should Contain Link
    ...  xpath://*[@id="rso"]/div[1]/div/div/div/div/div[1]/a
    Click Link
    ...  xpath://*[@id="rso"]/div[1]/div/div/div/div/div[1]/a
    Wait Until Location Is  https://iservice.truecorp.co.th/

ทำการค้นหาคำว่า "${keyword}"
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN
