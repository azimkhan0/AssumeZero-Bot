# Use official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application files
COPY . .

# Expose the port your app runs on
EXPOSE 4000

# Set environment variable for production
ENV NODE_ENV=production

# Start the application
CMD ["node", "server.js"]
