-- (4) 데이터 수정 --

SELECT * FROM sample01;

-- [1] 성별이 '남'인 데이터를 'male' 로변경하시오.
UPDATE sample01 SET sample01_gender='male' WHERE sample01_gender='남';

-- [2] 성별이 'male'인 데이터를 '남' 로변경하시오.
UPDATE sample01 SET sample01_gender='남' WHERE sample01_gender='male';

-- [3] 이름이 '박준용' 인 데이터를 '김준용' 으로 변경하시오.
UPDATE sample01 SET sample01_name='김준용' WHERE sample01_name='박준용';

-- [4] 이름이 '김준용' 인 데이터를 '박준용' 으로 변경하시오.
UPDATE sample01 SET sample01_name='박준용' WHERE sample01_name='김준용';


-- [1] 성별이 '남'인 데이터를 'male' 로변경하시오.
-- [2] 성별이 'male'인 데이터를 '남' 로변경하시오.
-- [3] 이름이 '박준용' 인 데이터를 '김준용' 으로 변경하시오.
-- [4] 이름이 '김준용' 인 데이터를 '박준용' 으로 변경하시오.



