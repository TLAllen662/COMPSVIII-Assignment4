# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . .

# Expose port 3000 so the app can be accessed from outside the container
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
