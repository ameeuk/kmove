	
//데이터 베이스 설정. WEB-INF 폴더의 web.xml 파일을 열어 아래의 정보를 수정하세요.
	jdbcdriver=com.mysql.jdbc.Driver
	jdbcUrl=jdbc:mysql://localhost:3306/[데이터베이스명]?characterEncoding=utf8
	dbUser=[db아이디]
	dbPass=[db비번]
	validationQuery=select 1
	minIdle=3
	maxTotal=30
	poolName=login

//데이터베이스명은 kmove
CREATE DATABASE `kmove`;

//as게시판 테이블
DROP TABLE IF EXISTS `kmove`.`board`;
CREATE TABLE  `kmove`.`board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `writer` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(500) NOT NULL,
  `postingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

//공지사항 테이블
DROP TABLE IF EXISTS `kmove`.`notice`;
CREATE TABLE  `kmove`.`notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `writer` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(200) NOT NULL,
  `postingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 PACK_KEYS=0;

//회원 테이블
DROP TABLE IF EXISTS `kmove`.`member`;
CREATE TABLE  `kmove`.`member` (
  `memberid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `regdate` datetime NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

