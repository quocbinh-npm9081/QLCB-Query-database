USE QuanLyDeAn
GO
--1
SELECT CONCAT(HONV, TENLOT, TENNV) AS HO_TEN_NV, TENPHG
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.PHONG = PHONGBAN.MAPHG

--2
SELECT TENNV, TENDA
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.PHONG = PHONGBAN.MAPHG
			  JOIN DEAN ON PHONGBAN.MAPHG = DEAN.PHONG
WHERE TENNV LIKE N'Tiến%' AND HONV LIKE N'Đinh%'
--3
SELECT TENNV, TENTN, NGAYSINH,(2021- YEAR(NGAYSINH)) AS 'TUOI'
FROM NHANVIEN JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
WHERE (2021- YEAR(NGAYSINH)) >= 50 
ORDER BY TUOI DESC

--4
SELECT TENNV
FROM NHANVIEN LEFT JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
WHERE THANNHAN.MA_NVIEN IS NULL

--5 
SELECT DEAN1.TENDA,DEAN1.DDIEM_DA,DEAN1.PHONG
FROM DEAN AS DEAN1 ,DEAN AS DEAN2 
WHERE  DEAN1.DDIEM_DA = DEAN2.DDIEM_DA AND DEAN1.MADA <> DEAN2.MADA AND DEAN1.PHONG = DEAN2.PHONG

--6
SELECT DEAN.TENDA, PHONGBAN.TENPHG, CONCAT(NHANVIEN.HONV, NHANVIEN.TENLOT, NHANVIEN.TENNV) AS HOTEN_TRUONGPHONG, PHONGBAN.NG_NHANCHUC
FROM PHONGBAN JOIN DEAN ON PHONGBAN.MAPHG = DEAN.PHONG
			  JOIN NHANVIEN ON NHANVIEN.MANV = PHONGBAN.TRUONGPHG
WHERE DEAN.DDIEM_DA LIKE N'Hà Nội%'

--7
SELECT NV.TENNV , QL.TENNV AS TEN_QL
FROM NHANVIEN AS NV, NHANVIEN AS QL
WHERE QL.MANV=NV.MA_NQL

--8
SELECT NV.TENNV , QL.TENNV AS TEN_QL, TP.TENNV AS TEN_TP
FROM NHANVIEN AS NV, NHANVIEN AS QL, NHANVIEN AS TP, PHONGBAN
WHERE QL.MANV = NV.MA_NQL AND
	  TP.MANV = PHONGBAN.TRUONGPHG AND
	  NV.PHONG = PHONGBAN.MAPHG 

	  --8
SELECT NV.TENNV , TP.TENNV AS TEN_TP
FROM NHANVIEN AS NV,  NHANVIEN AS TP, PHONGBAN
WHERE TP.MANV = PHONGBAN.TRUONGPHG AND
	  NV.PHONG = PHONGBAN.MAPHG 
--WHERE QL.MANV = NV.MA_NQL AND
	--  TP.PHONG = PHONGBAN.MAPHG AND
	 -- PHONGBAN.TRUONGPHG = NV.MANV

	 





			  
	 


