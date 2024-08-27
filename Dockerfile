# Använd en officiell Node.js-bild som bas
FROM node:18-alpine

# Installera nödvändiga byggverktyg
RUN apk add --no-cache python3 make g++

# Ställ in arbetskatalog
WORKDIR /app

# Kopiera package.json och package-lock.json
COPY package*.json ./

# Installera beroenden
RUN npm install

# Kopiera resten av applikationen
COPY . .

# Bygg Next.js-applikationen
RUN npm run build

# Exponera Render.coms port (10000 via PORT variabel)
EXPOSE $PORT

# Starta applikationen på den angivna porten
CMD ["npm", "start"]
