import { Router } from "express";
import indexHandler from "../endpoints";
import pingHandler from "../endpoints/ping";

function createRouter() {
  const router = Router();

  router.get("/", indexHandler);
  router.get("/ping", pingHandler);

  return router;
}

export default createRouter;
