import express from "express";

async function main() {
  const app = express();
  app.use(express.json());
  const port = 3000;

  app.get("/", (req, res) => {
    res.send({
      message: "hello world",
      param: req.query,
    });
  });

  app.listen(3000, () => console.log("APP RUNNING ON PORT", port));
}

main();
