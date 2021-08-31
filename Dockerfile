# Tagging this stage as builder
FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run builder


# We don't need to specify another stage, since the presence of another "FROM" will terminate the previous stage
FROM nginx
# Copy something from the previous phase into specified directory by nginx to be served up

COPY --from=builder /app/build /usr/share/nginx/html