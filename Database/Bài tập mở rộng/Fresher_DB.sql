DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

CREATE TABLE Trainee(
	TraineeID 				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	Full_Name  				VARCHAR(50) NOT NULL,
	Birth_Date				DATE NOT NULL,
	Gender					ENUM('MALE','FEMALE','UNKNOWN') NOT NULL,
	ET_IQ					TINYINT UNSIGNED CHECK(ET_IQ >= 0 AND ET_IQ <= 20) NOT NULL,
	ET_Gmath				TINYINT UNSIGNED CHECK(ET_Gmath >= 0 AND ET_Gmath <= 20) NOT NULL,
	ET_English				TINYINT UNSIGNED CHECK(ET_English >= 0 AND ET_English <= 50) NOT NULL,
	Training_Class			VARCHAR(50) NOT NULL,
	Evaluation_Notes		VARCHAR(50) NOT NULL
);

INSERT INTO Trainee (Full_Name				, Birth_Date		, Gender	, ET_IQ	, ET_Gmath	, ET_English, Training_Class, Evaluation_Notes)
VALUES				('Nguyen Van A'			, '2000-01-15'		, 'MALE'	, 20	, 	14		, 	30		, 'VTI001'		, 'DHBKHN'),
					('Tran Thi B'			, '2001-04-22'		, 'FEMALE'	, 10	, 	12		, 	25		, 'VTI002'		, 'DHQGHN'),
					('Leee Van C'				, '1999-11-30'		, 'MALE'	, 8		, 	10		, 	18		, 'VTI001'		, 'HVBCVT'),
					('Pham Gia D'			, '2002-05-10'		, 'MALE'	, 12	, 	14		, 	22		, 'VTI002'		, 'HVKTMM'),
					('Nguyen Van A'			, '2000-08-08'		, 'FEMALE'	, 16	, 	15		, 	35		, 'VTI003'		, 'HVBCVT'),
					('Ngo Thi F'			, '2003-09-21'		, 'FEMALE'	, 11	, 	13		, 	27		, 'VTI001'		, 'DHBKHN'),
					('Nguyen Trung G'		, '2001-01-01'		, 'MALE'	, 9		, 	10		, 	20		, 'VTI002'		, 'HVBCVT'),
					('Do Minh H'			, '2000-12-12'      , 'MALE'	, 17	, 	18		, 	45		, 'VTI003'		, 'DHGTVT'),
					('Phung Ngoc I'			, '2002-03-03'		, 'FEMALE'	, 13	, 	15		, 	40		, 'VTI002'		, 'HVKTMM'),
					('Nguyen Tien C'		, '1998-07-07'		, 'MALE'	, 18	, 	16		, 	48		, 'VTI001'		, 'HVBCVT');
                    
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
-- Question 2: Thêm ít nhất 10 bản ghi vào table
-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả.
-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào, và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20
SELECT * FROM Trainee 
WHERE ET_IQ >= 12 AND ET_Gmath >= 12 AND ET_English >= 20
ORDER BY Birth_Date;
-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT * FROM Trainee 
WHERE Full_Name LIKE 'N%C';
-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT * FROM Trainee 
WHERE Full_Name LIKE '_G%';
-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
SELECT * FROM Trainee 
WHERE Full_Name LIKE '_________C';
-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau.
SELECT DISTINCT(Full_Name) FROM Trainee;
-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z.
SELECT Full_Name FROM Trainee
ORDER BY Full_Name;
-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT * FROM Trainee
WHERE LENGTH(Full_Name) = (
		SELECT MAX(length(Full_Name)) FROM Trainee
);
-- ORDER BY length(Full_Name) DESC 
-- LIMIT 1

-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID, Full_Name, Birth_Date   FROM Trainee
WHERE LENGTH(Full_Name) = (
		SELECT MAX(length(Full_Name)) FROM Trainee
);
-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất

-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất

-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
-- • ET_IQ + ET_Gmath>=20
-- • ET_IQ>=8
-- • ET_Gmath>=8
-- • ET_English>=18

-- Question 15: Xóa thực tập sinh có TraineeID = 5

-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15

-- Question 17: Xóa thực tập sinh quá 30 tuổi.

-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database.

-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểm ET_English = 30.

-- Question 20: Đếm xem trong lớp VTI001  có bao nhiêu thực tập sinh.

-- Question 21: Đếm xem trong lớp VTI001  có bao nhiêu thực tập sinh.

-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh.

-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.

-- Question 24: Lấy ra lớp có lớn hơn 5 thực tập viên

-- Question 25: Lấy ra lớp có lớn hơn 5 thực tập viên

-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học

-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
-- Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
-- Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2
                   
