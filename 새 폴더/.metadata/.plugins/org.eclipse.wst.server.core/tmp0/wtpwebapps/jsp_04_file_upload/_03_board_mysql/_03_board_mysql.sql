CREATE DATABASE _03_board_mysql;
USE _03_board_mysql;

CREATE TABLE board (
	board_number INT PRIMARY KEY AUTO_INCREMENT
    ,board_writer VARCHAR(20)
    ,board_subject VARCHAR(50)
    ,board_content VARCHAR(500)
    ,board_date VARCHAR(20)
    ,board_readcount INT
    ,board_ref INT
    ,board_step INT
    ,board_level INT
    ,board_remove INT
);
INSERT INTO board VALUES(0, '작성자01', '제목01', '내용01', '2024-05-01 10:30:21', 0, 1, 1, 1, 0);
INSERT INTO board VALUES(0, '작성자02', '제목02', '내용02', '2024-05-02 11:30:21', 0, 2, 1, 1, 0);
INSERT INTO board VALUES(0, '작성자03', '제목03', '내용03', '2024-05-03 12:30:21', 0, 3, 1, 1, 0);
INSERT INTO board VALUES(0, '작성자04', '제목04', '내용04', now(), 0, 4, 1, 1, 0);
SELECT * FROM board;


CREATE TABLE boardimage (
	 boardimage_number INT PRIMARY KEY AUTO_INCREMENT
    ,boardimage_boardnumber INT
    ,boardimage_name VARCHAR(20)
);
SELECT * FROM boardimage;


