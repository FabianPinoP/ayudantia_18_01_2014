import express from 'express';
import {getAllSessions} from "../../src/api/v1/controllers/sessionsController.js";
const router = express.Router();

router.get('/sessions', getAllSessions);

export default router;