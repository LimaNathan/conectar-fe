# Conectar Users - Frontend

## Introdução

Este é o projeto frontend para o teste técnico da Conéctar. A aplicação foi desenvolvida em Flutter e tem como objetivo consumir a API de gerenciamento de usuários e clientes, oferecendo uma interface amigável e funcional para as operações de CRUD.

## Tecnologias Principais

- **Framework:** [Flutter](https://flutter.dev/)
- **Gerenciamento de Estado:** [Provider](https://pub.dev/packages/provider)
- **Roteamento:** [go_router](https://pub.dev/packages/go_router)
- **Cliente HTTP:** [Dio](https://pub.dev/packages/dio)
- **Componentes de UI:** [Shadcn UI](https://pub.dev/packages/shadcn_ui)
- **Armazenamento Seguro:** [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- **Validação:** [lucid_validation](https://pub.dev/packages/lucid_validation)
- **Ícones:** [Lucide Icons](https://pub.dev/packages/lucide_icons)

## Arquitetura e Decisões de Design

O projeto foi estruturado seguindo os princípios de Clean Architecture, visando a separação de responsabilidades e a manutenibilidade do código. A estrutura de diretórios é a seguinte:

- **`lib/`**: Diretório principal do código-fonte.
  - **`main.dart`**: Ponto de entrada da aplicação.
  - **`common/`**: Contém código que é compartilhado por toda a aplicação, como constantes, rotas, exceções, etc.
  - **`data/`**: Camada de dados, responsável por obter os dados da API e de outras fontes.
    - **`interceptors/`**: Interceptadores do Dio para adicionar o token de autenticação nas requisições.
    - **`repositories/`**: Repositórios que abstraem a origem dos dados.
    - **`services/`**: Serviços que fazem a comunicação com a API.
  - **`models/`**: Modelos de dados da aplicação.
  - **`presentation/`**: Camada de apresentação, responsável pela UI.
    - **`components/`**: Widgets reutilizáveis.
    - **`viewmodels/`**: View-models que contêm a lógica de negócio da UI.
    - **`views/`**: Telas da aplicação.

## Como Rodar o Projeto

Siga os passos abaixo para configurar e executar a aplicação localmente.

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) (versão 3.x ou superior)
- [API do Conectar](https://github.com/LimaNathan/conectar-api) rodando localmente.

### 1. Clone o Repositório

```bash
git clone https://github.com/LimaNathan/conectar-teste-tecnico.git
cd conectar-teste-tecnico/conectar_users_fe
```

### 2. Instale as Dependências

```bash
flutter pub get
```

### 3. Configure as Variáveis de Ambiente

Crie um arquivo `env.json` na raiz do projeto (`conectar_users_fe/env.json`) e adicione a seguinte variável de ambiente para conectar à API:

```json
{
  "BASE_URL": "http://localhost:3000"
}
```

### 4. Inicie a Aplicação

Finalmente, para iniciar a aplicação, execute:
A flag `--web-browser-flag=--disable-web-security` serve para evitar problemas de CORS a nível de desenvolvimento.
A flag `--dart-define-from-file=env.json` carrega as variáveis de ambientes para a aplicação.

```bash
flutter run --web-browser-flag=--disable-web-security --dart-define-from-file=env.json
```

A aplicação estará rodando no seu emulador ou dispositivo.
