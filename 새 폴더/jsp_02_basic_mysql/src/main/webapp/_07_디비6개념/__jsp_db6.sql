CREATE DATABASE jsp_db6;

USE jsp_db6;

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


CREATE TABLE item(
   item_number int ,
   item_name varchar(20)
);

INSERT item VALUES(100001,"고래밥");
INSERT item VALUES(100002,"새우깡");
INSERT item VALUES(100003,"감자깡");
INSERT item VALUES(100004,"칸쵸");
INSERT item VALUES(100005,"오징어땅콩");
INSERT item VALUES(100006,"빼빼로");
INSERT item VALUES(100007,"고구마깡");
INSERT item VALUES(100008,"포카칩");

select * from item;

CREATE TABLE item_order(
   member_number int ,
   item_number int
);
INSERT item_order VALUES(3001,100001);
INSERT item_order VALUES(3001,100002);
INSERT item_order VALUES(3003,100001);
INSERT item_order VALUES(3002,100007);
INSERT item_order VALUES(3003,100006);
INSERT item_order VALUES(3005,100007);
INSERT item_order VALUES(3002,100001);
INSERT item_order VALUES(3001,100003);
INSERT item_order VALUES(3003,100002);
INSERT item_order VALUES(3001,100001);
INSERT item_order VALUES(3002,100003);
INSERT item_order VALUES(3001,100004);
INSERT item_order VALUES(3003,100004);
INSERT item_order VALUES(3004,100001);


SELECT * FROM item_order;




