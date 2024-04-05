-- (5) 데이터 삭제 와 삽입 

SELECT * FROM sample01;

-- [1] 3번을 삭제하시오.
DELETE FROM sample01 WHERE sample01_no=3;

-- [1-1] 원상복구
INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(3, '홍길동', '1990-04-28', '남');


-- [2] 성별이 여자인 데이터를 삭제하시오.
DELETE FROM sample01 WHERE sample01_gender='여';

-- [2-1] 원상복구
INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(2, '홍영아', '1990-03-28', '여');
INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(4, '이영아', '1993-08-18', '여');
INSERT INTO sample01 (sample01_no, sample01_name, sample01_birthday, sample01_gender) 
VALUES(5, '김신영', '1996-02-03', '여');


-- [1] 3번을 삭제하시오.
-- [2] 성별이 여자인 데이터를 삭제하시오.
-- [1-1] 원상복구
-- [2-1] 원상복구