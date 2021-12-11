import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  return res.status(200).send({
    message: "hello world",
    param: req.query,
  });
};

export default indexHandler;
