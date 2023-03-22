drop database glo_2005_Projet_ConcessionnaireNouvelleAuto;

CREATE DATABASE glo_2005_Projet_ConcessionnaireNouvelleAuto;

use glo_2005_Projet_ConcessionnaireNouvelleAuto;

#DE OU VIENS LE NIV ORIGINALLEMENT?

CREATE TABLE Concessionnaire
(
    idConcessionnaire              integer,
    nomConcessionnaire             varchar(100),
    adresseConcessionnaire         varchar(200),
    numTelephoneConcessionnaire    varchar(15),
    adresseCourrielConcessionnaire varchar(100),
    siteWeb                        varchar(100),
    PRIMARY KEY (idConcessionnaire)
);

CREATE TABLE Employe
(
    idEmploye      integer,
    prenomEmploye  varchar(100),
    nomEmploye     varchar(100),
    ageEmploye     integer,
    numCellEmploye varchar(15),
    numPoste       integer,
    titreEmploi    varchar(100),
    salaireAnnuel  integer,
    anciennete     integer,
    PRIMARY KEY (idEmploye)
);

CREATE TABLE Client
(
    idClient           integer,
    prenomClient       varchar(100),
    nomClient          varchar(100),
    numTelephoneClient varchar(15),
    adresseClient      varchar(200),
    codePostaleClient  varchar(7),
    genreClient        varchar(1),
    PRIMARY KEY (idClient)
);

CREATE TABLE Automobile
(
    niv           varchar(17),
    marque        varchar(50),
    modele        varchar(50),
    annee         integer,
    couleur       varchar(50),
    odometre      integer,
    nbPlaces      integer,
    prixAuto      double,
    locationVente varchar(8),
    sousCategorie varchar(20),
    poidsAuto     integer,
    PRIMARY KEY (niv)
);

CREATE TABLE Pieces
(
    idPiece          integer,
    nomPiece         varchar(100),
    categorie        varchar(100),
    poidsPiece       double,
    descriptionPiece varchar(200),
    prixPiece        double,
    PRIMARY KEY (idPiece)
);

CREATE TABLE LavageAuto
(
    idLavage   integer,
    typeLavage varchar(50),
    prixLavage double,
    niv        varchar(17),
    idClient   integer,
    idEmploye  integer,
    PRIMARY KEY (idLavage, idClient, idEmploye, niv),
    FOREIGN KEY (idClient)
        REFERENCES Client (idClient)
        ON UPDATE CASCADE,   #on veut que le nom change partout
        #ON DELETE SET NULL, #ON VEUT PAS EFFACER LA TRANSACTION ON COMPLET, DONC SI IL FAUT DELETE SET NULL JE PENSE
    FOREIGN KEY (idEmploye)
        REFERENCES Employe (idEmploye)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (niv)
        REFERENCES automobile (niv)
        ON UPDATE CASCADE
        #ON DELETE SET NULL
);


CREATE TABLE Vente
(
    idVente          integer,
    niv              varchar(17),
    idClient         integer,
    idEmploye        integer,
    dureeFinancement integer,
    tauxInteret      double,
    PRIMARY KEY (idVente, niv, idClient, idEmploye),
    FOREIGN KEY (niv)
        REFERENCES automobile (niv)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idClient)
        REFERENCES Client (idClient)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idEmploye)
        REFERENCES employe (idEmploye)
        ON UPDATE CASCADE
        #ON DELETE SET NULL
);

CREATE TABLE Reparation
(
    idReparation   integer,
    idClient       integer,
    niv            varchar(17),
    idEmploye      integer,
    typeReparation varchar(100),
    descriptionRep varchar(400),
    idPiece        integer,
    tempsDeTravail integer, #minutes
    coutReparation double,
    PRIMARY KEY (idReparation, idClient, niv, idEmploye, idPiece),
    FOREIGN KEY (idClient)
        REFERENCES Client (idClient)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (niv)
        REFERENCES automobile (niv)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idEmploye)
        REFERENCES employe (idEmploye)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idPiece)
        REFERENCES Pieces (idPiece)
        ON UPDATE CASCADE
        #ON DELETE SET NULL
);

CREATE TABLE Location
(
    idLocation    integer,
    niv           varchar(17),
    idClient      integer,
    idEmploye     integer,
    dureeLocation integer, #mois
    tauxInteret   double,
    PRIMARY KEY (idLocation, niv, idClient, idEmploye),
    FOREIGN KEY (niv)
        REFERENCES automobile (niv)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idClient)
        REFERENCES Client (idClient)
        ON UPDATE CASCADE,
        #ON DELETE SET NULL,
    FOREIGN KEY (idEmploye)
        REFERENCES employe (idEmploye)
        ON UPDATE CASCADE
        #ON DELETE SET NULL
);



CREATE TABLE FournisseursPieces
(
    idFournisseursPieces              integer,
    nomFournisseursPieces             varchar(50),
    adresseFournisseursPieces         varchar(200),
    numTelephoneFournisseursPieces    varchar(15),
    adresseCourrielFournisseursPieces varchar(100),
    villeFournisseursPieces           varchar(100),
    provinceEtatFournisseursPieces    varchar(50),
    paysFournisseursPieces            varchar(50),
    PRIMARY KEY (idFournisseursPieces)
);

CREATE TABLE FournisseursVehicules
(
    idFournisseursVehicules              integer,
    nomFournisseursVehicules             varchar(50),
    adresseFournisseursVehicules         varchar(200),
    numTelephoneFournisseursVehicules    varchar(15),
    adresseCourrielFournisseursVehicules varchar(100),
    villeFournisseursVehicules           varchar(100),
    provinceEtatFournisseursVehicules    varchar(50),
    paysFournisseursVehicules            varchar(50),
    PRIMARY KEY (idFournisseursVehicules)
);






