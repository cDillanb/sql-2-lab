SELECT * FROM invoice_line
WHERE unit_price > 0.99;


SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
	JOIN customer c
  	ON i.customer_id = c.customer_id;


SELECT c.first_name AS customer_first,
    c.last_name AS customer_last, 
    e.first_name AS rep_first, 
    e.first_name AS rep_last
FROM customer c
	JOIN employee e
  	ON c.support_rep_id = e.employee_id;


SELECT  ar.name, al.title
FROM artist ar
	JOIN album al
  	ON ar.artist_id = al.artist_id;


SELECT track_id FROM playlist_track
WHERE playlist_id IN (
	SELECT playlist_id FROM playlist
    WHERE name = 'Music'
);


SELECT name FROM track
WHERE track_id IN (
	SELECT playlist_id
    FROM playlist
);


SELECT p.name AS playlist_name,
	t.name AS track_name
FROM playlist_track pt
    JOIN playlist p
  	    ON p.playlist_id = pt.playlist_id
    JOIN track t
  	    ON t.track_id = pt.track_id;



SELECT t.name AS track_name, a.title AS album
FROM track t
	JOIN album a
  	    ON t.album_id = a.album_id
    JOIN genre g
  	    ON t.genre_id = g.genre_id
    WHERE t.genre_id IN (
  	    SELECT genre_id
        FROM genre
        WHERE name = 'Alternative & Punk'
    );