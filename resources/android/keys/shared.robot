

*** Keywords ***
## helpers
Menu
    # [Arguments]     ${item}
    @{elements}=       Get Webelements     ${MENU_LIST} 
    Click Element       @{elements}[0]

Acessar lista de desejo
    # [Arguments]     ${item}
    @{elements}=       Get Webelements     ${MENU_LIST} 
    Click Element       @{elements}[1]

Acessa carrinho
    # [Arguments]     ${item}
    ${elements}=       Get Webelements     ${MENU_LIST} 
    Click Element       ${elements}[2]

Sobre
    # [Arguments]     ${item}
    @{elements}=       Get Webelements     ${MENU_LIST} 
    Click Element       @{elements}[3]

## Android components
Devo ver o popup com a mensagem:
    [Arguments]                         ${expect_message}
    Wait Until Page Contains Element    ${POPUP}
    Element Text Should Be              ${POPUP}         ${expect_message}