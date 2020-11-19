CREATE TABLE `doctor`
(
    `name`       varchar(255) NOT NULL,
    `last_name`  varchar(255) NOT NULL,
    `id`         varchar(255) NOT NULL,
    `speciality` varchar(255) NOT NULL,
    `experience` int DEFAULT NULL,
    PRIMARY KEY (`id`)
);
CREATE TABLE `patient`
(
    `name`       varchar(255) NOT NULL,
    `last_name`  varchar(255) NOT NULL,
    `id`         varchar(255) NOT NULL,
    `address`    varchar(255) NOT NULL,
    `password`   varchar(255) NOT NULL,
    `doctor_id`  varchar(255) NOT NULL,
    `birth_date` date         NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`doctor_id`) REFERENCES doctor (`id`)
);
CREATE TABLE `prescription`
(
    `id`         bigint       NOT NULL,
    `date`       date         NOT NULL,
    `doctor_id`  varchar(255) NOT NULL,
    `patient_id` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`doctor_id`) REFERENCES doctor (id),
    FOREIGN KEY (`patient_id`) REFERENCES patient (id)
);