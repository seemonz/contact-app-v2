CREATE TABLE contacts (
  id serial NOT NULL PRIMARY KEY,
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  email varchar(40) NOT NULL
);

INSERT INTO contacts (firstname, lastname, email)
  VALUES ('simon', 'pelletier', 'seemonz@gmail.com');

INSERT INTO contacts (firstname, lastname, email)
  VALUES ('tomah', 'axford', 'axford@gmail.com');

INSERT INTO contacts (firstname, lastname, email)
  VALUES ('jared', 'halpin', 'jared@gmail.com');
