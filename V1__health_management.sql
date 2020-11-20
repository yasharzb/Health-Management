DROP DATABASE IF EXISTS health_management;
CREATE DATABASE health_management;
USE health_management;
CREATE TABLE doctor
(
    name       varchar(255) NOT NULL,
    last_name  varchar(255) NOT NULL,
    id         varchar(255) NOT NULL,
    speciality varchar(255) NOT NULL,
    experience int DEFAULT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE patient
(
    name       varchar(255) NOT NULL,
    last_name  varchar(255) NOT NULL,
    id         varchar(255) NOT NULL,
    address    TEXT DEFAULT NULL,
    password   varchar(255) NOT NULL,
    doctor_id  varchar(255) NOT NULL,
    birth_date date         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (doctor_id) REFERENCES doctor (id)
);
CREATE TABLE prescription
(
    id         bigint       NOT NULL,
    date       date         NOT NULL,
    doctor_id  varchar(255) NOT NULL,
    patient_id varchar(255) NOT NULL,
    PRIMARY KEY (id, patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor (id),
    FOREIGN KEY (patient_id) REFERENCES patient (id)
);
CREATE TABLE pharmaceutical_companies
(
    name         varchar(255) PRIMARY KEY NOT NULL,
    phone_number varchar(255)             NOT NULL
);

CREATE TABLE pharmacies
(
    id           varchar(255) PRIMARY KEY NOT NULL,
    name         varchar(255)             NOT NULL,
    address      TEXT                     NOT NULL,
    phone_number varchar(255)             NOT NULL
);

CREATE TABLE contracts
(
    id               varchar(255) PRIMARY KEY NOT NULL,
    contraction_date DATE                     NOT NULL,
    end_date         DATE                     NOT NULL,
    text             TEXT                     NOT NULL,
    company_id       varchar(255)             NOT NULL NOT NULL,
    pharmacy_id      varchar(255)             NOT NULL NOT NULL,
    FOREIGN KEY (company_id) REFERENCES pharmaceutical_companies (name),
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies (id)
);

CREATE TABLE drug
(
    pharmaceutical_company_name varchar(255) NOT NULL,
    drug_trade_name             varchar(255) NOT NULL,
    formula                     TEXT         NOT NULL,
    PRIMARY KEY (pharmaceutical_company_name, drug_trade_name),
    FOREIGN KEY (pharmaceutical_company_name) REFERENCES pharmaceutical_companies (name)
);

CREATE TABLE sell
(
    pharmacy_id                 varchar(255) NOT NULL,
    price                       INTEGER      NOT NULL,
    pharmaceutical_company_name varchar(255) NOT NULL,
    drug_trade_name             varchar(255) NOT NULL,
    FOREIGN KEY (pharmacy_id) REFERENCES pharmacies (id),
    FOREIGN KEY (pharmaceutical_company_name, drug_trade_name) REFERENCES drug (pharmaceutical_company_name, drug_trade_name)
);

CREATE TABLE prescription_drug
(
    prescription_id             bigint       NOT NULL,
    patient_id                  varchar(255) NOT NULL,
    count                       int          NOT NULL,
    pharmaceutical_company_name varchar(255) NOT NULL,
    drug_trade_name             varchar(255) NOT NULL,
    FOREIGN KEY (prescription_id, patient_id) REFERENCES prescription (id, patient_id),
    FOREIGN KEY (pharmaceutical_company_name, drug_trade_name) REFERENCES drug (pharmaceutical_company_name, drug_trade_name)
);

INSERT INTO doctor
VALUES ('yashar', 'yashar', '0123456789', 'Heart specialist', 5);
INSERT INTO patient
VALUES ('sadeq', 'sadeq', '9876543210', 'Khuneye aqa sadeq', '1234', '0123456789', '1999-12-17');
INSERT INTO prescription
VALUES (100, '2020-11-19', '0123456789', '9876543210');
INSERT INTO pharmacies
VALUES ('alef_1234', 'jafars drug store', 'Sadr, Hemat, folan', '+982122758395');
INSERT INTO pharmaceutical_companies
VALUES ('khafan_tolid', '+9877262435');
INSERT INTO drug
VALUES ('khafan_tolid', 'water', 'H2O');
INSERT INTO drug
VALUES ('khafan_tolid', 'roghan banafshe', 'Unknown');
INSERT INTO prescription_drug
VALUES (100, '9876543210', 2, 'khafan_tolid', 'water');
INSERT INTO prescription_drug
VALUES (100, '9876543210', 2, 'khafan_tolid', 'roghan banafshe');
INSERT INTO contracts
VALUES ('vav2222', '2020-12-11', '2024-12-11', 'in daroo haro befrooshid va sood haye faravan bebarid', 'khafan_tolid',
        'alef_1234');
INSERT INTO sell
VALUES ('alef_1234', 100000, 'khafan_tolid', 'water')
