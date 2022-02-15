drop table MOVIE;
drop table MUSER;
drop table THEATER;
drop table THEATER_ROOM;
drop table RESERVATION;
drop table qna;

CREATE TABLE MOVIE(

    m_no number(5) PRIMARY KEY,
    m_name varchar2(100),
    m_dir varchar2(50),
    m_actor varchar2(100),
    m_genre varchar2(10),
    m_sdate date,
    m_edate date,
    m_grade char(2),
    m_rtime number(10),
    m_view number(10),
    m_info varchar(1000)
);



CREATE TABLE MUSER(
    u_no number(5) PRIMARY KEY,
    u_id varchar2(10),
    u_pw varchar2(10),
    u_mail varchar2(30),
    u_birth date,
    u_name varchar2(10),
    u_gender char(2),
    u_regdate date,
    u_phone varchar2(15)
);

CREATE TABLE THEATER(
    t_no number(5) PRIMARY KEY,
    t_name varchar2(10),
    t_address varchar2(10),
    t_list number(3)
);

CREATE TABLE THEATER_ROOM(
    tr_no number(5) PRIMARY KEY,
    tr_row number(10),
    tr_column number(10),
    t_no number(5) not null /* 영화관 테이블 join */
);


CREATE TABLE RESERVATION(
    r_no number(10) PRIMARY KEY,
    r_count number(10),
    r_date date,
    m_no number(5) not null, /* 영화번호 : 영화테이블에서 같은 번호가 있으면 그 영화 예약 */
    u_no number(5) not null, /* 회원번호 : 회원테이블에서 생년월일 가져와서 관람등급 검사 */
    t_no number(5) not null /* 영화관번호 : 영화관테이블에서 영화관 정보 join */
);

CREATE TABLE qna(
    q_no number(10) PRIMARY KEY,
    q_title varchar2(50),
    q_con varchar2(3000),
    q_hit number(10),
    q_date date
);

commit;

/* 영화번호, 영화제목, 감독, 배우, 장르, 개봉일, 종영일, 관람등급, 상영시간, 관객수, 영화설명 */
insert into MOVIE values(1, '언차티드', '루벤플레셔', '롬홀랜드,마크월버그', '액션', '20220216', '20220516', 
'A', 116, 40000, '모든 것을 걸었다면 세상 누구보다 빠르게 찾아야 한다!');
insert into MOVIE values(2, '극장판 주술회전 0', '박성후', '오가타메구미,하나자와카나', '애니', '20220217', '20220517',
'B', 105, 20000, '12월 24일, 우리는 백귀야행을 결행한다');
insert into MOVIE values(3, '듄', '드니 빌뇌브', '티모시샬라메,레베카퍼거슨', 'SF', '20220209', '20220509',
'A', 155, 50000, '듄을 지배하는 자가 우주를 지배한다!');
insert into MOVIE values(4, '더 배트맨', '맷리브스', '로버트패틴슨,폴다노', '액션', '20220301', '20220601',
'B', 176, 10000, '영웅이 될 것인가 악당이 될 것인가 운명을 결정할 선택만이 남았다');
insert into MOVIE values(5, '리코리쉬 피자', '폴 토마스 앤더슨', '알라나하임,쿠퍼호프만', '멜로', '20220216', '20220516',
'B', 134, 70000, '1973년 어느 찬란한 여름날 청춘의 한복판으로 달려가는 그들의 이야기');
insert into MOVIE values(6, '나일 강의 죽음', '케네스 브래너', '케네스브래너,갤가돗', '범죄', '20220209', '20220509',
'C', 127, 90000, '신혼부부를 태운 이집트 나일강의 초호화 여객선에서 살인사건이 벌어진다');
insert into MOVIE values(7, '355', '사이먼 킨버그', '제시카차스테인,다이앤크루거', '액션', '20220209', '20220509',
'B', 122, 100000, '월드클래스 블랙 에이전트 TEAM ‘355’ 드디어 그들이 움직인다!');
insert into MOVIE values(8, '해리포터와 불사조기사단', '데이빗 예이츠', '다니엘래드클리프,엠마왓슨', '환타지', '20220209', '20220509',
'A', 137, 50000, '어둠의 세력에 빠진 호그와트를 구하기 위해 해리포터와 불사조 기사단, 그들이 손을 잡았다!');
insert into MOVIE values(9, '나의 촛불', '김의성', '고영태,박영수', '다큐', '20220210', '20220510',
'A', 88, 20000, '2016년 전세계가 주목한 그 시작의 날 진보와 보수를 넘나드는 정치인들이 그날의 비화를 증언한다!');
insert into MOVIE values(10, '씽2게더', '가스제닝스', '메튜맥커너히,리즈위더스푼', '애니', '20220105', '20220405',
'A', 109, 60000, '전 세계가 주목한 스테이지! 함께 도전할 준비됐지?');

INSERT INTO MUSER VALUES(1, 'aaa123', 'aaa123', 'aaa123@aaa.com', '19900101', '김회원', 'M', '20210101', '01011112222'); /* 회원번호, 아이디, 비밀번호, 이메일, 생년월일, 이름, 성별, 가입일자, 전화 */
INSERT INTO MUSER VALUES(2, 'bbb123', 'bbb123', 'bbb123@bbb.com', '19910202', '이회원', 'F', '20210201', '01011113333');
INSERT INTO MUSER VALUES(3, 'ccc123', 'ccc123', 'ccc123@ccc.com', '19920303', '정회원', 'M', '20210301', '01011114444');
INSERT INTO MUSER VALUES(4, 'ddd123', 'ddd123', 'ddd123@ddd.com', '19930404', '현회원', 'F', '20210401', '01011115555');
INSERT INTO MUSER VALUES(5, 'eee123', 'eee123', 'eee123@eee.com', '19940505', '오회원', 'M', '20210501', '01011116666');
INSERT INTO MUSER VALUES(6, 'fff123', 'fff123', 'fff123@fff.com', '19950606', '연회원', 'F', '20210601', '01011117777');
INSERT INTO MUSER VALUES(7, 'ggg123', 'ggg123', 'ggg123@ggg.com', '19960707', '훈회원', 'M', '20210701', '01011118888');
INSERT INTO MUSER VALUES(8, 'hhh123', 'hhh123', 'hhh123@hhh.com', '19970808', '장회원', 'F', '20210801', '01011119999');
INSERT INTO MUSER VALUES(9, 'iii123', 'iii123', 'iii123@iii.com', '19980909', '구회원', 'M', '20210901', '01022221111');
INSERT INTO MUSER VALUES(10, 'jjj123', 'jjj123', 'jjj123@jjj.com', '19991010', '장회원', 'F', '20211001', '01022223333');
INSERT INTO THEATER VALUES(1, '삼공팔', '중앙동', 3); /* 영화관번호, 영화관이름, 지역(동), 상영관숫자 */
INSERT INTO THEATER VALUES(2, '삼공팔', '초지동', 2);
INSERT INTO THEATER VALUES(3, '삼공팔', '사동', 2);
insert into theater_room values(1, 5, 5, 1); /* 상영관번호, 행좌석, 열좌석, 영화관번호(영화관테이블join) */
insert into theater_room values(2, 6, 6, 1);
insert into theater_room values(3, 7, 7, 1);
insert into RESERVATION values(1, 1, '20220201', 1, 1, 1); /*예매번호, 인원수, 예매날짜, 영화번호(영화테이블), 회원번호(회원테이블), 영화관번호(영화관테이블) */
insert into RESERVATION values(2, 3, '20220201', 2, 2, 2);
insert into RESERVATION values(3, 2, '20220201', 3, 3, 3);
insert into RESERVATION values(4, 2, '20220201', 4, 4, 2);
insert into RESERVATION values(5, 1, '20220201', 5, 5, 1);


select theater.t_name, theater.t_address, theater.t_list, theater_room.tr_no, theater_room.tr_row, theater_room.tr_column from theater, theater_room WHERE THEATER.t_no = THEATER_ROOM.t_no;