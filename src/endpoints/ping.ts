import { RequestHandler } from "express";

const pingHandler: RequestHandler = async (req, res) => {
  res.status(200).send({
    message: "pong",
    query: Object.keys(req.query).length > 0 ? req.query : undefined,
  });
};

export default pingHandler;
