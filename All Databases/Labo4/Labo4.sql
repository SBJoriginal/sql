drop DATABASE glo_2005_labs_2023;

CREATE DATABASE glo_2005_labs_2023;

SHOW DATABASES;

USE glo_2005_labs_2023;

SHOW TABLES;



CREATE TABLE Artistes (surnom varchar(100), nom varchar(100), age int(3), specialite enum('Peinture', 'Sculpture', 'Collage'), PRIMARY KEY (surnom));

CREATE TABLE Oeuvres (id int, titre varchar(100), annee YEAR(4), galerie int, prix int, type char(10));

CREATE TABLE Createurs (id int, surnom varchar(100));

CREATE TABLE Galeries (id int, adresse varchar(100), ville varchar(100), capacite int, gala enum('oui', 'non'));



INSERT INTO Artistes (surnom, nom, age, specialite) VALUES  ('Merveilles', 'Alice', 22, 'Peinture'), ('LeBob', 'Bob', 35, 'Peinture'), ('Canard', 'Cedric', 28, 'Sculpture'), ('Bobbie', 'Bob', 24, 'Collage');

INSERT INTO Oeuvres (id, titre, annee, galerie, prix, type) VALUES (101, 'La Fleur', 2002, 1, 205, 'Sculpture'), (102, "Nuit d'hiver", 2005, 3, 192, 'Peinture'), (103, 'Fleurs des champs', 1990, 2, 36, 'Sculpture'), (104, "L'amour et le fleuriste", 2015, 1, 157, 'Sculpture'), (105, 'Plumes', 1995, 2, 228, 'Peinture');

INSERT INTO Createurs (id, surnom) VALUES (101, 'Merveilles'), (101, 'Canard'), (102, 'Merveilles'), (103, 'LeBob'), (104, 'LeBob'), (104, 'Bobbie'), (104, 'Merveilles'), (105, 'Bobbie');

INSERT INTO Galeries(id, adresse, ville, capacite, gala)  VALUES (1, '2020 Rue Finfin', 'Quebec', 200, 'non'), (2, '1234 Cinquieme Ave', 'Quebec', 100, 'oui'), (3, '666 Septieme Cercle', 'Montreal', 300, 'oui');

INSERT INTO galeries (id, adresse, ville, capacite, gala) VALUES (4, '456 rue de John
Doe', 'Laval', 400, 'non') ;

INSERT INTO oeuvres (id, titre, annee, galerie, prix, type) VALUES (106, 'Cascade', 1996, 5,
356, 'Peinture');


SELECT @specialiteMerveilles := A.specialite from Artistes A WHERE a.surnom = 'Merveilles';


SELECT * FROM Oeuvres O Where  O.type = @specialiteMerveilles;


SET GLOBAL log_bin_trust_function_creators = 1;


DELIMITER //
CREATE PROCEDURE reqSpecialite (IN surnom varchar(100), OUT specialite enum('Peinture', 'Sculpture', 'Collage'))
BEGIN
SELECT A.specialite INTO specialite FROM Artistes A WHERE A.surnom = surnom;
end //

CALL reqSpecialite("Merveilles", @special);
SELECT @special;



DELIMITER //
CREATE FUNCTION reqSpecialites (surnom varchar (100))
    RETURNS enum('Peinture', 'Sculpture', 'Collage')
    BEGIN
        DECLARE specialite enum('Peinture', 'Sculpture', 'Collage');

        SELECT A.specialite INTO specialite FROM Artistes A WHERE A.surnom = surnom;
        RETURN  specialite;
    end //
DELIMITER ;


SELECT reqSpecialites("Canard");





