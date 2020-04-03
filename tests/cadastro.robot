*** Settings   ***
Documentation   Cadastro de jogos
Library     SeleniumLibrary

*** Test Cases  ***
Cadastrar novo jogo
    Log To Console      "Olar"
    Open Browser        http://localhost:3000   Chrome
    Set Browser Implicit Wait    5
    Click Element       link:Novo
    Input Text          id:produto_nome         Call of Duty
    Input Text          id:produto_descricao    Jogo de Primeira Pessoa 
    Input Text          id:produto_preco        R$ 99.90
    Input Text          id:produto_quantidade   10
   
    Click Element       xpath://input[@value='Criar Produto']
   
    Element Should Contain      css:div[role=alert]     Produto cadastrado com sucesso
    Element Should Contain      css:table tbody         Call of Duty




