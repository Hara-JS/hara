-- (3) WHERE 과 논리연산자 --

-- [1] 번호가 3보다 작은 데이터이고 생일이 1990 이전 인 데이터만 출력 
SELECT * FROM sample01 WHERE sample01_no < 3 AND sample01_birthday < '1990-01-01';

-- [2] 생일이 1993년 이후 이고 성별이 여자인 데이터만 출력 
SELECT * FROM sample01 WHERE sample01_birthday > '1993-12-31'  AND sample01_gender='여';

-- [3] 남자이거나 번호가 3이후인 데이터 출력
SELECT * FROM sample01 WHERE sample01_gender = '남' OR sample01_no >= 3;

-- [4] 번호가 짝수이거나 여자인 데이터만 출력하시오.
SELECT * FROM sample01 WHERE sample01_no % 2 = 0 OR sample01_gender='여';


-- [문제] --
-- [1] 번호가 3보다 작은 데이터이고 생일이 1990 이전 인 데이터만 출력 
-- [2] 생일이 1993년 이후 이고 성별이 여자인 데이터만 출력 
-- [3] 남자이거나 번호가 3이후인 데이터 출력
-- [4] 번호가 짝수이거나 여자인 데이터만 출력하시오.







