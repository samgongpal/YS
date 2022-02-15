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
    t_no number(5) not null /* ��ȭ�� ���̺� join */
);


CREATE TABLE RESERVATION(
    r_no number(10) PRIMARY KEY,
    r_count number(10),
    r_date date,
    m_no number(5) not null, /* ��ȭ��ȣ : ��ȭ���̺��� ���� ��ȣ�� ������ �� ��ȭ ���� */
    u_no number(5) not null, /* ȸ����ȣ : ȸ�����̺��� ������� �����ͼ� ������� �˻� */
    t_no number(5) not null /* ��ȭ����ȣ : ��ȭ�����̺��� ��ȭ�� ���� join */
);

CREATE TABLE qna(
    q_no number(10) PRIMARY KEY,
    q_title varchar2(50),
    q_con varchar2(3000),
    q_hit number(10),
    q_date date
);

commit;

/* ��ȭ��ȣ, ��ȭ����, ����, ���, �帣, ������, ������, �������, �󿵽ð�, ������, ��ȭ���� */
insert into MOVIE values(1, '����Ƽ��', '�纥�÷���', '��Ȧ����,��ũ������', '�׼�', '20220216', '20220516', 
'A', 116, 40000, '��� ���� �ɾ��ٸ� ���� �������� ������ ã�ƾ� �Ѵ�!');
insert into MOVIE values(2, '������ �ּ�ȸ�� 0', '�ڼ���', '����Ÿ�ޱ���,�ϳ��ڿ�ī��', '�ִ�', '20220217', '20220517',
'B', 105, 20000, '12�� 24��, �츮�� ��;����� �����Ѵ�');
insert into MOVIE values(3, '��', '��� ������', 'Ƽ��ü����,����ī�۰Ž�', 'SF', '20220209', '20220509',
'A', 155, 50000, '���� �����ϴ� �ڰ� ���ָ� �����Ѵ�!');
insert into MOVIE values(4, '�� ��Ʈ��', '�˸��꽺', '�ι�Ʈ��ƾ��,���ٳ�', '�׼�', '20220301', '20220601',
'B', 176, 10000, '������ �� ���ΰ� �Ǵ��� �� ���ΰ� ����� ������ ���ø��� ���Ҵ�');
insert into MOVIE values(5, '���ڸ��� ����', '�� �丶�� �ش���', '�˶�����,����ȣ����', '���', '20220216', '20220516',
'B', 134, 70000, '1973�� ��� ������ ������ û���� �Ѻ������� �޷����� �׵��� �̾߱�');
insert into MOVIE values(6, '���� ���� ����', '�ɳ׽� �귡��', '�ɳ׽��귡��,������', '����', '20220209', '20220509',
'C', 127, 90000, '��ȥ�κθ� �¿� ����Ʈ ���ϰ��� ��ȣȭ ���������� ���λ���� ��������');
insert into MOVIE values(7, '355', '���̸� Ų����', '����ī��������,���̾�ũ���', '�׼�', '20220209', '20220509',
'B', 122, 100000, '����Ŭ���� �� ������Ʈ TEAM ��355�� ���� �׵��� �����δ�!');
insert into MOVIE values(8, '�ظ����Ϳ� �һ�������', '���̺� ������', '�ٴϿ�����Ŭ����,�����ӽ�', 'ȯŸ��', '20220209', '20220509',
'A', 137, 50000, '����� ���¿� ���� ȣ�׿�Ʈ�� ���ϱ� ���� �ظ����Ϳ� �һ��� ����, �׵��� ���� ��Ҵ�!');
insert into MOVIE values(9, '���� �к�', '���Ǽ�', '����,�ڿ���', '��ť', '20220210', '20220510',
'A', 88, 20000, '2016�� �����谡 �ָ��� �� ������ �� ������ ������ �ѳ���� ��ġ�ε��� �׳��� ��ȭ�� �����Ѵ�!');
insert into MOVIE values(10, '��2�Դ�', '�������׽�', '��Ʃ��Ŀ����,����������Ǭ', '�ִ�', '20220105', '20220405',
'A', 109, 60000, '�� ���谡 �ָ��� ��������! �Բ� ������ �غ����?');

INSERT INTO MUSER VALUES(1, 'aaa123', 'aaa123', 'aaa123@aaa.com', '19900101', '��ȸ��', 'M', '20210101', '01011112222'); /* ȸ����ȣ, ���̵�, ��й�ȣ, �̸���, �������, �̸�, ����, ��������, ��ȭ */
INSERT INTO MUSER VALUES(2, 'bbb123', 'bbb123', 'bbb123@bbb.com', '19910202', '��ȸ��', 'F', '20210201', '01011113333');
INSERT INTO MUSER VALUES(3, 'ccc123', 'ccc123', 'ccc123@ccc.com', '19920303', '��ȸ��', 'M', '20210301', '01011114444');
INSERT INTO MUSER VALUES(4, 'ddd123', 'ddd123', 'ddd123@ddd.com', '19930404', '��ȸ��', 'F', '20210401', '01011115555');
INSERT INTO MUSER VALUES(5, 'eee123', 'eee123', 'eee123@eee.com', '19940505', '��ȸ��', 'M', '20210501', '01011116666');
INSERT INTO MUSER VALUES(6, 'fff123', 'fff123', 'fff123@fff.com', '19950606', '��ȸ��', 'F', '20210601', '01011117777');
INSERT INTO MUSER VALUES(7, 'ggg123', 'ggg123', 'ggg123@ggg.com', '19960707', '��ȸ��', 'M', '20210701', '01011118888');
INSERT INTO MUSER VALUES(8, 'hhh123', 'hhh123', 'hhh123@hhh.com', '19970808', '��ȸ��', 'F', '20210801', '01011119999');
INSERT INTO MUSER VALUES(9, 'iii123', 'iii123', 'iii123@iii.com', '19980909', '��ȸ��', 'M', '20210901', '01022221111');
INSERT INTO MUSER VALUES(10, 'jjj123', 'jjj123', 'jjj123@jjj.com', '19991010', '��ȸ��', 'F', '20211001', '01022223333');
INSERT INTO THEATER VALUES(1, '�����', '�߾ӵ�', 3); /* ��ȭ����ȣ, ��ȭ���̸�, ����(��), �󿵰����� */
INSERT INTO THEATER VALUES(2, '�����', '������', 2);
INSERT INTO THEATER VALUES(3, '�����', '�絿', 2);
insert into theater_room values(1, 5, 5, 1); /* �󿵰���ȣ, ���¼�, ���¼�, ��ȭ����ȣ(��ȭ�����̺�join) */
insert into theater_room values(2, 6, 6, 1);
insert into theater_room values(3, 7, 7, 1);
insert into RESERVATION values(1, 1, '20220201', 1, 1, 1); /*���Ź�ȣ, �ο���, ���ų�¥, ��ȭ��ȣ(��ȭ���̺�), ȸ����ȣ(ȸ�����̺�), ��ȭ����ȣ(��ȭ�����̺�) */
insert into RESERVATION values(2, 3, '20220201', 2, 2, 2);
insert into RESERVATION values(3, 2, '20220201', 3, 3, 3);
insert into RESERVATION values(4, 2, '20220201', 4, 4, 2);
insert into RESERVATION values(5, 1, '20220201', 5, 5, 1);


select theater.t_name, theater.t_address, theater.t_list, theater_room.tr_no, theater_room.tr_row, theater_room.tr_column from theater, theater_room WHERE THEATER.t_no = THEATER_ROOM.t_no;