import { dataService } from "../service/data.service";
import cron from "node-cron";

export function cronStart() {
  cron.schedule("*/2 * * * *", async () => {
    try {
      const limaTime = new Date().toLocaleString("en-US", {
        timeZone: "America/Lima",
      });
      const limaDate = new Date(limaTime);
      const previousDayTimestamp = limaDate.getTime() - 24 * 60 * 60 * 1000;
      const previousDayDate = new Date(previousDayTimestamp);

      const dayOfWeek = limaDate.getDay();

      // solo evitaria si fuese lunes, porque si es lunes jalaria del domingo
      if (dayOfWeek !== 1) {
        const dayOfMonth = previousDayDate.getDate();
        const month = previousDayDate.getMonth() + 1;
        const year = previousDayDate.getFullYear();
        const currentHour = new Date(limaTime).getHours();

        if (currentHour === 19) {
          await dataService.instanceDataInit(
            dayOfMonth,
            dayOfMonth,
            year,
            month,
            true
          );
        }
      }
    } catch (error) {
      console.log(error);
    }
  });
}
