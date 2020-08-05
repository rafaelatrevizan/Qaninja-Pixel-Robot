*** Settings ***
Library     AppiumLibrary
Library     String
Library     ../libs/api_helper.py

Resource    android/elements.robot
Resource    android/keys/login.robot
Resource    android/keys/cart.robot
Resource    android/keys/shared.robot

*** Variables ***
${URL}              http://localhost:4723/wd/hub
${deviceName}       Pixel 2 API 28
${app}              ${CURDIR}/app/pixel.apk
${timeout}          30


*** Keywords ***
### hooks
Abrir app
    Set Appium TImeout  ${timeout} 
    Open Application    ${URL}  
    ...                 platformName=Android
    ...                 deviceName=${deviceName}
    ...                 app=C:\\Qaninja\\Pixel\\resources\\app\\pixel.apk
    ...                 automationName=uiautomator2
    ...                 autoGrantPermissions=true

Fechar app 
    Capture Page Screenshot
    Close Application

    

