CREATE VIEW rock AS
SELECT * FROM track
WHERE genre_id IN (
	SELECT genre_id
    FROM genre
    WHERE name = 'Rock'
);


CREATE VIEW classical_count AS
SELECT COUNT(*) FROM track
WHERE track_id IN (
	SELECT track_id
  FROM playlist_track
  WHERE playlist_id IN (
  	SELECT playlist_id
    FROM playlist
    WHERE name = 'Classical'
  )
);