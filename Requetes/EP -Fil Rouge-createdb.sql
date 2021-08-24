
drop table activite cascade constraints;
drop table cotiser cascade constraints;
drop table membre cascade constraints;
drop table participer cascade constraints;
drop table photo cascade constraints;
drop table publication cascade constraints;
drop table saison cascade constraints;

CREATE TABLE Membre(
   Id_Membre NUMBER(10),
   Nom VARCHAR2(50),
   Prenom VARCHAR2(50),
   email VARCHAR2(50),
   IsOrganisateur NUMBER(1),
   Date_Naissance TIMESTAMP,
   Photo_Profil BLOB,
   No_Voie VARCHAR2(50),
   Nom_De_Rue VARCHAR2(50),
   Code_Postal VARCHAR2(50),
   Ville VARCHAR2(50),
   Pays VARCHAR2(50),
   Login VARCHAR2(50) NOT NULL,
   mdp VARCHAR2(50) NOT NULL,
   NoTel VARCHAR2(50),
   CONSTRAINT Membre_PK PRIMARY KEY(Id_Membre),
   CONSTRAINT Membre_AK UNIQUE(Login)
);

CREATE TABLE Activite(
   Id_Activite NUMBER(10),
   Nom_Activite VARCHAR2(50),
   Description_Activite VARCHAR2(500),
   Destination_Activite VARCHAR2(50),
   Point_GPS_Activite VARCHAR2(50),
   Date_Activite TIMESTAMP,
   Tarif_Adherent NUMBER(7,2),
   Tarif_Invite NUMBER(7,2),
   Type_Vehicule VARCHAR2(50),
   Photo_Activite BLOB,
   Duree_Activite NUMBER(5,2),
   Id_Membre NUMBER(10) NOT NULL,
   CONSTRAINT Activite_PK PRIMARY KEY(Id_Activite),
   CONSTRAINT Activite_Membre_FK FOREIGN KEY(Id_Membre) REFERENCES Membre(Id_Membre)
);

CREATE TABLE Photo(
   Id_Photo NUMBER(10),
   Fichier_Photo BLOB,
   Date_Publi_Photo TIMESTAMP,
   Id_Activite NUMBER(10) NOT NULL,
   Id_Membre NUMBER(10) NOT NULL,
   CONSTRAINT Photo_PK PRIMARY KEY(Id_Photo),
   CONSTRAINT Photo_Activite_FK FOREIGN KEY(Id_Activite) REFERENCES Activite(Id_Activite),
   CONSTRAINT Photo_Membre_FK FOREIGN KEY(Id_Membre) REFERENCES Membre(Id_Membre)
);

CREATE TABLE Saison(
   Id_Saison NUMBER(10),
   Date_Debut_Saison TIMESTAMP,
   Date_Fin_Saison TIMESTAMP,
   CONSTRAINT Saison_PK PRIMARY KEY(Id_Saison)
);

CREATE TABLE Publication(
   Id_Publication NUMBER(10),
   Description_Nouvelle VARCHAR2(50),
   IsOffrePromotionnelleAdherents NUMBER(1),
   Texte VARCHAR2(500),
   Fichier_Associe BLOB,
   IsNouvelleAdherents NUMBER(1),
   Id_Membre NUMBER(10) NOT NULL,
   Date_Publi_Nouvelle TIMESTAMP,
   CONSTRAINT Publication_PK PRIMARY KEY(Id_Publication),
   CONSTRAINT Publication_Membre_FK FOREIGN KEY(Id_Membre) REFERENCES Membre(Id_Membre)
);


CREATE TABLE Participer(
   Id_Membre NUMBER(10),
   Id_Activite NUMBER(10),
   Date_Inscription TIMESTAMP,
   Nombre_Invites NUMBER(10),
   Libelle_Invites VARCHAR2(500),
   CONSTRAINT Participer_PK PRIMARY KEY(Id_Membre, Id_Activite),
   CONSTRAINT Participer_Membre_FK FOREIGN KEY(Id_Membre) REFERENCES Membre(Id_Membre),
   CONSTRAINT Participer_Activite_FK FOREIGN KEY(Id_Activite) REFERENCES Activite(Id_Activite)
);

CREATE TABLE Cotiser(
   Id_Membre NUMBER(10),
   Id_Saison NUMBER(10),
   Cotisation_A_Jour NUMBER(1),
   Date_Cotisation TIMESTAMP,
   Montant_Cotisation NUMBER(5,2),
   CONSTRAINT Cotiser_PK PRIMARY KEY(Id_Membre, Id_Saison),
   CONSTRAINT Cotiser_Membre_FK FOREIGN KEY(Id_Membre) REFERENCES Membre(Id_Membre),
   CONSTRAINT Cotiser_Saison_FK FOREIGN KEY(Id_Saison) REFERENCES Saison(Id_Saison));
