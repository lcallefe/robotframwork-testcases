*** Settings   ***
Documentation   Cadastro de jogos
Resource        resources/keywords.robot
Suite Setup     Inicia Sessao
Suite Teardown  Encerra Sessao



*** Test Cases  ***
Cadastrar novo jogo

    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     Duke Nukem 3D       FPS     20.00       10    
    Então vejo a mensagem de sucesso "Produto cadastrado com sucesso"
    E vejo este novo jogo na lista
   

Nome deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     ${EMPTY}     FPS     20.00       10   
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"

Preço deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     Duke Nukem 3D       FPS     ${EMPTY}      10   
    Então devo ver a mensagem de alerta "Preco não pode ficar em branco"

Quantidade deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     Duke Nukem 3D       FPS     20.00        ${EMPTY}   
    Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"


    
 



