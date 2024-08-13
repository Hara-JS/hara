CREATE DATABASE _03_ajax_join_mysql;
USE _03_ajax_join_mysql;

CREATE TABLE admin (
	admin_id VARCHAR(20) PRIMARY KEY
    ,admin_pw VARCHAR(20)
    ,admin_name VARCHAR(20)
    ,admin_email VARCHAR(20)
);
INSERT INTO admin VALUES('admin', 'admin', '관리자', 'admin@naver.com');
SELECT * FROM admin;

CREATE TABLE member (
	member_number INT PRIMARY KEY AUTO_INCREMENT 
	,member_id VARCHAR(20)
    ,member_pw VARCHAR(20)
    ,member_name VARCHAR(20)
    ,member_email VARCHAR(20)
    ,member_phone VARCHAR(20)
    ,member_addr1 VARCHAR(20)
    ,member_addr2 VARCHAR(50)
    ,member_addr3 VARCHAR(50)
    ,member_gender INT
    ,member_route INT
    ,member_marketing INT
);

INSERT INTO member VALUES(0, 'qwer1234', 'Qwer1234!', '홍길동', 'qwer@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1, 1);
INSERT INTO member VALUES(0, 'abcd1234', 'Abcd1234!', '김수정', 'abcd@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 2, 1, 0);
INSERT INTO member VALUES(0, 'hello1234', 'Hello1234!', '박철수', 'hello@naver.com', '01012345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1, 1);

SELECT * FROM member;




