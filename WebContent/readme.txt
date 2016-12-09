	
//������ ���̽� ����. WEB-INF ������ web.xml ������ ���� �Ʒ��� ������ �����ϼ���.
	jdbcdriver=com.mysql.jdbc.Driver
	jdbcUrl=jdbc:mysql://localhost:3306/[�����ͺ��̽���]?characterEncoding=utf8
	dbUser=[db���̵�]
	dbPass=[db���]
	validationQuery=select 1
	minIdle=3
	maxTotal=30
	poolName=login

//�����ͺ��̽����� kmove
CREATE DATABASE `kmove`;

//as�Խ��� ���̺�
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

//�������� ���̺�
DROP TABLE IF EXISTS `kmove`.`notice`;
CREATE TABLE  `kmove`.`notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `writer` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(200) NOT NULL,
  `postingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 PACK_KEYS=0;

//ȸ�� ���̺�
DROP TABLE IF EXISTS `kmove`.`member`;
CREATE TABLE  `kmove`.`member` (
  `memberid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `regdate` datetime NOT NULL,
  PRIMARY KEY (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

