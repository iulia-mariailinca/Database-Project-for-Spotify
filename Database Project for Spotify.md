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
   a) **Artists** is connected with **Albums** through a 1 relationship which was implemented through                                                          
     **Artists.ArtistID** as a primary key and **Albums.ArtistID** as a foreign key.
   b) **Albums** is connected with **Songs** through a 1 relationship which was implemented through                                                     
     **Albums.AlbumID** as a primary key and **Songs.AlbumID** as a foreign key.
   c) **Users** is connected with **Playlists** through a 1 relationship which was implemented through                                                        
     **Users.UserID** as a primary key and **Playlists.UserID** as a foreign key.
   d) **Playlists** is connected with **PlaylistSongs** through a N relationship which was implemented through                                            
     **Playlists.PlaylistID** as a primary key and **PlaylistSongs.PlaylistID** as a foreign key.
   e) **Songs** is connected with **PlaylistSongs** through a N relationship which was implemented through                                                
     **Songs.SongID** as a primary key and **PlaylistSongs.SongID** as a foreign key.
   </ul> <br>
