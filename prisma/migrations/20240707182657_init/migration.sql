-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dni` VARCHAR(191) NOT NULL,
    `full_name` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `enabled` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Report` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date_created` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `name` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailReport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `report_id` INTEGER NOT NULL,
    `tardanza` VARCHAR(191) NOT NULL,
    `falta` VARCHAR(191) NOT NULL,
    `dia` VARCHAR(191) NOT NULL,
    `fecha_reporte` DATETIME(3) NOT NULL,
    `dni` VARCHAR(191) NOT NULL,
    `nombre` VARCHAR(191) NOT NULL,
    `supervisor` VARCHAR(191) NULL,
    `sede` VARCHAR(191) NOT NULL,
    `hora_entrada` VARCHAR(191) NULL,
    `hora_inicio` VARCHAR(191) NULL,
    `hora_inicio_refrigerio` VARCHAR(191) NULL,
    `hora_fin_refrigerio` VARCHAR(191) NULL,
    `hora_salida` VARCHAR(191) NULL,
    `daily_license` VARCHAR(191) NULL,
    `reason_license` VARCHAR(191) NULL,
    `discount` DOUBLE NULL,
    `worker_status` VARCHAR(191) NULL,
    `incidentId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Worker` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(191) NOT NULL,
    `dni` VARCHAR(191) NOT NULL,
    `type_dni` VARCHAR(191) NULL,
    `type_contract` VARCHAR(191) NULL,
    `department` VARCHAR(191) NOT NULL,
    `position` VARCHAR(191) NULL,
    `supervisor` VARCHAR(191) NULL,
    `coordinator` VARCHAR(191) NULL,
    `management` VARCHAR(191) NULL,
    `company` VARCHAR(191) NULL,
    `company_ruc` VARCHAR(191) NULL,
    `hire_date` DATETIME(3) NULL,
    `termination_date` DATETIME(3) NULL,
    `reason` VARCHAR(191) NULL,
    `enabled` VARCHAR(191) NULL DEFAULT 'si',

    UNIQUE INDEX `Worker_dni_key`(`dni`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TypeTermination` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NOT NULL,
    `lunes` VARCHAR(191) NOT NULL,
    `martes` VARCHAR(191) NOT NULL,
    `miercoles` VARCHAR(191) NOT NULL,
    `jueves` VARCHAR(191) NOT NULL,
    `viernes` VARCHAR(191) NOT NULL,
    `sabado` VARCHAR(191) NOT NULL,
    `domingo` VARCHAR(191) NOT NULL,
    `comments` VARCHAR(191) NULL,
    `type` VARCHAR(191) NULL,

    UNIQUE INDEX `Schedule_worker_id_key`(`worker_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TypeSchedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `lunes` VARCHAR(191) NOT NULL,
    `martes` VARCHAR(191) NOT NULL,
    `miercoles` VARCHAR(191) NOT NULL,
    `jueves` VARCHAR(191) NOT NULL,
    `viernes` VARCHAR(191) NOT NULL,
    `sabado` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `TypeSchedule_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vacation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NOT NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `reason` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Permissions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NOT NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `reason` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Incident` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Licence` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `reason` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MedicalRest` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NULL,
    `start_date` DATETIME(3) NOT NULL,
    `end_date` DATETIME(3) NOT NULL,
    `reason` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DetailReportIncident` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `detail_report_id` INTEGER NOT NULL,
    `incident_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DetailReport` ADD CONSTRAINT `DetailReport_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `Report`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailReport` ADD CONSTRAINT `DetailReport_incidentId_fkey` FOREIGN KEY (`incidentId`) REFERENCES `Incident`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Schedule` ADD CONSTRAINT `Schedule_worker_id_fkey` FOREIGN KEY (`worker_id`) REFERENCES `Worker`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Vacation` ADD CONSTRAINT `Vacation_worker_id_fkey` FOREIGN KEY (`worker_id`) REFERENCES `Worker`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Permissions` ADD CONSTRAINT `Permissions_worker_id_fkey` FOREIGN KEY (`worker_id`) REFERENCES `Worker`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Licence` ADD CONSTRAINT `Licence_worker_id_fkey` FOREIGN KEY (`worker_id`) REFERENCES `Worker`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `MedicalRest` ADD CONSTRAINT `MedicalRest_worker_id_fkey` FOREIGN KEY (`worker_id`) REFERENCES `Worker`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailReportIncident` ADD CONSTRAINT `DetailReportIncident_incident_id_fkey` FOREIGN KEY (`incident_id`) REFERENCES `Incident`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DetailReportIncident` ADD CONSTRAINT `DetailReportIncident_detail_report_id_fkey` FOREIGN KEY (`detail_report_id`) REFERENCES `DetailReport`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
