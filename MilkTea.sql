USE [master]
GO
/****** Object:  Database [MilkTea]    Script Date: 8/8/2022 12:28:41 PM ******/
CREATE DATABASE [MilkTea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MilkTea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHAITQ\MSSQL\DATA\MilkTea.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MilkTea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KHAITQ\MSSQL\DATA\MilkTea_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MilkTea] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkTea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkTea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkTea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkTea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkTea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkTea] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkTea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MilkTea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MilkTea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkTea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkTea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkTea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkTea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkTea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkTea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkTea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MilkTea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkTea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkTea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkTea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkTea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkTea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MilkTea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkTea] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MilkTea] SET  MULTI_USER 
GO
ALTER DATABASE [MilkTea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkTea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkTea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkTea] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MilkTea] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MilkTea] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MilkTea] SET QUERY_STORE = OFF
GO
USE [MilkTea]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](30) NULL,
	[orderDate] [date] NOT NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [varchar](10) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](10) NOT NULL,
	[categoryID] [varchar](10) NULL,
	[productName] [nvarchar](max) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](max) NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/8/2022 12:28:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](30) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[address] [nvarchar](max) NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'BA', N'BÁNH')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'DS', N'ĐÁ XAY')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'TC', N'TRÀ TRÁI CÂY')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'TOP', N'TOPPING')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'TS', N'TRÀ SỮA')
GO
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T1', N'TS', N'Trà Sữa Bạc Hà', 33.0000, 25, N'https://beponghoang.com/wp-content/uploads/2021/09/tra-sua-bac-ha.webp', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T10', N'TOP', N'Trân Châu Đen', 5.0000, 80, N'https://cdn.pastaxi-manager.onepas.vn/content/uploads/articles/0011.%20le-%20mon%20ngon%20cong%20thuc/cach%20lam%20tran%20chau%20den/A8.%20%20cach%20lam%20tran%20chau%20den.png', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T100', N'BA', N'BÃ¡nh Oreo', 8.0000, 1, N'https://cdn.tgdd.vn/2020/08/CookProduct/11-1200x676-3.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T11', N'TOP', N'Trân Châu Hoàng Kim', 8.0000, 76, N'https://cdn.dayphache.edu.vn/wp-content/uploads/2019/09/cach-lam-tran-chau-hoang-kim.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T12', N'TOP', N'Pudding Trứng', 8.0000, 50, N'https://cf.shopee.vn/file/b7582a13a1263cc63d34fa22d373c3e4', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T13', N'TOP', N'Thạch Cà Phê', 5.0000, 25, N'https://blog.beemart.vn/wp-content/uploads/2019/09/cach-lam-thach-ca-phe-pho-mai006-143415241.jpeg', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T14', N'DS', N'Cà Phê Đá Xay', 42.0000, 17, N'https://thelovelycup.com/wp-content/uploads/barista-du-hoc-sinh-1-2.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T16', N'TOP', N'Thạch Cà Phê', 6.0000, 15, N'https://blog.beemart.vn/wp-content/uploads/2019/09/cach-lam-thach-ca-phe-pho-mai006-143415241.jpeg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T17', N'TC', N'Trà Vải', 28.0000, 15, N'https://danviet.mediacdn.vn/upload/2-2018/images/2018-05-29/_mg_5907-1527580186-width650height433.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T18', N'TC', N'Trà Thạch Đào', 28.0000, 22, N'https://i.ytimg.com/vi/o_GWlo_2sYY/maxresdefault.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T19', N'TS', N'Trà Sữa Khoai Môn', 28.0000, 15, N'https://viettuantea.vn/wp-content/uploads/2020/11/cong-thuc-pha-tra-sua-khoai-mon.jpg', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T2', N'TS', N'Trà Sữa Truyền Thống', 25.0000, 30, N'https://cdn.daotaobeptruong.vn/wp-content/uploads/2021/02/cach-lam-banh-tra-sua-tran-chau-duong-den.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T20', N'BA', N'Bánh Macaron', 7.0000, 30, N'https://nof.vn/wp-content/uploads/2021/01/diem-danh-cac-loai-banh-mi-phap-noi-tieng-cach-lam-banh-macaron-bang-chao-800x590-1.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T21', N'BA', N'Bánh Cookies', 7.0000, 25, N'https://bizweb.dktcdn.net/100/438/465/files/banh-cookies-sapo.jpg?v=1642844068210', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T22', N'BA', N'Bánh Sừng Trâu', 15.0000, 15, N'https://hotdeal.vn/images/uploads/2017/Th%C3%A1ng%202/14/318515/318515-combo-hop-5-banh-sung-trau-body%20%287%29.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T23', N'TOP', N'Thạch Củ Năng', 4.0000, 50, N'https://congthucphache.com/wp-content/uploads/2019/01/thach-cu-nang-1.jpg', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T24', N'TOP', N'Khúc Bạch', 7.0000, 25, N'https://vcdn-giadinh.vnecdn.net/2020/08/24/Che-Khuc-bach-2-6311-1598272128.jpg', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T25', N'TC', N'Trà Lài Đắc Thơm', 33.0000, 27, N'https://congthucmonngon.com/wp-content/uploads/2021/09/tra-lai-dac-thom.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T26', N'BA', N'Bánh Trứng', 12.0000, 15, N'https://ferolivietnam.vn/media/news/2808_unnamed.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T3', N'TS', N'Trà Sữa Socola', 27.0000, 18, N'https://pozaatea.vn/wp-content/uploads/2019/06/6-1.png', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T30', N'BA', N'Bánh Toast', 25.0000, 13, N'https://nhipcauduhoc.com/upload/fck/image/ut/the_alley_toast(1).jpg', N'false')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T33', N'BA', N'Bánh granola', 11.0000, 11, N'https://bizweb.dktcdn.net/100/357/495/articles/banh-ngu-coc-an-kieng-baker-baking-blog-187.jpg?v=1606534078810', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T38', N'BA', N'Bánh Trung Thu', 20.0000, 15, N'https://cdn.tgdd.vn/Files/2014/08/13/559712/huong-dan-cach-chon-mua-banh-trung-thu-13.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T4', N'TS', N'Trà Sữa Dâu Tây', 25.0000, 15, N'https://cf.shopee.vn/file/e789d6ed0b019a11f527ef8421ea7aec', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T5', N'DS', N'Cookie Oreo Đá Xay', 42.0000, 23, N'https://lamaca.vn/wp-content/uploads/2021/08/c%C3%A1ch-l%C3%A0m-c%C3%A0-ph%C3%AA-%C4%91%C3%A1-xay-Cookie.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T6', N'DS', N'Matcha Đá Xay', 38.0000, 25, N'http://www.richs.com.vn/images/cong-thuc/Th%E1%BB%A9c%20u%E1%BB%91ng/Matcha%20%C4%91%C3%A1%20xay/IMG_7185.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T7', N'TS', N'Hồng Trà Macchiato', 45.0000, 20, N'https://i.pinimg.com/originals/66/bf/48/66bf4897c7636a27a4748200b14d1f47.png', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T8', N'TC', N'Trà Đào Cam Sả', 35.0000, 27, N'https://cdn.cet.edu.vn/wp-content/uploads/2020/03/hinh-anh-tra-dao-cam-sa.jpg', N'true')
INSERT [dbo].[tblProduct] ([productID], [categoryID], [productName], [price], [quantity], [image], [status]) VALUES (N'T9', N'TC', N'Trà Chanh Mật Ong', 25.0000, 17, N'https://vcdn-suckhoe.vnecdn.net/2019/05/24/anh-dai-dien-5619-1558669114.jpg', N'true')
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'admin', N'AD', N'Tôi là ADMIN', N'123', N'FPT University', NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'dong', N'US', N'Nguyễn Thành Đông', N'123', N'Quận 6, TP.HCM', N'0789742530', N'dong123@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'Hoadnt', N'US', N'Đoàn Nguyễn Thành Hòa', N'1', N'', N'', N'')
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'khai', N'US', N'Tăng Quang Khải', N'123', N'Quận 8, TP.HCM', N'0836434919', N'khaitqse150823@fpt.edu.vn')
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'lamhau', N'US', N'Lâm Long Hậu', N'123', N'Bình Thạnh', N'0933135719', N'lamhau@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [roleID], [fullName], [password], [address], [phone], [email]) VALUES (N'quocdat', N'US', N'Nguyễn Trọng Quốc Đạt', N'123', N'Vũng Tàu', N'0705442400', N'datblind@gmail.com')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [MilkTea] SET  READ_WRITE 
GO
