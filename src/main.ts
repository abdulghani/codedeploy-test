import express from "express";
import createRouter from "./router";

async function main() {
  const port = 3000;
  const app = express().use(express.json());

  app.use(createRouter());

  app.listen(3000, () => console.log("APP RUNNING ON PORT", port));
}

main();
