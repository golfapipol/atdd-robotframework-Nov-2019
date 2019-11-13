*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***

*** Test Cases ***
ค้นหาข้อมูลของ pub ลาดพร้าว
    [Tags]  testing
    เปิดหน้าค้นหา
    ทำการค้นหาคำว่า  pub ลาดพร้าว
    ต้องเจอผลลัพธ์

ค้นหาข้อมูลของ iservice
    เปิดหน้าค้นหา
    ทำการค้นหาคำว่า "iservice"
    ต้องเจอผลลัพธ์ของ iservice
*** Keywords ***
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
