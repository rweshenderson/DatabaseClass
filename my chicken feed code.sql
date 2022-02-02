DROP TABLE chicken_feed;
DROP TABLE manufacturer;
DROP SEQUENCE sq_feed_id;
DROP SEQUENCE sq_brand_id;

CREATE SEQUENCE sq_feed_id
    INCREMENT BY 1
    MAXVALUE 19999
    MINVALUE 10000
    NO CYCLE;

CREATE SEQUENCE sq_brand_id
    INCREMENT BY 1
    MAXVALUE 29999
    MINVALUE 20000
    NO CYCLE;

CREATE TABLE manufacturer
  (
  brand_id  NUMERIC(5) DEFAULT NEXTVAL('sq_brand_id') PRIMARY KEY,
  name      VARCHAR(30) NOT NULL UNIQUE,
  address   VARCHAR(50),
  city      VARCHAR(30),
  state     CHAR(2),
  zip       NUMERIC(5)
  );

CREATE TABLE chicken_feed
  (
  feed_id     NUMERIC(5) DEFAULT NEXTVAL('sq_feed_id') PRIMARY KEY,
  brand_id    NUMERIC(5),
  type        VARCHAR(20),
  weight      INT,
  description TEXT,
  organic     BOOLEAN,
  medicated   BOOLEAN,
  life_stage  VARCHAR(20)
  );

INSERT INTO manufacturer
  (name, city)
VALUES('Oakley','Beebe');

INSERT INTO chicken_feed
  (brand_id,type,weight)
VALUES(20000,'Crumbles',25);

SELECT * FROM chicken_feed;

SELECT * FROM manufacturer;

ALTER TABLE chicken_feed
  ADD CONSTRAINT fk_brand_id FOREIGN KEY (brand_id)
  REFERENCES manufacturer (brand_id) ON DELETE SET NULL;

DELETE FROM manufacturer
  WHERE brand_id = 20000;
