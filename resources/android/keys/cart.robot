

*** Keywords ***
Faço login com as credencias "${email}" e "${senha}"
    Clean Cart                                                         ${email}
    login.Dado que acesso a tela de Login
    login.Quando submeto minhas credenciais "${email}" e "${senha}"


Acesso a categoria "${category}"
    ${target} =                                                        Convert To Uppercase     ${category}
    Wait Until Page Contains                                           ${target}
    Click Text                                                         ${target}

Escolho o produto "${product}"
    Wait Until Page Contains                                           ${product}
    Click Text                                                         ${product}
    #faz com que a variável fique disponível durante todo o cenário
    Set Test Variable                                                  ${product}

Adiciono este item ao carrinho
    Wait Until Page Contains                                           ${product}
    Click Text                                                         ADICIONAR AO CARRINHO


#Checkout
Tenho o seguinte produto no meu carrinho:
    [Arguments]     ${product}       ${category}
    Acesso a categoria "${category}"
    Escolho o produto "${product}"
    Adiciono este item ao carrinho
    Wait Until Page Contains Element        ${POPUP_OK}     
    Click Element       ${POPUP_OK}
    Sleep       1
    Go Back
    Wait Until Page Contains        ${product}
    Go Back     
    Sleep   1
    shared.Acessa carrinho
    Click Element       ${BUTTON_REFRESH}
    
Finalizo a compra com Paypal
    Click Text      FINALIZAR COMPRA

    Wait Until Page Contains        Log In with PayPal

    Input Text      ${EMAIL_PAYPAL}        test@qaninja.io
    Input Text      ${SENHA_PAYPAL}        qaninja123456

    Wait Until Element Is Visible       ${LOGIN_PAYPAL} 
    Click Element       ${LOGIN_PAYPAL}

    Wait Until Page Contains        	NinjaPixel purchase
    Click Element       ${PAY_PAYPAL}

    Wait Until Element Is Visible               ${POPUP} 
    Wait Until Page Does Not Contain            One moment…
