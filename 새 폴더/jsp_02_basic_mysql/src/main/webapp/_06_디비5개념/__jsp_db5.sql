CREATE DATABASE jsp_db5;

USE jsp_db5;

CREATE TABLE user(
	student_number int,
	name varchar(20)
);

INSERT user VALUES(1001,'김철수');
INSERT user VALUES(1002,'이만수');
INSERT user VALUES(1003,'이영희');


SELECT * FROM user;


CREATE TABLE point(
    user_number int,
    point int
);

INSERT point VALUES(1001,1);
INSERT point VALUES(1002,3);
INSERT point VALUES(1001,4);
INSERT point VALUES(1003,2);
INSERT point VALUES(1003,2);

SELECT * FROM point;




