REALNEWS is a simple app that fetches Articles from Newsapi.org Api and presents a preview of them with the ability to filter the news by category

It uses a MVVM+C pattern and it was built upon SOLID principles and POP

Some features are: Filter by category of news, Pull to refresh update, Pagination.
Some technologies used: Concurrency(async await), XCTests, Compositional layout. 

This app was build for test and demostration purposes only

Comentários processo seletivo BornLogic:
Pra dar um pouquinho de personalidade chamei o app de realnews, meio que uma brincadeira com o termo realness e fake news, criei uma identidade visual bem básica que combinasse com o layout que eu estava pensando em fazer. Decidi fazer tudo em inglês devido ao fato de que os dados em inglês eram os mais consistentes da Api e achei que ia ficar uma apresentação bacana, até tinha pensando na possibilidade de adicionar filtros por países mas o fato da api retornar dados muito variáveis e na maioria das vezes faltantes para outras localizações me fez deixar isso de lado e focar em outras coisas como por exemplo o filtro por categorias, concurrency e escrita de testes. 
Utilizei um padrão MVVM em conjunto com um Coordinator pois fazia um tempinho que queria revisar coordinator pattern aí aproveitei mesmo sabendo que é um padrão mais complexo do que o problema pede (apresentar 01 tela apenas). Além disso, tentei executar ao máximo princípios SOLID e POP, alguns exemplos: injeção de dependência de protocolos, separação de responsabilidades, decomposição de componentes...

Além dos requisitos pedidos no projeto, tomei a liberdade de adicionar algumas features como diferentes categorias, paginação, pull to refresh pois acredito que é o mínimo pro app ter uma usabilidade ok e ser funcional. Acredito que não era o intuito do projeto mas se tivesse mais tempo provavelmente utilizaria algum framework como Combine pra atualizar as views sem a necessidade de tratar o resultado das chamadas para api na viewController diretamente, e também faria um mapeamento e tratativa de erros mais robusto...

Troubleshooting errrors:

In case you start getting the error related to limit of api calls reached: 

1. Generate a new Api Key in newsapi.org
2. Open Xcode Project and click Edit Scheme on your selected target
3. Replace the envronment variable apiKey with your new key
4. Run the app


