create database jsp_db1;
USE jsp_db1;

CREATE TABLE basic(
	a int,
	b float,
	c varchar(20)
);

DESC basic;
INSERT INTO basic (a, b, c) VALUES ( 10, 1234.45 , "hello");
INSERT INTO basic (a, b, c) VALUES ( 11, 33.4, "bye");
INSERT INTO basic  VALUES ( 12, 54.343, "one");
INSERT INTO basic  VALUES ( 13, 99.3432, "two");

SELECT * FROM basic;
SELECT * FROM basic where a=10;