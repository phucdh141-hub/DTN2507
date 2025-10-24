-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT AccountID, FullName, 
(SELECT DepartmentName FROM Department WHERE DepartmentID = `Account`.DepartmentID) As DepartmentName
FROM `Account`;
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * FROM `Account` WHERE CreateDate > '2010-12-20';
-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT * FROM `Account`
WHERE PositionID = ( 
SELECT PositionID FROM Position WHERE PositionName = 'Dev'
);

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT DepartmentID FROM `Account`
GROUP BY DepartmentID
HAVING COUNT(AccountID) > 3;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT Content FROM Question
WHERE QuestionID = (
	SELECT QuestionID FROM ExamQuestion
    GROUP BY QuestionID
    ORDER BY COUNT(ExamID) DESC
    LIMIT 1
);
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT CategoryID, (
		SELECT CategoryName FROM CategoryQuestion WHERE CategoryID = Question.CategoryID
) AS CategoryName, COUNT(QuestionID) AS Total
FROM Question
GROUP BY CategoryID;
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT QuestionID, Content, (
		SELECT COUNT(*) FROM ExamQuestion WHERE ExamQuestion.QuestionID = Question.QuestionID
) AS Total    
FROM Question;
-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT QuestionID, Content, (
	SELECT COUNT(*) FROM Answer	WHERE Answer.QuestionID = Question.QuestionID
) AS TotalAnswer    
FROM Question
ORDER BY TotalAnswer DESC
LIMIT 1;
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT GroupID, COUNT(AccountID) AS TotalAccount
FROM GroupAccount
GROUP BY GroupID;
-- Question 10: Tìm chức vụ có ít người nhất
SELECT PositionID, PositionName,(
		SELECT COUNT(*) FROM `Account` a WHERE a.PositionID =  p.PositionID
) AS Total
FROM `Position` p
WHERE (SELECT COUNT(*) FROM `Account` a WHERE a.PositionID = p.PositionID) = (
    SELECT MIN(SoLuong) 
    FROM (
        SELECT COUNT(*) AS SoLuong
        FROM `Account` 
        GROUP BY PositionID
    ) AS Temp
);
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
  d.DepartmentID,
  d.DepartmentName,
  (SELECT COUNT(*) FROM `Account` a 
     WHERE a.DepartmentID = d.DepartmentID AND a.PositionID = 1) AS Dev,
  (SELECT COUNT(*) FROM `Account` a 
     WHERE a.DepartmentID = d.DepartmentID AND a.PositionID = 2) AS Test,
  (SELECT COUNT(*) FROM `Account` a 
     WHERE a.DepartmentID = d.DepartmentID AND a.PositionID = 3) AS ScrumMaster,
  (SELECT COUNT(*) FROM `Account` a 
     WHERE a.DepartmentID = d.DepartmentID AND a.PositionID = 4) AS PM
FROM Department d;

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

-- Question 14: Lấy ra group không có account nào
-- Question 15: Lấy ra group không có account nào
SELECT *
FROM `Group`
WHERE GroupID NOT IN (
    SELECT GroupID
    FROM GroupAccount
);
-- Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question
WHERE QuestionID NOT IN (
    SELECT QuestionID
    FROM Answer
);
/*
Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
*/


/*
uestion 18:
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b)
*/