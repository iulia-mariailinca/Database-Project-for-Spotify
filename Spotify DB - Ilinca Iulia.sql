/*Crearea unei baze de date pentru a testa aplicația Spotify*/

create database Spotify; /*A fost creată baza de date Spotify*/

/* Instrucțiuni DDL*/
/* CREATE */

-- Crearea tabelei 'Users'
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    UserAge INT,                 -- Această tabelă stochează informațiile despre utilizatorii aplicației Spotify, inclusiv ID-ul unic, numele, vârsta, emailul și tipul de abonament.
    Email VARCHAR(100),
    SubscriptionType VARCHAR(50)
);
-- Crearea tabelei 'Artists'
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(100),      -- Această tabelă stochează informații despre artiști: ID-ul unic al fiecărui artist, numele și genul muzical.
    Genre VARCHAR(50)
);
-- Crearea tabelei 'Albums'
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(100),
    ReleaseDate DATE,             -- Această tabelă stochează informații despre albume: ID-ul unic, numele, data lansării și ID-ul artistului.
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);
-- Crearea tabelei 'Songs'
CREATE TABLE Songs (
    SongID INT PRIMARY KEY,
    SongName VARCHAR(100),
    Duration INT,                  -- Această tabelă stochează informații despre melodii: ID-ul unic, numele, durata și ID-ul albumului.
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);
-- Crearea tabelei 'Playlists'
CREATE TABLE Playlists (
    PlaylistID INT PRIMARY KEY,
    PlaylistName VARCHAR(100),       --  Această tabelă deține informații despre listele de redare (playlists): ID-ul unic al fiecărei liste, numele și ID-ul utilizatorului care a creat lista.
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Crearea tabelei 'PlaylistSongs'
CREATE TABLE PlaylistSongs (
    PlaylistID INT,
    SongID INT,
    PRIMARY KEY (PlaylistID, SongID),   -- Această tabelă de legătură stochează relația dintre listele de redare și melodii, permițând adăugarea mai multor melodii într-o listă de redare.
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID),
    FOREIGN KEY (SongID) REFERENCES Songs(SongID)
    );

/*ALTER - Modificarea tabelei*/
ALTER TABLE Artists                  -- Adăugăm o coloană pentru a stoca țara de origine a artiștilor.
ADD Country VARCHAR(100);

/* Instrucțiuni DML */
/* INSERT - Inserarea de date */
INSERT INTO Users (UserID, UserName, UserAge, Email, SubscriptionType)
VALUES (28, 'Iulia Maria', 23, 'iulia.maria@gmail.com', 'Premium Student'),
	   (26, 'Andrei Andrei', 28, 'andrei.andrei@gmail.com', 'Free'),
       (520, 'Elena F.', 40, 'felena@yahoo.com', 'Premium Individual'),
       (4000, 'Vlad Popescu', 32, 'popevlad@outlook.com', 'Premium Duo'),
       (5289, 'Mariana Alexandrescu', 46, 'alexandrescu.mary@gmail.com', 'Premium Family');
       
INSERT INTO Artists (ArtistID, ArtistName, Genre, Country)
VALUES (1, 'Linkin Park', 'Rock', 'SUA'),
       (23, 'Lara Fabian', 'French pop', 'France'),
       (65, 'Shakira', 'Latin pop' , 'Colombia'),
       (87, 'David Guetta', 'House', 'France'),
       (600, 'Smiley', 'Pop', 'Romania');    
       
INSERT INTO Albums (AlbumID, AlbumName, ReleaseDate, ArtistID)
VALUES (3, 'Meteora', '2003-03-25', 1),
	   (44, 'Le Secret', '2013-04-15', 23),
       (700, 'Sale el Sol', '2010-10-19', 65),
       (886, 'One More Love', '2009-08-24', 87),
       (46565, 'Acasa', '2013-11-21', 600);

INSERT INTO Songs (SongID, SongName, Duration, AlbumID)
VALUES (13, 'Numb', 307, 3),
       (6, 'Mirage', 337, 44),
       (5, 'Addicted to You', 227, 700),
       (12, 'Love is Gone', 306, 886),
       (2, 'Acasa', 342, 46565);       
    
/* DELETE - Ștergerea datelor */
DELETE FROM Songs WHERE SongID=13;    -- Ștergerea unei melodii din tabela Songs

/* UPDATE - Actualizarea datelor */
UPDATE Users
SET SubscriptionType = 'Free' WHERE UserID = 28;  -- Actualizarea tipului de abonament pentru un utilizator

UPDATE Songs
SET SongName = 'In the End' WHERE SongID = 13;    -- Actualizarea unei melodii

/* Instrucțiuni DQL */

-- 1. Selectarea tuturor datelor (SELECT * FROM) 
SELECT * FROM Artists;  -- Selectarea tuturor artiștilor

-- 2. Selectarea câtorva coloane
SELECT SongID, SongName, AlbumID FROM Songs; -- Selectarea ID-ului și numelui cântecelor

-- 3. Filtrarea cu WHERE
SELECT * FROM Artists WHERE Country = 'France';  -- Selectarea artiștilor din Franța
SELECT * FROM Users WHERE UserAge = 28;          -- Selectarea utilizatorilor cu vârsta de 28 de ani

-- 4. Filtrare cu LIKE
SELECT * FROM Users WHERE UserName LIKE 'M%';    -- Selectarea utilizatorilor al căror nume începe cu 'M'
SELECT * FROM Artists WHERE ArtistName LIKE 'L%';   -- Selectarea artiștilor al căror nume începe cu 'L'

-- 5. Filtrare cu AND și OR
SELECT * FROM Artists WHERE Country = 'Romania' AND Genre = 'Latin pop';  -- Selectarea artiștilor din România care au genul latin pop
SELECT * FROM Users WHERE SubscriptionType = 'Premium Duo' OR SubscriptionType = 'Free';  -- Selectarea utilizatorilor cu abonament premium duo sau free/gratis

-- 6. Funcții agregate
SELECT COUNT(*) AS TotalUsers FROM Users;   -- Numărul total de utilizatori
SELECT SUM(UserAge) AS TotalAges FROM Users;   -- Suma anilor utilizatorilor

-- 7. Filtrare pe funcții agregate
SELECT ArtistID, COUNT(*) AS NumberOfAlbums FROM Albums   -- Numărul de albume per artist
GROUP BY ArtistID HAVING COUNT(*) >= 1;

-- 8. Joinuri
-- a. INNER JOIN între Artists și Albums:
SELECT Artists.ArtistName, Albums.AlbumName FROM Artists
INNER JOIN Albums ON Artists.ArtistID = Albums.ArtistID;

-- b. LEFT JOIN între Users și Playlists:
SELECT Users.UserName, Playlists.PlaylistName FROM Users
LEFT JOIN Playlists ON Users.UserID = Playlists.UserID;

-- c. RIGHT JOIN între Albums și Songs:
SELECT Albums.AlbumName, Songs.SongName FROM Albums
RIGHT JOIN Songs ON Albums.AlbumID = Songs.AlbumID;

-- d. CROSS JOIN între Users și Songs:
SELECT Users.UserName, Songs.SongName FROM Users
CROSS JOIN Songs;

-- 9. Limite (LIMIT)
SELECT * FROM Users LIMIT 3; -- Selectarea primilor 3 utilizatori
SELECT * FROM Songs LIMIT 4; -- Selectarea primelor 4 melodii

-- 10. Ordonare (ORDER BY)
SELECT * FROM Users ORDER BY UserName ASC; -- Selectarea utilizatorilor ordonați crescător în funcție de nume
SELECT * FROM Artists ORDER BY ArtistName DESC; -- Selectarea artiștilor ordonați descrescător în funcție de nume

/* Subquery */
SELECT ArtistName
FROM Artists
WHERE ArtistID IN (
    SELECT ArtistID
    FROM Artists                     -- Selectarea artiștilor francezi din lista de artiști
    WHERE ArtistID IN (
        SELECT ArtistID
        FROM Artists
        WHERE Country = 'France'
    )
);