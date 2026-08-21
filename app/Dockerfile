# --- Build Stage ---
FROM node:18 AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY server.js .

# --- Runtime Stage ---
FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["node", "server.js"]