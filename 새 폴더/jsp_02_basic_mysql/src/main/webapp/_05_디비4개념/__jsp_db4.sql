CREATE DATABASE jsp_db4;

USE jsp_db4;

CREATE TABLE student(
	student_number int,
	name varchar(20),
    gender varchar(2)
);

INSERT student VALUES(1001,'이만수','남');
INSERT student VALUES(1002,'이영희','여');
INSERT student VALUES(1003,'김민정','여');
INSERT student VALUES(1004,'이철민','남');
INSERT student VALUES(1005,'오만석','남');
INSERT student VALUES(1006,'최이슬','여');

SELECT * FROM student;


CREATE TABLE score(
    student_number int,
    kor int,
    math int
);

INSERT score VALUES(1001,10,20);
INSERT score VALUES(1002,70,30);
INSERT score VALUES(1003,64,65);
INSERT score VALUES(1004,64,87);
INSERT score VALUES(1005,64,80);
INSERT score VALUES(1006,14,90);

SELECT * FROM score;




