CREATE TABLE contact (
  id serial NOT NUL PRIMARY KEY
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  email varchar(40) NOT NULL
);

INSERT INTO (id, firstname, lastname, email)
  VALUES (0, "Simon", "Pelletier", "seemonz@gmail.com");

INSERT INTO (id, firstname, lastname, email)
  VALUES (1, "Tomah", "Axford", "axford@gmail.com");

INSERT INTO (id, firstname, lastname, email)
  VALUES (2, "Trevor", "Engh", "trev@gmail.com");
