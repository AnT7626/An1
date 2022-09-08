CREATE DATABASE Quanlyduan
USE Quanlyduan
CREATE TABLE NHANVIEN
(
	MANV CHAR(10) NOT NULL PRIMARY KEY,
	HONV NVARCHAR(10),
	TENLOT NVARCHAR(10),
	TENNV NVARCHAR(10),
	NGSINH DATETIME,
	DIACHI NVARCHAR(50),
	PHAI NCHAR(3),
	LUONG INT,
	MA_NQL CHAR(10),
	PHG CHAR(10)
)
GO
GO
CREATE TABLE PHONGBAN
(	
	MAPHG CHAR(10) NOT NULL PRIMARY KEY,
	TENPHG NVARCHAR(50),
	TRGPHG CHAR(10) FOREIGN KEY(TRGPHG) REFERENCES dbo.NHANVIEN(MANV),
	NG_NHANCHUC DATETIME DEFAULT(GETDATE()),
)
GO
CREATE TABLE DIADIEM_PHG
(
	MAPHG CHAR(10) NOT NULL ,
	DIADIEM NVARCHAR(50) ,
	FOREIGN KEY(MAPHG) REFERENCES dbo.PHONGBAN(MAPHG),
	PRIMARY KEY(MAPHG,DIADIEM)
)
GO
CREATE TABLE DEAN
(
	TENDA NVARCHAR(50),
	MADA CHAR(10) NOT NULL PRIMARY KEY,
	DDIEM_DA NVARCHAR(50),
	PHONG CHAR(10) FOREIGN KEY(PHONG) REFERENCES dbo.PHONGBAN(MAPHG)
)
GO
CREATE TABLE PHANCONG
(
	MA_NVIEN CHAR(10) NOT NULL ,
	SODA CHAR(10) NOT NULL ,
	PRIMARY KEY(MA_NVIEN,SODA),
	SOGIO FLOAT,
	FOREIGN KEY(MA_NVIEN) REFERENCES dbo.NHANVIEN(MANV),
	FOREIGN KEY (SODA) REFERENCES dbo.DEAN(MADA)
)
GO
CREATE TABLE THANNHAN
(
	MA_NVIEN CHAR(10) FOREIGN KEY (MA_NVIEN) REFERENCES dbo.NHANVIEN(MANV),
	TENTN NVARCHAR(30),
	PHAI NCHAR(3),
	NGSINH DATETIME,
	QUANHE NVARCHAR(20)
)
ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT FK1
FOREIGN KEY (MA_NQL) REFERENCES dbo.NHANVIEN(MANV)
ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT FK2
FOREIGN KEY (PHG) REFERENCES dbo.PHONGBAN(MAPHG)
INSERT INTO dbo.PHONGBAN
(
    MAPHG,
    TENPHG,
    TRGPHG,
    NG_NHANCHUC
)
VALUES
(   '5',
    N'NGHIEN CUU',      -- TENPHG - nvarchar(50)
    NULL,       -- TRGPHG - char(10)
    '19780522'
)
GO
INSERT INTO dbo.PHONGBAN
(
    MAPHG,
    TENPHG,
    TRGPHG,
    NG_NHANCHUC
)
VALUES
(   '4',
    N'DIEU HANH',      -- TENPHG - nvarchar(50)
    NULL,       -- TRGPHG - char(10)
    '19850101'
)
GO
INSERT INTO dbo.PHONGBAN
(
    MAPHG,
    TENPHG,
    TRGPHG,
    NG_NHANCHUC
)
VALUES
(   '1',
    N'QUAN LY',      -- TENPHG - nvarchar(50)
    NULL,       -- TRGPHG - char(10)
    '19710619'
)
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '123456789',        -- MANV - char(10)
    N'DINH',       -- HONV - nvarchar(10)
    N'BA',       -- TENLOT - nvarchar(10)
    N'TIEN',       -- TENNV - nvarchar(10)
    '19550109', -- NGSINH - datetime
    N'731 TRAN HUNG DAO, Q1 TPHCM',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    30000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '5'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '333445555',        -- MANV - char(10)
    N'NGUYEN',       -- HONV - nvarchar(10)
    N'THANH',       -- TENLOT - nvarchar(10)
    N'TUNG',       -- TENNV - nvarchar(10)
    '19451208', -- NGSINH - datetime
    N'638 NGUYEN VAN CU, Q5,TPHCM',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    40000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '5'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '999887777',        -- MANV - char(10)
    N'BUI',       -- HONV - nvarchar(10)
    N'THUY',       -- TENLOT - nvarchar(10)
    N'VU',       -- TENNV - nvarchar(10)
    '19580719', -- NGSINH - datetime
    N'332 NGUYEN THAI HOC, Q1, TPHCM',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    25000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '4'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '987654321',        -- MANV - char(10)
    N'LE',       -- HONV - nvarchar(10)
    N'THI',       -- TENLOT - nvarchar(10)
    N'NHAN',       -- TENNV - nvarchar(10)
    '19310620', -- NGSINH - datetime
    N'219 HO VAN HUE, QPN, TPHCM',       -- DIACHI - nvarchar(50)
    N'NU',       -- PHAI - nchar(3)
    43000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '4'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '666884444',        -- MANV - char(10)
    N'NGUYEN',       -- HONV - nvarchar(10)
    N'MANH',       -- TENLOT - nvarchar(10)
    N'HUNG',       -- TENNV - nvarchar(10)
    '19520915', -- NGSINH - datetime
    N'975 BA RIA, VUNG TAU',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    38000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '5'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '453453453',        -- MANV - char(10)
    N'TRAN',       -- HONV - nvarchar(10)
    N'THANH',       -- TENLOT - nvarchar(10)
    N'TAM',       -- TENNV - nvarchar(10)
    '19620731', -- NGSINH - datetime
    N'543 MAI THI LUU, Q1, TPHCM',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    25000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '5'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '987987987',        -- MANV - char(10)
    N'TRAN',       -- HONV - nvarchar(10)
    N'HONG',       -- TENLOT - nvarchar(10)
    N'QUANG',       -- TENNV - nvarchar(10)
    '19590329', -- NGSINH - datetime
    N'980 LE HONG PHONG, Q10, TPHCM',       -- DIACHI - nvarchar(50)
    N'NAM',       -- PHAI - nchar(3)
    25000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '4'         -- PHG - char(10)
    )
GO
INSERT INTO dbo.NHANVIEN
(
    MANV,
    HONV,
    TENLOT,
    TENNV,
    NGSINH,
    DIACHI,
    PHAI,
    LUONG,
    MA_NQL,
    PHG
)
VALUES
(   '888665555',        -- MANV - char(10)
    N'VUONG',       -- HONV - nvarchar(10)
    N'NGOC',       -- TENLOT - nvarchar(10)
    N'QUYEN',       -- TENNV - nvarchar(10)
    '19271010', -- NGSINH - datetime
    N'450 TRUNG VUONG, HA NOI',       -- DIACHI - nvarchar(50)
    N'NU',       -- PHAI - nchar(3)
    55000,         -- LUONG - int
    NULL,        -- MA_NQL - char(10)
    '1'         -- PHG - char(10)
    )
GO
-- CAP NHAT CHO DBO.PHONG BAN:
UPDATE dbo.PHONGBAN SET TRGPHG ='333445555' WHERE MAPHG='5'
UPDATE dbo.PHONGBAN SET TRGPHG ='987987987' WHERE MAPHG='4'
UPDATE dbo.PHONGBAN SET TRGPHG ='888665555' WHERE MAPHG='1'
-- CAP NHAT CHO DBO.GIAOVIEN:
UPDATE dbo.NHANVIEN SET MA_NQL ='333445555' WHERE MANV='123456789' OR MANV ='666884444' OR MANV ='453453453'
UPDATE dbo.NHANVIEN SET MA_NQL ='888665555' WHERE MANV='333445555' OR MANV ='987654321'
UPDATE dbo.NHANVIEN SET MA_NQL ='987654321' WHERE MANV='999887777' OR MANV ='987987987' 
UPDATE dbo.NHANVIEN SET MA_NQL=NULL WHERE MANV='888665555'
INSERT INTO dbo.DIADIEM_PHG
(
    MAPHG,
    DIADIEM
)
VALUES
(   '1', -- MAPHG - char(10)
    N'TPHCM' -- DIADIEM - nvarchar(50)
)
GO
INSERT INTO dbo.DIADIEM_PHG
(
    MAPHG,
    DIADIEM
)
VALUES
(   '4', -- MAPHG - char(10)
    N'HA NOI' -- DIADIEM - nvarchar(50)
)
GO
INSERT INTO dbo.DIADIEM_PHG
(
    MAPHG,
    DIADIEM
)
VALUES
(   '5', -- MAPHG - char(10)
    N'VUNG TAU' -- DIADIEM - nvarchar(50)
)
GO
INSERT INTO dbo.DIADIEM_PHG
(
    MAPHG,
    DIADIEM
)
VALUES
(   '5', -- MAPHG - char(10)
    N'NHA TRANG' -- DIADIEM - nvarchar(50)
)
GO
INSERT INTO dbo.DIADIEM_PHG
(
    MAPHG,
    DIADIEM
)
VALUES
(   '5', -- MAPHG - char(10)
    N'TPHCM' -- DIADIEM - nvarchar(50)
)
GO
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '333445555',        -- MA_NVIEN - char(10)
    N'Quang',       -- TENTN - nvarchar(30)
    N'Nu',       -- PHAI - nchar(3)
    '19760405', -- NGSINH - datetime
    N'Con gai'        -- QUANHE - nvarchar(20)
)
GO	
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '333445555',        -- MA_NVIEN - char(10)
    N'Khang',       -- TENTN - nvarchar(30)
    N'Nam',       -- PHAI - nchar(3)
    '19731025', -- NGSINH - datetime
    N'Con trai'        -- QUANHE - nvarchar(20)
)
GO	
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '333445555',        -- MA_NVIEN - char(10)
    N'Duong',       -- TENTN - nvarchar(30)
    N'Nu',       -- PHAI - nchar(3)
    '19480503', -- NGSINH - datetime
    N'Vo chong'        -- QUANHE - nvarchar(20)
)
GO
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '987654321',        -- MA_NVIEN - char(10)
    N'Dang',       -- TENTN - nvarchar(30)
    N'Nam',       -- PHAI - nchar(3)
    '19320229', -- NGSINH - datetime
    N'Vo chong'        -- QUANHE - nvarchar(20)
)
GO	
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '123456789',        -- MA_NVIEN - char(10)
    N'Duy',       -- TENTN - nvarchar(30)
    N'Nam',       -- PHAI - nchar(3)
    '19780101', -- NGSINH - datetime
    N'Con trai'        -- QUANHE - nvarchar(20)
)
GO	
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '123456789',        -- MA_NVIEN - char(10)
    N'Chau',       -- TENTN - nvarchar(30)
    N'Nu',       -- PHAI - nchar(3)
    '19781231', -- NGSINH - datetime
    N'Con gai'        -- QUANHE - nvarchar(20)
)
GO
INSERT INTO dbo.THANNHAN
(
    MA_NVIEN,
    TENTN,
    PHAI,
    NGSINH,
    QUANHE
)
VALUES
(   '123456789',        -- MA_NVIEN - char(10)
    N'Phuong',       -- TENTN - nvarchar(30)
    N'Nu',       -- PHAI - nchar(3)
    '19570505', -- NGSINH - datetime
    N'Vo chong'        -- QUANHE - nvarchar(20)
)
GO	
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'San pham X', -- TENDA - nvarchar(50)
    '1',  -- MADA - char(10)
    N'VUNG TAU', -- DDIEM_DA - nvarchar(50)
    '5'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'San pham Y', -- TENDA - nvarchar(50)
    '2',  -- MADA - char(10)
    N'NHA TRANG', -- DDIEM_DA - nvarchar(50)
    '5'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'San pham Z', -- TENDA - nvarchar(50)
    '3',  -- MADA - char(10)
    N'TP HCM', -- DDIEM_DA - nvarchar(50)
    '5'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'Tin hoa hoc', -- TENDA - nvarchar(50)
    '10',  -- MADA - char(10)
    N'HA NOI', -- DDIEM_DA - nvarchar(50)
    '4'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'Cap quang', -- TENDA - nvarchar(50)
    '20',  -- MADA - char(10)
    N'TP HCM', -- DDIEM_DA - nvarchar(50)
    '1'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.DEAN
(
    TENDA,
    MADA,
    DDIEM_DA,
    PHONG
)
VALUES
(   N'Dao tao', -- TENDA - nvarchar(50)
    '30',  -- MADA - char(10)
    N'HA NOI', -- DDIEM_DA - nvarchar(50)
    '4'   -- PHONG - char(10)
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '123456789', -- MA_NVIEN - char(10)
    '1', -- SODA - char(10)
    32.5 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '123456789', -- MA_NVIEN - char(10)
    '2', -- SODA - char(10)
    7.5 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '666884444', -- MA_NVIEN - char(10)
    '3', -- SODA - char(10)
    40.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '453453453', -- MA_NVIEN - char(10)
    '1', -- SODA - char(10)
    20.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '453453453', -- MA_NVIEN - char(10)
    '2', -- SODA - char(10)
    20.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '333445555', -- MA_NVIEN - char(10)
    '3', -- SODA - char(10)
    10.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '333445555', -- MA_NVIEN - char(10)
    '10', -- SODA - char(10)
    10.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '333445555', -- MA_NVIEN - char(10)
    '20', -- SODA - char(10)
    10.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '999887777', -- MA_NVIEN - char(10)
    '30', -- SODA - char(10)
    30.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '999887777', -- MA_NVIEN - char(10)
    '10', -- SODA - char(10)
    10.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '987987987', -- MA_NVIEN - char(10)
    '10', -- SODA - char(10)
    35.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '987987987', -- MA_NVIEN - char(10)
    '30', -- SODA - char(10)
    5.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '987987987', -- MA_NVIEN - char(10)
    '30', -- SODA - char(10)
    20.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '987987987', -- MA_NVIEN - char(10)
    '20', -- SODA - char(10)
    15.0 -- SOGIO - float
)
GO
INSERT INTO dbo.PHANCONG
(
    MA_NVIEN,
    SODA,
    SOGIO
)
VALUES
(   '888665555', -- MA_NVIEN - char(10)
    '20', -- SODA - char(10)
	NULL
)
GO
-- UPDATE THEM COT VAO BANG
ALTER TABLE dbo.NHANVIEN 
ADD quequan NVARCHAR(100)
ALTER TABLE dbo.NHANVIEN DROP COLUMN quequan
-- UPDATE DATA
UPDATE dbo.NHANVIEN SET quequan=N'can tho'
WHERE MANV='123456789'
ALTER TABLE dbo.NHANVIEN ADD tinhtranggd NVARCHAR(100)
ALTER TABLE dbo.NHANVIEN 
ALTER COLUMN tinhtranggd 
ALTER TABLE dbo.NHANVIEN ADD hsl FLOAT
-- DROP COLUMN
ALTER TABLE dbo.NHANVIEN DROP COLUMN hsl
CREATE TABLE data1
(
	id INT,
	name NVARCHAR(50)
)
-- DROP TABLE
DROP TABLE dbo.data1
DROP DATABASE Quanlyduan
-- CHO DS NHAN VIEN TT HIEN THI: MANV,HONV,TENLOT,TENNV,GT
SELECT MANV,HONV,TENLOT,TENNV,PHAI FROM dbo.NHANVIEN
SELECT MANV,TENNV FROM dbo.NHANVIEN
WHERE PHG='5' AND PHAI=N'nam'
SELECT HONV+ ' ' +TENLOT+  ' '+ TENNV AS 'HO VA TEN' FROM dbo.NHANVIEN
SELECT MANV,TENNV, (YEAR(GETDATE())-YEAR(NGSINH)) AS TUOI FROM dbo.NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGSINH)>40 AND YEAR(GETDATE())-YEAR(NGSINH)<=60