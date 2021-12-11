## BUILDER
FROM node:14 AS build
COPY . /app
WORKDIR /app

RUN npm install
RUN npm run build

## PACKAGE
FROM node:14 AS package
COPY ./package*.json /app/
WORKDIR /app

RUN npm ci --only=production

## RUNNER
FROM gcr.io/distroless/nodejs:14
COPY --from=build ./package*.json /app/
COPY --from=build /app/build /app/build
COPY --from=package /app/node_modules /app/node_modules
WORKDIR /app

EXPOSE 3000
CMD ["./build/main.js"]