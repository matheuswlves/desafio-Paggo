# Usando uma imagem oficial do Node.js como base
FROM node:18-alpine

# Definindo o diretório de trabalho dentro do container
WORKDIR /app

# Copiando o package.json e o package-lock.json
COPY package*.json ./

# Instalando as dependências
RUN npm install

# Copiando o restante dos arquivos
COPY . .

# Compilando o projeto
RUN npm run build

# Expondo a porta que o NestJS utiliza
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "run", "start:prod"]
