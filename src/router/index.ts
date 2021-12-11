import { Router } from "express";
import indexHandler from "../endpoints";

function createRouter() {
  const router = Router();

  router.get("/", indexHandler);

  return router;
}

export default createRouter;
