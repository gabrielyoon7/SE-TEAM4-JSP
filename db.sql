DROP DATABASE if exists booksys ;

CREATE DATABASE booksys ;

USE booksys ;

CREATE TABLE Oid (
       last_id	 INT NOT NULL
) ;

CREATE TABLE `Table` (
       oid	     INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       number	 INT NOT NULL,
       places	 INT NOT NULL
) ;

CREATE TABLE Customer (
       oid	     INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       name	     VARCHAR(32) NOT NULL,
       phoneNumber  CHAR(13) NOT NULL
) ;

CREATE TABLE WalkIn (
       oid	     int NOT NULL PRIMARY KEY,
       covers	 int,
       date	     DATE,
       time	     TIME,
       table_id	 int
) ;

CREATE TABLE Reservation (
       oid	        int NOT NULL PRIMARY KEY,
       covers	    int,
       date	        DATE,
       time	        TIME,
       table_id	    int,
       customer_id  int,
       arrivalTime  TIME
) ;
CREATE TABLE NOTICE
( ID DOUBLE NOT NULL,
TITLE NVARCHAR(100) NOT NULL,
WRITER_ID NVARCHAR(50) NOT NULL,
CONTENT LONGTEXT,
REGDATE DATETIME (6) DEFAULT CURRENT_TIMESTAMP NOT NULL,
HIT DOUBLE DEFAULT 0 NOT NULL,
FILES NVARCHAR(1000),
PUB TINYINT DEFAULT 0 NOT NULL,
CONSTRAINT `NOTICE_PK` PRIMARY KEY (`ID`)
);

CREATE VIEW `NOTICE_VIEW` AS SELECT * FROM `NOTICE` ORDER BY REGDATE DESC;


INSERT INTO `table` VALUES(101,1,1);
INSERT INTO `table` VALUES(102,2,2);
INSERT INTO `table` VALUES(103,3,3);