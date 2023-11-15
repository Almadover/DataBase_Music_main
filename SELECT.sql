--Название и продолжительность самого длинного трэка.

SELECT name, duration 
FROM song
WHERE duration  = (SELECT max(duration) FROM song s);

--Название треков, продолжительность которых не менее 3,5 минут.

SELECT name, duration
FROM song s
WHERE duration >= '03:30:00'
ORDER BY duration DESC;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT name_collection , year_of_relise
FROM collection c 
WHERE year_of_relise BETWEEN '2018-01-01' AND '2021-01-01'
ORDER BY year_of_relise;

--Исполнители, чьё имя состоит из одного слова.

SELECT *
FROM artist a 
WHERE name_artist LIKE '%';

--Название треков, которые содержат слово «мой» или «my».

SELECT name
FROM song s 
WHERE lower(name) LIKE '%мой%' OR lower(name) LIKE '%my%';

--Количество исполнителей в каждом жанре.

SELECT title, count(artist_id)  
FROM genre g 
JOIN genres_artist ga ON g.genre_id = ga.genre_id
GROUP BY title

--Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT count(title) 
FROM song s 
JOIN album a ON s.album_id = a.album_id 
WHERE year_ >= '2019-01-01' AND year_ <= '2021-01-01';

--Средняя продолжительность треков по каждому альбому.

SELECT title, avg(duration) 
FROM song s 
JOIN album a ON s.album_id = a.album_id 
GROUP BY title 

--Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT name
FROM artist a 
JOIN album_artist aa ON a.artist_id = aa.album_id 
JOIN album a2 ON a2.album_id = aa.album_id 
WHERE year_ NOT BETWEEN '2020-01-01' AND '2021-12-31'
GROUP BY name

--Названия сборников, в которых присутствует конкретный исполнитель (DDT).

SELECT name_collection
FROM collection c 
JOIN songs_collection sc ON sc.collection_id = c.collection_id 
JOIN song s ON sc.songs_id = s.song_id 
JOIN album a ON s.album_id = a.album_id 
JOIN album_artist aa ON aa.album_id = a.album_id 
JOIN artist a2 ON aa.artist_id = a2.artist_id 
WHERE name_artist = 'DDT'
GROUP BY name_collection