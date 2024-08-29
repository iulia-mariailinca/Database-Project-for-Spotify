<h1> Database Project for **Spotify** </h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **Spotify**

Tools used: MySQL Workbench

Database description: **This Spotify database is designed to manage and organise multiple aspects of a music streaming service, including information about users, artists, albums, songs, playlists, and the relationships between these entities.**

## Database Schema

You can find below the database schema that was generated through Reverse Engineer and which contains all the tables and the relationships between them.
![image](https://github.com/user-attachments/assets/885da799-63d2-464b-ab7b-0cf77744a10e)



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
CREATE DATABASE Spotify 
```

```
CREATE TABLE 'Users'
```
```
CREATE TABLE 'Artists'
```
```
CREATE TABLE 'Albums'
```
```
CREATE TABLE 'Songs'
```
```
CREATE TABLE 'Playlists'
```
```
CREATE TABLE 'PlaylistSongs'
```

After the database and the tables have been created, an ALTER instruction was written in order to update the structure of the database, as described below:

```
ALTER TABLE 'Artists' ADD 'Country' VARCHAR (100)
```

The new column called Country is added to store the origin country of the artists. 

### DML (Data Manipulation Language): <br>

       In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. <br> 
       In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase. <br>
       Below you can find all the insert instructions that were created in the scope of this project: <br>
       - INSERT INTO 'Users' <br>
       - INSERT INTO 'Artist' <br>
       - INSERT INTO 'Albums' <br>
       - INSERT INTO 'Songs' <br>
      <br>
       After the INSERT command, in order to prepare the data to be better suited for the testing process, I updated some data in the following way: <br>
       - UDPATE 'Users': I replaced the Subscription Type of a user to a free one. <br>
       - UPDATE 'Songs': I replaced a song name from the Linkin Park band with 'In the End'. <br>
   <br>
       After the testing process, I deleted the data that was no longer relevant in order to preserve the database clean: <br>
       - DELETE FROM 'Songs' WHERE SongID=13; <br>
   <br>
   
### DQL (Data Query Language): <br>
      In order to simulate various scenarios that might happen in real life, I created the following queries that would cover multiple potential real-life situations: <br>
       - SELECT * FROM 'Artist'; - selecting all the artist <br>
       - SELECT 'SongID', 'SongName', 'AlbumID' FROM 'Songs'; <br>
       - WHERE filter; <br>
       - LIKE filter; <br>
       - AND, OR filter; <br>
       - Aggregate functions; <br>
       - Filtering on Aggregate functions; <br>
   <br>
       - JOINS: <br>
   <br>
       a) INNER JOIN between Artists and Albums <br>
       Explanation: <br>
       **Artists**: The table containing information about all artists. <br>
       **Albums**: The table containing information about all albums. <br>
       **INNER JOIN**: This operation matches records from both tables where the ArtistID in the Albums table corresponds to the ArtistID in the Artists table. Only albums that have a valid artist relationship will be included in the result. <br>
   <br>
       **The Business Purpose** of this JOIN: Music Discovery - Facilitating music discovery features that connect users with artists and their complete discography, including all valid albums. <br>
       <br>
       b) LEFT JOIN between Users and Playlists <br>
       Explanation: <br>
       **Users**: The main table in the query, containing information about all users. <br>
       **Playlists**: The associated table, which contains the playlist information. <br>
       **LEFT JOIN**: Returns all rows in the Users table, even if there is no match in the Playlists table. If a user has no playlist, the PlaylistID and PlaylistName fields will be NULL. <br>
   <br>
       **The Business Purpose** of this JOIN: This JOIN is essential to generate reports and analytics that identify users without playlists, to better understand user behavior and take action to increase engagement. <br>
       <br>
       c) RIGHT JOIN between Albums and Songs <br>
       Explanation: <br>
       **Albums**: The secondary table in the query, containing information about albums. <br>
       **Songs**: The primary table in the query, containing information about songs. <br>
       **RIGHT JOIN**: Returns all rows from the Songs table, even if there is no corresponding entry in the Albums table. If a song is not associated with any album, the AlbumID and AlbumName fields will be NULL. <br>
   <br>
       **The Business Purpose** of this JOIN: This JOIN is useful for reporting, product teams can use this data to identify and fix missing associations between songs and albums, thereby improving the user experience. <br>
       <br>
       d) CROSS JOIN between Users and Songs <br>
       Explanation: <br>
       **Users**: The table containing information about all users. <br>
       **Songs**: The table containing information about all songs. <br>
       **CROSS JOIN**: This operation combines each user with every song. <br>
   <br>
       **The Business Purpose** of this JOIN: Generating all possible user-song pairs can be helpful for testing recommendation algorithms or understanding the user's preferences. <br>
   <br>
       - LIMITS; <br>
       - ORDER BY; <br>
       - Bonus: Subquery - selecting all the french artists from the Artists. <br>


## Conclusions

As a conclusion, this project provided a deep understanding of how to design and manage a database for a complex application like Spotify. I have acquired essential skills in data modeling, defining relationships and efficient data manipulation, all of which are critical to the success of any database-based system.

  
  
