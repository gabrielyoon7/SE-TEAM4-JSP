DROP DATABASE if exists booksys ;

CREATE DATABASE booksys ;

USE booksys ;

CREATE TABLE Oid (
    last_id    INT NOT NULL
) ;

CREATE TABLE `Table` (
                         oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         number    INT NOT NULL,
                         places    INT NOT NULL,
                         limits   INT NOT NULL
) ;

CREATE TABLE Customer (
                          oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          name        VARCHAR(32) NOT NULL,
                          phoneNumber  CHAR(13) NOT NULL,
                          id            CHAR(13) NOT NULL,
                          PW            CHAR(13) NOT NULL,
                          blackList      BOOLEAN NOT NULL
) ;

CREATE TABLE WalkIn (
                        oid        int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        covers    int,
                        date        DATE,
                        time        TIME,
                        table_id    int
) ;

CREATE TABLE Reservation (
                             oid           int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                             covers       int,
                             date           DATE,
                             time           TIME,
                             table_id       int,
                             customer_id  int,
                             arrivalTime  TIME
) ;
CREATE TABLE   covidLog(
                              name VARCHAR(32)    NOT NULL,
                              address VARCHAR(32) NOT NULL,
                              phoneNumber CHAR(13) NOT NULL,
                              symptom BOOLEAN NOT NULL,
                              temperature DOUBLE NOT NULL,
                              tableNumber INT NOT NULL
                  
);
CREATE TABLE WaitingList(
                              date   DATE,
                              name VARCHAR(32) NOT NULL,
                              covers INT NOT NULL,
                              table_id int
);
CREATE TABLE Menu(
                              oid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              type   CHAR(13)   NOT NULL,
                              name VARCHAR(32) NOT NULL,
                              price INT NOT NULL,
                              imageURL VARCHAR(100)
);
CREATE TABLE pickup(
                              date DATE,
                              oid   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                              name VARCHAR(32) NOT NULL,
                              orderedList VARCHAR(32) NOT NULL
);

CREATE TABLE User (
                          oid        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          id            CHAR(13) NOT NULL,
                          password    CHAR(13) NOT NULL,
                          type VARCHAR (13) NOT NULL,
                          name        VARCHAR(32) NOT NULL,
                          birthDay   DATE,
                          phoneNumber  CHAR(13) NOT NULL,
                          blackList      BOOLEAN NOT NULL
) ;

INSERT INTO `user` VALUES(1000,201713919,1234,'관리자','윤주현','1996-03-25','010-4413-5698',false);
INSERT INTO `user` VALUES(1001,201912161,1234,'관리자','허수빈','2001-01-05','010-3217-5620',false);
INSERT INTO `user` VALUES(1002,201912149,1234,'관리자','최예슬','2000-09-24','010-3160-9231',false);

INSERT INTO `table` VALUES(101,1,1,4);
INSERT INTO `table` VALUES(102,2,2,4);
INSERT INTO `table` VALUES(103,3,3,2);
INSERT INTO `customer` VALUES(1, 'Gab', '010-4413-5698','Gab','1111',false);
INSERT INTO `customer` VALUES(2, 'Arthur', '010-0000-0000','Arthur','2222',true);
INSERT INTO `customer` VALUES(3, 'Dutch', '010-1111-1111','Dutch','3333',false);