CREATE DATABASE jsp_db2;

USE jsp_db2;

CREATE TABLE member(
	number int,
	id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20)
);

-- DROP TABLE member;
DESC member;

INSERT INTO member (number, id, pw, name) VALUES ( 1001, 'qwer', '1234', '홍길동');
INSERT INTO member VALUES (1002, 'abcd', '1234', '박대길');
INSERT INTO member VALUES (1003, 'hello', '1234', '김여신');
INSERT INTO member VALUES (1004, 'test', '1111', '민서희');

SELECT * FROM member;


SELECT * FROM member where id='qwer';



