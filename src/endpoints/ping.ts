import { RequestHandler } from "express";

const pingHandler: RequestHandler = async (req, res) => {
  res.status(200).send({
    message: "pong",
  });
};

export default pingHandler;
