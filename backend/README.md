# Configuração e Execução do Backend

Este é o README para o backend do projeto, desenvolvido com **Node.js** e **Fastify**. O banco de dados **PostgreSQL** é configurado usando **Docker** e estou utilizando o **Drizzle ORM** para as queries no banco de dados. Abaixo estão as instruções para configurar e rodar o backend localmente.

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em seu sistema:

- [Node.js](https://nodejs.org/) (versão 20 ou superior, para esse projeto eu utilizei a versão 20.14.0)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Instalação

1. **Clone o Repositório**

   Se ainda não tiver o repositório clonado, faça isso com o comando:

- HTTPS:
   ```bash
   git clone https://github.com/edu-almeidaf/in-orbit.git
   ```

- SSH:
   ```bash
   git clone git@github.com:edu-almeidaf/in-orbit.git
   ```
##

2. **Navegue até o diretório do Backend**
    
    ```bash
    cd backend
    ```
##

3. **Instale as dependências**

    Você pode instalar usando npm ou yarn:
- npm:
    ```bash
    npm install
    ```
- yarn:
    ```bash
    yarn install
    ```
##

4. **Configure o arquivo .env**
    
    Copie o conteúdo do arquivo .env.example para o arquivo .env:
    ```bash
    cp .env.example .env
    ```
  - **OBS**: Substitua as variáveis `<usuario>`, `<senha>`, e `<nome_do_banco>` conforme sua preferência.

##

5. **Verificação do Docker**

    Certifique-se de que o Docker está rodando com o comando:
    ```bash
    docker info
    ```
    Se o comando retornar informações sobre o Docker, você está pronto para iniciar os containers. Caso contrário, inicie o Docker.

##

6. **Inicie o container docker do banco de dados**
    ```bash
    docker-compose up -d
    ```
##

7. **Rode as migrations do ORM**

    As migrations são scripts que criam ou modificam as tabelas no banco de dados para garantir que ele esteja sincronizado com o modelo da aplicação.
    Execute o comando:
    ```bash
    npm run migrate
    ```
##

8. **Inicie o servidor**
- npm:
    ```bash
    npm run dev
    ```
- yarn:
    ```bash
    yarn dev
    ```
##

9. **[OPCIONAL]: Rode o seed**
    
    Caso você queira iniciar o projeto com as tabelas do banco já populadas, rode o comando abaixo:
    ```bash
    npm run seed
    ```
##

## Testes
(Em breve) - Atualmente, este projeto ainda não possui testes configurados. Assim que implementados, as instruções para rodar os testes serão adicionadas aqui.


## Avisos:
- Caso opte por rodar o projeto com Yarn, remova o arquivo package-lock.json. Isso garantirá que o arquivo yarn.lock seja utilizado corretamente.

- Este projeto roda na porta **3333**. Caso já tenha outro serviço rodando nesta porta, altere o valor da variável **PORT** no arquivo `.env`.

- Caso ocorra algum erro durante a execução, siga estas verificações:

  1. Verifique se o container do banco de dados está ativo com o comando: `docker ps`.

      Caso o container não esteja rodando, utilize o comando abaixo para visualizar os logs do container:
      ```bash
      docker-compose logs -f
      ```

  2. Verifique a versão do Node.js para garantir que está correta.

  3. Verifique se as variáveis de ambiente estão configuradas corretamente e se as migrations rodaram sem problemas.

- Para visualizar as tabelas do banco de dados, execute o seguinte comando:
    ```bash
    npx drizzle-kit studio
    ```
  Esse comando abrirá uma URL no terminal para você visualizar as tabelas e editar os dados diretamente pelo navegador.

## Contato

Se você tiver dúvidas ou sugestões, entre em contato:

- Email: [eduardoa.fernandes@hotmail.com](mailto:eduardoa.fernandes@hotmail.com)
- LinkedIn: [Eduardo de Almeida Fernandes](https://linkedin.com/in/almeidaedu)

---

## Licença

Este projeto está licenciado sob os termos da [MIT License](../LICENSE).
  