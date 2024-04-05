-- (2) WHERE 과 비교연산자 --

-- WHERE 은 언어의 IF 와 비슷하다.

-- [1] 번호가 3보다 작은 데이터만 출력 
SELECT * FROM sample01 WHERE sample01_no < 3;

-- [2] 생일이 1990년 이전 데이터만 출력 
SELECT * FROM sample01 WHERE sample01_birthday < '1990-01-01';

-- [3] 남자만 출력
SELECT * FROM sample01 WHERE sample01_gender = '남';

-- [4] 번호가 짝수인 데이터만 출력하시오.
SELECT * FROM sample01 WHERE sample01_no % 2 = 0;

-- [5] 성별이 남자가 아닌 데이터만 출력하시오.
SELECT * FROM sample01 WHERE sample01_gender <> '남';

-- [6] 생일이 1991년 이후 출생인 데이터만 출력하시오.
SELECT * FROM sample01 WHERE sample01_birthday > '1990-12-31';

-- [7] 번호가 홀수인 데이터만 출력하시오.
SELECT * FROM sample01 WHERE sample01_no % 2 = 1;

-- [문제]--
-- [1] 번호가 3보다 작은 데이터만 출력 
-- [2] 생일이 1990년 이전 데이터만 출력 
-- [3] 남자만 출력
-- [4] 번호가 짝수인 데이터만 출력하시오.
-- [5] 성별이 남자가 아닌 데이터만 출력하시오.
-- [6] 생일이 1991년 이후 출생인 데이터만 출력하시오.
-- [7] 번호가 홀수인 데이터만 출력하시오.





