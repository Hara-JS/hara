CREATE DATABASE _12_member;

USE _12_member;

CREATE TABLE member(
	member_number int,
	member_name varchar(20)
);

INSERT member VALUES(3001,'이만수');
INSERT member VALUES(3002,'김철민');
INSERT member VALUES(3003,'이영희');
INSERT member VALUES(3004,'조성아');
INSERT member VALUES(3005,'박민재');
INSERT member VALUES(3006,'유재석');

SELECT * FROM member;





