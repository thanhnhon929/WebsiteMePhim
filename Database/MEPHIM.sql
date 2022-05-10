--USE [master]
--GO
--/****** Object:  Database [PHIM2]    Script Date: 7/25/2021 10:38:45 PM ******/
--CREATE DATABASE [PHIM2]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'PHIM2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PHIM2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
-- LOG ON 
--( NAME = N'PHIM2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PHIM2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
-- WITH CATALOG_COLLATION = DATABASE_DEFAULT
--GO
--ALTER DATABASE [PHIM2] SET COMPATIBILITY_LEVEL = 150
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [PHIM2].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [PHIM2] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [PHIM2] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [PHIM2] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [PHIM2] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [PHIM2] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [PHIM2] SET AUTO_CLOSE ON 
--GO
--ALTER DATABASE [PHIM2] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [PHIM2] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [PHIM2] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [PHIM2] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [PHIM2] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [PHIM2] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [PHIM2] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [PHIM2] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [PHIM2] SET  ENABLE_BROKER 
--GO
--ALTER DATABASE [PHIM2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [PHIM2] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [PHIM2] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [PHIM2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [PHIM2] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [PHIM2] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [PHIM2] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [PHIM2] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [PHIM2] SET  MULTI_USER 
--GO
--ALTER DATABASE [PHIM2] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [PHIM2] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [PHIM2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [PHIM2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
--GO
--ALTER DATABASE [PHIM2] SET DELAYED_DURABILITY = DISABLED 
--GO
--ALTER DATABASE [PHIM2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
--GO
--ALTER DATABASE [PHIM2] SET QUERY_STORE = OFF
--GO
--USE [PHIM2]
--GO
--/****** Object:  Table [dbo].[ADMIN]    Script Date: 7/25/2021 10:38:45 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE TABLE [dbo].[ADMIN](
	[MaAdmin] [int] NOT NULL,
	[TenAdmin] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](15) NULL,
	[TenDN] [varchar](15) NULL,
	[MatKhau] [varchar](15) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHIEURAP]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHIEURAP](
	[MaChieuRap] [int] NOT NULL,
	[TenChieuRap] [nvarchar](50) NULL,
	[MaNSX] [int] NULL,
	[MaPhim] [int] NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_CR] PRIMARY KEY CLUSTERED 
(
	[MaChieuRap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIXEM]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIXEM](
	[MaNX] [int] IDENTITY(7000,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TaiKhoan] [varchar](15) NULL,
	[MatKhau] [varchar](15) NOT NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[NgaySinh] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHASANXUAT]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHASANXUAT](
	[MaNSX] [int] NOT NULL,
	[TenNSX] [char](50) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[DienThoai] [varchar](15) NULL,
 CONSTRAINT [PK_NSX] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[MaPhim] [int] NOT NULL,
	[TenPhim] [nvarchar](50) NOT NULL,
	[MoTa] [ntext] NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[MaTheLoai] [int] NULL,
	[MaNSX] [int] NULL,
	[PhimVip] [int] NULL,
	[LuotXem] [int] NULL,
 CONSTRAINT [PK_PHIM] PRIMARY KEY CLUSTERED 
(
	[MaPhim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIMBO]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIMBO](
	[MaPhimBo] [int] NOT NULL,
	[TenPhimBo] [nvarchar](50) NULL,
	[MaNSX] [int] NULL,
	[MaPhim] [int] NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_PB] PRIMARY KEY CLUSTERED 
(
	[MaPhimBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIMHAY]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIMHAY](
	[MaPhimHay] [int] NOT NULL,
	[TenPhimHay] [nvarchar](50) NULL,
	[MaNSX] [int] NULL,
	[MaPhim] [int] NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_PH] PRIMARY KEY CLUSTERED 
(
	[MaPhimHay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIMLE]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIMLE](
	[MaPhimLe] [int] NOT NULL,
	[TenPhimLe] [nvarchar](50) NULL,
	[MaNSX] [int] NULL,
	[MaPhim] [int] NULL,
	[AnhBia] [varchar](50) NULL,
 CONSTRAINT [PK_PL] PRIMARY KEY CLUSTERED 
(
	[MaPhimLe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTheLoai] [int] NOT NULL,
	[TenTheLoai] [nvarchar](50) NULL,
	[MaNSX] [int] NULL,
 CONSTRAINT [PK_TL] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIDEO]    Script Date: 7/25/2021 10:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIDEO](
	[MaPhim] [int] NULL,
	[Video] [varchar](100) NULL,
	[TenPhim] [nvarchar](50) NOT NULL,
	[MoTa] [ntext] NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([MaAdmin], [TenAdmin], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email]) VALUES (111, N'Cao Thanh Nhon', N'HCM', N'0123456782', N'thanhnhon', N'123', CAST(N'2001-01-01T00:00:00' AS SmallDateTime), N'thanhnhon929@gmail.com')
INSERT [dbo].[ADMIN] ([MaAdmin], [TenAdmin], [DiaChi], [DienThoai], [TenDN], [MatKhau], [NgaySinh], [Email]) VALUES (112, N'vqluong', N'BinhDuong', N'0210221222', N'vqluong', N'123', CAST(N'1980-02-02T00:00:00' AS SmallDateTime), N'vqluong@gmail.com')
GO
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6001, N'Avengers: End Game', 1001, 1, N'endgame.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6002, N'Avengers: Infinity', 1001, 2, N'Aven3.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6003, N'Avengers: Civil War', 1001, 3, N'civilwar.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6004, N'Bố Gìa', 1003, 5, N'bogia.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6005, N'Mắt Biếc ', 1004, 6, N'matbiec.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6006, N'The Flu', 1008, 14, N'theflu.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6007, N'Lật Mặt 4', 1002, 10, N'latmat4.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6008, N'Naruto: The Last Movie', 1005, 11, N'tlm.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6009, N'Cross', 1010, 17, N'cross.jpg')
INSERT [dbo].[CHIEURAP] ([MaChieuRap], [TenChieuRap], [MaNSX], [MaPhim], [AnhBia]) VALUES (6010, N'Fast and Furius', 1011, 18, N'quanhanh9.jpg')
GO
SET IDENTITY_INSERT [dbo].[NGUOIXEM] ON 

INSERT [dbo].[NGUOIXEM] ([MaNX], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (7000, N'Cao Nhon', N'thanhnhon', N'123', N'thanhnhon929@gmail.com', N'HCM', N'0212456321', CAST(N'2001-02-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[NGUOIXEM] ([MaNX], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (7001, N'Vo Luong', N'vqluong', N'123', N'vqluong@gmail.com', N'BinhDuong', N'0212212222', CAST(N'1980-02-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[NGUOIXEM] ([MaNX], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (7002, N'aaa', N'aaa', N'1', N'aa@gmail.com', N'HCM', N'02121212', CAST(N'2021-07-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[NGUOIXEM] ([MaNX], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (7003, N'bbb', N'bbb', N'1', N'aaa@gmail.com', N'HCM', N'021212123', CAST(N'2021-07-18T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[NGUOIXEM] OFF
GO
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1001, N'Maver                                             ', N'HLW', N'0123456789')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1002, N'Ly Hai                                            ', N'VN', N'0211255515')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1003, N'Tran Thanh                                        ', N'VN', N'0215215458')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1004, N'VieOn                                             ', N'VN', N'0212155555')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1005, N'Naruto                                            ', N'Japan', N'0321515455')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1006, N'VTV                                               ', N'VN', N'0025025222')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1007, N'TVN                                               ', N'Korea', N'0216666666')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1008, N'KSP                                               ', N'Korea', N'0511520525')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1009, N'Doremon                                           ', N'JaPan', N'0212121555')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1010, N'Cross                                             ', N'HLW', N'0021555555')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1011, N'FAST                                              ', N'HLW', N'0215121512')
INSERT [dbo].[NHASANXUAT] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (1012, N'Pokemom                                           ', N'Japan', N'0212211655')
GO
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (1, N'Avengers: End Game', N'End Game

Nh&agrave; Sản Xuất: Marvel Studios

Đạo Diễn: Joe Russo, Anthony Russo

Diễn Vi&ecirc;n: Josh Brolin, Chris Pratt, Chris Hemsworth

Quốc Gia: &Acirc;u Mỹ

Năm Ph&aacute;t H&agrave;nh: 2019
', N'endgame.jpg', CAST(N'2021-07-25T00:00:00' AS SmallDateTime), 2001, 1001, 1, 123123)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (2, N'Avengers: Infinity', N'Infinity
 Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'Aven3.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2001, 1001, 1, 123124)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (3, N'Avengers: Civil War', N'Civil War
Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'civilwar.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2001, 1001, 1, 123125)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (4, N'Avengers: Ultron', N'Unltron
Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'Aven2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2001, 1001, 1, 123126)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (5, N'Bố Gìa ', N'Bố Gìa
Nhà Sản Xuất: Trấn Thành Town
Đạo Diễn: Trấn Thành, Vũ Ngọc Đãng
Diễn Viên: Trấn Thành, Tuấn Trần,…
Quốc Gia: Việt Nam 
Năm Phát Hành: 2021
 ', N'bogia.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2003, 1003, 1, 231122)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (6, N'Mắt Biếc', N'Mắt Biếc
Nhà Sản Xuất: Galaxy Media & Entertainment; November Films
Đạo Diễn: Victor Vũ
Diễn Viên: Trần Nghĩa, Trúc Anh,…
Quốc Gia: Việt Nam
Năm Phát Hành: 2019
', N'matbiec.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2010, 1004, 0, 122122)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (7, N'Lật Mặt 1', N'Lật Mặt 1
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Trường Giang, Lý Hải…
Quốc Gia: Việt Nam
Năm Phát Hành: 2015
', N'latmat1.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2005, 1002, 0, 1112)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (8, N'Lật Mặt 2', N'Lật Mặt 2
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: , Lý Hải…
Quốc Gia: Việt Nam
Năm Phát Hành: 2016
', N'latmat2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2005, 1002, 0, 2125)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (9, N'Lật Mặt 3', N'Lật Mặt 3
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Song Luần, Kiều Minh Tuấn,…
Quốc Gia: Việt Nam
Năm Phát Hành: 2018
', N'latmat3.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2005, 1002, 0, 68999)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (10, N'Lật Mặt 4', N'Lật Mặt 4
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Ốc Thanh Vân, …
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
', N'latmat4.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2005, 1002, 0, 4122)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (11, N'Naruto:The Last Movie', N'Naruto: The Last Movie
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Naruto Uzumaki, Hinata…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'tlm.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2002, 1005, 0, 354687)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (12, N'Pokemom: Bảo Bối Thần Kỳ', N'Pokemon: Bảo Bối Thần Kỳ
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Pikachu,Satoshi…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'pokemon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2012, 1012, 0, 21548)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (13, N'Cua Lại Vợ Bầu', N'Cua Lại Vợ Bầu
Nhà Sản Xuất: Galaxy
Đạo Diễn: Nhất Trung
Diễn Viên: Trấn Thành, Ninh Dương Lan Ngọc …
Quốc Gia: Việt Nam
Năm Phát Hành: 2019
', N'CLVB.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2010, 1004, 0, 21568)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (14, N'The Flu', N'The Flu
Nhà Sản Xuất: TvN
Đạo Diễn: Kim Sung-Soo
Diễn Viên: Soo Ae, Park Min-Ha…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2013
', N'theflu.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2009, 1008, 0, 21623)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (15, N'Doraemon: Nobita', N'Doraemon: Nobita
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Doraemon, Nobita…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'doraemon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2008, 1009, 0, 215153)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (16, N'Doraemon: Chong Chóng Tre', N'Doraemon: Chong Chóng Che
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Doraemon, Nobita…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'doraemon2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2008, 1009, 0, 211587)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (17, N'Cross', N'Croods
Nhà Sản Xuất: DreamWorks
Đạo Diễn:   Kirk DeMicco; Chris Sanders
Diễn Viên: Ryan Reynolds, Emma Stone,…
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'cross.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2007, 1010, 0, 656)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (18, N'Fast and Furius', N'Fast and Furious
Nhà Sản Xuất: One Race Films
Đạo Diễn: Justin Lin
Diễn Viên: Jon Cena, Vin Diesel…
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2021
', N'quanhanh9.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2006, 1011, 0, 54452)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (19, N'ItewonClass', N'ItewonClass
Nhà Sản Xuất: TvN
Đạo Diễn:   Kim Sung-Yoo
Diễn Viên: Park Seo-Joon,…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2020
', N'itewon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2004, 1007, 0, 21548)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (20, N'Crash Landing On You', N'Crash Landing On You
Nhà Sản Xuất: TvN
Đạo Diễn: Lee Jung-hyo 
Diễn Viên: Hyun Bin, Son Ye-Jin…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2019
', N'crashlanding.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2004, 1007, 0, 21688)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (21, N'Hotel De Luna', N'Hotel De Luna
Nhà Sản Xuất: TvN
Đạo Diễn: Oh Choong-hwan
Diễn Viên: Iu, Son Ye-Jin…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2018
', N'hotel.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2009, 1008, 0, 216846)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (22, N'Cây Táo Nở Hoa', N'Cây Táo Nở Hoa
Nhà Sản Xuất: Vie On
Đạo Diễn:   Võ Thạch Thảo
Diễn Viên: Thái Hòa, Hồng Hạnh
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
 ', N'caytao.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2010, 1004, 0, 84622)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (23, N'Gạo Nếp Gạo Tẻ', N'Gạo Nếp Gạo Tẻ
Nhà Sản Xuất: Vie On
Đạo Diễn:   Võ Thạch Thảo
Diễn Viên: Thúy Ngân, Phương Hằng
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
', N'gao.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2010, 1004, 0, 5468)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (24, N'Người Phán Xử', N'Người Phán Xử
Nhà Sản Xuất: VTV
Đạo Diễn:   Nguyễn Khải Anh
Diễn Viên: Hoàng Dũng, Việt Anh
Quốc Gia: Việt Nam
Năm Phát Hành: 2017
', N'nguoiphanxu.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2011, 1006, 0, 55646)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (25, N'Naruto Shipuden', N'Naruto: Shipuden
Nhà Sản Xuất: Japan
Đạo Diễn:   Masahiko Murata
Diễn Viên: Uzumaki Naruto, Uchiha Sasuke,…
Quốc Gia: Japan
Năm Phát Hành: 2009
', N'naruto.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2002, 1005, 0, 2124)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (26, N'Boruto: The Next Genaration', N'Boruto: The Next
Nhà Sản Xuất: Japan
Đạo Diễn:   Masahiko Murata
Diễn Viên: Uzumaki Naruto, Uchiha Sasuke,…
Quốc Gia: Japan
Năm Phát Hành: 2017
', N'borutothenext.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2002, 1005, 0, 284)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (27, N'WandaVison', N'WandaVison
Nhà Sản Xuất: Marvel Studios
Đạo Diễn:   Joe Russo, Anthony Russo
Diễn Viên: Elizabeth Olsen
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'wanda.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2001, 1001, 1, 5566)
INSERT [dbo].[PHIM] ([MaPhim], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat], [MaTheLoai], [MaNSX], [PhimVip], [LuotXem]) VALUES (29, N'Captain Falcon', N'Captain Falcon
Nhà Sản Xuất: Marvel Studios
Đạo Diễn:   Joe Russo, Anthony Russo
Diễn Viên: Anthony Mackie, 
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'captain.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime), 2001, 1005, 1, 122335)
GO
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5001, N'ItewonClass', 1007, 19, N'itewon.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5002, N'Crash Landing On You', 1007, 20, N'crashlanding.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5003, N'Hotel De Luna', 1008, 21, N'hotel.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5004, N'Cây Táo Nở Hoa', 1004, 22, N'caytao.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5005, N'Gạo Nếp Gạo Tẻ', 1004, 23, N'gao.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5006, N'Người Phán Xử', 1006, 24, N'nguoiphanxu.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5007, N'Naruto Shipuden', 1005, 25, N'naruto.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5008, N'Boruto: The Next Genaration', 1005, 26, N'borutothenext.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5009, N'WandaVison', 1001, 27, N'wanda.jpg')
INSERT [dbo].[PHIMBO] ([MaPhimBo], [TenPhimBo], [MaNSX], [MaPhim], [AnhBia]) VALUES (5010, N'Captain Falcon', 1001, 29, N'captain.jpg')
GO
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4001, N'Avengers: Infinity ', 1001, 2, N'Aven3.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4002, N'Avengers: Civil War', 1001, 3, N'civilwar.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4003, N'Avengers: End Game', 1001, 1, N'endgame.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4004, N'Bố Gìa', 1003, 5, N'bogia.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4005, N'Mắt Biếc', 1004, 6, N'matbiec.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4006, N'ItewonClass', 1007, 19, N'itewon.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4007, N'Crash Landing On You', 1007, 20, N'crashlanding.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4008, N'Boruto: The Next Genaration', 1005, 26, N'borutothenext.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4009, N'Captain Falcon', 1001, 29, N'captain.jpg')
INSERT [dbo].[PHIMHAY] ([MaPhimHay], [TenPhimHay], [MaNSX], [MaPhim], [AnhBia]) VALUES (4010, N'Naruto: Shipudent', 1005, 25, N'wanda.jpg')
GO
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3001, N'Avengers: End Game', 1001, 1, N'endgame.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3002, N'Avengers: Ultron', 1001, 4, N'Aven2.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3003, N'Avengers: Civil War', 1001, 3, N'civilwar.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3004, N'Avengers:Infinity', 1001, 2, N'Aven3.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3005, N'Bố Gìa', 1003, 5, N'bogia.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3006, N'Lật Mặt 1', 1002, 7, N'latmat1.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3007, N'Lật Mặt 2', 1002, 8, N'latmat2.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3008, N'Lật Mặt 3', 1002, 9, N'latmat3.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3009, N'Lật Mặt 4', 1002, 10, N'latmat4.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3010, N'Naruto: The Last Movie', 1005, 11, N'tlm.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3011, N'PoKeMon: Bảo Bối Thần Kỳ', 1012, 12, N'pokemon.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3012, N'Mắt Biếc', 1004, 6, N'matbiec.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3013, N'Cua Lại Vợ Bầu', 1004, 13, N'CLVB.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3014, N'The Flu', 1008, 14, N'theflu.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3015, N'Doraemon: Nobita', 1009, 15, N'doraemon.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3016, N'Doraemon: Chong Chóng Tre', 1009, 16, N'doraemon2.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3017, N'Cross', 1010, 17, N'cross.jpg')
INSERT [dbo].[PHIMLE] ([MaPhimLe], [TenPhimLe], [MaNSX], [MaPhim], [AnhBia]) VALUES (3018, N'Fast and Furius 9', 1011, 18, N'quanhanh9.jpg')
GO
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2001, N'Hành Động', 1001)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2002, N'Hoạt Hình', 1005)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2003, N'Gia Đình', 1003)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2004, N'Tình Cảm', 1007)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2005, N'Hành Động', 1002)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2006, N'Hành Động', 1011)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2007, N'Hoạt Hình', 1010)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2008, N'Hoạt Hình', 1009)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2009, N'Tình Cảm', 1008)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2010, N'Gia Đình', 1004)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2011, N'Gia Đình', 1006)
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [MaNSX]) VALUES (2012, N'Hoat Hình', 1012)
GO
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (1, N'https://www.youtube.com/embed/TcMBFSGVi1c', N'Avengers: End Game', N'End Game
Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'endgame.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (10, N'https://www.youtube.com/embed/kBY2k3G6LsM', N'Lật Mặt 4', N'Lật Mặt 4
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Ốc Thanh Vân, …
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
', N'latmat4.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (11, N'https://www.youtube.com/embed/tA3yE4_t6SY', N'Naruto:The Last Movie', N'Naruto: The Last Movie
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Naruto Uzumaki, Hinata…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'tlm.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (12, N'https://www.youtube.com/embed/1roy4o4tqQM', N'Pokemom: Bảo Bối Thần Kỳ', N'Pokemon: Bảo Bối Thần Kỳ
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Pikachu,Satoshi…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'pokemon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (13, N'https://www.youtube.com/embed/7V7SBjaQQ4g', N'Cua Lại Vợ Bầu', N'Cua Lại Vợ Bầu
Nhà Sản Xuất: Galaxy
Đạo Diễn: Nhất Trung
Diễn Viên: Trấn Thành, Ninh Dương Lan Ngọc …
Quốc Gia: Việt Nam
Năm Phát Hành: 2019
', N'CLVB.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (14, N'https://www.youtube.com/embed/1BvKZMg2LjU', N'The Flu', N'The Flu
Nhà Sản Xuất: TvN
Đạo Diễn: Kim Sung-Soo
Diễn Viên: Soo Ae, Park Min-Ha…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2013
', N'theflu.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (15, N'https://www.youtube.com/embed/twtjj-tuwaY', N'Doraemon: Nobita', N'Doraemon: Nobita
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Doraemon, Nobita…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'doraemon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (16, N'https://www.youtube.com/embed/WDILZzpgTJQ', N'Doraemon: Chong Chóng Tre', N'Doraemon: Chong Chóng Che
Nhà Sản Xuất: Japan
Đạo Diễn:  Tsuneo Kobayashi
Diễn Viên: Doraemon, Nobita…
Quốc Gia: Japan
Năm Phát Hành: 2014
', N'doraemon2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (17, N'https://www.youtube.com/embed/4fVCKy69zUY', N'Cross', N'Croods
Nhà Sản Xuất: DreamWorks
Đạo Diễn:   Kirk DeMicco; Chris Sanders
Diễn Viên: Ryan Reynolds, Emma Stone,…
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'cross.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (18, N'https://www.youtube.com/embed/f02Haxdg7EQ', N'Fast and Furius', N'Fast and Furious
Nhà Sản Xuất: One Race Films
Đạo Diễn: Justin Lin
Diễn Viên: Jon Cena, Vin Diesel…
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2021
', N'quanhanh9.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (19, N'https://www.youtube.com/embed/NeaHNQJ1kCo', N'ItewonClass', N'ItewonClass
Nhà Sản Xuất: TvN
Đạo Diễn:   Kim Sung-Yoo
Diễn Viên: Park Seo-Joon,…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2020
', N'itewon.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (2, N'https://www.youtube.com/embed/6ZfuNTqbHE8', N'Avengers: Infinity', N'Infinity
 Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'Aven3.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (20, N'https://www.youtube.com/embed/eXMjTXL2Vks', N'Crash Landing On You', N'Crash Landing On You
Nhà Sản Xuất: TvN
Đạo Diễn: Lee Jung-hyo 
Diễn Viên: Hyun Bin, Son Ye-Jin…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2019
', N'crashlanding.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (21, N'https://www.youtube.com/embed/iDzR6twXE_E', N'Hotel De Luna', N'Hotel De Luna
Nhà Sản Xuất: TvN
Đạo Diễn: Oh Choong-hwan
Diễn Viên: Iu, Son Ye-Jin…
Quốc Gia: Hàn Quốc
Năm Phát Hành: 2018
', N'hotel.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (22, N'https://www.youtube.com/embed/4JbvwHRtkt8', N'Cây Táo Nở Hoa', N'Cây Táo Nở Hoa
Nhà Sản Xuất: Vie On
Đạo Diễn:   Võ Thạch Thảo
Diễn Viên: Thái Hòa, Hồng Hạnh
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
 ', N'caytao.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (23, N'https://www.youtube.com/embed/mSVdNLrenPA', N'Gạo Nếp Gạo Tẻ', N'Gạo Nếp Gạo Tẻ
Nhà Sản Xuất: Vie On
Đạo Diễn:   Võ Thạch Thảo
Diễn Viên: Thúy Ngân, Phương Hằng
Quốc Gia: Việt Nam
Năm Phát Hành: 2021
', N'gao.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (24, N'https://www.youtube.com/embed/QpfRsqTVwf0', N'Người Phán Xử', N'Người Phán Xử
Nhà Sản Xuất: VTV
Đạo Diễn:   Nguyễn Khải Anh
Diễn Viên: Hoàng Dũng, Việt Anh
Quốc Gia: Việt Nam
Năm Phát Hành: 2017
', N'nguoiphanxu.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (25, N'https://www.youtube.com/embed/thh7bVCgDHs', N'Naruto Shipuden', N'Naruto: Shipuden
Nhà Sản Xuất: Japan
Đạo Diễn:   Masahiko Murata
Diễn Viên: Uzumaki Naruto, Uchiha Sasuke,…
Quốc Gia: Japan
Năm Phát Hành: 2009
', N'naruto.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (26, N'https://www.youtube.com/embed/iHXT9JF6b_o', N'Boruto: The Next Genaration', N'Boruto: The Next
Nhà Sản Xuất: Japan
Đạo Diễn:   Masahiko Murata
Diễn Viên: Uzumaki Naruto, Uchiha Sasuke,…
Quốc Gia: Japan
Năm Phát Hành: 2017
', N'borutothenext.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (27, N'https://www.youtube.com/embed/sj9J2ecsSpo', N'WandaVison', N'WandaVison
Nhà Sản Xuất: Marvel Studios
Đạo Diễn:   Joe Russo, Anthony Russo
Diễn Viên: Elizabeth Olsen
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'wanda.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (29, N'https://www.youtube.com/embed/IWBsDaFWyTE', N'Captain Falcon', N'Captain Falcon
Nhà Sản Xuất: Marvel Studios
Đạo Diễn:   Joe Russo, Anthony Russo
Diễn Viên: Anthony Mackie, 
Quốc Gia: Hoa Kỳ
Năm Phát Hành: 2021
', N'captain.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (3, N'https://www.youtube.com/embed/FkTybqcX-Yo', N'Avengers: Civil War', N'Civil War
Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'civilwar.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (4, N'https://www.youtube.com/embed/P5iIPfNzj2o', N'Avengers: Ultron', N'Unltron
Nhà Sản Xuất: Marvel Studios
Đạo Diễn: Joe Russo, Anthony Russo
Diễn Viên: Josh Brolin, Chris Pratt, Chris Hemsworth
Quốc Gia: Âu Mỹ
Năm Phát Hành: 2019
', N'Aven2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (5, N'https://www.youtube.com/embed/jluSu8Rw6YE', N'Bố Gìa ', N'Bố Gìa
Nhà Sản Xuất: Trấn Thành Town
Đạo Diễn: Trấn Thành, Vũ Ngọc Đãng
Diễn Viên: Trấn Thành, Tuấn Trần,…
Quốc Gia: Việt Nam 
Năm Phát Hành: 2021
 ', N'bogia.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (6, N'https://www.youtube.com/embed/MNm77lvTfi4', N'Mắt Biếc', N'Mắt Biếc
Nhà Sản Xuất: Galaxy Media & Entertainment; November Films
Đạo Diễn: Victor Vũ
Diễn Viên: Trần Nghĩa, Trúc Anh,…
Quốc Gia: Việt Nam
Năm Phát Hành: 2019
', N'matbiec.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (7, N'https://www.youtube.com/embed/ZFoIBlb5BDw', N'Lật Mặt 1', N'Lật Mặt 1
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Trường Giang, Lý Hải…
Quốc Gia: Việt Nam
Năm Phát Hành: 2015
', N'latmat1.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (8, N'https://www.youtube.com/embed/RY30ngiSJHA', N'Lật Mặt 2', N'Lật Mặt 2
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: , Lý Hải…
Quốc Gia: Việt Nam
Năm Phát Hành: 2016
', N'latmat2.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[VIDEO] ([MaPhim], [Video], [TenPhim], [MoTa], [AnhBia], [NgayCapNhat]) VALUES (9, N'https://www.youtube.com/embed/JcKMQQLycpQ', N'Lật Mặt 3', N'Lật Mặt 3
Nhà Sản Xuất: Lý Hải
Đạo Diễn: Lý Hải
Diễn Viên: Song Luần, Kiều Minh Tuấn,…
Quốc Gia: Việt Nam
Năm Phát Hành: 2018
', N'latmat3.jpg', CAST(N'2021-06-29T00:00:00' AS SmallDateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NGUOIXEM__A9D10534FAC2C0D6]    Script Date: 7/25/2021 10:38:45 PM ******/
ALTER TABLE [dbo].[NGUOIXEM] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NGUOIXEM__D5B8C7F02AFDA0B5]    Script Date: 7/25/2021 10:38:45 PM ******/
ALTER TABLE [dbo].[NGUOIXEM] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHIEURAP]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[CHIEURAP]  WITH CHECK ADD FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[THELOAI] ([MaTheLoai])
GO
ALTER TABLE [dbo].[PHIMBO]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[PHIMBO]  WITH CHECK ADD FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[PHIMHAY]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[PHIMHAY]  WITH CHECK ADD FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[PHIMLE]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[PHIMLE]  WITH CHECK ADD FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[THELOAI]  WITH CHECK ADD FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NHASANXUAT] ([MaNSX])
GO
ALTER TABLE [dbo].[VIDEO]  WITH CHECK ADD FOREIGN KEY([MaPhim])
REFERENCES [dbo].[PHIM] ([MaPhim])
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [Checks] CHECK  (([PhimVip]>=(0) AND [PhimVip]<=(1)))
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [Checks]
GO

