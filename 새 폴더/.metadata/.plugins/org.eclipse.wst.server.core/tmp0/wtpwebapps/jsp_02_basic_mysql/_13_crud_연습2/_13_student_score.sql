CREATE DATABASE _13_student_score;

USE _13_student_score;



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
    math int,
    total int,
    avg float,
    score_rank int
);

INSERT score VALUES(1001,10,20,0,0,0);
INSERT score VALUES(1002,70,30,0,0,0);
INSERT score VALUES(1003,64,65,0,0,0);
INSERT score VALUES(1004,64,87,0,0,0);
INSERT score VALUES(1005,64,80,0,0,0);
INSERT score VALUES(1006,14,90,0,0,0);

SELECT * FROM score;




