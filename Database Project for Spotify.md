<h1> Database Project for **Spotify** </h1>

The scope of this project is to use all the SQL knowledge gained throught the Software Testing course and apply them in practice.

Application under test: **Spotify**

Tools used: MySQL Workbench

Database description: **This Spotify database is designed to manage and organise multiple aspects of a music streaming service, including information about users, artists, albums, songs, playlists, and the relationships between these entities.**

<ol>
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
    <li>Database Queries can be observed here: https://github.com/iulia-mariailinca/Database-Project-for-Spotify/blob/main/Spotify%20DB%20-%20Ilinca%20Iulia.sql, but I will also write a few words about what was done there:</li>
   <br>
     1. DDL (Data Definition Language): <br>
      The following instructions were written in the scope of CREATING the structure of the database (CREATE INSTRUCTIONS): <br>
      - CREATE DATABASE Spotify <br>
      - CREATE TABLE 'Users' <br>
      - CREATE TABLE 'Artists' <br>
      - CREATE TABLE 'Albums' <br>
      - CREATE TABLE 'Songs' <br>
      - CREATE TABLE 'Playlists' <br>
      - CREATE TABLE 'PlaylistSongs' <br>
     After the database and the tables have been created, an ALTER instruction was written in order to update the structure of the database, as described below: <br>
     - ALTER TABLE 'Artists' ADD 'Country' VARCHAR (100), which is a column added to store the origin country of the artists. <br>
   <br>
     2. DML (Data Manipulation Language): <br>
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
      3. DQL (Data Query Language): <br>
      In order to simulate various scenarios that might happen in real life, I created the following queries that would cover multiple potential real-life situations: <br>
       - SELECT * FROM 'Artist'; - selecting all the artist <br>
       - SELECT 'SongID', 'SongName', 'AlbumID' FROM 'Songs'; <br>
       - WHERE filter; <br>
       - LIKE filter; <br>
       - AND, OR filter; <br>
       - Aggregate functions; <br>
       - Filtering on Aggregate functions; <br>
       - JOINS: INNER JOIN between Artists and Albums, LEFT JOIN between Users and Playlists, RIGHT JOIN between Albums and Songs and CROSS JOIN between Users and Songs; <br>
       - LIMITS; <br>
       - ORDER BY; <br>
       - Bonus: Subquery - selecting all the french artists from the Artists. <br>
   
</ol>
<br>

<li>Conclusions</li>

**As a conclusion, this project provided a deep understanding of how to design and manage a database for a complex application like Spotify. I have acquired essential skills in data modeling, defining relationships and efficient data manipulation, all of which are critical to the success of any database-based system.**

</ol>
  
  
