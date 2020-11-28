DROP DATABASE IF EXISTS db_HW2_1;
create database db_HW2_1;

use db_HW2_1;

CREATE TABLE `doctor`
(
    `NationalID` char(10) primary key not null,
    `FirstName`  varchar(32)          not null,
    `LastName`   varchar(32)          not null,
    `Profession` varchar(32)          not null,
    `Background` int(2)               not null
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `patient`
(
    `NationalID`   char(10) primary key,
    `FirstName`    varchar(32)  not null,
    `LastName`     varchar(32)  not null,
    `Address`      varchar(256),
    `BirthYear`    YEAR         not null,
    `Password`     VARCHAR(256) not null,
    `MainDoctorId` char(10)     not null,
    foreign key (MainDoctorId) references doctor (NationalID) ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `pharmacy`
(
    `Id`        char(10) primary key not null,
    `Name`      varchar(32)          not null,
    `Address`   varchar(256),
    `Telephone` char(10)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `company`
(

    `Name`      varchar(32) primary key not null,
    `Telephone` char(10)
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `contract`
(
    `Id`          char(10) primary key not null,
    `Text`        varchar(1024),
    `StartDate`   DATE                 not null,
    `EndDate`     DATE                 not null,
    `CompanyName` varchar(32)          not null,
    `PharmacyId`  char(10)             not null,
    FOREIGN KEY (CompanyName) references company (Name) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PharmacyId) references pharmacy (Id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `drug`
(
    `Name`        varchar(100) not null,
    `Formula`     varchar(100) not null,
    `CompanyName` varchar(32)  not null,
    primary key (Name, CompanyName),
    FOREIGN KEY (CompanyName) references company (Name) ON UPDATE CASCADE ON DELETE CASCADE

) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `sale`
(
    `Price`       INT          NOT NULL,
    `DrugName`    varchar(100) NOT NULL,
    `CompanyName` varchar(32)  NOT NULL,
    `PharmacyId`  char(10)     NOT NULL,
    primary key (DrugName, CompanyName, PharmacyId),
    FOREIGN KEY (DrugName, CompanyName) references drug (Name, CompanyName) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PharmacyId) references pharmacy (Id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `prescription`
(
    `Id`               char(10) not null,
    `PrescriptionDate` DATE     not null,
    `DoctorId`         char(10) not null,
    `PatientId`        char(10) not null,
    PRIMARY KEY (Id, DoctorId, PatientId),
    FOREIGN KEY (DoctorId) references doctor (NationalID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (PatientId) references patient (NationalID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `drug_prescription`
(
    `PrescriptionId` char(10)     not null,
    `DoctorId`       char(10)     not null,
    `PatientId`      char(10)     not null,
    `DrugName`       varchar(100) not null,
    `CompanyName`    varchar(32)  not null,
    `Quantity`       int          not null,
    primary key (PrescriptionId, DoctorId, PatientId, DrugName, CompanyName),
    FOREIGN KEY (PrescriptionId, DoctorId, PatientId) references prescription (Id, DoctorId, PatientId) On UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DrugName, CompanyName) references drug (Name, CompanyName) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


##################### VALUES
USE db_HW2_1;
INSERT INTO company
VALUES ('comp', '1234567890');

INSERT INTO company
VALUES ('comp2', '1234567890');
INSERT INTO drug
VALUES ('water', 'h20', 'comp');
INSERT INTO drug
VALUES ('med', 'idk', 'comp');
INSERT INTO drug
VALUES ('chizak2', 'C1H2O12H15', 'comp2');
INSERT INTO drug
VALUES ('chiz2', 'C1H2O3H4', 'comp');
INSERT INTO doctor
VALUES ('docid', 'doc', 'doctor', 'hamechi', 0);
INSERT INTO doctor
VALUES ('di', 'docy', 'doctor', 'baf', 2);
INSERT INTO patient
VALUES ('0012345678', 'mahdi', 'bazhammahdi', 'iran', 1999, 'nope', 'docid');
INSERT INTO patient
VALUES ('fa', 'fas', 'fadsfas', 'iran', 1999, 'nope', 'di');
INSERT INTO patient
VALUES ('pate', 'pete', 'petian', 'usa', 1999, 'nope', 'docid');
INSERT INTO prescription
VALUES ('p', '13990710', 'docid', '0012345678');
INSERT INTO prescription
VALUES ('p2', '13990710', 'docid', '0012345678');
INSERT INTO prescription
VALUES ('p3', '13990710', 'docid', 'pate');
INSERT INTO prescription
VALUES ('p4', '13990710', 'docid', 'pate');
INSERT INTO prescription
VALUES ('p5', '20101011', 'docid', '0012345678');

INSERT INTO prescription
VALUES ('p6', '13990710', 'docid', 'pate');
INSERT INTO prescription
VALUES ('p8', '20101220', 'di', 'pate');

INSERT INTO prescription
VALUES ('p9', '20101220', 'di', '0012345678');
INSERT INTO drug_prescription
VALUES ('p', 'docid', '0012345678', 'water', 'comp', 4);
INSERT INTO drug_prescription
VALUES ('p', 'docid', '0012345678', 'med', 'comp', 4);
INSERT INTO drug_prescription
VALUES ('p3', 'docid', 'pate', 'med', 'comp', 3);

INSERT INTO drug_prescription
VALUES ('p4', 'docid', 'pate', 'med', 'comp', 6);
INSERT INTO drug_prescription
VALUES ('p4', 'docid', 'pate', 'water', 'comp', 6);

INSERT INTO drug_prescription
VALUES ('p5', 'docid', '0012345678', 'water', 'comp', 20);

INSERT INTO drug_prescription
VALUES ('p6', 'docid', 'pate', 'water', 'comp', 20);

INSERT INTO pharmacy
VALUES ('pharm', 'ph', 'Tehran', '123');
INSERT INTO pharmacy
VALUES ('notpharm', 'ph', 'NotTehran', '456');
INSERT INTO pharmacy
VALUES ('notpharm2', 'ph', 'NotTehran', '789');
INSERT INTO sale
VALUES (5, 'med', 'comp', 'pharm');
INSERT INTO sale
VALUES (100, 'med', 'comp', 'notpharm');
INSERT INTO sale
VALUES (10, 'med', 'comp', 'notpharm2');

INSERT INTO contract
VALUES ('f2asdf', 'fads', '20200101', '20201212', 'comp', 'pharm');
INSERT INTO contract
VALUES ('fa3sdf', 'fads2', '20200101', '20201212', 'comp', 'pharm');
INSERT INTO contract
VALUES ('fasdaads', 'fasdfasfda', '20200101', '20201212', 'comp2', 'notpharm');
#####################

# Q1
SELECT DISTINCT DrugName, CompanyName
FROM drug_prescription
WHERE PatientId = '0012345678';

# Q2
SELECT FirstName
FROM patient
WHERE NationalID IN
      (SELECT PatientId
       FROM drug_prescription
       WHERE DrugName = 'med'
         AND CompanyName = 'comp'
         AND Quantity > 3
      );

# Q3
SELECT Id, Telephone
FROM pharmacy
WHERE Id IN (SELECT PharmacyId FROM sale WHERE DrugName = 'med' AND Price < 100)
  and Address LIKE 'Tehran%';

# Q4
SELECT COUNT(DISTINCT PatientId)
FROM prescription
WHERE DoctorId in (
    SELECT doctor.NationalID
    FROM doctor
    WHERE doctor.FirstName = 'doc'
      AND doctor.LastName = 'doctor'
)
  AND PrescriptionDate = '1399-07-10'
  AND (
          SELECT SUM(Quantity)
          FROM drug_prescription
          WHERE PrescriptionId = prescription.Id
            AND DoctorId = prescription.DoctorId
            AND PatientId = prescription.PatientId) > 10;

#Q5
SELECT company.Name
FROM company
WHERE (
          SELECT COUNT(contract.CompanyName)
          FROM contract
          WHERE contract.CompanyName = company.Name)
          !=
      (SELECT cnt
       FROM (SELECT CompanyName, COUNT(contract.CompanyName) AS cnt FROM contract GROUP BY CompanyName) as MX
       ORDER BY cnt DESC
       LIMIT 1) AND company.Name IN (SELECT drug.CompanyName FROM drug WHERE drug.Formula REGEXP  'C[0-9]*H[0-9]*O[0-9]*H[0-9]*');;


# Q6
SELECT *
FROM doctor
WHERE NationalID IN (
    SELECT DoctorId
    FROM (
             SELECT DoctorId, COUNT(Id) AS cnt
             FROM prescription
             WHERE PatientId = '0012345678'
             GROUP BY DoctorId) AS TMP
    WHERE cnt > 2);