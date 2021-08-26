ALTER TABLE animals
ADD location VARCHAR(100);


INSERT INTO animals (name, age, type, location)
VALUES ('Kibo', '3', 'dog', 'utah'),
('Zaylee', '7', 'dog', 'utah'),
('Bubba', '8', 'fish', 'water');


ALTER TABLE animals
RENAME COLUMN type TO species;


-- this should work I think but its not for some reason
ALTER TABLE animals
ALTER COLUMN species VARCHAR(40);