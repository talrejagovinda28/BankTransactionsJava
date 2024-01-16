SHOW databases;
USE amdocspro;
SHOW tables;

CREATE TABLE BankTrans (
TransID varchar(20) PRIMARY KEY,
AcctNo int,
OldBal decimal(12,2),
TransType varchar(5) CHECK (TransType IN ('W', 'D')),
TransAmt decimal(12,2),
NewBal decimal(12,2),
TransStat varchar(10) );

-- SHOW TABLES;

-- SELECT * FROM BankTrans;


INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T007', 2001, 5000, 'W', -5500, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T002', 2002, 3000, 'D', 1500, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T001', 2005, 10000, 'W', -10010, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T003', 2003, 26562, 'D', 500, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T004', 2004, 2500, 'W', -500, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T005', 2012, 3628, 'W', -3628, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T006', 2006, 5000, 'D', 2500, NULL, NULL);

INSERT INTO BankTrans 
(TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
VALUES ('T008', 2008, 5000, 'W', -500, NULL, NULL);


CREATE TABLE ValidTrans (
TransID varchar(20) PRIMARY KEY NOT NULL,
TransType varchar(5),
TransAmt decimal(12,2),
Validity varchar(20) );

-- SELECT * FROM validtrans;

CREATE TABLE InValidTrans (
TransID varchar(20) PRIMARY KEY NOT NULL,
TransType varchar(5),
TransAmt decimal(12,2),
Validity varchar(20) );

-- SELECT * FROM InValidTrans;

-- DELETE FROM ValidTrans;
-- DELETE FROM BankTrans;
-- DELETE FROM InvalidTrans;
-- DROP TABLE InvalidTrans;


-- INSERT INTO BankTrans 
-- (TransID, AcctNo, OldBal, TransType, TransAmt, NewBal, TransStat)
-- VALUES ('T009', 2009, 5000, 'W', -5500, NULL, NULL);

COMMIT;






