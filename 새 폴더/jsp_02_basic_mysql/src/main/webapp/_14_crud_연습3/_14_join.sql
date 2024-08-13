CREATE DATABASE _14_join;
USE _14_join;

CREATE TABLE member (
	id VARCHAR(10),
    pw VARCHAR(10),
    name VARCHAR(10),
    gender VARCHAR(5)
);

INSERT INTO member (id, pw, name, gender) VALUES('admin', 'admin', 'admin', '남성');
INSERT INTO member (id, pw, name, gender) VALUES('qwer', '1111', '이만수', '남성');
INSERT INTO member VALUES('abcd', '2222', '박영희', '여성');
INSERT INTO member VALUES('hello', '3333', '이수민', '여성');

SELECT * FROM member;

-- SELECT COUNT(*) FROM member;
-- SELECT * FROM member;
-- DELETE FROM member WHERE id='abcd';
-- SELECT COUNT(*) FROM member WHERE id='hello';
-- SELECT COUNT(*) FROM member WHERE id='hello' AND pw='3333';
-- SELECT pw, name, gender FROM member WHERE id='hello';
-- SELECT pw FROM member WHERE id='hello';
-- UPDATE member SET name='박하늬', gender='여성' WHERE id='qwer';

-- DROP TABLE member;