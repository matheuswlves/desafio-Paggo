# Usa uma imagem leve do Node.js
FROM node:18-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas package.json e package-lock.json para instalar dependências primeiro (otimiza cache)
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código
COPY . .

# Compila o projeto NestJS
RUN npm run build

# Expondo a porta padrão do NestJS
EXPOSE 3000

# Comando para rodar a aplicação
CMD ["npm", "run", "start:prod"]
