DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

CREATE TABLE Trainee(
	TraineeID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Full_Name  				NVARCHAR(50) NOT NULL,
	Birth_Date				DATE NOT NULL,
	Gender					ENUM('MALE','FEMALE','UNKNOWN') NOT NULL,
	ET_IQ					TINYINT UNSIGNED NOT NULL,
	ET_Gmath				TINYINT UNSIGNED NOT NULL,
	ET_English				TINYINT UNSIGNED NOT NULL,
	Training_Class			VARCHAR(50) NOT NULL,
	Evaluation_Notes		VARCHAR(50) NOT NULL
);

INSERT INTO Trainee (Full_Name				, Birth_Date		, Gender	, ET_IQ	, ET_Gmath	, ET_English, Training_Class, Evaluation_Notes)
VALUES				('Nguyen Van A'			, '2000-01-15'		, 'MALE'	, 15	, 	14		, 	30		, 'VTI001'		, 'DHBKHN'),
					('Tran Thi B'			, '2001-04-22'		, 'FEMALE'	, 10	, 	12		, 	25		, 'VTI002'		, 'DHQGHN'),
					('Le Van C'				, '1999-11-30'		, 'MALE'	, 8		, 	10		, 	18		, 'VTI001'		, 'HVBCVT'),
					('Pham Gia D'			, '2002-05-10'		, 'MALE'	, 12	, 	14		, 	22		, 'VTI002'		, 'HVKTMM'),
					('Ngoc Linh E'			, '2000-08-08'		, 'FEMALE'	, 16	, 	15		, 	35		, 'VTI003'		, 'HVBCVT'),
					('Ngo Thi F'			, '2003-09-21'		, 'FEMALE'	, 11	, 	13		, 	27		, 'VTI001'		, 'DHBKHN'),
					('Nguyen Trung G'		, '2001-01-01'		, 'MALE'	, 9		, 	10		, 	20		, 'VTI002'		, 'HVBCVT'),
					('Do Minh H'			, '2000-12-12'      , 'MALE'	, 17	, 	18		, 	45		, 'VTI003'		, 'DHGTVT'),
					('Phung Ngoc I'			, '2002-03-03'		, 'FEMALE'	, 13	, 	15		, 	40		, 'VTI002'		, 'HVKTMM'),
					('Nguyen Tien C'		, '1998-07-07'		, 'MALE'	, 18	, 	16		, 	48		, 'VTI001'		, 'HVBCVT');
                    
                    
