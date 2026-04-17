# Step 1: Use an official lightweight Node.js image.
# We use Alpine because it is much smaller, keeping our resulting image size tiny.
FROM node:18-alpine

# Step 2: Set the working directory inside our container to /app.
# All subsequent commands will be run from this directory.
WORKDIR /app

# Step 3: Copy only package.json and package-lock.json first.
# By copying these first, Docker can cache the 'npm install' step.
# It will only rerun 'npm install' if you change your dependencies.
COPY package*.json ./

# Install all the dependencies inside the container.
RUN npm install

# Step 4: Copy the rest of your application files into the container.
COPY . .

# Step 5: Expose the port your app runs on.
# This acts as documentation allowing developers to know which port to map.
EXPOSE 3000

# Step 6: Define the command to start your app.
# This uses the "start" script defined in your package.json.
CMD ["npm", "start"]
