USE [master]
GO
/****** Object:  Database [ananas]    Script Date: 11/17/2020 9:03:05 PM ******/
CREATE DATABASE [ananas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ananas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGTIENVIETT\MSSQL\DATA\ananas.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ananas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGTIENVIETT\MSSQL\DATA\ananas_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ananas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ananas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ananas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ananas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ananas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ananas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ananas] SET ARITHABORT OFF 
GO
ALTER DATABASE [ananas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ananas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ananas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ananas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ananas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ananas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ananas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ananas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ananas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ananas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ananas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ananas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ananas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ananas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ananas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ananas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ananas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ananas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ananas] SET  MULTI_USER 
GO
ALTER DATABASE [ananas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ananas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ananas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ananas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ananas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ananas]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collection]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](100) NOT NULL,
	[CollectionImage] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ColorName] [varchar](100) NULL,
	[ColorCode] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](16) NULL,
	[Total] [decimal](18, 0) NULL,
	[Status] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](20) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[OrderDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] NOT NULL,
	[ProductCode] [varchar](10) NOT NULL,
	[Size] [varchar](4) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [OrderDetail_PK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ProductCode] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductCode] [varchar](10) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[CategoryID] [smallint] NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[Size] [varchar](4) NOT NULL,
	[Images] [text] NULL,
	[Gender] [varchar](10) NULL,
	[CollectionID] [smallint] NULL,
	[MaterialID] [smallint] NULL,
	[Quantity] [int] NULL,
	[Style] [nvarchar](100) NULL,
	[ColorID] [smallint] NULL,
	[DetailProduct] [nvarchar](1000) NULL,
	[ProductLineID] [smallint] NULL,
 CONSTRAINT [Product_PK] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductLine]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLine](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[ProductLineName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/17/2020 9:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](16) NOT NULL,
	[Password] [varchar](32) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Role] [nvarchar](25) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (1, N'Giày')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (2, N'Nửa trên')
INSERT [dbo].[Category] ([ID], [CategoryName]) VALUES (3, N'Phụ Kiện')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([ID], [CollectionName], [CollectionImage]) VALUES (1, N'Track 6 OG', N'ảnh')
INSERT [dbo].[Collection] ([ID], [CollectionName], [CollectionImage]) VALUES (2, N'Ananas x Lucky Luke', NULL)
INSERT [dbo].[Collection] ([ID], [CollectionName], [CollectionImage]) VALUES (3, N'Yesterday', NULL)
INSERT [dbo].[Collection] ([ID], [CollectionName], [CollectionImage]) VALUES (4, N'Mister', NULL)
SET IDENTITY_INSERT [dbo].[Collection] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (1, N'Triple Black', N'#2d2c2f')
INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (2, N'Chocolate Brown', N'#4e403b')
INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (3, N'Storm', N'#035453')
INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (4, N'Chestnut', N'#584039')
INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (5, N'Moonstruck Pirate', N'#c4c2b9')
INSERT [dbo].[Color] ([ID], [ColorName], [ColorCode]) VALUES (6, N'Caviar Black', N'#2d2c2f')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (1, N'Canvas | Vải', N'vải')
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (2, N'Suede | Da lộn', NULL)
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (3, N'Synthetic Leather', NULL)
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (4, N'Leather | Da', NULL)
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (5, N'Cotton', NULL)
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (6, N'Corduroy', NULL)
INSERT [dbo].[Material] ([ID], [MaterialName], [Description]) VALUES (7, N'Polyester', NULL)
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (5, N'bbuivietcuongg', CAST(715000 AS Decimal(18, 0)), N'Complete', N'Tân Xã, Thạch Hòa, Thạch Thất, Hà Nội', N'12345', N'Cường', N'Bùi', CAST(N'2020-11-14' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (6, N'bbuivietcuongg', CAST(715000 AS Decimal(18, 0)), N'Pending', N'Tân Xã, Thạch Hòa, Thạch Thất, Hà Nội', N'1234', N'Cường', N'Bùi', CAST(N'2020-11-14' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (7, N'bbuivietcuongg', CAST(610000 AS Decimal(18, 0)), N'Pending', N'Tân Xã, Thạch Hòa, Thạch Thất, Hà Nội', N'123', N'Cường', N'Bùi', CAST(N'2020-11-14' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (8, N'bbuivietcuongg', CAST(610000 AS Decimal(18, 0)), N'Pending', N'Tân Xã, Thạch Hòa, Thạch Thất, Hà Nội', N'12345', N'Cường', N'Bùi', CAST(N'2020-11-14' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (10, N'', CAST(105000 AS Decimal(18, 0)), N'Cancel', N'', N'', N'', N'', CAST(N'2020-11-14' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (11, N'bbuivietcuongg', CAST(715000 AS Decimal(18, 0)), N'Pending', N'Tân Xã, Thạch Hòa, Thạch Thất, Hà Nội', N'0793382816', N'Cường', N'Bùi', CAST(N'2020-11-15' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (12, N'', CAST(610000 AS Decimal(18, 0)), N'Pending', N'', N'', N'', N'', CAST(N'2020-11-16' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (13, N'', CAST(105000 AS Decimal(18, 0)), N'Pending', N'', N'', N'', N'', CAST(N'2020-11-16' AS Date))
INSERT [dbo].[Order] ([ID], [Username], [Total], [Status], [Address], [Phone], [FirstName], [LastName], [OrderDate]) VALUES (14, N'bbuivietcuongg', CAST(975000 AS Decimal(18, 0)), N'Complete', N'Tân Xã, Thạch Thất, Hà Nội', N'0793382816', N'Cường', N'Bùi', CAST(N'2020-11-17' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (10, N'AHCLLS04', N'free', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (11, N'A61101', N'38', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (11, N'AHCLLS04', N'free', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (12, N'A61101', N'36', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (13, N'AHCLLS04', N'free', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (14, N'A61101', N'36', 1)
INSERT [dbo].[OrderDetail] ([ID], [ProductCode], [Size], [Quantity]) VALUES (14, N'AGT0013', N'36', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61044', N'Vintas Yesterday - High Top - Moonstruck Pirate', 1, CAST(550000 AS Decimal(18, 0)), N'Sử dụng đồng thời chất liệu da Suede, da Nappa và vải Canvas, ', N'Best Seller', N'36', N'images/pro_vintas_A61044_1.jpg', N'Unisex', 3, 1, 4, N'High Top', 5, N'– Gender: Unisex – Size run: 35 – 46 – Upper: Canvas / Leather / Suede – Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn ', N'New Arrival', N'35', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn ', N'New Arrival', N'36', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 10, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn ', N'New Arrival', N'37', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn "hết bài" cho những con người trầm tính và điềm đạm.', N'New Arrival', N'38', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn "hết bài" cho những con người trầm tính và điềm đạm.', N'New Arrival', N'39', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn ', N'New Arrival', N'40', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn "hết bài" cho những con người trầm tính và điềm đạm.', N'New Arrival', N'41', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 10, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A61101', N'Vintas Mister - High Top - Chocolate Brown', 1, CAST(610000 AS Decimal(18, 0)), N'Công thức pha trộn từ hai chất liệu vải và da lộn đặc trưng, điều thường thấy ở bộ Vintas Mister. Sự kết hợp mạnh mẽ tạo nên nét cổ điển, hoài niệm. Chắc chắn là sự lựa chọn "hết bài" cho những con người trầm tính và điềm đạm.', N'New Arrival', N'42', N'images/pro_A61101_1_1.jpg', N'Unisex', 4, 1, 5, N'High Top', 2, N'Gender: Unisex Size run: 35 – 46 Upper: Canvas/Suede Outsole: Rubber', 2)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'35', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 2, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.	', N'Còn hàng', N'36', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 5, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'37', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 5, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'38', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 10, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'39', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 10, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'40', N'images/pro_track6_A6T003_1.jpg', N'N?', 1, 1, 5, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'41', N'images/pro_track6_A6T003_1.jpg', N'Unisex', 1, 1, 5, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'A6T003', N'Ananas Track 6 - Low Top - Tripple Black', 1, CAST(999000 AS Decimal(18, 0)), N'Với cảm hứng từ Retro Sneakers và âm nhạc giai đoạn 1970s, Ananas Track 6 ra đời với danh hiệu là mẫu giày Cold Cement đầu tiên của Ananas - một thương hiệu giày Vulcanized. Chất liệu Storm Leather đáng giá "càn quét" toàn bộ bề mặt upper cùng những chi tiết thiết kế đặc trưng và mang nhiều ý nghĩa. Chắc rắng, Track 6 sẽ đem đến cho bạn sự tự nhiên thú vị như chính thông điệp bài hát Let it be của huyền thoại The Beatles gửi gắm. Màu all black huyền bí luôn có mặt trong danh sách best seller.', N'Còn hàng', N'42', N'images/pro_track6_A6T003_1.jpg', N'Nam', 1, 1, 5, N'Low Top', 1, N'Gender: Unisex Size run: 35 – 46 Upper: Storm Leather Outsole: Rubber  Sản phẩm được Double Box khi giao hàng. Khuyến nghị chọn truesize hoặc +1 size (tùy form chân) so với giày Ananas Vulcanized.', 1)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'AGT0013', N'GRAPHIC TEE - LUCKY LUKE COMICS - CAVIAR BLACK', 1, CAST(365000 AS Decimal(18, 0)), N'Những chiếc áo Ananas Graphic Tee có phom dáng thoải mái, rộng linh hoạt được kết hợp cùng hoạ tiết lấy cảm hứng từ bộ truyện tuổi thơ Lucky Luke. Đây sẽ là một mảnh ghép cho những outfit thú vị, dù đủ bộ hay mặc riêng lẻ vẫn khẳng định cá tính riêng biệt, ghi dấu ấn cho lần hợp tác quốc tế đầu tiên của Ananas.', N'New Arrival', N'36', N'images/AGT0013_1.jpg', N'Nam', 1, 5, 2, N'Oversize', 5, N'Gender – /Unisex/ Hình in – /Lucky Luke Comics/ Chất liệu – /100% Cotton/ Size – /S – M – L – XL/ Màu sắc: Caviar Black In 2D', 3)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'AHCLLS04', N'High Crew Socks - LL Elements - Chestnut', 3, CAST(105000 AS Decimal(18, 0)), N'Vớ cổ cao với điểm nhấn ở má ngoài bằng những đặc trưng của vùng viễn Tây. Hình thêu đơn giản, phối đồ gì cũng hợp.', N'New Arrival', N'free', N'images/pro_sock_AHCLLS04_1.jpg', N'Nam', 2, 5, 10, N'', 4, N'Gender – /Unisex/ Họa tiết – /Lucky Luke Elements/ Thành phần – 80% cotton, 15% poly, 5% Spandex Thêu 2D đơn giản', 4)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'ASW1004', N'Lucky Luke Typo Sweatshirt - Storm', 2, CAST(500000 AS Decimal(18, 0)), N'Chiếc Sweatshirt nằm trong dự án hợp tác đặc biệt giữa Ananas x Lucky Luke. Với chất liệu nỉ dày dặn cho dịp cuối năm, phom áo oversize thoải mái pha trộn cùng hình thêu graphic độc đáo mà bắt mắt. Vừa đơn giản như outfit thường ngày nhưng vẫn mang điểm nhấn riêng. Khuyến khích mua cho đủ cả bộ sưu tập.', N'New Arrival', N'L', N'images/pro_ASW1004_1_1.jpg', N'Unisex', 2, 5, 4, N'Oversize', 3, N'Gender: Unisex Form: Oversize Size run: S – M – L – XL Chất liệu: 100% Cotton Hình thêu 2D màu sắc, chìm nổi tương phản', 3)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'ASW1004', N'Lucky Luke Typo Sweatshirt - Storm', 2, CAST(500000 AS Decimal(18, 0)), N'Chiếc Sweatshirt nằm trong dự án hợp tác đặc biệt giữa Ananas x Lucky Luke. Với chất liệu nỉ dày dặn cho dịp cuối năm, phom áo oversize thoải mái pha trộn cùng hình thêu graphic độc đáo mà bắt mắt. Vừa đơn giản như outfit thường ngày nhưng vẫn mang điểm nhấn riêng. Khuyến khích mua cho đủ cả bộ sưu tập.', N'New Arrival', N'M', N'images/pro_ASW1004_1_1.jpg', N'Unisex', 2, 5, 2, N'Oversize', 3, N'Gender: Unisex Form: Oversize Size run: S – M – L – XL Chất liệu: 100% Cotton Hình thêu 2D màu sắc, chìm nổi tương phản', 3)
INSERT [dbo].[Product] ([ProductCode], [ProductName], [CategoryID], [Price], [Description], [Status], [Size], [Images], [Gender], [CollectionID], [MaterialID], [Quantity], [Style], [ColorID], [DetailProduct], [ProductLineID]) VALUES (N'ASW1004', N'Lucky Luke Typo Sweatshirt - Storm', 2, CAST(500000 AS Decimal(18, 0)), N'Chiếc Sweatshirt nằm trong dự án hợp tác đặc biệt giữa Ananas x Lucky Luke. Với chất liệu nỉ dày dặn cho dịp cuối năm, phom áo oversize thoải mái pha trộn cùng hình thêu graphic độc đáo mà bắt mắt. Vừa đơn giản như outfit thường ngày nhưng vẫn mang điểm nhấn riêng. Khuyến khích mua cho đủ cả bộ sưu tập.', N'New Arrival', N'S', N'images/pro_ASW1004_1_1.jpg', N'Unisex', 2, 5, 5, N'Oversize', 6, N'Gender: Unisex Form: Oversize Size run: S – M – L – XL Chất liệu: 100% Cotton Hình thêu 2D màu sắc, chìm nổi tương phản', 5)
SET IDENTITY_INSERT [dbo].[ProductLine] ON 

INSERT [dbo].[ProductLine] ([ID], [ProductLineName]) VALUES (1, N'Track 6')
INSERT [dbo].[ProductLine] ([ID], [ProductLineName]) VALUES (2, N'Vintas')
INSERT [dbo].[ProductLine] ([ID], [ProductLineName]) VALUES (3, N'Sweatshirt')
INSERT [dbo].[ProductLine] ([ID], [ProductLineName]) VALUES (4, N'Socks | Vớ')
INSERT [dbo].[ProductLine] ([ID], [ProductLineName]) VALUES (5, N'Graphic Tee')
SET IDENTITY_INSERT [dbo].[ProductLine] OFF
INSERT [dbo].[User] ([Username], [Password], [FirstName], [LastName], [Address], [Email], [Phone], [Role], [CreateDate]) VALUES (N'admin', N'*TienViet3353', N'Việt', N'Nguyễn ', N'Đại học FPT Hà Nội', N'tienviet3353@gmail.com', N'0793382816', N'admin', CAST(N'2020-11-11 00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Username], [Password], [FirstName], [LastName], [Address], [Email], [Phone], [Role], [CreateDate]) VALUES (N'bbuivietcuongg', N'123', N'Cường', N'Bùi', N'Tân Xã, Thạch Thất, Hà Nội', N'', N'0793382816', N'customer', CAST(N'2020-11-10 23:52:06.130' AS DateTime))
INSERT [dbo].[User] ([Username], [Password], [FirstName], [LastName], [Address], [Email], [Phone], [Role], [CreateDate]) VALUES (N'ngtienviett', N'', N'Nguyen', N'Viet', N'Đại học FPT Hà Nội', N'tienviet3353@gmail.com', N'0793382816', N'customer', CAST(N'2020-11-12 06:08:58.313' AS DateTime))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([ID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [OrderDetail_FK] FOREIGN KEY([ProductCode], [Size])
REFERENCES [dbo].[Product] ([ProductCode], [Size])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [OrderDetail_FK]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection] FOREIGN KEY([CollectionID])
REFERENCES [dbo].[Collection] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Collection]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Color] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Color]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Material]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductLine] FOREIGN KEY([ProductLineID])
REFERENCES [dbo].[ProductLine] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductLine]
GO
USE [master]
GO
ALTER DATABASE [ananas] SET  READ_WRITE 
GO
