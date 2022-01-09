import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  const name = req.query.name ?? "there";
  const rand = Math.floor(Math.random() * 100);

  return res.status(200).send({
    message: `hello ${name}. updated change`,
    random_number: rand,
    query: req.query,
  });
};

export default indexHandler;
