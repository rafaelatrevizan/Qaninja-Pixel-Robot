**** Settings ***
Resource        ../resources/android.robot

Library         String

Test Setup      Abrir app
Test Teardown   Fechar app 


*** Test Cases ***
Adicionar produto ao carrinho
    Faço login com as credencias "fernando@qaninja.io" e "pass123"
    Acesso a categoria "Mega Drive"
    Escolho o produto "Golden Axe"
    Adiciono este item ao carrinho
    Devo ver o popup com a mensagem:
    ...     Você adicionou Golden Axe ao seu carrinho!


Não logado
    [Tags]              cart_nologin
    Acesso a categoria "Mega Drive"
    Escolho o produto "Golden Axe"
    Adiciono este item ao carrinho
    Devo ver o popup com a mensagem:
    ...     Você deve estar logado para adicionar um produto!

Comprar produto
    [Tags]      comprar 
    Faço login com as credencias "fernando@qaninja.io" e "pass123"
    Tenho o seguinte produto no meu carrinho:

    ...         F-Zero      Super Nintendo

    Finalizo a compra com Paypal
    Devo ver o popup com a mensagem: 
    ...     Você pagou seu pedido atraves do PayPal! Entregaremos sua encomenda o mais rápido possível!




        
    #dados paypal
    #test@qaninja.io
    #qaninja123456