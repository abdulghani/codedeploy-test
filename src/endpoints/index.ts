import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  const name = req.query.name ?? "world";
  return res.status(200).send({
    message: `hello ${name}`,
    param: Object.keys(req.query).length > 0 ? req.query : undefined,
  });
};

export default indexHandler;
