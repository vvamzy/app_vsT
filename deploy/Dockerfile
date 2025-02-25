# Use an official Node.js image as the base
FROM node:14

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
