-- USE cafe24호스팅아이디명;

USE javawebmaster;

CREATE TABLE member0620 (
	member_id VARCHAR(20),
	member_pw VARCHAR(20),
	member_name VARCHAR(20)
);

INSERT INTO member0620 VALUES('qwer', '1234', '홍길동');
INSERT INTO member0620 VALUES('abcd', '1234', '김철수');
INSERT INTO member0620 VALUES('hello', '1234', '민유진');

SELECT * FROM member0620;

SHOW TABLES;