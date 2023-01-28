CREATE DATABASE glo_2005_labs_2023;

SHOW DATABASES;

USE glo_2005_labs_2023;

SHOW TABLES;



CREATE TABLE Artistes (surnom varchar(100), nom varchar(100), age int(3), specialite enum('Peinture', 'Sculpture', 'Collage'), PRIMARY KEY (surnom));

CREATE TABLE Oeuvres (id int, titre varchar(100), annee YEAR(4), galerie int, prix int);

CREATE TABLE Createurs (id int, surnom varchar(100));

CREATE TABLE Galeries (id int, adresse varchar(100), ville varchar(100), capacite int, gala enum('oui', 'non'));



INSERT INTO Artistes (surnom, nom, age, specialite) VALUES  ('Merveilles', 'Alice', 22, 'Peinture'), ('LeBob', 'Bob', 35, 'Peinture'), ('Canard', 'Cedric', 28, 'Sculpture'), ('Bobbie', 'Bob', 24, 'Collage');

INSERT INTO Oeuvres (id, titre, annee, galerie, prix) VALUES (101, 'La Fleur', 2002, 1, 205), (102, 'Nuit dhiver', 2005, 3, 192), (103, 'Fleurs des champs', 1990, 2, 36), (104, 'Lamour et le fleuriste', 2015, 1, 157), (105, 'Plumes', 1995, 2, 228);

INSERT INTO Createurs (id, surnom) VALUES (101, 'Merveilles'), (101, 'Canard'), (102, 'Merveilles'), (103, 'LeBob'), (104, 'LeBob'), (104, 'Bobbie'), (104, 'Merveilles'), (105, 'Bobbie');

INSERT INTO Galeries(id, adresse, ville, capacite, gala)  VALUES (1, '2020 Rue Finfin', 'Quebec', 200, 'non'), (2, '1234 Cinquieme Ave', 'Quebec', 100, 'oui'), (3, '666 Septieme Cercle', 'Montreal', 300, 'oui');