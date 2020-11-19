USE HealthManagment;
CREATE TABLE pharmaceutical_companies (
    name CHAR(15) PRIMARY KEY,
    phone_number CHAR(13)
);

CREATE TABLE contracts (
    id CHAR(15) PRIMARY KEY,
    contraction_date DATE,
    end_date DATE,
    text TEXT
);

CREATE TABLE pharmacies (
    id CHAR(15) PRIMARY KEY,
    name CHAR(20),
    address TEXT,
    phone_number CHAR(13)
);

CREATE TABLE pharmaceutical_contracts (
    pharmaceutical_company_name CHAR(15),
    contract_id CHAR(15)
);

CREATE TABLE pharmacy_contracts  (
    pharmacy_id CHAR(15),
    contract_id CHAR(15)
);

CREATE TABLE drug (
    pharmaceutical_company_name CHAR(15),
    drug_trade_name CHAR(20),
    formula TEXT,
    PRIMARY KEY (pharmaceutical_company_name , drug_trade_name),
    FOREIGN KEY (pharmaceutical_company_name) REFERENCES pharmaceutical_companies (name) ON DELETE  CASCADE
);

CREATE TABLE sell (
    pharmacy_id CHAR(15),
    price INTEGER,
    pharmaceutical_company_name CHAR(15),
    drug_trade_name CHAR(20)
);

INSERT INTO pharmacies VALUES ('alef_1234', 'jafars drug store', 'Sadr, Hemat, folan', '+982122758395');
INSERT INTO pharmaceutical_companies VALUES ('khafan_tolid', '+9877262435');
INSERT INTO contracts VALUES ('vav2222', '2020-12-11', '2024-12-11', 'in daroo haro befrooshid va sood haye faravan bebarid');
INSERT INTO pharmacy_contracts VALUES ('alef_1234', 'vav2222');
INSERT INTO pharmaceutical_contracts VALUES ('khafan_tolid', 'vav2222');
INSERT INTO drug VALUES ('khafan_tolid', 'water', 'H2O');
INSERT INTO sell VALUES ('alef_1234', 100000, 'khafan_tolid', 'water')

SELECT  * FROM pharmacies;
SELECT  * FROM pharmaceutical_companies;
SELECT  * FROM contracts;
SELECT  * FROM pharmacy_contracts;
SELECT  * FROM pharmaceutical_contracts;
SELECT  * FROM drug;
SELECT  * FROM sell;

DELETE FROM pharmaceutical_companies WHERE name='khafan_tolid';
SELECT  * FROM drug;

