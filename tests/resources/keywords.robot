*** Settings ***
Library     SeleniumLibrary
Resource    elements.robot

*** Variables   ***
${BASE_URL}     http://localhost:3000 


*** Keywords ***

Inicia Sessao
    Open Browser        ${BASE_URL}   Chrome
    Set Browser Implicit Wait    5

Encerra Sessao
    Capture Page Screenshot
    Close Browser

Dado que acesso o portal de cadastro de jogos
    Go To       ${BASE_URL}/produtos/new
    

Quando eu faço o cadastro de um novo jogo
    [Arguments]     ${nome}     ${desc}     ${preco}     ${qtd}
    
    Input Text          ${CAMPO_NOME}           ${nome}
    Input Text          ${CAMPO_DESC}           ${desc}
    Input Text          ${PRODUTO_PRECO}        ${preco}
    Input Text          ${CAMPO_QTD}            ${qtd}
    Click Element       ${BT_CRIAR_PRODUTO}  
    Set Test Variables  ${nome}
Então vejo a mensagem de sucesso "${mensagem_esperada}"
    Element Should Contain      ${ALERTA_SUCESSO}      ${mensagem_esperada}

E vejo este novo jogo na lista
    [Arguments]     ${nome}
    Element Should Contain      ${LISTA_JOGOS}         ${nome}
   

Então devo ver a mensagem de alerta "${mensagem_esperada}"
    Element Should Contain      ${ALERTA_ERRO}      ${mensagem_esperada}