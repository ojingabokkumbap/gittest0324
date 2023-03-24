create table dbShopNotice (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  content		text	not null,						/* 글 내용 */
  nDate			datetime	default now(),	/* 글 올린 날짜 */
  part			varchar(20)  not null, 		/* 파일 분류 */
 	fName varchar(100),													/* 문의시에 올린 사진이나 문서파일 */
  fSName varchar(200),
  popupSw   char(1)  default 'N'			/* 공지사항 초기화면 개시 여부 */		
  primary key(idx)
);

desc dbShopNotice;
drop table dbShopNotice;
delete from dbShopNotice;
select * from dbShopNotice;

-- 답변완료 

create table dbShopReview (
  idx  int  not null auto_increment,	/* 게시글의 고유번호 */
  mid				varchar(20) not null,			/* 회원 아이디(내가 올린 게시글 전체 조회시체 사용) */
  nickName  varchar(20)  not null,		/* 게시글 올린사람의 닉네임 */
  title			varchar(100) not null,		/* 게시글의 글 제목 */
  content		text	not null,						/* 글 내용 */
  wDate			datetime	default now(),	/* 글 올린 날짜 */
  productName int REFERENCES dbProduct(productName)
  primary key(idx)
);

-- 리뷰
CREATE TABLE review(
    idx int not null auto_increment, 
    orderIdx int REFERENCES dbOrder(orderIdx),
    productIdx int REFEREN
    dbProduct(productIdx), 
	  mid		varchar(20) not null,			/* 회원 아이디(내가 올린 게시글 전체 조회 시 사용) */
	  nickName  varchar(20)  not null,		/* 게시글 올린사람의 닉네임 */
	  title	varchar(100) not null,		/* 게시글의 글 제목 */
	  content text not null,
    rDate datetime default now(),
    fName 
    good int DEFAULT 0,
    primary key(idx)
);





desc review;
drop table review;
select * from review;
