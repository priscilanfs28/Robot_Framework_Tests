*** Settings ***
Resource       ../resource/Resource.robot
Test Setup     Abrir navegador
Test Teardown  Fechar navegador

### SETUP roda keyword antes da suite ou antes de um teste
### TEARDOWN roda keyword depois de uma suite ou teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Acessar página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    Acessar página home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

Caso de Teste 03: Listar produtos
    Acessar página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"

Caso de Teste 04: Adicionar e Remover Produtos no Carrinho
    Acessar a página home do site
    Digitar o nome de produto "T-shirt" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"
    Clicar no ícone carrinho de compras no menu superior direito
    Excluir produto do carrinho

Caso de Teste 05: Adicionar Cliente
    Acessar página home do site
    Clicar no botão superior direito "Sign in"
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro
