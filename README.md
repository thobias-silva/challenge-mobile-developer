+A Educação - Mobile Developer
===================

[![N|Solid](https://maisaedu.com.br/hubfs/site-grupo-a/logo-mais-a-educacao.svg)](https://maisaedu.com.br/)

O objetivo deste desafio é avaliar as competências técnicas dos candidatos a desenvolvedor Mobile na Maior Plataforma de Educação do Brasil.

Será solicitado o desenvolvimento de um aplicativo que realize a autenticação e cadastro do Aluno na Turma de Programação Web da instituição Edtech. Regras e requisitos técnicos estão detalhadas neste documento.

# Especificações Técnicas
- **Mobile:**
  - Framework Flutter

- **UX/UI:** Utilizar preceitos e regras de material 3

- **Persistência de informações:** Utilizar Shared Preferences, SQFLite e/ou Banco NoSQL, caso necessário
- **Idioma de escrita do código:** Inglês

# Requisitos
## Contextualização
Considere que uma Instituição de Ensino Superior precisa de uma solução
para cadastrar e gerenciar os alunos em turmas online.
Para realizar a matrícula, é necessário que o cadastro do aluno tenha sido realizado.

O desafio consiste em criar uma aplicação para o cadastro de alunos conforme os critérios de aceitação.

Lembrando que o aplicativo deve ter

* Ícone de launcher;
* Tela de Splash Screen.

## Mockups de interface
A seguir, são apresentados alguns mockups de interface como um guia. Fique à vontade para usar sua criatividade na criação das telas.

* Ícone de launcher da aplicação
![Listagem de Alunos](/mockups/android_icon.png)

![Listagem de Alunos](/mockups/ios_icon.png)

* Splash screen  
![Listagem de Alunos](/mockups/splash.png)  

* Login  
![Listagem de Alunos](/mockups/login.png)  

* Cadastrar aluno  
![Listagem de Alunos](/mockups/student.png)  

* Editar/Excluir Aluno  
![Listagem de Alunos](/mockups/edit_student.png)  

![Listagem de Alunos](/mockups/list_student.png)  

## Histórias do Usuário
- **Sendo** um usuário administrativo da Instituição
- **Quero** gerenciar cadastros de alunos
- **Para** que eu possa realizar a matrícula do aluno

### Critérios de aceite:

#### Cenário: Entrar na aplicação
- **Dado** que estou na tela de Login
- **Dado** que inseri dados válidos nos campos
- **Quando** clico em Entrar
- **Então** abre a tela home do aplicativo

- **Dado** que estou na tela de Login
- **Dado** que inseri dados inválidos nos campos
- **Quando** clico em Entrar
- **Então** retorna mensagem de usuário/senha inválidos

- **Dado** que estou na tela de Login
- **Dado** que inseri dado em apenas um campo
- **Quando** clico em Entrar
- **Então** retorna mensagem de necessidade de preenchimento dos campos obrigatórios

#### Cenário: Cadastrar novo aluno
- **Dado** que estou na tela de Listagem de Alunos
- **Quando** clico em Adicionar Aluno
- **Então** abre a tela de Cadastro do Aluno
- **Então** exibe os campos obrigatórios vazios

####
- **Dado** que inseri dados válidos nos campos
- **Quando** clico em Adicionar
- **Então** cria o novo aluno na base
- **Então** retorna mensagem de sucesso

####
- **Dado** que inseri dados inválidos nos campos
- **Então** retorna mensagem de necessidade de preenchimento dos campos obrigatórios

####
- **Dado** que inseri dados válidos nos campos
- **Quando** clico na up navigation e/ou utilizo gestos
- **Então** retorna para tela Consulta de Alunos
- **Então** não persiste a gravação dos dados no banco

#### Cenário: Listar alunos cadastrados
- **Dado** que estou na tela home da aplicação
- **Então** abre a tela com listagem de Alunos
- **Então** abre a tela com ícone de edição de Alunos
- **Então** abre a tela com ícone de exclusão de Alunos
- **Então** abre a tela com botão Adicionar Aluno

#### Cenário: Editar cadastro de aluno
- **Dado** que estou na listagem de alunos
- **Quando** clico no ícone de Editar aluno
- **Então** abre a tela de Editar Aluno
- **Então** exibe os campos preenchidos
- **Então** habilita alteração dos campos editáveis

####
- **Dado** que estou na tela de Edição do Aluno
- **Quando** clico em Salvar
- **Então** grava os dados editáveis na base
- **Então** retorna mensagem de sucesso

####
- **Dado** que estou na tela de Edição do Aluno
- **Quando** clico na up navigation e/ou utilizo gestos
- **Então** retorna para a tela de Listagem de Alunos
- **Então** não persiste a gravação dos dados

#### Cenário: Excluir cadastro de aluno
- **Dado** que estou na listagem de alunos
- **Quando** clico no ícone de Excluir aluno
- **Então** exibe a modal de confirmação de exclusão

####
- **Dado** que estou na modal de confirmação de exclusão
- **Quando** clico em Excluir aluno
- **Então** então exclui o registro do aluno
- **Então** retorna mensagem de sucesso

####
- **Dado** que estou na modal de confirmação de exclusão
- **Quando** clico em Cancelar
- **Então** então fecha a modal e não persiste a exclusão

## Campos obrigatórios:
- **RA** (não editável) (chave única)
- **Nome** (editável)
- **Email** (editável)
- **Data de nascimento** (editável)
- **CPF** (não editável)

# Critérios de avaliação
- Qualidade de escrita do código
- Organização do projeto
- Lógica da solução implementada
- Qualidade da camada de persistência
- Utilização do Git (quantidade e descrição dos commits, Git Flow, ...)
- Validações
- Tratamento de erros
- Padrões de projeto e arquitetura

# Desejável
- Criar menu lateral sendo aberto a partir do menu de navegação inferior com as seguintes opções: Home e Adicionar alunos;

- Testes de unidade/componente/integração;
- Documentação da arquitetura de solução.

# Endpoints disponíveis para consumo:

## Endpoint login

POST - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login

exemplo de payload:
```
{
 "email": "joao@gmail.com",
 "password": "123456"
}
```
exemplo de response:
```
{
	"createdAt": "2023-11-02T18:54:47.981Z",
	"email": "joao@gmail.com",
	"token": "cb15fbdff6ad7fe1604fee7d",
	"password": "123456",
	"id": "1"
}
```

GET - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login

GET - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/:id

DELETE - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/:id

atenção: O endpoint de login é apenas um crud, ou seja, se ao enviar email e password o resultado for status code 200, pode redirecionar para a tela home da aplicação. Após fazer a persistência dos dados de forma local, utilize o get para validar as informações locais com o id remoto do usuário. Caso o id remoto seja igual ao local, ao abrir a aplicação passa direto para a tela home, sem necessidade de login.

## Endpoint student

POST - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student

exemplo de payload:
```
{
  "name": "Thiago Cury",
  "email": "thiago@gmail.com",
  "birthdate": "1983-11-10",
  "academic_record": "1234",
  "cpf": "00271700040"
}
```

exemplo de response:
```
{
	"createdAt": "2023-11-02T06:52:27.344Z",
	"name": "Thiago Cury",
	"birthdate": "1983-11-10",
	"cpf": "00271700040",
	"email": "thiago@gmail.com",
	"academic_record": "1234",
	"id": "1"
}
```

GET - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student

GET - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/:id

DELETE - https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/:id

# Observações
- As APIs foram criadas utilizando Mock.api, ou seja, não são apis oficiais, e sim, apenas de teste;
- Os endpoints login e student são rest, você pode utilizar os verbos GET/POST/PUT/DELETE para realizar os testes necessários;
- O login vai retornar um token gerado através de Faker.js;
- Esqueci o usuário e Esqueci a senha são apenas ilustrativos. Se desejar, pode deixar uma mensagem de funcionalidade em desenvolvimento.

# Diferenciais
- Utilização de gerenciador de estado;
- Segurança da aplicação (filtro de impurezas na autenticação, autorização, guardas, env, criptografia de senha);
- Gerar .aab e .apk assinados através de JKS e anexar ao repositório de entrega.

# Instruções de entrega
1. Crie um fork do repositório no seu GitHub
2. Faça o push do código desenvolvido no seu Github
3. Inclua um arquivo chamado COMMENTS.md explicando
    - Decisão da arquitetura utilizada
    - Lista de bibliotecas de terceiros utilizadas
    - O que você melhoraria se tivesse mais tempo
    - Quais requisitos obrigatórios que não foram entregues
4. Informe ao recrutador quando concluir o desafio junto com o link do repositório
5. Após revisão do projeto junto com a equipe de desenvolvimento deixe seu repositório privado
