-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-28 23:36:54.55

-- tables
-- Table: Developer
CREATE TABLE Developer (
    idDev integer  NOT NULL,
    Nazwa varchar2(50)  NOT NULL,
    CONSTRAINT Developer_pk PRIMARY KEY (idDev)
) ;

-- Table: Gra
CREATE TABLE Gra (
    idGry integer  NOT NULL,
    Tytul varchar2(50)  NOT NULL,
    CONSTRAINT Gra_pk PRIMARY KEY (idGry)
) ;

-- Table: GraNaplatforme
CREATE TABLE GraNaplatforme (
    Platforma_idPlatformy integer  NOT NULL,
    Gra_idGry integer  NOT NULL,
    Developer_idDev integer  NOT NULL,
    CONSTRAINT GraNaplatforme_pk PRIMARY KEY (Platforma_idPlatformy,Gra_idGry,Developer_idDev)
) ;

-- Table: Kategoria
CREATE TABLE Kategoria (
    Id_kategoria integer  NOT NULL,
    Kategoria varchar2(30)  NOT NULL,
    CONSTRAINT Kategoria_pk PRIMARY KEY (Id_kategoria)
) ;

-- Table: Platforma
CREATE TABLE Platforma (
    idPlatformy integer  NOT NULL,
    Nazwa varchar(30)  NOT NULL,
    CONSTRAINT Platforma_pk PRIMARY KEY (idPlatformy)
) ;

-- Table: Raport
CREATE TABLE Raport (
    idRaportu integer  NOT NULL,
    Sprawdzenie_Gra_idGry integer  NOT NULL,
    Sprawdzenie_osobaSpraw_idOsoby integer  NOT NULL,
    CONSTRAINT Raport_pk PRIMARY KEY (idRaportu)
) ;

-- Table: Sprawdzenie
CREATE TABLE Sprawdzenie (
    Gra_idGry integer  NOT NULL,
    osobaSpraw_idOsoby integer  NOT NULL,
    CONSTRAINT Sprawdzenie_pk PRIMARY KEY (Gra_idGry,osobaSpraw_idOsoby)
) ;

-- Table: Werdykt
CREATE TABLE Werdykt (
    idWerdykty integer  NOT NULL,
    Gra_idGry integer  NOT NULL,
    ZespolSprawdzajacy_idZespolu integer  NOT NULL,
    CONSTRAINT Werdykt_pk PRIMARY KEY (idWerdykty)
) ;

-- Table: ZespolSprawdzajacy
CREATE TABLE ZespolSprawdzajacy (
    idZespolu integer  NOT NULL,
    NazwaZespolu varchar(50)  NOT NULL,
    CONSTRAINT ZespolSprawdzajacy_pk PRIMARY KEY (idZespolu)
) ;

-- Table: osobaSpraw
CREATE TABLE osobaSpraw (
    idOsoby integer  NOT NULL,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    KategoriaSprawdzenia varchar(30)  NOT NULL,
    Kategoria_Id_kategoria integer  NOT NULL,
    ZespolSprawdzajacy_idZespolu integer  NOT NULL,
    CONSTRAINT osobaSpraw_pk PRIMARY KEY (idOsoby)
) ;

-- foreign keys
-- Reference: GraNaplatforme_Developer (table: GraNaplatforme)
ALTER TABLE GraNaplatforme ADD CONSTRAINT GraNaplatforme_Developer
    FOREIGN KEY (Developer_idDev)
    REFERENCES Developer (idDev);

-- Reference: GraNaplatforme_Gra (table: GraNaplatforme)
ALTER TABLE GraNaplatforme ADD CONSTRAINT GraNaplatforme_Gra
    FOREIGN KEY (Gra_idGry)
    REFERENCES Gra (idGry);

-- Reference: GraNaplatforme_Platforma (table: GraNaplatforme)
ALTER TABLE GraNaplatforme ADD CONSTRAINT GraNaplatforme_Platforma
    FOREIGN KEY (Platforma_idPlatformy)
    REFERENCES Platforma (idPlatformy);

-- Reference: Raport_Sprawdzenie (table: Raport)
ALTER TABLE Raport ADD CONSTRAINT Raport_Sprawdzenie
    FOREIGN KEY (Sprawdzenie_Gra_idGry,Sprawdzenie_osobaSpraw_idOsoby)
    REFERENCES Sprawdzenie (Gra_idGry,osobaSpraw_idOsoby);

-- Reference: Sprawdzenie_Gra (table: Sprawdzenie)
ALTER TABLE Sprawdzenie ADD CONSTRAINT Sprawdzenie_Gra
    FOREIGN KEY (Gra_idGry)
    REFERENCES Gra (idGry);

-- Reference: Sprawdzenie_osobaSpraw (table: Sprawdzenie)
ALTER TABLE Sprawdzenie ADD CONSTRAINT Sprawdzenie_osobaSpraw
    FOREIGN KEY (osobaSpraw_idOsoby)
    REFERENCES osobaSpraw (idOsoby);

-- Reference: Werdykt_Gra (table: Werdykt)
ALTER TABLE Werdykt ADD CONSTRAINT Werdykt_Gra
    FOREIGN KEY (Gra_idGry)
    REFERENCES Gra (idGry);

-- Reference: Werdykt_ZespolSprawdzajacy (table: Werdykt)
ALTER TABLE Werdykt ADD CONSTRAINT Werdykt_ZespolSprawdzajacy
    FOREIGN KEY (ZespolSprawdzajacy_idZespolu)
    REFERENCES ZespolSprawdzajacy (idZespolu);

-- Reference: osobaSpraw_Kategoria (table: osobaSpraw)
ALTER TABLE osobaSpraw ADD CONSTRAINT osobaSpraw_Kategoria
    FOREIGN KEY (Kategoria_Id_kategoria)
    REFERENCES Kategoria (Id_kategoria);

-- Reference: osobaSpraw_ZespolSprawdzajacy (table: osobaSpraw)
ALTER TABLE osobaSpraw ADD CONSTRAINT osobaSpraw_ZespolSprawdzajacy
    FOREIGN KEY (ZespolSprawdzajacy_idZespolu)
    REFERENCES ZespolSprawdzajacy (idZespolu);

-- End of file.
