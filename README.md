# Sistema de Controle de Entrada de Visitantes

### Antes de qualquer coisa, leia..

Eu aprendi a sintaxe do ruby e o freamework ruby on rails e desenvolvi esse projeto em um perido de 7 dias, fiz tudo isso em lives no youtube, durante os 7 dias realizamos por volta de 20 lives (ate o momento) acumulei cerca de 70 horas de live, uma media de 10 horas por dia nesse projeto. por ser um freamwork e linaguem novo para mim, é evidente que não tenho total dominio sobre o freamwork, mas durante esse perido com todas essas horas de dedicação a esse desafio, esse projeto eu pude aplicar nao so conhecimnentos externos mas também de boas praticas

se voce quiser pdoe acessar a playlist de lives desse projeto no meu canal do youtube:
https://youtube.com/playlist?list=PLPFcnwFvZAMZfgLLpt17qpilg_pPwBkm4&si=VbrqY8WBIm2ix5x9

link do canal:
https://www.youtube.com/@DevKeyllian

## Descrição desse projeto

Este projeto é um sistema para armazenar registros de entradas de pessoas (visitantes) que frequentam uma unidade específica de uma instituição. Ele inclui várias funcionalidades, como autenticação de usuários, autorização, upload de arquivos, e muito mais.

### Desafio proposto

Controle de Entrada
O sistema tem como objetivo armazenar os registros de entradas de pessoas (visitantes) que
frequentam uma determinada unidade de uma instituição.
A instituição possui varias unidades e cada unidade armazena apenas os dados de visita da
sua unidade. Porém, compartilham do cadastro dos visitantes afim de agilizar o processo.
Cada unidade possui vários setores com seus respectivos funcionários, os quais deveram ser
informados no momento do registro da visita.
O registro da visita deverá solicitar os seguintes dados do visitante: CPF, nome, RG,
telefone e foto (webcam). Caso o visitante já tenha sido cadastrado anteriormente, ao preencher o
CPF, o sistema deve consultar e apresentar os dados do visitante. E solicitar que informe o setor e
funcionário (opcional) ao qual será feita a visita. Ao final o sistema deve registrar a data e hora da
visita.
O sistema deve possuir 3 níveis de permissão de usuário, Administrador que poderá
cadastrar as unidades, setores, funcionários e os usuários; Atendente que será responsável pelo
cadastro do visitante e registro das visitas apenas de sua unidade; e Funcionário que poderá
visualizar a lista de visitantes que estão aguardando, bem como notificar ao sistema sobre a
realização da visita. O sistema deve exibir as funcionalidades conforme a permissão de cada
usuário.

Sistema web;
Padrão de arquitetura MVC (Ruby on Rails)

Ruby on Rails:
 Linguagem Ruby;
 Framework Ruby on Rails;
 Utilizar a gem Devise para autenticação;
 Utilizar a gem Cancancan para autorização;


## Tecnologias Utilizadas

### Ruby on Rails

O projeto é construído usando Ruby on Rails, uma framework web popular para desenvolvimento de aplicações web.

### Tailwind CSS

Este projeto utiliza [Tailwind CSS](https://tailwindcss.com/) para a estilização. Tailwind CSS é um framework de CSS utilitário que permite criar designs modernos e responsivos de forma rápida e eficiente.

### Configuração do Tailwind CSS

O Tailwind CSS está configurado no arquivo [Procfile.dev](Procfile.dev) para ser observado e recompilado automaticamente durante o desenvolvimento:

```dev
web: bin/rails server
css: bin/rails tailwindcss:watch
```
### Arquivo de Estilos

Os estilos globais do Tailwind CSS são importados no arquivo application.css:

```css
@import "tailwindcss";
```
Para mais informações sobre como utilizar o Tailwind CSS, consulte a [documentação oficial](https://tailwindcss.com/docs).

### Rubocop
por padrao o linter rubocop já vem configurado em um projeto rails, mas com configurações basicas,usei essse repositorio com as configurações avançadas de linter recomendadas para projetos rails
https://github.com/standardrb/standard/blob/main/config/base.yml

se quiser as configurações, basta copiar esse arquivo base.yml e colcar no seu .rubucop.yml na raiz do projeto

## Ferramentas que usei
Dockeer e o serviço web portainer
git/github
DBaver
Vscode
terminal (linux)
dbdiagram.io para modelagem do banco de dados
IA - para duvidas, entender erros, exemplos e ect, mas NUNCA para ejetar de codigo no projeto, vou falar mias no toripo IA no projeto
notion, para anotaçẽos, metas e outros
draw.io para entender o projeto e modelar algumas coisas


### Principais Gems Utilizadas

- **rails (~> 8.0.1)**: Framework principal para desenvolvimento web.
- **pg (~> 1.5, >= 1.5.6)**: Utilizado para o banco de dados PostgreSQL.
- **dotenv-rails (~> 2.1, >= 2.1.1)**: Carrega variáveis de ambiente a partir de um arquivo .env.
- **devise**: Autenticação de usuários.
- **cancancan**: Autorização de usuários.
- **carrierwave (~> 2.0)**: Upload de arquivos.
- **mini_magick**: Processamento de imagens.
- **fog-aws**: Armazenamento de arquivos na AWS S3.
- **brazilian_documents (~> 0.1.4)**: Validação de documentos brasileiros.
- **phonelib**: Validação de números de telefone.
- **puma (>= 5.0)**: Servidor web.

# Materias de apoio usadas para o desenvolvimento

### Youtuber
um canal que me ajudou bastante nesse processo tamém foi o RailsGO
https://www.youtube.com/@GorailsTV

### Documentações

https://github.com/CanCanCommunity/cancancan
https://github.com/carrierwaveuploader/carrierwave
https://github.com/daddyz/phonelib
https://github.com/heartcombo/devise
https://github.com/bkeepers/dotenv
https://tailwindui.com/
https://github.com/fidelisrafael/brazilian_documents
https://guides.rubyonrails.org/getting_started.html#controllers-actions
https://www.ruby-lang.org/pt/documentation/
https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia - documeraçaõ para o uso da webcam no navegador
https://github.com/standardrb/standard

### Serviço de Email

O projeto utiliza o Action Mailer para enviar emails dos serviços da gen Devise, escolhi o serviço do gmail para isso. A configuração do serviço está no arquivo development.rb:

```rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: ENV["EMAIL_GMAIL"],
  password: ENV["PASSWORD_GMAIL"],
  authentication: "plain",
  enable_starttls_auto: true
}
```

### Serviço AWS

O projeto utiliza o AWS S3 para armazenamento de fotos dos visitantes e de usuarios. A configuração está no arquivo carrierwave.rb:

```rb
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: ENV["AWS_REGION"],
    endpoint: "https://s3.sa-east-1.amazonaws.com"
  }

  config.fog_directory = ENV["AWS_BUCKET_NAME"]
  config.fog_public = false
  config.fog_attributes = {"Cache-Control" => "max-age=315576000"}
end
```

### Docker

O projeto está configurado para ser executado em containers Docker. O arquivo Dockerfile contém a configuração necessária:

```dockerfile
FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b '0.0.0.0'"]
```

O arquivo docker-compose.yml é utilizado organizar os containers:

```yml
version: '3'

services:

  db:
    image: postgres
    restart: always
    ports:
      - "5432:5432"
    volumes:
      - ./pgdata:/data/postgres
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    networks:
      - app-network

  web:
    build:
      context: .
      dockerfile: Dockerfile
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails server -b '0.0.0.0'"
    volumes:
      - ".:/app"
    ports:
      - "3000:3000"
    depends_on:
      - db
    networks:
      - app-network

volumes:
    pgdata:
      driver: local

networks:
  app-network:

```

## Configuração

### Variáveis de Ambiente

Crie um arquivo .env na raiz do projeto e adicione as seguintes variáveis de ambiente, não considere os valores apos o sinal de =, são apenas uma breve explicaçaõ do papel de cada valor:

```
POSTGRES_USER=seu usuario no banco de dados
POSTGRES_PASSWORD=sua senha do banco de dados
POSTGRES_DB=seu nome do banco de dados
DATABASE_HOST=onde esta sendo hosteado o seu banco, normalmente localhost
EMAIL_GMAIL=seu email do gmail para o serviço 
PASSWORD_GMAIL=sua senha de aplicativos do gmail, para cria-lá, e necessario autenticação de dois fatores na conta
AWS_ACCESS_KEY_ID=sua chave de acesso na aws
AWS_SECRET_ACCESS_KEY=sua senha secreta na aws
AWS_BUCKET_NAME=o nome do seu bucket na aws
AWS_REGION=região do seu bucket na aws

```
## Permissões

as permissẽos são baseadas no roles e usuario
0 = employee (funcionario)
1 = attendant (atendente)
2 = admin (admin)

usamos a gem cancan para configurar as permissões dos usuarios, voce pode encontrar o arquivo de permissões completo em app/models/ability.rb
```sh
def initialize(user)
    case user.role

    when "admin"
      can :manage, :all
    when "attendant"
      can :read, Visit, unit_id: user.unit_id
      can :read, Visitor

      can :update, Visit, unit_id: user.unit_id
      can :update, Visitor

      can :create, Visit
      can :create, Visitor

      can :verify_by_cpf, Visitor
    when "employee"
      can :read, Visit, unit_id: user.unit_id
      can :update, Visit, unit_id: user.unit_id
    end
end
```

### Banco de Dados

### Normalização do Banco de Dados
O banco de dados foi projetado e estruturado de acordo com as três primeiras formas normais (1FN, 2FN e 3FN), garantindo um alto nível de integridade e eficiência na organização dos dados.

Uma breve explicação sobre as tres formas normais em um banco de dados:
Primeira Forma Normal (1FN): todas as colunas nas tabelas contêm valores atômicos, sem campos que armazenem múltiplos valores ou listas. Cada valor é único e independente dentro de suas respectivas colunas.
Segunda Forma Normal (2FN): todas as colunas não-chave dependam completamente da chave primária, eliminando dependências parciais.
Terceira Forma Normal (3FN): não há dependências transitivas entre as colunas, ou seja, as colunas dependem apenas da chave primária e não umas das outras.

![Banco de dados - Imagem](https://drive.google.com/uc?export=view&id=1Aj0z4ckj0zLDjRgKxzx2OSrZ0qlupNOu)

### Relacçoes, chaves extrangeiras, enums e validações

### Tabelas e Relacionamentos:

![Diagrama ER](https://drive.google.com/uc?id=1KcNN1DS-6CjBhkOGVfSnuuTzJQuA_iHS)

### Explicação das notações na imagem
1..n	Um para muitos
1..1	Um para um
n..1	Muitos para um
n..n	Muitos para muitos


1. **Tabela `sectors` (Setores)**:
     - `belongs_to :unit`: Cada setor pertence a uma unidade.
     - `has_many :visits`: Um setor pode ter várias visitas registradas.

2. **Tabela `units` (Unidades)**:
     - `has_many :sectors`: Uma unidade pode ter vários setores.
     - `has_many :users`: Uma unidade pode ter vários usuários.
     - `has_many :visits`: Uma unidade pode ter várias visitas.
   
3. **Tabela `users` (Usuários)**:
     - `belongs_to :unit, optional: true`: Um usuário pertence a uma unidade (opcional).
     - `belongs_to :sector, optional: true`: Um usuário pertence a um setor (opcional).
     - `has_many :visits`: Um usuário pode ter várias visitas.
   
4. **Tabela `visitors` (Visitantes)**:
     - `has_many :visits`: Um visitante pode ter várias visitas.

5. **Tabela `visits` (Visitas)**:
     - `belongs_to :visitor`: Cada visita pertence a um visitante.
     - `belongs_to :unit`: Cada visita pertence a uma unidade.
     - `belongs_to :sector`: Cada visita pertence a um setor.
     - `belongs_to :user, optional: true`: Cada visita pode ser associada a um usuário, mas isso é opcional (não obrigatório).

### Relacionamentos de Chaves Estrangeiras:
- **`sectors`**: Tem uma chave estrangeira (`unit_id`) que se relaciona com a tabela `units`.
- **`users`**: Tem chaves estrangeiras (`unit_id`, `sector_id`) que se relacionam com `units` e `sectors`.
- **`visits`**: Tem chaves estrangeiras (`visitor_id`, `unit_id`, `sector_id`, `user_id`) que se relacionam com `visitors`, `units`, `sectors` e `users`.

### Enum:
- O campo `status` da tabela `visits` tem um enum que define o status da visita: `pending` (pendente), `completed` (completada) e `absent` (ausente).
- O campo `role` da tabela `users` define o papel do usuário, podendo ser: `employee` (funcionário), `attendant` (atendente) ou `admin` (administrador).

### Validações:
- As validações em várias tabelas garantem que os dados inseridos sejam válidos, como CPF, RG, email, entre outros.
- `User` e `Visitor` têm validações específicas para o Telefone, CPF e RG, garantindo que sejam válidos de acordo com os padrões brasileiros.

Para configurar o banco de dados, execute os seguintes comandos:

```sh
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed - por padrão deixei um usuario com credenciais de administrador registrado, execute antes para poder fazer o primeiro login, sem isso voce nao ira conseguir
```

o comando seed acima vai gerar um usuario admin com essas informações, mas antes de executar, va ao model de user e desative a validação de foto, execute e reative a validação de photo, isso é um bug que não consegui resolver ate o momento por conta que para resolver tenho que usar outra biblioteca para upload de fotos

p arquivo está em: app/models/user.rb
```sh
  validates :photo, presence: true
```

mude para false, execute, defina como true

```sh
  email: keyllianazevedo2@gmail.com
  password: "123456",
  password_confirmation: "123456",
  confirmed_at: Time.now,
  role: 2,
  cpf: "24327784052", # CPF gerado pelo site https://www.4devs.com.br/gerador_de_cpf
  rg: "123456789",
  name: "Keyllian Azevedo",
  telephone: "55 92 36170584", # Telefone gerado pelo site https://geradornv.com.br/gerador-telefone/
```


### Executando o Projeto

Para executar o projeto localmente, utilize o Docker Compose:

```sh
docker-compose up
```

Se tudo ocorrer sem erros a aplicação estará disponível em `http://localhost:3000`.

## Testes

Por conta do limitado tempo de desenvolvimento, não consegui criar testes unitários, mas caso voce queira criar testes e executado o comando é o seguinte
```sh
bin/rails test
```

## Sobre documentaçaõ da API

Nesse periodo proposto, o tempo foi bastante corrido, devido a isso não consegui implementar o swagger para documentação das rotas e ect, mas aqui estão as principais rotas da api:

#### Autenticação

- **POST /users/sign_in**
  - Descrição: Realiza o login do usuário.
  - Parâmetros:
    - `email`: string (obrigatório)
    - `password`: string (obrigatório)
  - Respostas:
    - `200 OK`: Login bem-sucedido.
    - `401 Unauthorized`: Credenciais inválidas.

- **DELETE /users/sign_out**
  - Descrição: Realiza o logout do usuário.
  - Respostas:
    - `204 No Content`: Logout bem-sucedido.

#### Usuários

- **POST /users**
  - Descrição: Cria um novo usuário.
  - Parâmetros:
    - `email`: string (obrigatório)
    - `password`: string (obrigatório)
    - `name`: string (obrigatório)
    - `cpf`: string (obrigatório)
    - `rg`: string (obrigatório)
    - `telephone`: string (obrigatório)
    - `photo`: arquivo (obrigatório)
    - `role`: integer (obrigatório)
    - `unit_id`: uuid (opcional)
    - `sector_id`: uuid (opcional)
  - Respostas:
    - `201 Created`: Usuário criado com sucesso.
    - `422 Unprocessable Entity`: Erro de validação.

- **GET /users**
  - Descrição: Retorna a lista de usuários.
  - Respostas:
    - `200 OK`: Lista de usuários.

#### Visitantes

- **GET /visitors**
  - Descrição: Retorna a lista de visitantes.
  - Respostas:
    - `200 OK`: Lista de visitantes.

- **POST /visitors**
  - Descrição: Cria um novo visitante.
  - Parâmetros:
    - `name`: string (obrigatório)
    - `cpf`: string (obrigatório)
    - `rg`: string (obrigatório)
    - `telephone`: string (obrigatório)
    - `photo`: arquivo (obrigatório)
  - Respostas:
    - `201 Created`: Visitante criado com sucesso.
    - `422 Unprocessable Entity`: Erro de validação.

- **GET /visitors/:id**
  - Descrição: Retorna os detalhes de um visitante específico.
  - Parâmetros:
    - `id`: uuid (obrigatório)
  - Respostas:
    - `200 OK`: Detalhes do visitante.
    - `404 Not Found`: Visitante não encontrado.

#### Visitas

- **GET /visits**
  - Descrição: Retorna a lista de visitas.
  - Respostas:
    - `200 OK`: Lista de visitas.

- **POST /visits**
  - Descrição: Cria uma nova visita.
  - Parâmetros:
    - `visitor_id`: uuid (obrigatório)
    - `unit_id`: uuid (obrigatório)
    - `sector_id`: uuid (obrigatório)
    - `user_id`: uuid (opcional)
    - `date_time`: datetime (obrigatório)
    - `status`: integer (obrigatório)
  - Respostas:
    - `201 Created`: Visita criada com sucesso.
    - `422 Unprocessable Entity`: Erro de validação.

- **GET /visits/:id**
  - Descrição: Retorna os detalhes de uma visita específica.
  - Parâmetros:
    - `id`: uuid (obrigatório)
  - Respostas:
    - `200 OK`: Detalhes da visita.
    - `404 Not Found`: Visita não encontrada.

#### Setores

- **GET /sectors**
  - Descrição: Retorna a lista de setores.
  - Respostas:
    - `200 OK`: Lista de setores.

- **POST /sectors**
  - Descrição: Cria um novo setor.
  - Parâmetros:
    - `name`: string (obrigatório)
    - `unit_id`: uuid (obrigatório)
  - Respostas:
    - `201 Created`: Setor criado com sucesso.
    - `422 Unprocessable Entity`: Erro de validação.

- **GET /sectors/:id**
  - Descrição: Retorna os detalhes de um setor específico.
  - Parâmetros:
    - `id`: uuid (obrigatório)
  - Respostas:
    - `200 OK`: Detalhes do setor.
    - `404 Not Found`: Setor não encontrado.

#### Unidades

- **GET /units**
  - Descrição: Retorna a lista de unidades.
  - Respostas:
    - `200 OK`: Lista de unidades.

- **POST /units**
  - Descrição: Cria uma nova unidade.
  - Parâmetros:
    - `name`: string (obrigatório)
    - `email`: string (opcional)
  - Respostas:
    - `201 Created`: Unidade criada com sucesso.
    - `422 Unprocessable Entity`: Erro de validação.

- **GET /units/:id**
  - Descrição: Retorna os detalhes de uma unidade específica.
  - Parâmetros:
    - `id`: uuid (obrigatório)
  - Respostas:
    - `200 OK`: Detalhes da unidade.
    - `404 Not Found`: Unidade não encontrada.

## Contribuição

Sobre contribuições nesse projeto, elas são bem-vindas! Sinta-se à vontade para abrir issues e pull requests, caso esse projeto tome continuedade, podemos continuar o desenvolviemnto.

## Clonando o Repositório

Para clonar o repositório, siga os passos abaixo:

1. Abra o terminal.
2. Navegue até o diretório onde você deseja clonar o repositório.
3. Execute o comando abaixo

```sh
git clone https://github.com/Keyllian7/Dunnas-Challenge.git
```
Apos isso entre no diretorio com o comando
```sh
cd (para onde voce quer ir), caso não saiba o diretorio, de o comando (ls) no linux
```
Depois intale as dependencias do projeto
```sh
bundle install
```

## Imagens da web do projeto
Antes de ver a parte web do projeto, eu queria pedir desculpas por não ter um designer legal, não manjo muito da parte de front-end mas tentei fazer algo simples, pratico e agradavel, o modelo de CRUD foi baseeada na documentação com show, index, update, delete e new, então todos os modelos são iguais, claro que cada modelo tem suas informações diferentes.

abaixo deixei somente algumas imagens do projeto, se quiser velo completamente acesse o link do video no youtube onde eu mostro o projeto completo!

| Imagem | Link |
|--------|------|
| ![Imagem 1](https://drive.google.com/uc?id=14ICIj5ZtOtkDbvcueNPZ5XTqXJGoD4Nw) | [Visualizar](https://drive.google.com/file/d/14ICIj5ZtOtkDbvcueNPZ5XTqXJGoD4Nw/view?usp=sharing) |
| ![Imagem 2](https://drive.google.com/uc?id=17i-1K-f765ZyIaOIjhvdDahx3v6kGTh9) | [Visualizar](https://drive.google.com/file/d/17i-1K-f765ZyIaOIjhvdDahx3v6kGTh9/view?usp=sharing) |
| ![Imagem 3](https://drive.google.com/uc?id=1Bd2llu4iMPJl9683CTk_Schcm51rq4ki) | [Visualizar](https://drive.google.com/file/d/1Bd2llu4iMPJl9683CTk_Schcm51rq4ki/view?usp=sharing) |
| ![Imagem 4](https://drive.google.com/uc?id=1UF7UeOZEwE_ksMnNO3afY41CpBhJuJdS) | [Visualizar](https://drive.google.com/file/d/1UF7UeOZEwE_ksMnNO3afY41CpBhJuJdS/view?usp=sharing) |
| ![Imagem 5](https://drive.google.com/uc?id=1Yj9eiZcUUtKVifK09HmC5s1DOLhCSPlG) | [Visualizar](https://drive.google.com/file/d/1Yj9eiZcUUtKVifK09HmC5s1DOLhCSPlG/view?usp=sharing) |
| ![Imagem 6](https://drive.google.com/uc?id=1a6d5gbJCJXbBO-O7q1sRchiYv4PEg1Pe) | [Visualizar](https://drive.google.com/file/d/1a6d5gbJCJXbBO-O7q1sRchiYv4PEg1Pe/view?usp=sharing) |
| ![Imagem 7](https://drive.google.com/uc?id=1a_trbil75wTzCvC1xuPCne29Oyc6B45P) | [Visualizar](https://drive.google.com/file/d/1a_trbil75wTzCvC1xuPCne29Oyc6B45P/view?usp=sharing) |
| ![Imagem 8](https://drive.google.com/uc?id=1bkPfpqzHJP8_qT9ayBml5VDjcLMCnEnN) | [Visualizar](https://drive.google.com/file/d/1bkPfpqzHJP8_qT9ayBml5VDjcLMCnEnN/view?usp=sharing) |
| ![Imagem 9](https://drive.google.com/uc?id=1dw1PGjswhR5IJBLKlbirC0bjzu-wQIAN) | [Visualizar](https://drive.google.com/file/d/1dw1PGjswhR5IJBLKlbirC0bjzu-wQIAN/view?usp=sharing) |
| ![Imagem 10](https://drive.google.com/uc?id=1qYqtKCpCSX5dXaicO8JCNKQJQWBScxr7) | [Visualizar](https://drive.google.com/file/d/1qYqtKCpCSX5dXaicO8JCNKQJQWBScxr7/view?usp=sharing) |
| ![Imagem 11](https://drive.google.com/uc?id=1zK6jR4d2xAOKPUgu8PUCCbR7rPHcU89G) | [Visualizar](https://drive.google.com/file/d/1zK6jR4d2xAOKPUgu8PUCCbR7rPHcU89G/view?usp=sharing) |

### 📌 Como baixar as imagens

1. Clique no link de "Visualizar" correspondente à imagem desejada.
2. Você será redirecionado para o Google Drive onde poderá visualizar e baixar a imagem.

## Ainda sobre o desenvolvimento
Vou deixar imagens de algumas anotações que fiz durante o projeto, não considere a bagunça haha

![Anotação 1](https://drive.google.com/uc?id=1QPIVChj53cs7izm-cYklBcrH-VpZuSig)
![Anotação 2](https://drive.google.com/uc?id=1ueWf7o7s2QLQ5ESViJU8oUnumVK0-37g)



## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
