CREATE DATABASE jsp_07_poject_mysql;
USE jsp_07_poject_mysql;

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

CREATE TABLE book (
	book_number INT PRIMARY KEY AUTO_INCREMENT 
    ,book_category VARCHAR(50)
    ,book_subcategory VARCHAR(50)
    ,book_name VARCHAR(50)
    ,book_price INT
    ,book_stock INT
    ,book_image VARCHAR(20)
    ,book_contentImage VARCHAR(20)    
    ,book_info VARCHAR(100)
    ,book_discount INT
    ,book_sold INT
);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '혼자 공부하는 머신러닝+딥러닝', 						26000, 10, '', '', '박해선 저 | 한빛미디어 | 2020년 12월 21일', 												10, 78024);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', 'Must Have 머신러닝·딥러닝 문제해결 전략', 				38000,  9, '', '', '신백균 저 | 골든래빗 | 2022년 04월 13일', 													10, 3288);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '혼파이썬 머신러닝 완벽 가이드', 						40000,  3, '', '', '권철민 저 | 위키북스 | 2022년 04월 21일', 													10, 1302);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '파이썬 머신러닝 판다스 데이터 분석', 					25000,  2, '', '', '오승환 저 | 정보문화사 | 2019년 06월 15일', 												10, 9177);
INSERT INTO book VALUES(0, '컴퓨터공학', 'AI', 			'Do it! 첫 인공지능', 								13000,  1, '', '', '이애리 저 | 이지스퍼블리싱 | 2022년 04월 01일', 												10, 831);
INSERT INTO book VALUES(0, '컴퓨터공학', '일반/에세이', 	'비전공자를 위한 이해할 수 있는 IT 지식', 				16800,  0, '', '', '최원영 저 | 티더블유아이지 | 2020년 07월 14일', 												10, 73413);
INSERT INTO book VALUES(0, '컴퓨터공학', '일반/에세이', 	'비전공자도 이해할 수 있는 AI 지식', 					19800,  7, '', '', '박상길 저/정진호 그림 | 반니 | 2022년 03월 04일', 											10, 23217);
INSERT INTO book VALUES(0, '프로그래밍', 'HTML/CSS', 	'Do it! HTML+CSS+자바스크립트 웹 표준의 정석', 			30000,  6, '', '', '고경희 저 | 이지스퍼블리싱 | 2021년 01월 22일', 												10, 53232);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'혼자 공부하는 파이썬', 								18000,  1, '', '', '윤인성 저 | 한빛미디어 | 2019년 06월 10일', 												10, 80499);
INSERT INTO book VALUES(0, '프로그래밍', 'HTML/CSS', 	'코딩만 따라 해도 웹페이지가 만들어지는 HTML+CSS+자바스크립트', 24000,  3, '', '', '반병현 저 | 생능북스 | 2022년 02월 15일', 													10, 3552);

INSERT INTO book VALUES(0, '프로그래밍', 'Java Script','자바스크립트 완벽 가이드', 							42000,  4, '', '', '데이비드 플래너건 저/한선용 역 | 인사이트(insight) | 2022년 03월 31일', 							10, 4143);
INSERT INTO book VALUES(0, '프로그래밍', 'C/C++', 		'리눅스 C프로그래밍 스킬북', 							25000,  2, '', '', '김원표, 박승주 저 | 홍릉 | 2022년 02월 24일', 												 0, 90);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'모두의 데이터 분석 with 파이썬', 						18000,  5, '', '', '송석리, 이현아 저 | 길벗 | 2019년 04월 25일', 												10, 23670);
INSERT INTO book VALUES(0, '프로그래밍', 'C/C++', 		'놀랄 만큼 재미있는 C언어 기초 WONDER C', 				32000,  8, '', '', '조성호 저 | 인피니티북스 | 2021년 12월 17일', 												 0, 2208);
INSERT INTO book VALUES(0, '프로그래밍', 'C/C++', 		'266가지 문제로 정복하는 코딩 인터뷰 in C++', 			35000,  0, '', '', '아드난 아지즈, 쭝시엔 리, 아미트 프라카시 저/이창현, 김현욱 역 | 인사이트(insight) | 2021년 10월 01일', 	10, 1170);
INSERT INTO book VALUES(0, '프로그래밍', 'C/C++', 		'코딩 테스트를 위한 자료 구조와 알고리즘 with C++', 		32000,  7, '', '', '존 캐리, 셰리안 도시, 파야스 라잔 저/황선규 역 | 길벗 | 2020년 12월 08일', 							10, 4632);
INSERT INTO book VALUES(0, '프로그래밍', 'C#', 			'C#을 다루는 기술', 								36000,  1, '', '', '존 스킷 저/김명신 역 | 길벗 | 2021년 05월 13일', 											10, 2874);
INSERT INTO book VALUES(0, '프로그래밍', 'C#', 			'C# 프로그래밍(2판)', 								26000,  0, '', '', '윤인성 저 | 한빛아카데미 | 2021년 01월 05일', 												 0, 6498);
INSERT INTO book VALUES(0, 'DB/OS',   'IOS/안드로이드','아키텍처를 알아야 앱 개발이 보인다', 						30000,  4, '', '', '옥수환 저 | 비제이퍼블릭(BJ퍼블릭) | 2020년 04월 17일', 										10, 1524);
INSERT INTO book VALUES(0, '프로그래밍', 'Java Script','초보자를 위한 JavaScript 200제', 					25000,  3, '', '', '고재도, 노지연 저 | 정보문화사 | 2019년 03월 10일', 											10, 864);

INSERT INTO book VALUES(0, '프로그래밍', '파이썬',		'데이터 과학을 위한 기초수학 with 파이썬', 				26000,  6, '', '', '이병준 저 | 한빛아카데미 | 2021년 01월 06일', 												 5, 3273);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'컴퓨팅 사고와 소프트웨어 with 파이썬', 					25000,  1, '', '', '성태응, 홍정희, 이홍래 저 | 인피니티북스 | 2022년 03월 02일', 									0, 1872);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'파이썬 클린 코드', 									28000,  3, '', '', '마리아노 아나야 저/김창수 역 | 터닝포인트 | 2019년 02월 25일', 									10, 3942);
INSERT INTO book VALUES(0, '프로그래밍', 'Java Script', '자바스크립트 프로그래밍 입문', 						27000,  9, '', '', '윤인성 저 | 한빛아카데미 | 2022년 01월 03일', 												 0, 1674);
INSERT INTO book VALUES(0, '컴퓨터공학', 'AI', 			'쉽게 배우는 AWS AI 서비스', 							30000,  2, '', '', '피터 엘거, 오언 셔너히 저/맹윤호, 임지순 역/곽근봉 감수 | 한빛미디어 | 2022년 04월 15일', 				10, 714);
INSERT INTO book VALUES(0, 'DB/OS',   '유닉스/리눅스', 	'이것이 우분투 리눅스다(개정판)', 						32000,  9, '', '', '우재남 저 │ 한빛미디어 │ 2020년 11월 02일', 												10, 11148);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'Do it! 점프 투 파이썬', 							18000, 10, '', '', '박응용 저 | 이지스퍼블리싱 | 2019년 06월 20일', 												10, 117618);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '모두의 딥러닝', 									24000,  8, '', '', '조태호 저 | 길벗 | 2022년 03월 31일', 												 	10, 3084);
INSERT INTO book VALUES(0, '프로그래밍', 'JSP',			'자바 웹을 다루는 기술', 								45000,  5, '', '', '이병승 저 | 길벗 | 2019년 01월 10일', 													10, 3162);
INSERT INTO book VALUES(0, '프로그래밍', 'Java',		'Java의 정석', 									30000,  3, '', '', '남궁성 저 | 도우출판 | 2016년 02월 01일', 													10, 31371);

INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝',	'선형대수와 통계학으로 배우는 머신러닝 with 파이썬', 			37500, 10, '', '', '장철원 저 | 비제이퍼블릭(BJ퍼블릭) | 2021년 01월 26일', 										 8, 7542);
INSERT INTO book VALUES(0, 'DB/OS',   'IOS/안드로이드', '코틀린을 이용한 안드로이드 개발', 						30000,  5, '', '', '마르친 모스칼라, 이고르 워다 저/최민석 역 | 에이콘출판사 | 2018년 05월 31일', 					    10, 66);
INSERT INTO book VALUES(0, 'DB/OS',   'IOS/안드로이드', '깡쌤의 안드로이드 프로그래밍 with 자바', 				35000, 10, '', '', '강성윤 저 | 쌤즈 | 2022년 04월 01일', 													10, 0);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '코딩은 처음이라 with 딥러닝', 						18000,  6, '', '', '이종환 저 | 영진닷컴 | 2022년 04월 25일', 												 	10, 330);
INSERT INTO book VALUES(0, '프로그래밍', 'JAVA', 		 '생활코딩! 자바 프로그래밍 입문', 						27000,  7, '', '', '이고잉 저 | 위키북스 | 2022년 02월 09일', 													 0, 780);
INSERT INTO book VALUES(0, '컴퓨터공학', '일반/에세이', 	 '1일 1로그 100일 완성 IT 지식', 						20000,  8, '', '', '브라이언 W. 커니핸 저/하성창 역 | 인사이트(insight) | 2021년 12월 31일', 						10, 35775);
INSERT INTO book VALUES(0, '컴퓨터공학', '일반/에세이', 	'IT 지식으로 미래를 읽는다면', 							14000,  7, '', '', '윤정구 저 | 다른 | 2022년 03월 03일', 													 0, 654);
INSERT INTO book VALUES(0, '컴퓨터공학', '일반/에세이', 	'디지털 시대에 살아남는 IT 지식', 						16000,  5, '', '', '박성묵 저 | 정보문화사 | 2021년 08월 30일', 												10, 1500);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬',		'만들면서 배우는 파이썬과 40개의 작품들', 					18800,  6, '', '', '장문철 저 | 앤써북 | 2022년 02월 28일', 													10, 14856);
INSERT INTO book VALUES(0, 'DB/OS',   'IOS/안드로이드',	'웹 표준을 이용한 iOS 앱 개발 트레이닝', 					16000,  0, '', '', '크리스토퍼 레이온 저 / 김지선 역 | 정보문화사 | 2012년 07월 13일', 								10, 0);

INSERT INTO book VALUES(0, 'DB/OS',  'IOS/안드로이드',	'Do it! 스위프트로 아이폰 앱 만들기 입문', 				30000,  6, '', '', '송호정 , 이범근 저 | 이지스퍼블리싱 | 2022년 02월 28일', 										 5, 3660);
INSERT INTO book VALUES(0, 'DB/OS',  '유닉스/리눅스', 	'모두의 리눅스', 									25000,  7, '', '', '미야케 히데아키 , 오스미 유스케 저 | 이동규 역 | 길벗 | 2021년 12월 24일', 					    	 7, 1464);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '모두의 딥러닝', 									24000,  8, '', '', '조태호 저 | 길벗 | 2022년 03월 31일', 													10, 3084);
INSERT INTO book VALUES(0, '프로그래밍', 'JSP', 		'모바일 웹 서비스 구현을 위한 JSP 웹 프로그래밍', 			30000,  5, '', '', '김현규 , 박유현 저 | 한빛아카데미 | 2021년 08월 23일', 										 5, 372);
INSERT INTO book VALUES(0, '프로그래밍', 'JAVA', 		'명품 JAVA Programming', 							33000,  8, '', '', '황기태 , 김효수 저 | 생능출판 | 2018년 06월 01일', 											10, 17082);
INSERT INTO book VALUES(0, '프로그래밍', 'JAVA', 	 	'개념있는 JAVA', 									25000,  2, '', '', '시바타 보요 저 | 김성훈 역 | 영진닷컴 | 2019년 01월 10일', 										10, 132);
INSERT INTO book VALUES(0, '컴퓨터공학', '머신러닝/딥러닝', '이보다 더 쉬울 수 없는 자바 머신러닝 with Weka', 		31000,  0, '', '', '자바라머신러닝 저 | 비제이퍼블릭 | 2021년 01월 29일', 											10, 480);
INSERT INTO book VALUES(0, '프로그래밍', '파이썬', 		'이것이 취업을 위한 코딩 테스트다 with 파이썬', 			34000,  0, '', '', '나동빈 저 | 한빛미디어 | 2020년 08월 05일', 												10, 42039);
INSERT INTO book VALUES(0, '프로그래밍', 'JSP',			'자신감 뿜뿜! JSP 웹 프로그래밍 Hard Carry', 			26800,  0, '', '', '신윤환 저 | 생능출판 | 2022년 01월 10일', 													 0, 783);
INSERT INTO book VALUES(0, 'DB/OS',   '유닉스/리눅스',	'리눅스 입문자를 위한 명령어 사전', 						32000,  1, '', '', '가와구치 히로시 , 다야 후미히코 , 미사와 아키라 저 | 서수환 역 | 한빛미디어 | 2021년 07월 07일', 			 0, 4362);
SELECT * FROM book;


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

UPDATE board SET board_remove = 1 WHERE board_number = 1;

SELECT * FROM board;

SELECT * FROM board WHERE board_number = 1;

CREATE TABLE boardimage (
	 boardimage_number INT PRIMARY KEY AUTO_INCREMENT
    ,boardimage_boardnumber INT
    ,boardimage_name VARCHAR(20)
);

SELECT * FROM boardimage;



CREATE TABLE cart (
	cart_number INT PRIMARY KEY AUTO_INCREMENT
    ,cart_buyer VARCHAR(20)
    ,cart_buycount INT
    ,cart_booknumber INT
);

CREATE TABLE delivery (
	delivery_number INT PRIMARY KEY AUTO_INCREMENT
    ,delivery_name VARCHAR(20)
    ,delivery_addr VARCHAR(20)
    ,delivery_tel VARCHAR(20)
);

CREATE TABLE ordermenu (
	order_number INT PRIMARY KEY AUTO_INCREMENT
    ,order_deliverynumber INT
    ,order_booknumber INT
    ,order_buycount INT
    ,order_buyer VARCHAR(20)
);



SELECT * FROM cart;
SELECT * FROM book;
SELECT * FROM member;
SELECT * FROM ordermenu;
SELECT * FROM delivery;

SELECT max(delivery_number) from delivery;
SELECT max(delivery_number) from delivery;

-- 도서 상세 페이지
SELECT * FROM book WHERE book_number = 1;
-- 로그인
SELECT * FROM member WHERE member_id = 'qwer1234' AND member_pw = 'Qwer1234!';

-- 회원가입
INSERT INTO member (member_id, member_pw, member_name, member_email, member_phone, member_addr1, member_addr2, member_addr3, member_gender, member_route, member_marketing) 
VALUES('test1234', 'Test1234!', '고유동', 'test@naver.com', '0102345678', '02830', '서울 성북구 아리랑로 3', '100동 209호', 1, 1, 0);

-- 아이디 중복 검사
SELECT * FROM member WHERE member_id = 'sdefd2';
-- 이메일 중복 검사
SELECT * FROM member WHERE member_email = 'sdefd2@naver.com';


SELECT max(delivery_number) from delivery;

SELECT * FROM board ORDER BY board_ref DESC , board_level ASC;


SELECT MAX(board_ref) FROM board;


SELECT * FROM board;



