*** Settings ***
Library         SeleniumLibrary
Library         String

*** Variables ***
${BROWSER}              firefox
${URL}                  http://automationpractice.com/

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser        about:blank         ${BROWSER}

Fechar navegador
    Close Browser

### Passo-Passo
Acessar página home do site
    Go to      ${URL}
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      name=search_query      ${PRODUTO}

Clicar no botão pesquisar
    Click Element   name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait until Element is visible       css=#center_column > h1
    Title Should Be                     Search - My Store
    Page Should Contain image           xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Page Should Contain Link            xpath=//*[@id="center_column"]//a[@class="product-name"]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be              //*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over    //*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Acessar a página home do site
    Go To                   ${URL}
    Title Should Be         My Store

Digitar o nome de produto "${TSHIRT}" no campo de pesquisa
    Input Text      name=search_query      ${TSHIRT}

Clicar no botão de pesquisa
    Click Element   name=submit_search


Clicar no botão "${ADDTOCART}" do produto
    Mouse Over                       //*[@id="center_column"]/ul/li/div/div[1]
    Wait Until Element Is Visible    //*[@id="center_column"]/ul/li/div/div[2]/div[2]
    Click Element                    //*[@id="center_column"]/ul/li/div/div[2]/div[2]

Clicar no botão "${PROCEEDTOCHE}"
    Wait Until Element Is Visible    //*[@id="layer_cart"]/div[1]/div[2]
    Click Element                    //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a

Clicar no ícone carrinho de compras no menu superior direito
    Click Element    //*[@id="header"]/div[3]/div/div/div[3]/div/a

Excluir produto do carrinho
    Click Element    xpath=//*[@class="cart_quantity_delete"]

Clicar no botão superior direito "Sign In"
    Click Element    //*[@id="header"]/div[2]/div/div/nav/div[1]/a

Inserir um e-mail válido
    Wait Until Element Is Visible    //*[@id="create-account_form"]
    ${EMAIL}                        Generate Random String
    Input Text                      id=email_create    ${EMAIL}@testerobot.com

Clicar no botão "Create na account"
    Click Button        //*[@id="SubmitCreate"]

Preencher os campos obrigatórios
    Wait Until Element Is Visible    xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element                    id=id_gender2
    Input Text                      //*[@id="customer_firstname"]     Maria
    Input Text                      //*[@id="customer_lastname"]      Souza
    Input Text                      //*[@id="email"]    mariasouza@gmail.com
    Input Password                  //*[@id="passwd"]    Teste12345!
    Select From List By Value       //*[@id="days"]    12
    Select From List By Value       //*[@id="months"]    4
    Select From List By Value       //*[@id="years"]    1994
    Select Checkbox                 //*[@id="newsletter"]
    Select Checkbox                 //*[@id="optin"]
    Input Text                      //*[@id="firstname"]    Maria
    Input Text                      //*[@id="lastname"]     Souza
    Input Text                      //*[@id="address1"]    Lake Buena Vista
    Input Text                      //*[@id="city"]        Orlando
    Select From List By Value       //*[@id="id_state"]    9
    Input Text                      //*[@id="postcode"]    32830
    Input Text                      //*[@id="phone_mobile"]    333444555
    Input Text                      //*[@id="alias"]    Disney


Clicar em "Register" para finalizar o cadastro
    Submit Form
