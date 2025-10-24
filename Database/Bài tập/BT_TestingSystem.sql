DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

CREATE TABLE Department(
	DepartmentID    		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName			VARCHAR(50) UNIQUE KEY NOT NULL
);

-- Thêm dữ liệu cho Department
INSERT INTO Department        ( DepartmentName )
VALUES				          ( 'Trainee'      ),
							  (	'Sale'         ),
                              ( "Bảo vệ"       ),
                              ( "Nhân sự"      ),
                              ( "Kỹ thuật"	   ),
                              ( "Tài chính"    ),
                              ( "Phó giám đốc" ),
                              ( "Giám đốc"     ),
                              ( "Thư kí"       ),
                              ( "Bán hàng"     );

CREATE TABLE `Position`(
	PositionID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName		ENUM("Dev", "Test", "Scrum Master", "PM") UNIQUE KEY NOT NULL
);

-- thêm dữ liệu cho `Position`
INSERT INTO `Position` (PositionName  )
VALUES				   ('Dev'         ),
					   ('Test'        ),
                       ('Scrum Master'),
                       ('PM'          );
                      
CREATE TABLE `Account`(
	AccountID		   TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email              VARCHAR(50) UNIQUE KEY,
    Username           VARCHAR(50) UNIQUE KEY NOT NULL,
    FullName           VARCHAR(50) NOT NULL,
	DepartmentID       TINYINT UNSIGNED,
    PositionID		   TINYINT UNSIGNED,
    CreateDate         DATE DEFAULT(now()),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- tạo bảng cho `Account`
INSERT INTO `Account` (Email                               , Username         , FullName                  , DepartmentID    , PositionID   , CreateDate)
VALUES                ('dophuc141Produce@gmail.com'        , 'phucca141'      , 'Do Huy Phuc'             ,       1         ,      1     ,'2025-11-14'),
	                  ('account1@gmail.com'                , 'account1'       , 'Tran Minh Hieu'          ,     NULL        ,      2     ,'2023-03-05'),
                      ('account2@gmail.com'                , 'account2'       , 'Duong Do'                ,       2         ,      3     ,'2023-03-07'),
                      ('account3@gmail.com'                , 'coconut'        , 'Tran Thi Quynh Trang'    ,       3         ,      4     ,'2010-03-08'),
                      ('admin1@gmail.com'                  , 'admin'          , 'A Do Min'                ,       2         ,      4     ,'2010-03-09'),
                      ('account9@gmail.com'                , 'account9'       , 'Nguyen Chien Thang'      ,       6         ,      3     ,'2023-04-10'),
                      ('mtp@gmail.com'                     , 'sontungmtp'     , 'MTP'                     ,       10        ,      2     ,'2010-05-14'),
                      ('account11@gmail.com'               , 'account11'      , 'Duong Do'                ,       2         ,      1     ,'2023-06-11'),
                      ('account5@gmail.com'                , 'account5'       , 'Tran Minh Hieu'          ,       2         ,      1     ,'2010-03-05'),
                      ('account8@gmail.com'                , 'account8'       , 'Tran Minh Hieu'          ,       3         ,      3     ,'2022-06-05');

CREATE TABLE `Group`(
	GroupID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	GroupName			VARCHAR(50) NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATE DEFAULT(now()),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

-- Tạo bảng cho `Group`
INSERT INTO `Group` (GroupName    , CreatorID, CreateDate )
VALUES				( 'Dev'       ,    1     , '2023-01-05' ),
					( 'Training'  ,    4     , '2019-04-20' ),
                    ( 'Test'      ,    2     , '2023-02-10' ),
                    ( 'PM'        ,    3     , '2023-03-15' ),
					( 'HR'        ,    5     , '2023-05-25' ),
					( 'Sale'      ,    6     , '2023-06-30' ),
					( 'Security'  ,    7     , '2023-07-10' ),
					( 'Marketing' ,    8     , '2023-08-15' ),
					( 'AI'        ,    9     , '2023-09-05' ),
					( 'System'    ,    10    , '2019-10-01' );


CREATE TABLE GroupAccount(
	ID					TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	GroupID				TINYINT UNSIGNED NOT NULL,
    AccountID			TINYINT UNSIGNED NOT NULL,
    JoinDate			DATE DEFAULT(now()),
--    PRIMARY KEY(GroupID, AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID),
    UNIQUE KEY(GroupID, AccountID)
);

-- Tạo bảng cho GroupAccount
INSERT INTO GroupAccount    (GroupID    , 	AccountID	,   JoinDate  )
VALUES				        (	1		, 		1		, '2023-01-06'),
							(	1		, 		2		, '2023-01-07'),
							(	2		, 		3		, '2023-02-15'),
							(	3		, 		4		, '2023-03-20'),
							(	1		, 		5		, '2023-04-21'),
							(	5		, 		6		, '2023-05-26'),
							(	6		, 		5		, '2023-06-30'),
							(	1		, 		8		, '2023-07-15'),
							(	8		, 		3		, '2023-08-16'),
							(	9		, 		10		, '2023-09-06');
CREATE TABLE TypeQuestion(
	TypeID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName			ENUM('Essay', 'Multiple-Choice') UNIQUE KEY NOT NULL

);

-- Tạo bảng cho GroupAccount
INSERT INTO TypeQuestion    (TypeName		  )
VALUES						('Essay'          ),
							('Multiple-Choice');

CREATE TABLE CategoryQuestion(
	CategoryID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	CategoryName 		VARCHAR(50) UNIQUE KEY NOT NULL
);

-- Tạo bảng cho CategoryQuestion
INSERT INTO CategoryQuestion   		(CategoryName   )
VALUES								('SQL'			),
									('Java'		    ),
									('Python'		),
									('C++'			),
									('Network'		),
									('OS'			),
									('Security'		),
									('Testing'		),
									('AI'			),
									('Hardware'		);
                            
CREATE TABLE Question(
	QuestionID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Content				VARCHAR(1000) NOT NULL,
	CategoryID			TINYINT UNSIGNED NOT NULL,
    TypeID				TINYINT UNSIGNED NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATE DEFAULT(now()),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- Tạo bảng cho Question
INSERT INTO Question   		(Content			, CategoryID  , TypeID		, CreatorID	, CreateDate  )
VALUES						('Câu hỏi SQL'		, 1			  , 1			, 2			, '2022-11-11'),
							('Câu hỏi Java'		, 10		  , 2			, 2			, '2023-11-14'),
							('Câu hỏi Python'	, 6			  , 1			, 3			, '2023-09-01'),
							('Câu hỏi C++'		, 3			  , 2			, 3			, '2023-01-13'),
							('Câu hỏi Network'	, 9  		  , 1			, 5			, '2023-11-01'),
							('Câu hỏi OS'		, 10		  , 2			, 5			, '2023-10-01'),
							('Câu hỏi Security' , 5			  , 1			, 7			, '2023-03-01'),
							('Câu hỏi Testing'  , 5			  , 2			, 8			, '2022-12-31'),
							('Câu hỏi AI'		, 5			  , 1			, 9			, '2023-02-01'),
							('Câu hỏi Hardware' , 5 		  , 2			, 10		, '2023-10-29');
                                    
                                    
CREATE TABLE Answer(
	AnswerID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content				VARCHAR(1000),
    QuestionID			TINYINT UNSIGNED NOT NULL,
    isCorrect			BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)

);

-- Tạo bảng cho Answer
INSERT INTO Answer  (Content		, QuestionID	, isCorrect	)
VALUES 				('Đáp án 1'		, 1				, TRUE		),
					('Đáp án 2'		, 1				, FALSE		),
					('Đáp án 3'		, 1				, TRUE		),
					('Đáp án 4'		, 1				, TRUE		),
					('Đáp án 5'		, 2				, FALSE		),
					('Đáp án 6'		, 3				, TRUE		),
					('Đáp án 7'		, 4				, TRUE		),
					('Đáp án 8'		, 5				, FALSE		),
					('Đáp án 9'		, 6				, TRUE		),
					('Đáp án 10'	, 7				, TRUE		);

CREATE TABLE Exam(
	ExamID 			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code`			VARCHAR(50) UNIQUE KEY NOT NULL,
    Title			VARCHAR(50) NOT NULL,
    CategoryID		TINYINT UNSIGNED NOT NULL,
    Duration		SMALLINT UNSIGNED,
    CreatorID		TINYINT UNSIGNED NOT NULL,
    CreateDate		DATE  DEFAULT(now()),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)

);

-- Tạo bảng cho Exam
INSERT INTO Exam 	(`Code` , Title			, CategoryID, Duration  , CreatorID	, CreateDate )
VALUES 			 	('EX001','Đề SQL'		,1			, 90		,	1		,'2023-11-01'),
					('EX002','Đề Java'		,2			, 45		,	2		,'2023-10-15'),
					('EX003','Đề Python'	,3			, 60		,	3		,'2019-12-10'),
					('EX004','Đề C++'		,4			, 30		,	4		,'2023-08-01'),
					('EX005','Đề AI'		,5			, 120 		,	5		,'2019-07-20'),
					('EX006','Đề OS'		,6			, 75		,	6		,'2023-09-12'),
					('EX007','Đề Network'	,7			, 100		,	7		,'2022-11-11'),
					('EX008','Đề Security'	,8			, 60		,	8		,'2019-12-20'),
					('EX009','Đề Testing'	,9			, 45		,	9		,'2019-10-01'),
					('EX010','Đề Hardware'	,10			, 30		,	10		,'2023-09-05');

CREATE TABLE ExamQuestion(
	ID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	ExamID 			TINYINT UNSIGNED NOT NULL,
    QuestionID		TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
	UNIQUE KEY(ExamID,QuestionID)
);

-- Tạo bảng cho ExamQuestion
INSERT INTO ExamQuestion 	( ExamID, QuestionID)
VALUES 			 			(1		,	1		),
							(1		,	2		),
                            (2		,	3		),
                            (3		,	4		),
                            (3		,	5		),
                            (4		,	6		),
                            (2		,	7		),
                            (6		,	2		),
                            (2		,	9		),
                            (8		,	10		); 












