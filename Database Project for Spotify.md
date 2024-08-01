<h1> Database Project for **Spotify** </h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **Spotify**

Tools used: MySQL Workbench

Database description: **This Spotify database is designed to manage and organise multiple aspects of a music streaming service, including information about users, artists, albums, songs, playlists, and the relationships between these entities.**

<o>
<li> Database Schema </li>
<br>   
   You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
   
   The tables are connected in the following way:
   <ul>
   <li>a) **Artists** is connected with **Albums** through a 1 relationship which was implemented through                                                          
     **Artists.ArtistID** as a primary key and **Albums.ArtistID** as a foreign key. </li>
   <li>b) **Albums** is connected with **Songs** through a 1 relationship which was implemented through                                                     
     **Albums.AlbumID** as a primary key and **Songs.AlbumID** as a foreign key.</li>
   <li>c) **Users** is connected with **Playlists** through a 1 relationship which was implemented through                                                        
     **Users.UserID** as a primary key and **Playlists.UserID** as a foreign key.</li>
   <li>d) **Playlists** is connected with **PlaylistSongs** through a N relationship which was implemented through                                            
     **Playlists.PlaylistID** as a primary key and **PlaylistSongs.PlaylistID** as a foreign key.</li>
   <li>e) **Songs** is connected with **PlaylistSongs** through a N relationship which was implemented through                                                
     **Songs.SongID** as a primary key and **PlaylistSongs.SongID** as a foreign key.</li>
   </ul> <br>

<li>Database Queries</li><br>

<ol type="a">
  <li>DDL (Data Definition Language)</li>

  The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS)
  CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    UserAge INT,                 -- Această tabelă stochează informațiile despre utilizatorii aplicației Spotify, inclusiv ID-ul unic, numele, vârsta, emailul și tipul de abonament.
    Email VARCHAR(100),
    SubscriptionType VARCHAR(50)
);
  
  
