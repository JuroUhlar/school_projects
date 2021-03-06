USE [master]
GO
/****** Object:  Database [hotels]    Script Date: 1/5/2020 9:59:54 PM ******/
CREATE DATABASE [hotels]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hotels', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\hotels.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hotels_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\hotels_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hotels] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hotels].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hotels] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hotels] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hotels] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hotels] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hotels] SET ARITHABORT OFF 
GO
ALTER DATABASE [hotels] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hotels] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hotels] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hotels] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hotels] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hotels] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hotels] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hotels] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hotels] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hotels] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hotels] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hotels] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hotels] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hotels] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hotels] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hotels] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hotels] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hotels] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hotels] SET  MULTI_USER 
GO
ALTER DATABASE [hotels] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hotels] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hotels] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hotels] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hotels] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hotels] SET QUERY_STORE = OFF
GO
USE [hotels]
GO
/****** Object:  Table [dbo].[Accommodations]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodations](
	[accommodation_id] [int] NOT NULL,
	[hotel_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[capacity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accommodation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Daily_consumption]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Daily_consumption](
	[order_accommodation_id] [int] NOT NULL,
	[consumtion_date] [date] NULL,
	[snacks_consumed] [int] NULL,
	[drinks_consumed] [int] NULL,
	[tv_consumed] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[type] [varchar](50) NULL,
	[hotel_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[name] [varchar](100) NOT NULL,
	[type_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotels]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotels](
	[hotel_id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Accommodation]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Accommodation](
	[order_accommodation_id] [int] NOT NULL,
	[order_ID] [int] NOT NULL,
	[accommodation_id] [int] NOT NULL,
	[guest_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_accommodation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[state] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 1/5/2020 9:59:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[type_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[spring_price] [int] NOT NULL,
	[summer_price] [int] NOT NULL,
	[fall_price] [int] NOT NULL,
	[winter_price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accommodations]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotels] ([hotel_id])
GO
ALTER TABLE [dbo].[Accommodations]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[Types] ([type_id])
GO
ALTER TABLE [dbo].[Daily_consumption]  WITH CHECK ADD FOREIGN KEY([order_accommodation_id])
REFERENCES [dbo].[Order_Accommodation] ([order_accommodation_id])
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotels] ([hotel_id])
GO
ALTER TABLE [dbo].[Facilities]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[Types] ([type_id])
GO
ALTER TABLE [dbo].[Order_Accommodation]  WITH CHECK ADD FOREIGN KEY([accommodation_id])
REFERENCES [dbo].[Accommodations] ([accommodation_id])
GO
ALTER TABLE [dbo].[Order_Accommodation]  WITH CHECK ADD FOREIGN KEY([order_ID])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Accommodations]  WITH CHECK ADD CHECK  (([capacity]>=(1)))
GO
ALTER TABLE [dbo].[Daily_consumption]  WITH CHECK ADD CHECK  (([drinks_consumed]>=(0)))
GO
ALTER TABLE [dbo].[Daily_consumption]  WITH CHECK ADD CHECK  (([snacks_consumed]>=(0)))
GO
ALTER TABLE [dbo].[Daily_consumption]  WITH CHECK ADD CHECK  (([tv_consumed]>=(0)))
GO
ALTER TABLE [dbo].[hotels]  WITH CHECK ADD CHECK  (([category]>=(1) AND [category]<=(5)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([end_date]>[start_date]))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([state]='recieved' OR [state]='invoiced' OR [state]='occupied' OR [state]='cancelled' OR [state]='confirmed' OR [state]='reserved' OR [state]='requested'))
GO
USE [master]
GO
ALTER DATABASE [hotels] SET  READ_WRITE 
GO
