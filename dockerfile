FROM node:18


#Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies

# Copy the rest of the application code to the working directory


# Expose port 8080 as required by the server
EXPOSE 80

# Define the command to run the application
CMD ["node", "server.js"]
