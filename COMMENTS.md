## Decisão da arquitetura utilizada
Como arquitetura estou utilizando os conceitos de Clean Architecture, porém um pouco simplificada. Iniciei o projeto com a estrutura completa, com a utilização de Usecases, Repositories, DataSources, porém conforme o andamento fui realizando refatorações visando um melhor alinhamento com o escopo do projeto, mas sem perder os conceitos do SOLID e da Clean Architecture de separação de camadas e desacoplamentos. 
A organização final de pastas, ficou assim:
```
├── lib
│   ├── core
│   ├── app
│   │   ├── data
│   │   │   ├── adapters
│   │   │   ├── repositories
│   │   ├── domain
│   │   │   ├── entities
│   │   │   ├── repositories
│   │   ├── presentation
│   │   │   ├── pages
│   │   │   ├── stores
│   │   │   ├── widgets
```

## Lista de bibliotecas de terceiros utilizadas

 - dio
 - dartz
 - shared_preferences
 - mobx
 - flutter_mobx
 - get_it
 - intl
 - mocktail
 - mobx_codegen
 - build_runner

## O que você melhoraria se tivesse mais tempo
 - Criação dos testes do StudentRepository
 - Validações no formalário
 - Melhor estruturação da pagina de adicionar/editar aluno
   
## Quais requisitos obrigatórios que não foram entregues
 - SplashScreen nativa do Android/iOS
 - Icone no iOS
