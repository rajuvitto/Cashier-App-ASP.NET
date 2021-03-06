USE [master]
GO
/****** Object:  Database [CashierDB]    Script Date: 5/17/2019 9:11:54 AM ******/
CREATE DATABASE [CashierDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CashierDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CashierDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CashierDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CashierDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CashierDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CashierDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CashierDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CashierDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CashierDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CashierDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CashierDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CashierDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CashierDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CashierDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CashierDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CashierDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CashierDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CashierDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CashierDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CashierDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CashierDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CashierDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CashierDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CashierDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CashierDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CashierDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CashierDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CashierDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CashierDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CashierDB] SET  MULTI_USER 
GO
ALTER DATABASE [CashierDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CashierDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CashierDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CashierDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CashierDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CashierDB', N'ON'
GO
USE [CashierDB]
GO
/****** Object:  Table [dbo].[AccountTable]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountTable](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [binary](64) NULL,
	[RoleID] [int] NULL,
	[RegisterTime] [datetime] NULL,
 CONSTRAINT [PK_AccountTable] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductTable]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTable](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Price] [int] NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_ProductTable] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleTable]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleTable](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescription] [varchar](50) NULL,
 CONSTRAINT [PK_RoleTable] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionTable]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionTable](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[TransactionNumber] [varchar](50) NULL,
	[AccountID] [int] NULL,
	[Total] [int] NULL,
	[TransactionTime] [datetime] NULL,
 CONSTRAINT [PK_TransactionTable] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Best_Seller_Product]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Best_Seller_Product] AS
SELECT TOP(5) ProductID AS ProductID, COUNT(ProductID) AS Produk_Terlaris From TransactionTable Group by ProductID ORDER BY Produk_Terlaris DESC
GO
/****** Object:  View [dbo].[DateOfTransaction]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DateOfTransaction] AS
SELECT TransactionTable.TransactionID AS TransactionID,TransactionTable.Total, CONVERT(VARCHAR(10), TransactionTable.TransactionTime, 120) AS TransactionDate FROM TransactionTable
WHERE CONVERT(VARCHAR(10), TransactionTable.TransactionTime, 120) = CONVERT(VARCHAR(10), GETDATE(), 120)
GO
/****** Object:  View [dbo].[DetailTransaction]    Script Date: 5/17/2019 9:11:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetailTransaction] AS
SELECT TransactionTable.TransactionNumber, ProductTable.ProductName, ProductTable.Price, TransactionTable.Quantity, TransactionTable.Total 
FROM TransactionTable 
INNER JOIN ProductTable 
ON TransactionTable.ProductID = ProductTable.ProductID 
GO
ALTER TABLE [dbo].[AccountTable]  WITH CHECK ADD  CONSTRAINT [FK_AccountTable_RoleTable] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleTable] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountTable] CHECK CONSTRAINT [FK_AccountTable_RoleTable]
GO
ALTER TABLE [dbo].[TransactionTable]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTable_ProductTable] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ProductTable] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionTable] CHECK CONSTRAINT [FK_TransactionTable_ProductTable]
GO
ALTER TABLE [dbo].[TransactionTable]  WITH CHECK ADD  CONSTRAINT [FK_TransactionTable_ProductTable1] FOREIGN KEY([AccountID])
REFERENCES [dbo].[AccountTable] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TransactionTable] CHECK CONSTRAINT [FK_TransactionTable_ProductTable1]
GO
USE [master]
GO
ALTER DATABASE [CashierDB] SET  READ_WRITE 
GO
