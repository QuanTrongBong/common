USE QuanLySinhVien;

-- 1. Tat ca mon hoc co so tin chi cao nhat
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);

-- 2. Cac mon hoc co diem thi cao nhat
SELECT DISTINCT Sub.*
FROM Subject AS Sub
JOIN Mark AS M ON M.SubId = Sub.SubId
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);

-- 3. Diem trung binh cua moi sinh vien, sap xep giam dan
SELECT S.StudentId, S.StudentName, AVG(M.Mark) AS AverageMark
FROM Student AS S
LEFT JOIN Mark AS M ON M.StudentId = S.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY AverageMark DESC;
