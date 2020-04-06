*** Settings   ***
Documentation   Cadastro de jogos
Resource        resources/keywords.robot
Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao



*** Test Cases  ***
Cadastrar novo jogo
    [Tags]  smoke
    Dado que eu tenho o seguinte produto
    ...     Duke Nukem 3D       FPS     20.00       10  
    Quando eu faço o cadastro deste item   
    Então vejo a mensagem de sucesso Produto cadastrado com sucesso
    E vejo este novo jogo na lista
   
Jogo não pode ser duplicado
    [Tags]  dup
    Dado que eu tenho o seguinte produto
    ...     Super Mario World      Aventura     20.00       10 
    Mas este produto já está cadastrado
    Quando eu faço o cadastro deste item
    Então devo ver a mensagem de alerta Nome já está em uso 

Nome deve ser obrigatório
    [Template]  Tentar Cadastrar
    ${EMPTY}    19.99   10  Nome não pode ficar em branco
    

Preço deve ser obrigatório
    [Template]  Tentar Cadastrar
    Donkey Kong Country 2    ${EMPTY}   10  Preco não pode ficar em branco

Quantidade deve ser obrigatório
    [Template]  Tentar Cadastrar
    Donkey Kong Country 2    19.99   ${EMPTY}  Quantidade não pode ficar em branco

*** Keywords ***
Tentar Cadastrar
    [Arguments]     ${nome}  ${preco}   ${qtd}    ${texto}   
    
    Dado que eu tenho o seguinte produto
    ...     ${nome}     Jogo de Aventura    ${preco}      ${qtd}
    Quando eu faço o cadastro deste item
    Então devo ver a mensagem de alerta ${texto}

    
 



