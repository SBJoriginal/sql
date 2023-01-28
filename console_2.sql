create database test;

show databases;

use test;

show tables;


create table Artistes
(
    surnom     varchar(100),
    nom        varchar(100),
    age        int(3),
    specialité enum ('Peinture', 'Sculpture', 'Collage')
);

create table Oeuvres
(
    id      int(3),
    titre   varchar(100),
    année   year(4),
    galerie int,
    prix    int
);


create table Créateurs
(
    id     int(3),
    surnom varchar(100)
);

create table Galeries
(
    id       int,
    adresse  varchar(100),
    ville    varchar(100),
    capacité int,
    gala     enum ('oui', 'non') # you could also use : tinybit(1) or bit(1)
);



insert into Artistes (surnom, nom, age, specialité) values ('LeBob', 'Bob', 35, 'Sculpture'), ('Canard', 'Cédric', 28, 'Sculpture'), ('Bobbie','Bob',24 ,'Collage');

INSERT INTO Oeuvres (id, titre, année, galerie, prix) VALUES (101, 'La Fleur', 2002, 1, 205), (102, 'Nuit dhiver', 2005, 3, 192), (103, 'Fleurs des champs', 1990, 2, 36), (104, 'Lamour et le fleuriste', 2015, 1, 157), (105, 'Plumes', 1995, 2, 228);

INSERT INTO Créateurs (id, surnom) VALUES (101, 'Merveilles'), (101, 'Canard'), (102, 'Merveilles'), (103, 'LeBob'), (104, 'LeBob'), (104, 'Bobbie'), (104, 'Merveilles'), (105, 'Bobbie');

INSERT INTO Galeries(id, adresse, ville, capacité, gala)  VALUES (1, '2020 Rue Finfin', 'Quebec', 200, 'non'), (2, '1234 Cinquieme Ave', 'Quebec', 100, 'oui'), (3, '666 Septieme Cercle', 'Montreal', 300, 'oui');



select * from galeries;