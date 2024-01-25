# step 1 - set the base image (ex: official nodejs base image)
FROM node:12

# step 2 - set the working directory for any subsequent instructions (the root path of the image filesystem)
WORKDIR /app

# step 3 - copy files of folders from the {source} to the {destination} path in the image filesystem
COPY package*.json ./

# step 4 - runs a command in the Terminal
# when it's finished, the results will be commited to the docker image as a layer
# SHELL FORM (shell command)
RUN npm install

# step 5 - copy the source code to the root path of the image filesystem
# ignores the "node_modules" folder because of ".dockerignore" file, 
#  so the modules installed in Step 4 are not overwritten
COPY . .

# step 6 - set the environment variable to listen on port 8080 (the same port set in the node project)
ENV PORT=8080

# step 7 - define the network ports that this container will listen on at runtime
EXPOSE 8080

# step 8 - tells the container how to run the application, starting a process without opening a Shell Prompt
# there can be only one CMD instruction per Dockerfile 
# more adequate then the "RUN" command
# EXEC FORM (array of instructions)
CMD [ "npm", "start" ]