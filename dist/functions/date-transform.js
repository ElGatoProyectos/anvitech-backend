"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.returnFormatDate = exports.formatDateForPrisma = exports.excelSerialDateToJSDate = void 0;
function excelSerialDateToJSDate(serial) {
    const excelEpoch = new Date(1900, 0, 1);
    // const days = serial - 1; esto aumentaba supuestamente uno a la fecha
    const days = serial;
    return new Date(excelEpoch.getTime() + days * 24 * 60 * 60 * 1000);
}
exports.excelSerialDateToJSDate = excelSerialDateToJSDate;
function formatDateForPrisma(date) {
    const newDate = new Date(date);
    return newDate.toISOString();
}
exports.formatDateForPrisma = formatDateForPrisma;
function returnFormatDate(serial) {
    const date = excelSerialDateToJSDate(serial);
    return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`;
}
exports.returnFormatDate = returnFormatDate;
