USE [Automation]
GO
/****** Object:  Table [dbo].[PartMaster]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartMaster](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[PartId] [varchar](50) NOT NULL,
	[PartName] [varchar](50) NOT NULL,
	[PartType] [varchar](50) NOT NULL,
	[PartDescription] [varchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[FirmName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PartMaster] PRIMARY KEY CLUSTERED 
(
	[PartId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PartMaster] ON
INSERT [dbo].[PartMaster] ([AutoId], [PartId], [PartName], [PartType], [PartDescription], [Price], [FirmName], [Quantity]) VALUES (1, N'PID001', N'abc', N'pqr', N'hekllo', 67, N'MRF', 90)
SET IDENTITY_INSERT [dbo].[PartMaster] OFF
/****** Object:  Table [dbo].[MechanicInformation]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MechanicInformation](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[MechanicId] [varchar](50) NOT NULL,
	[MechanicName] [varchar](50) NOT NULL,
	[MechanicAddress] [varchar](50) NOT NULL,
	[MechanicContactNo] [varchar](50) NOT NULL,
	[JoiningDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MechanicInformation] PRIMARY KEY CLUSTERED 
(
	[MechanicId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MechanicInformation] ON
INSERT [dbo].[MechanicInformation] ([AutoId], [MechanicId], [MechanicName], [MechanicAddress], [MechanicContactNo], [JoiningDate]) VALUES (1, N'MEC001', N'Test', N'Test', N'Test', N'12/12/2012')
SET IDENTITY_INSERT [dbo].[MechanicInformation] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[UserId] [varchar](50) NULL,
	[Password] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Login] ([UserId], [Password]) VALUES (N'abc', N'123')
/****** Object:  Table [dbo].[JobCardDetail]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobCardDetail](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[JobCardNumber] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[ClientName] [varchar](50) NOT NULL,
	[VehicleName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[VehicleStatus] [varchar](50) NOT NULL,
	[RemainingOil] [varchar](50) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Problem] [varchar](max) NOT NULL,
	[AllotedMechanic] [varchar](50) NOT NULL,
 CONSTRAINT [PK_JobCardDetail] PRIMARY KEY CLUSTERED 
(
	[JobCardNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[JobCardDetail] ON
INSERT [dbo].[JobCardDetail] ([AutoId], [JobCardNumber], [Date], [ClientName], [VehicleName], [Address], [ContactNo], [EmailId], [City], [VehicleStatus], [RemainingOil], [Status], [Problem], [AllotedMechanic]) VALUES (1, N'JCN001', N'12/12/2011', N'test', N'Splendor', N'lko', N'9090909', N'test@yahoo.com', N'lko', N'23', N'9', N'7', N'hhjhgkj', N'ghjghf')
SET IDENTITY_INSERT [dbo].[JobCardDetail] OFF
/****** Object:  Table [dbo].[InvoiceOut]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceOut](
	[Autoid] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[TotalSum] [int] NOT NULL,
	[InvoiceDate] [varchar](50) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[ClientName] [varchar](50) NULL,
	[JobCardNumber] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
 CONSTRAINT [PK_InvoiceOut] PRIMARY KEY CLUSTERED 
(
	[Autoid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceIn]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceIn](
	[Autoid] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[TotalSum] [int] NOT NULL,
	[InvoiceDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InvoiceIn] PRIMARY KEY CLUSTERED 
(
	[Autoid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventoryOut]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryOut](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[PartName] [varchar](50) NOT NULL,
	[FirmName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
 CONSTRAINT [PK_InventoryOut] PRIMARY KEY CLUSTERED 
(
	[autoid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryOut] ON
INSERT [dbo].[InventoryOut] ([autoid], [InvoiceNo], [PartName], [FirmName], [Quantity], [TotalAmount]) VALUES (1, N'IO001', N'test', N'test', 67, 9009)
SET IDENTITY_INSERT [dbo].[InventoryOut] OFF
/****** Object:  Table [dbo].[InventoryIn]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InventoryIn](
	[autoid] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](50) NOT NULL,
	[PartName] [varchar](50) NOT NULL,
	[FirmName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InventoryIn] PRIMARY KEY CLUSTERED 
(
	[autoid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryIn] ON
INSERT [dbo].[InventoryIn] ([autoid], [InvoiceNo], [PartName], [FirmName], [Quantity]) VALUES (1, N'II001', N'tetst', N'test', 90)
SET IDENTITY_INSERT [dbo].[InventoryIn] OFF
/****** Object:  Table [dbo].[FirmMaster]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FirmMaster](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[FirmId] [varchar](50) NOT NULL,
	[FirmName] [varchar](50) NOT NULL,
	[FirmAddress] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[FirmId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BikeDetail]    Script Date: 04/23/2013 03:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BikeDetail](
	[BikeName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_PartMaster_Quantity]    Script Date: 04/23/2013 03:42:04 ******/
ALTER TABLE [dbo].[PartMaster] ADD  CONSTRAINT [DF_PartMaster_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
