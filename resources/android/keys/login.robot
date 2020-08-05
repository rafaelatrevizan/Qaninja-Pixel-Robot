

*** Keywords ***
Dado que acesso a tela de Login
    Wait Until Page Contains Element    ${BT_ACCOUNT}        ${timeout}
    Click Element                       ${BT_ACCOUNT}

Quando submeto minhas credenciais "${email}" e "${senha}"
    Wait Until Page Contains            Login                ${timeout}
    Input Text                          ${INPUT_EMAIL}       ${email}
    Input Text                          ${INPUT_PASSWORD}    ${senha}
    Click Element                       ${BT_LOGIN}

Então devo ver "${expect_user}" na tela minha conta
    Wait Until Page Contains Element    ${BT_ACCOUNT}        ${timeout}
    Click Element                       ${BT_ACCOUNT}
    Wait Until Page Contains            ${expect_user}       ${timeout}