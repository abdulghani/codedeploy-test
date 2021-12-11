import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  const name = req.query.name + "!" ?? "world";
  return res.status(200).send({
    message: `hello ${name}`,
    param: req.query,
  });
};

export default indexHandler;
