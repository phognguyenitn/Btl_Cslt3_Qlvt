IF EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME LIKE 'VATTU_DB')
DROP DATABASE VATTU_DB
CREATE DATABASE VATTU_DB

GO
USE VATTU_DB

GO

IF OBJECT_ID ('VATTU_DB..tb_Tai_Khoan') IS NOT NULL
DROP TABLE tb_Tai_Khoan
CREATE TABLE tb_Tai_Khoan
(
	Ma_Tk nchar(10),
	Ten_Tk nvarchar(128),
	Tk_Me nchar(10)
	CONSTRAINT pk_matk  PRIMARY KEY (Ma_Tk)
)

IF OBJECT_ID ('VATTU_DB..tb_Nhom_Khach_Hang') IS NOT NULL
DROP TABLE tb_Nhom_Khach_Hang
CREATE TABLE tb_Nhom_Khach_Hang
(
	Ma_Nhom nchar(10),
	Ten_Nhom nvarchar(128)
	CONSTRAINT PK_Ma_Nhom PRIMARY KEY (Ma_Nhom)
)

IF OBJECT_ID ('VATTU_DB..tb_Ma_Kho') IS NOT NULL
DROP TABLE tb_Ma_Kho
CREATE TABLE tb_Ma_Kho
(
	Ma_Kho nchar(10),
	Ten_Kho nvarchar(128)
	CONSTRAINT PK_Ma_Kho PRIMARY KEY (Ma_Kho)
)

IF OBJECT_ID ('VATTU_DB..tb_Hang_Hoa') IS NOT NULL
DROP TABLE tb_Hang_Hoa
CREATE TABLE tb_Hang_Hoa 
(
	Ma_Hang nchar(10),
	Ten_Hang nvarchar(128),
	DVT nvarchar(10)
	CONSTRAINT PK_Ma_Hang PRIMARY KEY(Ma_Hang)
)

IF OBJECT_ID ('VATTU_DB..tb_Khach_Hang') IS NOT NULL
DROP TABLE tb_Khach_Hang
CREATE TABLE tb_Khach_Hang
(
	Ma_Kh nchar(10),
	Ten_Kh nvarchar(128),
	Ma_Nhom nchar(10),
	Ma_So_Thue nvarchar(50),
	Tiem_Nang tinyint,
	CONSTRAINT PK_Ma_Kh PRIMARY KEY (Ma_Kh),
	CONSTRAINT FK_Ma_Nhom FOREIGN KEY (Ma_Nhom) REFERENCES tb_Nhom_Khach_Hang(Ma_Nhom)
)

IF OBJECT_ID ('VATTU_DB..tb_Ton_Dau_Ki') IS NOT NULL
DROP TABLE tb_Ton_Dau_Ki
CREATE TABLE tb_Ton_Dau_Ki
(
	Ngay DATETIME,
	Ma_Hang nchar(10),
	Ma_Kho NCHAR(10),
	So_Luong NUMERIC(14,2),
	Thanh_Tien NUMERIC(18,2)
	CONSTRAINT FK_Ma_Hang FOREIGN KEY (Ma_Hang)  REFERENCES tb_Hang_Hoa(Ma_Hang),
	CONSTRAINT FK_Ma_Kho FOREIGN KEY (Ma_Kho) REFERENCES tb_Ma_Kho(Ma_Kho)
)

IF OBJECT_ID ('VATTU_DB..tb_Phieu_Nhap') IS NOT NULL
DROP TABLE tb_Phieu_Nhap
CREATE TABLE tb_Phieu_Nhap
(
	So NCHAR(15),
	Ngay DATETIME,
	Tk_No NCHAR(10),
	Tk_Co NCHAR(10),
	Ma_Kh NCHAR(10),
	Ma_Kho NCHAR(10),
	Tongtien NUMERIC(18,2),
	Dien_Giai NVARCHAR(128)
	CONSTRAINT PK_So PRIMARY KEY (So),  
	CONSTRAINT FK_Phieu_Nhap_Ma_Kho FOREIGN KEY (Ma_Kho) REFERENCES tb_Ma_Kho(Ma_Kho),
	CONSTRAINT FK_Phieu_Nhap_Ma_Kh FOREIGN KEY (Ma_Kh) REFERENCES tb_Khach_Hang(Ma_Kh),
	CONSTRAINT FK_Phieu_Nhap_TK_Co FOREIGN KEY (Tk_Co) REFERENCES tb_Tai_Khoan(Ma_Tk),
	CONSTRAINT FK_Phieu_Nhap_TK_No FOREIGN KEY (Tk_No) REFERENCES tb_Tai_Khoan(Ma_Tk),
)

IF OBJECT_ID ('VATTU_DB..tb_CT_Phieu_Nhap') IS NOT NULL
DROP TABLE tb_CT_Phieu_Nhap
CREATE TABLE tb_CT_Phieu_Nhap
(
	So NCHAR(15),
	Ma_Hang NCHAR(10),
	So_Luong NUMERIC(14,2),
	Don_Gia NUMERIC(18,2),
	Thanh_Tien NUMERIC(18,2)
	CONSTRAINT PK_So_MaHang PRIMARY KEY (So,Ma_Hang),
	CONSTRAINT FK_CT_Phieu_Nhap_MaHang FOREIGN KEY (Ma_Hang) REFERENCES tb_Hang_Hoa(Ma_Hang)
)

IF OBJECT_ID ('VATTU_DB..tb_Phieu_Xuat') IS NOT NULL
DROP TABLE tb_Phieu_Xuat
CREATE TABLE tb_Phieu_Xuat
(
	So NCHAR(15),
	Ngay DATETIME,
	Tk_No NCHAR(10),
	Tk_Co NCHAR(10),
	Ma_Kh NCHAR(10),
	Ma_Kho NCHAR(10),
	Tongtien NUMERIC(18,2),
	Dien_Giai NVARCHAR(128)
	CONSTRAINT PK_Phieu_Xuat_So PRIMARY KEY (So),  
	CONSTRAINT FK_Phieu_Xuat_Ma_Kho FOREIGN KEY (Ma_Kho) REFERENCES tb_Ma_Kho(Ma_Kho),
	CONSTRAINT FK_Phieu_Xuat_Ma_Kh FOREIGN KEY (Ma_Kh) REFERENCES tb_Khach_Hang(Ma_Kh),
	CONSTRAINT FK_Phieu_Xuat_TK_Co FOREIGN KEY (Tk_Co) REFERENCES tb_Tai_Khoan(Ma_Tk),
	CONSTRAINT FK_Phieu_Xuat_TK_No FOREIGN KEY (Tk_No) REFERENCES tb_Tai_Khoan(Ma_Tk),
)

IF OBJECT_ID ('VATTU_DB..tb_CT_Phieu_Xuat') IS NOT NULL
DROP TABLE tb_CT_Phieu_Xuat
CREATE TABLE tb_CT_Phieu_Xuat
(
	So NCHAR(15),
	Ma_Hang NCHAR(10),
	So_Luong NUMERIC(14,2),
	Don_Gia NUMERIC(18,2),
	Thanh_Tien NUMERIC(18,2)
	CONSTRAINT PK_CT_Phieu_Xuat_So_MaHang PRIMARY KEY (So,Ma_Hang),
	CONSTRAINT FK_CT_Phieu_Xuat_MaHang FOREIGN KEY (Ma_Hang) REFERENCES tb_Hang_Hoa(Ma_Hang)
)


IF OBJECT_ID ('VATTU_DB..tb_User') IS NOT NULL
DROP TABLE tb_User
CREATE TABLE tb_User
(
	UserID INT IDENTITY(1,1),
	UserName NVARCHAR(128),
	UserPassword NCHAR(75),
	CONSTRAINT PK_UserID PRIMARY KEY (UserID)
)
