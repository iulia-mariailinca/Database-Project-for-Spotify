<h1> Database Project for **Spotify** </h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **Spotify**

Tools used: MySQL Workbench

Database description: **This Spotify database is designed to manage and organise multiple aspects of a music streaming service, including information about users, artists, albums, songs, playlists, and the relationships between these entities.**

## Database Schema

You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
![image](https://github.com/user-attachments/assets/05354806-e231-4d5c-ab32-6d741f5a6d67)




The tables are connected in the following way:<br><br>
a) **Artists** is connected with **Albums** through a 1 relationship which was implemented through **Artists.ArtistID** as a primary key and **Albums.ArtistID** as a foreign key. <br><br>
b) **Albums** is connected with **Songs** through a 1 relationship which was implemented through **Albums.AlbumID** as a primary key and **Songs.AlbumID** as a foreign key.<br><br>
c) **Users** is connected with **Playlists** through a 1 relationship which was implemented through **Users.UserID** as a primary key and **Playlists.UserID** as a foreign key.<br><br>
d) **Playlists** is connected with **PlaylistSongs** through a N relationship which was implemented through **Playlists.PlaylistID** as a primary key and **PlaylistSongs.PlaylistID** as a foreign key.<br><br>
e) **Songs** is connected with **PlaylistSongs** through a N relationship which was implemented through **Songs.SongID** as a primary key and **PlaylistSongs.SongID** as a foreign key.<br><br>
     

## Database Queries</li><br>

Database Queries can be observed [here](https://github.com/iulia-mariailinca/Database-Project-for-Spotify/blob/main/Spotify%20DB%20-%20Ilinca%20Iulia.sql), but I will also write a few words about what was done there in the sections below.
   
### DDL (Data Definition Language): <br>

The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS):

```
CREATE DATABASE Spotify; 
```

```
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    UserAge INT,                
    Email VARCHAR(100),
    SubscriptionType VARCHAR(50)
);
```
```
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(100),      
    Genre VARCHAR(50)
);
```
```
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(100),
    ReleaseDate DATE,             
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);
```
```
CREATE TABLE Songs (
    SongID INT PRIMARY KEY,
    SongName VARCHAR(100),
    Duration INT,                  
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);
```
```
CREATE TABLE Playlists (
    PlaylistID INT PRIMARY KEY,
    PlaylistName VARCHAR(100),      
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
```
```
CREATE TABLE PlaylistSongs (
    PlaylistID INT,
    SongID INT,
    PRIMARY KEY (PlaylistID, SongID),   
    FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID),
    FOREIGN KEY (SongID) REFERENCES Songs(SongID)
    );
```

After the database and the tables have been created, an ALTER instruction was written in order to update the structure of the database, as described below:

```
ALTER TABLE 'Artists'
ADD 'Country' VARCHAR (100)
```

The new column called Country is added to store the origin country of the artists. 

### DML (Data Manipulation Language): <br>
In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. <br> 
In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. <br>
Below you can find all the insert instructions that were created in the scope of this project: <br>
```
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
```
       
After the INSERT command, in order to prepare the data to be better suited for the testing process, I updated some data in the following way: <br>
```
UPDATE Users
SET SubscriptionType = 'Free' WHERE UserID = 28;

UPDATE Songs
SET SongName = 'In the End' WHERE SongID = 13;
```
After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: <br>
```
DELETE FROM Songs WHERE SongID=13;
```
<br>
   
### DQL (Data Query Language): <br>
In order to simulate various scenarios that might happen in real life, I created the following queries that would cover multiple potential real-life situations: <br>
```
SELECT * FROM Artists;
```
```
SELECT SongID, SongName, AlbumID FROM Songs;
```
```
WHERE filter:
SELECT * FROM Artists WHERE Country = 'France';
SELECT * FROM Users WHERE UserAge = 28;
```
```
LIKE filter:
SELECT * FROM Users WHERE UserName LIKE 'M%';
SELECT * FROM Artists WHERE ArtistName LIKE 'L%';
```
```
AND, OR filter:
SELECT * FROM Artists WHERE Country = 'Romania' AND Genre = 'Latin pop';
SELECT * FROM Users WHERE SubscriptionType = 'Premium Duo' OR SubscriptionType = 'Free';
```
```
Aggregate functions:
SELECT COUNT(*) AS TotalUsers FROM Users;   
SELECT SUM(UserAge) AS TotalAges FROM Users;
```
```
JOINS:
a) INNER JOIN between Artists and Albums:
SELECT Artists.ArtistName, Albums.AlbumName FROM Artists     
INNER JOIN Albums ON Artists.ArtistID = Albums.ArtistID;

Explanation: 
**Artists**: The table containing information about all artists. 
**Albums**: The table containing information about all albums. 
 **INNER JOIN**: This operation matches records from both tables where the ArtistID in the Albums table corresponds to the ArtistID in the Artists table. Only albums that have a valid artist relationship will be included in the result. 
   
**The Business Purpose** of this JOIN: Music Discovery - Facilitating music discovery features that connect users with artists and their complete discography, including all valid albums. 
       
b) LEFT JOIN between Users and Playlists:
SELECT Users.UserName, Playlists.PlaylistName FROM Users
LEFT JOIN Playlists ON Users.UserID = Playlists.UserID;

Explanation: 
**Users**: The main table in the query, containing information about all users. 
**Playlists**: The associated table, which contains the playlist information. 
**LEFT JOIN**: Returns all rows in the Users table, even if there is no match in the Playlists table. If a user has no playlist, the PlaylistID and PlaylistName fields will be NULL. 
   
**The Business Purpose** of this JOIN: This JOIN is essential to generate reports and analytics that identify users without playlists, to better understand user behavior and take action to increase engagement. 
       
c) RIGHT JOIN between Albums and Songs:
SELECT Albums.AlbumName, Songs.SongName FROM Albums
RIGHT JOIN Songs ON Albums.AlbumID = Songs.AlbumID;

Explanation: 
**Albums**: The secondary table in the query, containing information about albums. 
**Songs**: The primary table in the query, containing information about songs. 
**RIGHT JOIN**: Returns all rows from the Songs table, even if there is no corresponding entry in the Albums table. If a song is not associated with any album, the AlbumID and AlbumName fields will be NULL. 
   
**The Business Purpose** of this JOIN: This JOIN is useful for reporting, product teams can use this data to identify and fix missing associations between songs and albums, thereby improving the user experience. 
       
d) CROSS JOIN between Users and Songs:
SELECT Users.UserName, Songs.SongName FROM Users
CROSS JOIN Songs;

Explanation: 
**Users**: The table containing information about all users. 
**Songs**: The table containing information about all songs. 
**CROSS JOIN**: This operation combines each user with every song. 
   
**The Business Purpose** of this JOIN: Generating all possible user-song pairs can be helpful for testing recommendation algorithms or understanding the user's preferences. 
```
```
LIMITS:
SELECT * FROM Users LIMIT 3; 
SELECT * FROM Songs LIMIT 4;
```
```
ORDER BY:
SELECT * FROM Users ORDER BY UserName ASC; 
SELECT * FROM Artists ORDER BY ArtistName DESC;
```
      
## Conclusions

As a conclusion, this project provided a deep understanding of how to design and manage a database for a complex application like Spotify. I have acquired essential skills in data modeling, defining relationships and efficient data manipulation, all of which are critical to the success of any database-based system.

  
  
