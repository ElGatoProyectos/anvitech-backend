"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.cronStart = void 0;
const data_service_1 = require("../service/data.service");
const node_cron_1 = __importDefault(require("node-cron"));
function cronStart() {
    node_cron_1.default.schedule("*/2 * * * *", () => __awaiter(this, void 0, void 0, function* () {
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
                    yield data_service_1.dataService.instanceDataInit(dayOfMonth, dayOfMonth, year, month, true);
                }
            }
        }
        catch (error) {
            console.log(error);
        }
    }));
}
exports.cronStart = cronStart;
