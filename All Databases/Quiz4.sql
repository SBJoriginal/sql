drop database cours_4_quiz;
CREATE DATABASE cours_4_quiz;
SHOW DATABASES;
USE cours_4_quiz;
SHOW TABLES;
CREATE TABLE Etudiants
(
    idul      varchar(100),
    nom       varchar(100),
    age       int(3),
    programme enum ('GLO','IFT','GIF'),
    PRIMARY KEY (idul)
);
CREATE TABLE Profs
(
    id          int(2),
    nom         varchar(100),
    département enum ('IFT','GLO','GIF'),
    PRIMARY KEY (id)
);
CREATE TABLE suivre
(
    idul  varchar(10),
    sigle char(20)
);
CREATE TABLE cours
(
    sigle char(20),
    nom   varchar(20),
    local char(20),
    prof  int(2),
    PRIMARY KEY (sigle)
);
INSERT INTO Etudiants(idul, nom, age, programme)
VALUES ('ALXYZ', 'Alice', 24, 'GLO'),
       ('BOUVW', 'Bob', 27, 'GLO'),
       ('CERST', 'Cédric', 22, 'IFT'),
       ('DIOPQ', 'Diane', 24, 'IFT'),
       ('ERLMN', 'Éric', 19, 'GIF'),
       ('FRIJK', 'Frank', 22, 'GIF');
INSERT INTO Profs(id, nom, département)
VALUES (0, 'T.Tremblay', 'IFT'),
       (1, 'B.Boivin', 'IFT'),
       (2, 'R.Rodriguez', 'GLO'),
       (3, 'S.Smith', 'GIF'),
       (4, 'G.Gagnon', 'GLO');
INSERT INTO suivre(idul, sigle)
VALUES ('ALXYZ', 'GLO-1234'),
       ('BOUVW', 'GLO-4567'),
       ('DIOPQ', 'IFT-2345'),
       ('DIOPQ', 'GIF-9876'),
       ('ERLMN', 'GIF-5432'),
       ('FRIJK', 'GLO-1234'),
       ('ALXYZ', 'GIF-9876'),
       ('BOUVW', 'IFT-6789'),
       ('FRIJK', 'GIF-9876'),
       ('DIOPQ', 'GLO-1234'),
       ('ALXYZ', 'GLO-4567');
INSERT INTO cours(sigle, nom, local, prof)
VALUES ('GLO-1234', 'Bases de données', 'PLT-1122', 0),
       ('GLO-4567', 'Analyse de données', 'PLT-3245', 2),
       ('IFT-2345', 'Programmation 1', 'PLT-1122', 4),
       ('IFT-6789', 'Programmation 2', 'PLT-2412', 3),
       ('GIF-9876', 'Vision numérique', 'VCH-2344', 0),
       ('GIF-5432', 'Signaux', 'PLT-1122', 1);
SHOW DATABASES;
USE cours_4_quiz;
SHOW TABLES;
SELECT *
from etudiants;
SELECT *
from profs;
SELECT *
from suivre;
SELECT *
from cours;#Question 1# SELECT C.nom FROM cours C WHERE C.local LIKE 'PLT-%';#Question 2#SELECT E.nom FROM Etudiants E WHERE E.idul NOT IN (SELECT S.idul FROM suivre S);#(SELECT E.nom, E.idul FROM Etudiants E UNION SELECT S.idul, S.sigle From Suivre S);#Question 3#select E.programme, avg(E.age) FROM Etudiants E group by E.programme;#Question 4#SELECT DISTINCT E.nom#FROM Etudiants E, Profs P, Cours C, Suivre S#WHERE E.idul = S.idul AND S.sigle = C.sigle AND C.prof = P.id AND P.nom = 'T.Tremblay' AND E.programme = 'GLO';#Question 5# SELECT E.programme, AVG(E.age)# FROM Etudiants E# WHERE E.age >= 20# GROUP BY E.programme#Question 6# SELECT DISTINCT E.nom# FROM Etudiants E# WHERE E.idul IN (#      SELECT S.idul FROM Suivre S#      GROUP BY S.idul#      HAVING COUNT(*) >= ALL (#           SELECT COUNT(*)#           FROM Suivre S2#           GROUP BY S2.idul#           )#      );