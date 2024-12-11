FROM node:18

COPY server.js . 

EXPOSE 80


CMD ["node", "server.js"]
