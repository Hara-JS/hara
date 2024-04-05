

# 01 데이터 베이스 생성하기
CREATE DATABASE _01_sample;

# 02 데이터 베이스 사용하기
USE _01_sample;


# 03 테이블 생성하기
-- CREATE TABLE 테이블명(열 정의1, 열 정의2, ...);

CREATE TABLE sample01(

	sample01_no INT(11),
    sample01_name VARCHAR(20),
    sample01_birthday varchar(20),
    sample01_gender VARCHAR(10)
);

INSERT INTO sample01 VALUES(1, '박준용', '1976-10-18', '남');

INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(2, '홍영아', '1990-03-28', '여');

INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(3, '홍길동', '1990-04-28', '남');

INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(4, '이영아', '1993-08-18', '여');

INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(5, '김신영', '1996-02-03', '여');



SELECT * FROM sample01;

-- DROP TABLE sample01;




