CREATE TABLE IF NOT EXISTS Song (
Song_ID serial PRIMARY KEY,
name VARCHAR (60) NOT NULL,
duration int NOT NULL,
album_id int REFERENCES Album(Album_ID)
);

CREATE TABLE IF NOT EXISTS Album (
Album_ID serial PRIMARY KEY,
title VARCHAR (60) NOT NULL,
year_relise date NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
Collection_ID serial PRIMARY KEY,
name_collection VARCHAR(60) NOT NULL,
year_of_release date NOT NULL
);

CREATE TABLE IF NOT EXISTS Songs_collection (
collection_id INTEGER REFERENCES Collection(Collection_ID),
songs_id INTEGER REFERENCES Song(Song_ID),
CONSTRAINT pk PRIMARY KEY (collection_id, songs_id)
);

CREATE TABLE IF NOT EXISTS Artist (
Artist_ID serial PRIMARY KEY,
name_artist VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album_Artist (
album_id INTEGER REFERENCES Album(Album_ID),
artist_id INTEGER REFERENCES Artist(Artist_ID),
CONSTRAINT nk PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Genre (
Genre_ID serial PRIMARY KEY,
title VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres_Artist (
Genre_ID INTEGER REFERENCES Genre(Genre_ID),
Artist_ID INTEGER REFERENCES Artist(Artist_ID),
CONSTRAINT sk PRIMARY KEY (Genre_ID, Artist_ID)
);