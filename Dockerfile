# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (for efficient caching)
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the app's source code
COPY . .

# Expose the port Fly.io will use
EXPOSE 8080

# Start the application
CMD ["node", "index.js"]
