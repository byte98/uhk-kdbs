/* Drop Foreign Keys */

ALTER TABLE [Administrativni_pracovnik]
    DROP CONSTRAINT [FK_Administrativni_pracovnik_Je_zamestnan_na]
GO

ALTER TABLE [Administrativni_pracovnik]
    DROP CONSTRAINT [FK_Administrativni_pracovnik_Ma_osobni_udaje]
GO

ALTER TABLE [Firma]
    DROP CONSTRAINT [FK_Firma_Ma_kontaktni_osobu]
GO

ALTER TABLE [Kontrakt]
    DROP CONSTRAINT [FK_Kontrakt_Je_uzavren_s]
GO

ALTER TABLE [Majitel_vozidla]
    DROP CONSTRAINT [FK_Majitel_vozidla_Ma_osobni_udaje]
GO

ALTER TABLE [Manazer]
    DROP CONSTRAINT [FK_Manazer_Ma_osobni_udaje]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Byla_realizovana]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Je_obslouzena]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Je cilem]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Je soucasti]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Je vyrizena]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [FK_Objednavka_Je_objednana]
GO

ALTER TABLE [Osoba]
    DROP CONSTRAINT [FK_Osoba_Bydli]
GO

ALTER TABLE [Pobocka]
    DROP CONSTRAINT [FK_Pobocka_Je_vedena]
GO

ALTER TABLE [Pobocka]
    DROP CONSTRAINT [FK_Pobocka_Se_nachazi]
GO

ALTER TABLE [Privatni_zakaznik]
    DROP CONSTRAINT [FK_Privatni_zakaznik_Ma_osobni_udaje]
GO

ALTER TABLE [Ridic]
    DROP CONSTRAINT [FK_Ridic_Je_zamestnan_na]
GO

ALTER TABLE [Ridic]
    DROP CONSTRAINT [FK_Ridic_Ma_osobni_udaje]
GO

ALTER TABLE [Rizeni_vozidel]
    DROP CONSTRAINT [FK_Rizeni_vozidel_Vozidlo]
GO

ALTER TABLE [Rizeni_vozidel]
    DROP CONSTRAINT [FK_Rizeni_vozidel_Ridic]
GO

ALTER TABLE [Vozidlo]
    DROP CONSTRAINT [FK_Vozidlo_Je_vlastneno]
GO

/* Drop Primary Keys */

ALTER TABLE [Administrativni_pracovnik]
    DROP CONSTRAINT [PK_Administrativni_pracovnik]
GO

ALTER TABLE [Adresa]
    DROP CONSTRAINT [PK_Adresa]
GO

ALTER TABLE [Adresa]
    DROP CONSTRAINT [PK_Adresa_Seq]
GO

ALTER TABLE [Firma]
    DROP CONSTRAINT [PK_Firma]
GO

ALTER TABLE [Jizda]
    DROP CONSTRAINT [PK_Jizda]
GO

ALTER TABLE [Kontrakt]
    DROP CONSTRAINT [PK_Kontrakt]
GO

ALTER TABLE [Majitel_vozidla]
    DROP CONSTRAINT [PK_Majitel_vozidla]
GO

ALTER TABLE [Manazer]
    DROP CONSTRAINT [PK_Manazer]
GO

ALTER TABLE [Objednavka]
    DROP CONSTRAINT [PK_Objednavka]
GO

ALTER TABLE [Osoba]
    DROP CONSTRAINT [PK_Osoba]
GO

ALTER TABLE [Pobocka]
    DROP CONSTRAINT [PK_Pobocka]
GO

ALTER TABLE [Privatni_zakaznik]
    DROP CONSTRAINT [PK_Privatni_zakaznik]
GO

ALTER TABLE [Ridic]
    DROP CONSTRAINT [PK_Ridic]
GO

ALTER TABLE [Rizeni_vozidel]
    DROP CONSTRAINT [PK_Rizeni_vozidel]
GO

ALTER TABLE [Vozidlo]
    DROP CONSTRAINT [PK_Vozidlo]
GO

/* Drop Sequences */

DROP SEQUENCE [SeqAdresaID]
GO

/* Drop Tables */

DROP TABLE [Administrativni_pracovnik]
GO

DROP TABLE [Adresa]
GO

DROP TABLE [Firma]
GO

DROP TABLE [Jizda]
GO

DROP TABLE [Kontrakt]
GO

DROP TABLE [Majitel_vozidla]
GO

DROP TABLE [Manazer]
GO

DROP TABLE [Objednavka]
GO

DROP TABLE [Osoba]
GO

DROP TABLE [Pobocka]
GO

DROP TABLE [Privatni_zakaznik]
GO

DROP TABLE [Ridic]
GO

DROP TABLE [Rizeni_vozidel]
GO

DROP TABLE [Vozidlo]
GO
