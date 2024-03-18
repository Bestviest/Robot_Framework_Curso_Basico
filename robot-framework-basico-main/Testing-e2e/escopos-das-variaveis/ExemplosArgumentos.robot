# Os argumentos em Robot Framework são utilizados para passar informações dinâmicas para as variáveis
# ou palavras-chave. Isso possibilita a reutilização de código e a execução de testes com 
# diferentes conjuntos de dados. Existem alguns escopos principais para variáveis em Robot Framework:

# **Variáveis Locais**: São definidas dentro de uma keyword e só existem dentro do escopo dessa keyword. 
# Elas são acessíveis somente dentro daquela keyword específica.

# **Variáveis Globais**: São definidas no nível do teste ou suite e podem ser acessadas por todas as keywords nesse nível.

# **Argumentos**: São passados para keywords para permitir a reutilização da keyword com diferentes valores. 
#  Eles são definidos entre as chaves **`{}`** na declaração da keyword.

*** Settings ***
Documentation   Exemplo de uso de variáveis como argumentos em Keywords

*** Variable ***
${PESSOA}       nome=May Fernandes   email=mayfernandes@exemplo.com.br   idade=20   sexo=feminino

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    Uma subkeyword com argumentos   Bruno Silva   bruno_silva@teste.com.br
    Uma subkeyword com argumentos   ${PESSOA.nome}   ${PESSOA.email}
    ${MENSAGEM_ALERTA}   Uma subkeyword com retorno   ${PESSOA.nome}   ${PESSOA.idade}
    Log     ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}   ${EMAIL_USUARIO}
    Log             Nome Usuário: ${NOME_USUARIO}
    Log             Email: ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}   ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If    ${IDADE_USUARIO}<18    Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!   OK!Usuário é maior de idade!
    [Return]        ${MENSAGEM}