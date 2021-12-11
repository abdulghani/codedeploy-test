## BUILDER
FROM node:14 AS build
COPY . /app
WORKDIR /app

RUN npm install
RUN npm run build

## RUNNER
FROM gcr.io/distroless/nodejs:14
COPY --from=build /app/build /app/build
COPY --from=build /app/package*.json /app/
WORKDIR /app

RUN npm ci --only=production

CMD ["./build/main.js"]