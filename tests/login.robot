**** Settings ***
Resource         ../resources/android.robot

Test Setup       Abrir app
Test Teardown    Fechar app


*** Test Cases ***
Teste 1: Login app com sucesso
    Dado que acesso a tela de Login
    Quando submeto minhas credenciais "tony@stark.com" e "pass123"
    Então devo ver "Tony Stark" na tela minha conta


Teste 2: Login com senha inválida
    [Tags]                                                            inv_pass
    [Template]                                                        Trying_to_login
    tony@stark.com                                                    abc123             Usuário e/ou senha inválidos.

Teste 3: Validar login com usuário inexistente
    [Template]                                                        Trying_to_login
    404@gmail.com                                                     abc123             Usuário e/ou senha inválidos.

*** Keywords ***
Trying_to_login
    [Arguments]                                                       ${email}           ${senha}                         ${saida}

    Dado que acesso a tela de Login
    Quando submeto minhas credenciais "${email}" e "${senha}"
    Devo ver o popup com a mensagem:
    ...                                                               ${saida}