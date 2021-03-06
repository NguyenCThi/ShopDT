
USE [master]
GO
/****** Object:  Database [ShopPhone]    Script Date: 14/07/2021 3:44:16 PM ******/
CREATE DATABASE [ShopPhone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopPhone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopPhone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopPhone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShopPhone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopPhone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopPhone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopPhone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopPhone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopPhone] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopPhone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopPhone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopPhone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopPhone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopPhone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopPhone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopPhone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopPhone] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopPhone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopPhone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopPhone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopPhone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopPhone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopPhone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopPhone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopPhone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopPhone] SET  MULTI_USER 
GO
ALTER DATABASE [ShopPhone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopPhone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopPhone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopPhone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopPhone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopPhone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopPhone] SET QUERY_STORE = OFF
GO
USE [ShopPhone]
GO
/****** Object:  Table [dbo].[company]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[companyId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[place] [nvarchar](max) NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paymentDetail]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paymentDetail](
	[payId] [int] IDENTITY(1,1) NOT NULL,
	[usersId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[dateOrder] [date] NOT NULL,
	[placeOrder] [nvarchar](max) NULL,
	[paymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_paymentDetail] PRIMARY KEY CLUSTERED 
(
	[payId] ASC,
	[usersId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[companyId] [int] NOT NULL,
	[price] [money] NOT NULL,
	[star] [int] NOT NULL,
	[rateCount] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[screen] [nvarchar](50) NULL,
	[os] [nvarchar](50) NULL,
	[camera] [nvarchar](50) NULL,
	[cameraFront] [nvarchar](50) NULL,
	[cpu] [nvarchar](50) NULL,
	[ram] [nvarchar](50) NULL,
	[rom] [nvarchar](50) NULL,
	[chip] [nvarchar](50) NULL,
	[battery] [nvarchar](50) NULL,
	[sim] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipment]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipment](
	[shipmentId] [int] IDENTITY(1,1) NOT NULL,
	[payId] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[shipperId] [int] NOT NULL,
 CONSTRAINT [PK_shipment] PRIMARY KEY CLUSTERED 
(
	[shipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipper]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipper](
	[shipperCompanyId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_shipper] PRIMARY KEY CLUSTERED 
(
	[shipperCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shoppingCart]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shoppingCart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[usersId] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_shoppingCart] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[productId] ASC,
	[usersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/07/2021 3:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[birthday] [datetime] NOT NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[paymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_paymentDetail_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[paymentDetail] CHECK CONSTRAINT [FK_paymentDetail_product]
GO
ALTER TABLE [dbo].[paymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_paymentDetail_shipment] FOREIGN KEY([payId])
REFERENCES [dbo].[shipment] ([shipmentId])
GO
ALTER TABLE [dbo].[paymentDetail] CHECK CONSTRAINT [FK_paymentDetail_shipment]
GO
ALTER TABLE [dbo].[paymentDetail]  WITH CHECK ADD  CONSTRAINT [FK_paymentDetail_users] FOREIGN KEY([usersId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[paymentDetail] CHECK CONSTRAINT [FK_paymentDetail_users]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_company] FOREIGN KEY([companyId])
REFERENCES [dbo].[company] ([companyId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_company]
GO
ALTER TABLE [dbo].[shipment]  WITH CHECK ADD  CONSTRAINT [FK_shipment_shipper] FOREIGN KEY([shipperId])
REFERENCES [dbo].[shipper] ([shipperCompanyId])
GO
ALTER TABLE [dbo].[shipment] CHECK CONSTRAINT [FK_shipment_shipper]
GO
ALTER TABLE [dbo].[shoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_shoppingCart_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[shoppingCart] CHECK CONSTRAINT [FK_shoppingCart_product]
GO
ALTER TABLE [dbo].[shoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_shoppingCart_users] FOREIGN KEY([usersId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[shoppingCart] CHECK CONSTRAINT [FK_shoppingCart_users]
GO
USE [master]
GO
ALTER DATABASE [ShopPhone] SET  READ_WRITE 
GO
