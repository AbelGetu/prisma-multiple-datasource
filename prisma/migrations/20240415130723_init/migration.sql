-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `age` INTEGER NOT NULL,
    `role` ENUM('BASIC', 'ADMIN') NOT NULL DEFAULT 'BASIC',
    `userPreferenceId` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_userPreferenceId_key`(`userPreferenceId`),
    INDEX `User_email_idx`(`email`),
    UNIQUE INDEX `User_age_name_key`(`age`, `name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserPreference` (
    `id` VARCHAR(191) NOT NULL,
    `emailUpdates` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_userPreferenceId_fkey` FOREIGN KEY (`userPreferenceId`) REFERENCES `UserPreference`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
