DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS allegiances;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE allegiances(
  id SERIAL8 PRIMARY KEY,
  houseA_id INT8 REFERENCES houses(id) NOT NULL,
  houseB_id INT8 REFERENCES houses(id) NOT NULL
);

CREATE TABLE characters(
  id SERIAL8 PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  gender CHAR(1),
  house_id INT8 REFERENCES houses(id) ON DELETE CASCADE,
  mother_id INT8 REFERENCES characters(id) ON DELETE CASCADE,
  father_id INT8 REFERENCES characters(id) ON DELETE CASCADE
);