--
-- File generated with SQLiteStudio v3.4.1 on Ðáñ Äåê 16 11:55:02 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Author
CREATE TABLE IF NOT EXISTS Author (
  AID INTEGER  NOT NULL  ,
  Surname VARCHAR(25)  NOT NULL  ,
  Name VARCHAR(25)  NOT NULL  ,
  Email VARCHAR(25)  NOT NULL    ,
PRIMARY KEY(AID));
INSERT INTO Author (AID, Surname, Name, Email) VALUES (1, 'ÐÝôñïõ', 'Ìáñßá', 'pmaria@example.com');
INSERT INTO Author (AID, Surname, Name, Email) VALUES (2, 'Jonan', 'Soe', 'soe@example.com');
INSERT INTO Author (AID, Surname, Name, Email) VALUES (3, 'Ðáðáðáýëïõ', 'Ìé÷áÞë', 'mpap@example.com');
INSERT INTO Author (AID, Surname, Name, Email) VALUES (4, 'Perkins', 'John', 'perk@example.com');

-- Table: AUTHORED_BY
CREATE TABLE IF NOT EXISTS AUTHORED_BY (
  BID INTEGER  NOT NULL  ,
  AID INTEGER  NOT NULL    ,
PRIMARY KEY(BID, AID)    ,
  FOREIGN KEY(BID)
    REFERENCES Book(BID)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(AID)
    REFERENCES Author(AID)
      ON DELETE SET NULL
      ON UPDATE CASCADE);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (4, 4);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (4, 1);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (4, 2);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (3, 2);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (2, 3);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (1, 3);
INSERT INTO AUTHORED_BY (BID, AID) VALUES (1, 1);

-- Table: Book
CREATE TABLE IF NOT EXISTS Book (
  BID INTEGER  NOT NULL  ,
  Title VARCHAR(50)  NOT NULL  ,
  ISBN VARCHAR(17)  NOT NULL  ,
  Price FLOAT  NOT NULL DEFAULT 0.0 ,
  Quantity INTEGER  NOT NULL DEFAULT 0 ,
  PID INTEGER  NOT NULL  ,
  SID INTEGER  NOT NULL    ,
PRIMARY KEY(BID)    ,
  FOREIGN KEY(SID)
    REFERENCES Storage(SID)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(PID)
    REFERENCES Publisher(PID)
      ON DELETE NO ACTION
      ON UPDATE CASCADE);
INSERT INTO Book (BID, Title, ISBN, Price, Quantity, PID, SID) VALUES (1, 'Ðñïãñáììáôéóìüò ìå ÌïíôÝëá ML', '978-3-11-178360-6
', 13.25, 3, 3, 1);
INSERT INTO Book (BID, Title, ISBN, Price, Quantity, PID, SID) VALUES (2, 'ÅéóáãùãÞ óôéò ÂÜóåéò ÄåäïìÝíùí', '979-3-76-743410-0
', 31.17, 23, 1, 1);
INSERT INTO Book (BID, Title, ISBN, Price, Quantity, PID, SID) VALUES (3, 'ÅéóáãùãÞ óôï AI', '978-3-96-148410-5', 53.8, 85, 2, 2);
INSERT INTO Book (BID, Title, ISBN, Price, Quantity, PID, SID) VALUES (4, 'Programming techniques in Java', '978-3-16-148410-0', 25.3, 18, 1, 2);

-- Table: C_Phone
CREATE TABLE IF NOT EXISTS C_Phone (
  CID INTEGER  NOT NULL  ,
  Phone INTEGER  NOT NULL    ,
PRIMARY KEY(CID, Phone)  ,
  FOREIGN KEY(CID)
    REFERENCES Customer(CID)
      ON DELETE CASCADE
      ON UPDATE CASCADE);
INSERT INTO C_Phone (CID, Phone) VALUES (1, 2410987654);
INSERT INTO C_Phone (CID, Phone) VALUES (3, 6900323210);
INSERT INTO C_Phone (CID, Phone) VALUES (1, 6977000012);
INSERT INTO C_Phone (CID, Phone) VALUES (2, 2310875421);
INSERT INTO C_Phone (CID, Phone) VALUES (2, 2310123456);

-- Table: CONTAINED_IN
CREATE TABLE IF NOT EXISTS CONTAINED_IN (
  BID INTEGER  NOT NULL  ,
  SCID INTEGER  NOT NULL  ,
  Quantity  INTEGER DEFAULT 1 ,
  Discount FLOAT   DEFAULT 0   ,
PRIMARY KEY(BID, SCID)    ,
  FOREIGN KEY(BID)
    REFERENCES Book(BID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(SCID)
    REFERENCES Shopping_Cart(SCID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);

-- Table: Customer
CREATE TABLE IF NOT EXISTS Customer (
  CID INTEGER  NOT NULL  ,
  Surname VARCHAR(25)    ,
  Name VARCHAR(25)    ,
  Father_Name VARCHAR(25)    ,
  City VARCHAR(50)    ,
  Address VARCHAR(50)    ,
  Address_No INTEGER    ,
  Postal_Code INTEGER(5)    ,
  Email VARCHAR(50)      ,
PRIMARY KEY(CID));
INSERT INTO Customer (CID, Surname, Name, Father_Name, City, Address, Address_No, Postal_Code, Email) VALUES (1, 'Êùíóôáíôéíßäç', 'ÅëÝíç', 'Éùáêåßì', 'ËÜñéóá', 'Èåïößëïõ', 9, 41612, 'konelen@example.com');
INSERT INTO Customer (CID, Surname, Name, Father_Name, City, Address, Address_No, Postal_Code, Email) VALUES (2, 'ÉùÜííïõ', 'ÉùÜííçò', 'ÐÝôñïò', 'Èåóóáëïíßêç', 'Êùí. ÊáñáìáíëÞ', 101, 54697, 'ioannoui@example.com');
INSERT INTO Customer (CID, Surname, Name, Father_Name, City, Address, Address_No, Postal_Code, Email) VALUES (3, 'Ðáðáäüðïõëïò', 'ÄçìÞôñçò', 'Êùíóôáíôßíïò', 'Èåóóáëïíßêç', '25çò Ìáñôßïõ', 45, 54836, 'papadim@example.com');

-- Table: P_Phone
CREATE TABLE IF NOT EXISTS P_Phone (
  Phone INTEGER(10)  NOT NULL  ,
  PID INTEGER  NOT NULL    ,
PRIMARY KEY(Phone, PID)  ,
  FOREIGN KEY(PID)
    REFERENCES Publisher(PID)
      ON DELETE CASCADE
      ON UPDATE CASCADE);
INSERT INTO P_Phone (Phone, PID) VALUES (9929272222, 3);
INSERT INTO P_Phone (Phone, PID) VALUES (2912433323, 3);
INSERT INTO P_Phone (Phone, PID) VALUES (388140707, 2);
INSERT INTO P_Phone (Phone, PID) VALUES (2126260500, 2);
INSERT INTO P_Phone (Phone, PID) VALUES (8003426626, 2);
INSERT INTO P_Phone (Phone, PID) VALUES (7329810060, 1);
INSERT INTO P_Phone (Phone, PID) VALUES (8006784333, 1);

-- Table: Publisher
CREATE TABLE IF NOT EXISTS Publisher (
  PID INTEGER  NOT NULL  ,
  Name VARCHAR(25)  NOT NULL  ,
  URL VARCHAR(50)    ,
  City VARCHAR(50)  NOT NULL  ,
  Address VARCHAR(50)  NOT NULL  ,
  Address_No INTEGER    ,
  Postal_Code INTEGER(5)  NOT NULL    ,
PRIMARY KEY(PID));
INSERT INTO Publisher (PID, Name, URL, City, Address, Address_No, Postal_Code) VALUES (1, 'IEEE', 'https://www.ieee.org/', 'New York', 'Park Avenue', 3, 83399);
INSERT INTO Publisher (PID, Name, URL, City, Address, Address_No, Postal_Code) VALUES (2, 'ACM', 'https://www.acm.org/', 'New York', 'Broadway', 1601, 10019);
INSERT INTO Publisher (PID, Name, URL, City, Address, Address_No, Postal_Code) VALUES (3, 'Scientific Publications', 'https://www.scientificpubonline.com/', 'New Delhi', 'Ansari Road', 4806, 11002);

-- Table: Shopping_Cart
CREATE TABLE IF NOT EXISTS Shopping_Cart (
  SCID INTEGER  NOT NULL  ,
  CID INTEGER  NOT NULL  ,
  Date DATETIME  NOT NULL    ,
PRIMARY KEY(SCID)  ,
  FOREIGN KEY(CID)
    REFERENCES Customer(CID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);

-- Table: Storage
CREATE TABLE IF NOT EXISTS Storage (
  SID INTEGER  NOT NULL  ,
  City VARCHAR(50)  NOT NULL  ,
  Address VARCHAR(50)  NOT NULL  ,
  Address_No INTEGER    ,
  Postal_Code INTEGER(5)  NOT NULL  ,
  Phone INTEGER(10)  NOT NULL    ,
PRIMARY KEY(SID));
INSERT INTO Storage (SID, City, Address, Address_No, Postal_Code, Phone) VALUES (1, 'ÊáâÜëá', 'ÁìåñéêÞò', 68, 52636, 6910101020);
INSERT INTO Storage (SID, City, Address, Address_No, Postal_Code, Phone) VALUES (2, 'Èåóóáëïíßêç', 'Öéëïìßëáò', 13, 51235, 2310900009);

-- Index: Book_FKIndex1
CREATE INDEX IF NOT EXISTS Book_FKIndex1 ON Book (SID);

-- Index: Book_FKIndex2
CREATE INDEX IF NOT EXISTS Book_FKIndex2 ON Book (PID);

-- Index: Book_has_Author_FKIndex1
CREATE INDEX IF NOT EXISTS Book_has_Author_FKIndex1 ON AUTHORED_BY (BID);

-- Index: Book_has_Author_FKIndex2
CREATE INDEX IF NOT EXISTS Book_has_Author_FKIndex2 ON AUTHORED_BY (AID);

-- Index: Book_has_Shopping_Cart_FKIndex1
CREATE INDEX IF NOT EXISTS Book_has_Shopping_Cart_FKIndex1 ON CONTAINED_IN (BID);

-- Index: Book_has_Shopping_Cart_FKIndex2
CREATE INDEX IF NOT EXISTS Book_has_Shopping_Cart_FKIndex2 ON CONTAINED_IN (SCID);

-- Index: C_Phone_FKIndex1
CREATE INDEX IF NOT EXISTS C_Phone_FKIndex1 ON C_Phone (CID);

-- Index: P_Phone_FKIndex1
CREATE INDEX IF NOT EXISTS P_Phone_FKIndex1 ON P_Phone (PID);

-- Index: Shopping_Cart_FKIndex1
CREATE INDEX IF NOT EXISTS Shopping_Cart_FKIndex1 ON Shopping_Cart (CID);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
