import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  const name = req.query.name ?? "there";
  return res.status(200).send({
    message: `hello ${name}. updated change`,
    query: req.query,
  });
};

export default indexHandler;
