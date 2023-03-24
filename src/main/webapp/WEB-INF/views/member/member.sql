show tables;

create table member (
  idx int not null auto_increment,	/* 회원 고유번호 */
  mid varchar(20) not null,					/* 회원 아이디(중복불허) */
  pwd varchar(100) not null,				/* 비밀번호(SHA암호화 처리) */
  nickName varchar(20) not null,		/* 별명(중복불허/수정가능) */
  email   varchar(50) not null,			/* 이메일(아이디/비밀번호 분실시 사용) - 형식체크필수 */
  userDel   char(2) default 'NO',		/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
  level			int default 4,					/* 회원등급(0:관리자, 1:운영자, 2:우수회원, 3:정회원, 4:준회원 */
  visitCnt	int default 0,					/* 방문횟수 */
  startDate datetime default now(),	/* 최초 가입일 */
  lastDate  datetime default now(), /* 마지막 접속일 */
  primary key(idx,mid)							/* 주키: idx(고유번호), mid(아이디) */
);

/* drop table member; */
desc member;

insert into member values (default,'admin','1234','관리자입니다','yooheez@naver.com',default,0,default,default,default);

select * from member;

select count(*) as cnt from member where mid like '%1%';