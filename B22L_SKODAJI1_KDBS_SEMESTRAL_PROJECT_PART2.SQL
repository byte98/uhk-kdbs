/* Procedura registrace */
CREATE PROCEDURE REGISTRACE
(
    @Jmeno varchar(64),
    @Prijmeni varchar(64),
    @Email varchar(256),
    @Telefon varchar(16),
    @Ulice varchar(64),
    @CisloPopisne int,
    @Obec varchar(64),
    @Psc char(5),
    @Ico varchar(16),
    @Nazev varchar(64),
    @CenaZaKm money,
    @PocetJizd int
)
AS
BEGIN
    DECLARE @AdresaID AS BIGINT;
    INSERT INTO [Adresa] (Cislo_popisne, Obec, Psc, Ulice)
    VALUES (@CisloPopisne, @Obec, @Psc, @Ulice);

    SET @AdresaID = SCOPE_IDENTITY();

    DECLARE @OsobaID  AS BIGINT;
    INSERT INTO [Osoba] (Email, Jmeno, Prijmeni, Telefon, [Je obyvana])
    VALUES (@Email, @Jmeno, @Prijmeni, @Telefon, @AdresaID);

    SET @OsobaID = SCOPE_IDENTITY();

    INSERT INTO [Firma] (Ico, Nazev, OsobaID)
    VALUES (@Ico, @Nazev, @OsobaID);

    DECLARE @FirmaID  AS BIGINT;
    SET @FirmaID = SCOPE_IDENTITY();

    INSERT INTO [Kontrakt] (Cena_za_km, Pocet_jizd, FirmaID)
    VALUES (@CenaZaKm, @PocetJizd, @FirmaID);
END;
GO

/* Pohled JIZDY_RIDICU */
CREATE VIEW JIZDY_RIDICU AS
SELECT
    o.RidicID,
    os.Jmeno,
    os.Prijmeni,
    adresaStart.Ulice AS StartovaciUlice,
    adresaStart.Obec AS StartovaciObec,
    adresaStart.Cislo_popisne AS StartovaciCislo,
    adresaKonec.Ulice AS KoncovaUlice,
    adresaKonec.Obec AS KoncovaObec,
    adresaKonec.Cislo_popisne AS KoncoveCislo,
    v.Tovarni_znacka,
    v.Model,
    v.Rz
FROM
    Objednavka o
    INNER JOIN Ridic r ON o.RidicID = r.RidicID
    INNER JOIN Osoba os ON r.OsobaID = os.OsobaID
    INNER JOIN Adresa adresaStart ON o.StartID = adresaStart.AdresaID
    INNER JOIN Adresa adresaKonec ON o.AdresaID = adresaKonec.AdresaID
    INNER JOIN Vozidlo v ON o.VozidloID = v.VozidloID
WHERE
    CONVERT(date, o.Cas) = '2016-11-17'
GO

/* Pohled NASMLOUVANE_JIZDY */
CREATE VIEW [NASMLOUVANE_KONTRAKTY] AS
SELECT
    [f].[Nazev] AS [NazevFirmy],
    [f].[Ico],
    [k].[Cena_za_km],
    [k].[Pocet_jizd],
    COUNT([o].[ObjednavkaID]) AS [PocetUskutecnenychJizd],
    (COUNT([o].[ObjednavkaID]) * 100.0) / [k].[Pocet_jizd] AS [ProcentoVyuziti]
FROM
    [Firma] AS [f]
    INNER JOIN [Kontrakt] AS [k] ON [f].[FirmaID] = [k].[FirmaID]
    LEFT JOIN [Objednavka] AS [o] ON [k].[KontraktID] = [o].[KontraktID]
        AND YEAR([o].[Cas]) = 2016
        AND MONTH([o].[Cas]) = 11
GROUP BY
    [f].[Nazev],
    [f].[Ico],
    [k].[Cena_za_km],
    [k].[Pocet_jizd]
GO


/* Pohled, ktery zobrazi celkovou utrzenou sumu kazdeho ridice za privatni zakazniky */
CREATE VIEW [TRZBY_RIDICU] AS
SELECT
    [o].[RidicID],
    [os].[Jmeno],
    [os].[Prijmeni],
    SUM([j].[Cena_jizdy]) AS [Souhrn_cen]
FROM
    [Objednavka] AS [o]
    INNER JOIN [Jizda] AS [j] ON [o].[JizdaID] = [j].[JizdaID]
    INNER JOIN [Osoba] AS [os] ON [o].[RidicID] = [os].[OsobaID]
WHERE
    MONTH([o].[Cas]) = 11 AND YEAR([o].[Cas]) = 2016
    AND [o].[KontraktID] IS NULL
GROUP BY
    [o].[RidicID],
    [os].[Jmeno],
    [os].[Prijmeni]
ORDER BY
    [Souhrn_cen] DESC;
