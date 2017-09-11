DROP TABLE characters;
DROP TABLE houses;

CREATE TABLE houses(
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL,
  allegiance_id INT8 REFERENCES houses(id) NULL
);

CREATE TABLE characters(
  id SERIAL8 primary key,
  fName VARCHAR(255) NOT NULL,
  sName VARCHAR(255) NOT NULL,
  gender CHAR(1) NOT NULL,
  house_id INT8 REFERENCES houses(id),
  mother_id INT8 REFERENCES characters(id) NULL,
  father_id INT8 REFERENCES characters(id) NULL
);
