import { RequestHandler } from "express";

const indexHandler: RequestHandler = async (req, res) => {
  const name = req.query.name ?? "there";
  return res.status(200).send({
    message: `hello ${name}. update from swarm test`,
    param: Object.keys(req.query).length > 0 ? req.query : undefined,
  });
};

export default indexHandler;
