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
                          blackList      VARCHAR(13) NOT NULL
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
CREATE TABLE CovidLog(
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
                              notice VARCHAR(100) NOT NULL,
                              imageURL VARCHAR(100)
);
CREATE TABLE Pickup(
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
                          blackList      VARCHAR(13) NOT NULL
) ;




INSERT INTO User(oid, id, password, type, name, birthDay, phoneNumber, blackList) VALUES(1000, 'admin', 'admin', '관리자', '홈페이지관리자', '2021-05-10', '010-0000-0000', 'false');
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList) VALUES(201713919,1234,'관리자','윤주현','1996-03-25','010-4413-5698','false');
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList) VALUES(201912161,1234,'관리자','허수빈','2001-01-05','010-3217-5620','false');
INSERT INTO User(id, password, type, name, birthDay, phoneNumber, blackList) VALUES(201912149,1234,'관리자','최예슬','2000-09-24','010-3160-9231','false');

-- 이미지 URL 이탈 가능성이 있어, oid를 일부러 강제로 지정함.
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(500,'치킨','후라이드치킨',20000,'후라이드 치킨입니다.','500.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(501,'치킨','양념치킨',21000,'맛있는 양념치킨입니다.','501.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(502,'치킨','간장치킨',21000,'맛있는 간장치킨입니다.','502.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(503,'피자','하와이안쉬림프피자',18000,'하와이안 쉬림프 피자입니다.','503.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(504,'피자','시카고스테이크피자',25000,'시카고스테이크 피자입니다.','504.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(505,'피자','불고기피피자',13000,'불고기피피자입니다.','505.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(506,'고기', '스테이크', 40000, '맛있는 스테이크입니다.', '506.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(507,'고기', '갈릭스테이크', 45000, '맛있는 갈릭스테이크입니다.', '507.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(508,'파스타','투움바 파스타',18000,'투움바 파스타입니다.','508.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(509,'파스타','까르보나라',16000,'까르보나라 입니다.','509.png');
INSERT INTO Menu(oid, TYPE, NAME, price, notice, imageURL) VALUES(510,'파스타','토마토 스파게티',14000,'토마토 스파게티 입니다.','510.png');

INSERT INTO `Table`(oid, number, places, limits ) VALUES(100,1,1,4);
INSERT INTO `Table`(number, places, limits ) VALUES(2,2,4);
INSERT INTO `Table`(number, places, limits ) VALUES(3,3,4);

INSERT INTO Customer(oid, name, phoneNumber,id,blackList ) VALUES(1, '윤주현', '010-4413-5698','201713919','false');
INSERT INTO Customer(name, phoneNumber,id,blackList ) VALUES('NAME', '010-0000-0000','myid','false');
