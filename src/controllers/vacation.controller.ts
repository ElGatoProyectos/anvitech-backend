import { vacationService } from "../service/vacation.service";
import { Request, Response } from "express";

class VacationController {
  async vacationPost(request: Request, response: Response): Promise<void> {
    try {
      const body = request.body;

      const serviceResponse = await vacationService.create(body);

      response.status(serviceResponse.statusCode).json(serviceResponse.content);
    } catch (error) {
      response.status(500).json(error);
    }
  }
}

export const vacationController = new VacationController();
