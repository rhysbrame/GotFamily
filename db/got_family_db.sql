DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS allegiances;
DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS religions;

CREATE TABLE religions(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  symbol VARCHAR(255)
);

CREATE TABLE houses(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  sigil_link VARCHAR(255),
  sigil_script VARCHAR(255),
  words VARCHAR(255),
  titles VARCHAR(255),
  seat VARCHAR(255),
  region VARCHAR(255),
  religion_id INT8 REFERENCES religions(id)
);

CREATE TABLE allegiances(
  id SERIAL8 PRIMARY KEY,
  a_id INT8 REFERENCES houses(id) NOT NULL,
  b_id INT8 REFERENCES houses(id) NOT NULL
);

CREATE TABLE characters(
  id SERIAL8 PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  gender CHAR(1),
  portrait VARCHAR(255) NULL,
  house_id INT8 REFERENCES houses(id) ON DELETE CASCADE,
  mother_id INT8 REFERENCES characters(id) ON DELETE CASCADE,
  father_id INT8 REFERENCES characters(id) ON DELETE CASCADE,
  religion_id INT8 REFERENCES religions(id) NULL
);