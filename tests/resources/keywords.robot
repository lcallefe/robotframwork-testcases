*** Settings ***
Library     SeleniumLibrary
Library     DatabaseLibrary
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

## Helpers
Acesso ao banco
    Connect To Database Using Custom Params     sqlite3     'db/development.sqlite3', isolation_level=None

Deleta pelo nome
    [Arguments]     ${nome_produto}
    Acesso ao banco
    Execute SQL String      delete from produtos where nome = '${nome_produto}'

Atualiza Status


Dado que eu tenho o seguinte produto
    [Arguments]     ${nome}     ${desc}     ${preco}     ${qtd}
    Deleta pelo nome                        ${nome}
   
    Set Test Variable   ${nome}
    Set Test Variable   ${desc}
    Set Test Variable   ${preco}
    Set Test Variable   ${qtd}

#E acesso o portal de cadastro de jogos
   # Go To       ${BASE_URL}/produtos/new

Quando eu faço o cadastro deste item
    Go To       ${BASE_URL}/produtos/new
    Input Text          ${CAMPO_NOME}           ${nome}
    Input Text          ${CAMPO_DESC}           ${desc}
    Input Text          ${PRODUTO_PRECO}        ${preco}
    Input Text          ${CAMPO_QTD}            ${qtd}
    
    Click Element       ${BT_CRIAR_PRODUTO}  

Então vejo a mensagem de sucesso ${mensagem_esperada}
    Element Should Contain      ${ALERTA_SUCESSO}      ${mensagem_esperada}

E vejo este novo jogo na lista
    Element Should Contain      ${LISTA_JOGOS}          ${nome}

Mas este produto já está cadastrado
   
    Quando eu faço o cadastro deste item



    

Então devo ver a mensagem de alerta ${mensagem_esperada}
    Element Should Contain      ${ALERTA_ERRO}      ${mensagem_esperada}