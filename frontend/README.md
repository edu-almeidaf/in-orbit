# Configuração e Execução do Frontend

Este é o README para o frontend do projeto, desenvolvido com **React** e **Vite**. Abaixo estão as instruções para configurar o ambiente de desenvolvimento e rodar o projeto localmente.

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em seu sistema:

- [Node.js](https://nodejs.org/) (versão 20 ou superior, para esse projeto eu utilizei a versão 20.14.0)
- [npm](https://www.npmjs.com/) ou [Yarn](https://classic.yarnpkg.com/) (gerenciador de pacotes)
- Além disso, esse projeto depende do backend previamente configurado. Se você ainda não configurou, pode fazê-lo [clicando aqui](../backend/README.md)

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

2. **Navegue até o diretório do Frontend**
   ```bash
   cd frontend
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

4. **Rode o projeto**
- npm:
    ```bash
    npm run dev
    ```
- yarn:
    ```bash
    yarn dev
    ```

## Avisos:
- Caso opte por rodar o projeto com Yarn, remova o arquivo package-lock.json. Isso garantirá que o arquivo yarn.lock seja utilizado corretamente

- Esse projeto roda na porta **5173**. Caso já tenha outro serviço rodando nesta porta, pode facilmente substituir a porta dentro do arquivo `vite.config.js`. Para isso, basta adicionar a chave `server` conforme o exemplo abaixo:

  ```bash
  import { defineConfig } from 'vite'
  import react from '@vitejs/plugin-react'

  // https://vitejs.dev/config/
  export default defineConfig({
    plugins: [react()],
    server: {
      port: 5173 //Número da porta desejada
    }
  })
  ```
---

## Contato

Se você tiver dúvidas ou sugestões, entre em contato:

- Email: [eduardoa.fernandes@hotmail.com](mailto:eduardoa.fernandes@hotmail.com)
- LinkedIn: [Eduardo de Almeida Fernandes](https://linkedin.com/in/almeidaedu)

---

## Licença

Este projeto está licenciado sob os termos da [MIT License](../LICENSE).
  