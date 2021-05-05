
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

INSERT INTO `table` VALUES(101,1,1);
INSERT INTO `table` VALUES(102,2,2);
INSERT INTO `table` VALUES(103,3,3);
INSERT INTO `customer` VALUES(1, 'Gab', '010-4413-5698');
INSERT INTO `customer` VALUES(2, 'Arthur', '010-0000-0000');
INSERT INTO `customer` VALUES(3, 'Dutch', '010-1111-1111');
