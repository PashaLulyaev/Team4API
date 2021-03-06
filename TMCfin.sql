CREATE DATABASE [Inventory_Items]
USE [Inventory_Items]

CREATE TABLE [dbo].[Act](
	[number_act] [int] NOT NULL,
	[count] [int] NOT NULL,
	[commissioningDate] [date] NOT NULL,
	[ID_product] [int] NOT NULL,
 CONSTRAINT [PK_Act] PRIMARY KEY CLUSTERED 
(
	[number_act] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Archiev]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Archiev](
	[ArchiveID] [int] IDENTITY(1,1) NOT NULL,
	[number_act] [int] NULL,
	[ArchivationDate] [date] NOT NULL,
 CONSTRAINT [PK_Archiev] PRIMARY KEY CLUSTERED 
(
	[ArchiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_category] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID_company] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID_company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Division]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Division](
	[ID_division] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED 
(
	[ID_division] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_product] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[ID_category] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_map]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_map](
	[inventory_number] [bigint] NOT NULL,
	[serial_number] [nvarchar](100) NOT NULL,
	[number_act] [int] NOT NULL,
	[specifications] [nvarchar](1000) NULL,
	[ID_responsible_persons] [int] NOT NULL,
	[ID_status] [int] NOT NULL,
 CONSTRAINT [PK_Product_map] PRIMARY KEY CLUSTERED 
(
	[inventory_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsible_persons]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsible_persons](
	[ID_responsible_persons] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NULL,
	[FIO]  AS ((([surname]+' ')+([name]+' '))+[patronymic]),
	[ID_company] [int] NULL,
	[ID_division] [int] NULL,
 CONSTRAINT [PK_Responsible_persons] PRIMARY KEY CLUSTERED 
(
	[ID_responsible_persons] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID_status] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Story]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Story](
	[StoryID] [int] IDENTITY(1,1) NOT NULL,
	[inventory_number] [bigint] NULL,
	[StatusID] [int] NULL,
	[ChangedDate] [datetime] NULL,
	[number_act] [int] NULL,
 CONSTRAINT [PK_Story] PRIMARY KEY CLUSTERED 
(
	[StoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID_user] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1, 2, CAST(N'2021-01-01' AS Date), 1)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (700, 2, CAST(N'2021-01-10' AS Date), 6)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (701, 1, CAST(N'2021-01-01' AS Date), 1)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (702, 1, CAST(N'2021-01-01' AS Date), 2)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (703, 1, CAST(N'2021-01-01' AS Date), 3)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (704, 1, CAST(N'2021-01-01' AS Date), 4)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (705, 1, CAST(N'2021-01-01' AS Date), 5)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1000, 14, CAST(N'2021-12-14' AS Date), 1)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1001, 20, CAST(N'2021-02-25' AS Date), 3)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1002, 25, CAST(N'2020-12-26' AS Date), 6)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1003, 18, CAST(N'2021-05-28' AS Date), 10)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1004, 3, CAST(N'2021-05-02' AS Date), 4)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1005, 11, CAST(N'2021-03-02' AS Date), 6)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1006, 13, CAST(N'2021-03-18' AS Date), 5)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1007, 11, CAST(N'2021-02-22' AS Date), 2)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1008, 17, CAST(N'2020-08-29' AS Date), 7)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1009, 11, CAST(N'2021-03-03' AS Date), 8)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1010, 10, CAST(N'2020-05-19' AS Date), 13)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1011, 20, CAST(N'2020-12-07' AS Date), 11)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1012, 22, CAST(N'2021-01-22' AS Date), 9)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1013, 20, CAST(N'2021-02-21' AS Date), 8)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1014, 1, CAST(N'2020-09-09' AS Date), 12)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1015, 9, CAST(N'2021-01-08' AS Date), 9)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1016, 23, CAST(N'2020-07-22' AS Date), 14)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1017, 13, CAST(N'2021-01-24' AS Date), 3)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1018, 25, CAST(N'2021-03-30' AS Date), 1)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1019, 23, CAST(N'2021-02-14' AS Date), 8)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1020, 10, CAST(N'2021-04-09' AS Date), 2)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1021, 13, CAST(N'2021-05-25' AS Date), 10)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1022, 18, CAST(N'2020-12-04' AS Date), 11)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1023, 4, CAST(N'2020-09-22' AS Date), 14)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1024, 10, CAST(N'2021-04-21' AS Date), 13)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1027, 2, CAST(N'2021-04-22' AS Date), 12)
INSERT [dbo].[Act] ([number_act], [count], [commissioningDate], [ID_product]) VALUES (1028, 35, CAST(N'2022-02-26' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Archiev] ON 

INSERT [dbo].[Archiev] ([ArchiveID], [number_act], [ArchivationDate]) VALUES (1, 701, CAST(N'2022-02-24' AS Date))
INSERT [dbo].[Archiev] ([ArchiveID], [number_act], [ArchivationDate]) VALUES (2, 1000, CAST(N'2022-02-26' AS Date))
SET IDENTITY_INSERT [dbo].[Archiev] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID_category], [title]) VALUES (1, N'Инструменты, станки и оборудование')
INSERT [dbo].[Category] ([ID_category], [title]) VALUES (2, N'Средства измерения')
INSERT [dbo].[Category] ([ID_category], [title]) VALUES (3, N'Оснастка')
INSERT [dbo].[Category] ([ID_category], [title]) VALUES (4, N'ИТ оборудование и перефирия')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID_company], [title]) VALUES (1, N'АО "Автоваз"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (2, N'АО "Автомобильный завод "Урал"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (3, N'ЗАО "Рено Россия"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (4, N'ООО "Фольксваген груп Рус"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (5, N'ПАО "ГАЗ"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (6, N'ПАО "Камаз"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (7, N'ПАО "Соллерс"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (8, N'ООО "ПСМА РУС"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (9, N'ООО "Хендэ Мотор Мануфактуринг Рус"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (10, N'ООО "Ниссан Мэнуфэкчуринг Рус"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (11, N'ООО "Тойота Мотор"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (12, N'ООО "Автотор Холдинг"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (13, N'АО "Концерн ВКО "Алмаз-антей"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (14, N'АО "Концерн "Радиоэлектронные технологии"')
INSERT [dbo].[Company] ([ID_company], [title]) VALUES (15, N'ПАО "Объединенная авиастроительная корпорация"')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Division] ON 

INSERT [dbo].[Division] ([ID_division], [title]) VALUES (1, N'Отдел информационного оборудования')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (2, N'Цех № 13')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (3, N'Кабинет бухгалтерии')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (4, N'Здание администрации')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (5, N'Кабинет юриста')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (6, N'Отдел охраны')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (7, N'Отдел сбыта')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (8, N'Отдел снабжения')
INSERT [dbo].[Division] ([ID_division], [title]) VALUES (9, N'Отдел кадров')
SET IDENTITY_INSERT [dbo].[Division] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (1, N'Ноутбук', 4)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (2, N'Сервер', 4)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (3, N'Монитор', 4)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (4, N'Колонки', 4)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (5, N'Генератор', 1)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (6, N'Сварочный станок', 1)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (7, N'Токарный станок', 1)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (8, N'Измельчитель', 1)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (9, N'Штангельциркуль', 2)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (10, N'Мультиметр', 2)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (11, N'Рулетка', 2)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (12, N'Микрометр', 2)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (13, N'Сборочно-сварочный стенд', 3)
INSERT [dbo].[Product] ([ID_product], [title], [ID_category]) VALUES (14, N'Испытательный стенд', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2, N'54gfdh5ehdg', 1018, N'test', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (99999999, N'54gfdh5ehdf', 1027, N'тест', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (999999988, N'436FDYH534E', 702, N'test3', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (999999999, N'3463rdfsg43', 1018, N'test2', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1018538401, N'm4f57ojr9ojhimq', 1015, N'0-150 мм Inforce 06-11-36', 17, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1060350794, N'5wawl84ov8jeqx9', 1001, N'HP Proliant ML30 G10 (P16929-421) Tower, 4-ядерный Intel Xeon E-2234 3600 МГц, 16 Гб DDR-4, 4 x 3.5" SATA, 2xGigabit Ethernet (1000 Мбит/с), 350 Вт', 2, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1071840489, N'2pv488j5jixu4nn', 1010, N'Гидравлическая тележка, роликовые опоры продольного перемещения, боковая поддержка трубы, центратор, сварочная колонна', 8, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1144618805, N'73a69tm5ijqbrc5', 1005, N'PATRIOT SRGE 2500, 220, 2.4кВт [474103130]', 17, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1445070264, N'aepwb99p8rz7v2v', 1018, N'LENOVO IdeaPad S145-15API, 15.6", AMD Ryzen 3 3200U 2.6ГГц, 8ГБ, 256ГБ SSD, AMD Radeon Vega 3, Free DOS, 81UT000URK, черный', 1, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1488543612, N'tbf1w0fpbb5225n', 1020, N'HPE ProLiant MicroServer Gen10 Plus [P18584-421]', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (1858969561, N'geefvfd5qkcctvh', 1007, N'DL580 G7 (8X SFF 2,5"), Процессоры: 4x Xeon 10C E7-4860 (10x2,27Ghz/24M), Оперативная память: 256Gb, RAID-контроллер: HP SA P410i', 2, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2146611389, N'pe1xjnpzzrl0n6c', 1003, N'MASTECH M838, Кол-во элементов питания 2, Тип элементов питания 6F22 "крона", Размеры (ШxВxГ) 70 x 126 x 24 мм, Вес 170 г, Гарантия 23 мес.', 7, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2163995155, N'56owcaslxvapgrk', 1023, N'СВС-12, СВС-12Ц, стенд высоковольтный стационарный, напряжение питающей сети: В 220±22, частота питающей сети: Гц 50±1, потребляемая мощность: 1500', 8, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2323335003, N'443iuqyj70rdm2z', 1014, N'МК50-1 25-50мм(ц.д.0,01мм) с поверкой', 7, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2480456412, N'xrsx9m36rqr6u7j', 1009, N'Система измельчения ножевая, Скорость вращения 3000 об/мин, Материал корпуса металл, Тип двигателя электрический', 7, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2713318823, N'la9xux73vftpiz3', 1016, N'BC 6500 ES Вода, максимальное давление при испытании: 6500, напряжение: 400V 50HZ 3PH, гидрозаполнение - автоматическое, мин. нач. давление: 600', 16, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2782939922, N'rcy8os35acc9nej', 1014, N'МК- 750 0,01 ЧИЗ*', 16, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2839091517, N'f9erxrvp6yx5ior', 1013, N'Шредер двухвальный PZO SHR-600D2M, кол-во роторов: 2, частота вращения об/мин: 21, ДхШхВ, мм: 3022х1092х2098, кол-во двигателей, шт: 2, кВт: 44', 6, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (2982162654, N'kxfe0p6ejok7kg3', 1018, N'ACER Aspire 7 A715-75G-73WN, 15.6", IPS, Intel Core i7 9750H 2.6ГГц, 8ГБ, 256ГБ SSD, NVIDIA GeForce GTX 1650 - 4096 Мб, Eshell, NH.Q87ER.004, черный', 1, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3003688256, N'ec8pb7iz1wnztvi', 1018, N'MSI GF63 Thin 9SCSR-1028XRU, 15.6", IPS, Intel Core i5 9300H 2.4ГГц, 8ГБ, 256ГБ SSD, NVIDIA GeForce GTX 1650 Ti MAX Q - 4096 Мб, Free DOS, 9S7-16R412-1028, черный', 1, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3091702494, N'eijxlpxd5xewnnx', 1014, N'0-150 мм Inforce 06-11-36', 16, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3243492431, N'0crriif4bz49jyg', 1017, N'PHILIPS 243V7QDSB (00/01) 23.8", черный', 2, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3528410653, N'e64eh7vbxf4ldvq', 1024, N'ССМ-04-04 исп2 сварочно-сборочный стол', 7, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3624498155, N'bpn2lt8t6anz46s', 1008, N'Максимальный диаметр обработки над станиной мм 360, Конус шпинделя (Морзе №) А2 - 6, Диаметр пиноли задней бабки мм 60, Длина мм 2520', 8, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (3879691469, N'38a2ex9yhxcxa9l', 1008, N'Максимальный диаметр обработки над станиной мм 360, Конус шпинделя (Морзе №) А2 - 8, Диаметр пиноли задней бабки мм 60, Длина мм 2520', 8, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (4215130185, N'oabd67xlkz5bqh0', 1011, N'Gigant GMT 1025 10x25 мм с магнитным захватом', 5, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (4221035020, N'0lged2h92mvx7yd', 1004, N'Samsung C24F390FHI 23.5", Тип матрицы: *VA, 72 Гц, Разрешение: 1920x1080 (16:9), Время отклика: 2 мс, Изогнутый экран: нет', 1, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (4669014174, N'hvcs1kpiit6mn8x', 1011, N'STANLEY Fiberglass 034297 (30 м х 12.7 мм)', 7, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5082754391, N'r5o0grp4ynw1pja', 1015, N'ШЦ-1-250 0.05 Эталон 786368', 12, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5112324952, N'myg28h8etk2yk3x', 1018, N'ASUS VivoBook E410MA-EB008T, 14", IPS, Intel Celeron N4020 1.1ГГц, 4ГБ, 64ГБ eMMC, Intel UHD Graphics 600, Windows 10, 90NB0Q11-M18300, синий', 2, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5122605173, N'lioazx4jsjagb6k', 1003, N'MASTECH M838, Кол-во элементов питания 1, Тип элементов питания 6F22 "крона", Размеры (ШxВxГ) 70 x 126 x 24 мм, Вес 170 г, Гарантия 23 мес.', 6, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5188983061, N'rv89osp97zn5fow', 1017, N'ASUS VA24DQ 23.8", темно-серый и черный [90lm0543-b01370]', 2, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5246123095, N'jwgesm2sn75qvc9', 1009, N'Система измельчения ножевая, Скорость вращения 2850 об/мин, Материал корпуса металл, Тип двигателя электрический', 7, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5277525604, N'cmd2b07j7yiz3hx', 1016, N'BCI 500 максимальная температура масла, °C: 50, максимальное давление при испытании: 500, напряжение: 400V 50HZ 3PH, подача на импульс, см3: 166', 3, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5442151485, N'qd8tfx2yvvpebnn', 1006, N'SVEN SPS-702 черный, Тип 2.0, Суммарная мощность 40 Вт, Диапазон воспроизводимых частот 40-22000 Гц, Регулировка тембра НЧ/ВЧ', 5, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5459972982, N'fzgvh59a9ewpehw', 1017, N'LG 24MK430H 23.8", черный [24mk430h-b.aruz]', 2, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (5855741707, N'mvdy2l2pfcwng4k', 1005, N'PATRIOT SRGE 2500, 220, 2.2кВт [474103130]', 8, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6172340601, N'ofvq5y5zny8a6eo', 1019, N'JET GH-1640 ZX DRO Токарно-винторезный станок серии ZX напряжение, В 400, диаметр обточки над станиной, мм 406, диаметр обточки над съемным мостиком, gap, мм 657', 14, 2)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6305711209, N'q05rnz36snsw25d', 1016, N'МЕГЕОН 031005 Моторизированный, элементы питания - сеть, количество и напряжение элементов питания - 220B, поверка - нет, точность - ±0.5Н', 3, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6319313150, N's7nahadxahhrr0k', 1000, N'ASUS ZenBook Duo UX482EG-HY124T Intel i7-1165G7/16G/1T SSD/14" FHD Touch 400nits/GeForce MX450 2Gb/ScreenPad™/Win10 Синий, 90NB0S51-M02210', 1, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6332367377, N'97itub3ie3hw8y9', 1015, N'Цифровой штангенциркуль NEO Tools 150 мм нержавеющая сталь 75-011', 7, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6643760798, N'skkp805kjie4djz', 1007, N'DL580 G7 (8X SFF 2,5"), Процессоры: 4x Xeon 10C E7-4860 (10x2,27Ghz/24M), Оперативная память: 256Gb, RAID-контроллер: HP SA P410i', 1, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6896667490, N'ezfw3ngke9fj7pk', 1014, N'МК-2000 0,01 ЧИЗ*', 10, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (6901444863, N'jfgo7dh712tmby4', 1017, N'VIEWSONIC VA2418SH 23.8", черный [vs16422]', 1, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (7291322098, N'2swcmp9xnvfcd45', 1004, N'Samsung C24F390FHI 23.5", Тип матрицы: *VA, 72 Гц, Разрешение: 1920x1080 (16:9), Время отклика: 4 мс, Изогнутый экран: да', 2, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (7348191054, N'ha9vdh9gqtaf32w', 1006, N'SVEN SPS-702 черный, Тип 2.0, Суммарная мощность 40 Вт, Диапазон воспроизводимых частот 40-22000 Гц, Регулировка тембра НЧ/ВЧ', 8, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (7711054915, N'zhindydfmy1wfrj', 1016, N'Common Rail КС 708 Мощность двигателя: 11 кВт или 15 кВт, скорость 0-1000 об / мин, высота центра двигателя: 125 мм, перекачивающий насос: 10 л / мин', 17, 3)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (8283995313, N'9d9o9k1m5isb6th', 1010, N'Гидравлическая тележка, роликовые опоры продольного перемещения, боковая поддержка трубы, центратор, сварочная колонна', 7, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (8346812217, N'dx32w7vl2bo9x49', 1021, N'CEM DT-3352 автоматический, ручной, до 1000 В, погрешность - 2 %, проверка целостности цепи, проверка диодов, измерение температуры, подсветка дисплея, автоотключение', 8, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (8411952792, N'6z5sqfmoiy7wha4', 1012, N'Штангенциркуль ШЦ-3- 400 0,05 губ. 100мм ЧИЗ', 4, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (9151715760, N'ggh4m98wqp9ql5b', 1012, N'ШЦЦ-1-150 0,01 электр. IP67 ЧИЗ', 16, 1)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (9424149248, N'qnhdow6krut3lpp', 1022, N'BOSCH GLM 50 C Professional 50 м', 11, 5)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (9515962546, N'idk83xlj60pp4mj', 1002, N'FUBAG BS 3300, Германия, Портативный, Мощность рабочая 3 кВт, Запуск Ручной, Напряжение 220 Вольт (1 фаза), Вес 46.5 кг, ', 7, 4)
INSERT [dbo].[Product_map] ([inventory_number], [serial_number], [number_act], [specifications], [ID_responsible_persons], [ID_status]) VALUES (9638580929, N'v7apim13ztp7x0v', 1015, N'ШЦЦ-I- 250-0,01 ГОСТ 166-89 GRIFF D168105', 9, 1)
SET IDENTITY_INSERT [dbo].[Responsible_persons] ON 

INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (1, N'Кольцова', N'Мария', N'Руслановна', 1, 9)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (2, N'Ерофеев', N'Дмитрий', N'Артёмович', 2, 4)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (3, N'Петров', N'Тимур', N'Александрович', 2, 6)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (4, N'Завьялова', N'Мария', N'Олеговна', 3, 3)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (5, N'Пономарева', N'Арина', N'Дмитриевна', 4, 8)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (6, N'Степанова', N'Полина', N'Михайловна', 5, 5)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (7, N'Михайлова', N'Александра', N'Викторовна', 6, 2)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (8, N'Фомичева', N'Валерия', N'Богдановна', 6, 4)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (9, N'Устинова', N'Алиса', N'Максимовна', 8, 9)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (10, N'Трофимов', N'Денис', N'Андреевич', 9, 2)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (11, N'Максимов', N'Кирилл', N'Константинович', 10, 1)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (12, N'Павлова', N'Ксения', N'Андреевна', 10, 2)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (13, N'Туманова', N'Валерия', N'Марковна', 10, 4)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (14, N'Корнеева', N'Виктория', N'Дмитриевна', 12, 5)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (15, N'Моргунов', N'Матвей', N'Дмитриевич', 14, 1)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (16, N'Руднева', N'Анна', N'Максимовна', 14, 6)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (17, N'Петров', N'Богдан', N'Тимурович', 15, 2)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (18, N'Царев', N'Константин', N'Дмитревич', 15, 3)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (19, N'Никитин', N'Глеб', N'Ярославович', 15, 7)
INSERT [dbo].[Responsible_persons] ([ID_responsible_persons], [surname], [name], [patronymic], [ID_company], [ID_division]) VALUES (20, N'Иванова', N'Ксения', N'Ярославовна', 15, 7)
SET IDENTITY_INSERT [dbo].[Responsible_persons] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID_status], [title]) VALUES (1, N'На складе')
INSERT [dbo].[Status] ([ID_status], [title]) VALUES (2, N'В эксплуатации')
INSERT [dbo].[Status] ([ID_status], [title]) VALUES (3, N'В ремонте')
INSERT [dbo].[Status] ([ID_status], [title]) VALUES (4, N'На проверке')
INSERT [dbo].[Status] ([ID_status], [title]) VALUES (5, N'Утилизирован')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[Story] ON 

INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (1, 1018538401, 5, CAST(N'2022-02-24T17:32:47.490' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (14, 9638580929, 2, CAST(N'2022-02-24T18:27:40.170' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (15, 9638580929, 1, CAST(N'2022-02-24T18:37:05.410' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (16, 9638580929, 5, CAST(N'2022-02-24T18:45:42.543' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (17, 9638580929, 1, CAST(N'2022-02-24T18:46:32.377' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (18, 9754770910, 1, CAST(N'2022-02-26T14:23:40.200' AS DateTime), 1000)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (19, 1018538401, 3, CAST(N'2022-02-26T15:50:44.660' AS DateTime), 1015)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (20, 99999999, 4, CAST(N'2022-02-26T17:18:48.633' AS DateTime), 1027)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (21, 999999999, 4, CAST(N'2022-02-26T17:32:37.807' AS DateTime), 1018)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (32, 999999988, 4, CAST(N'2022-02-26T17:44:41.260' AS DateTime), 702)
INSERT [dbo].[Story] ([StoryID], [inventory_number], [StatusID], [ChangedDate], [number_act]) VALUES (33, 2, 4, CAST(N'2022-02-26T18:11:35.717' AS DateTime), 1018)
SET IDENTITY_INSERT [dbo].[Story] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (1, N'Иванов', N'Павел', N'Даниилович', N'ivapavel092', N'ohsaqJ')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (2, N'Карташова', N'Екатерина', N'Артёмовна', N'ekatkart938', N'3FL4gV')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (3, N'Кузин', N'Даниил', N'Миронович', N'kuzindan238', N'WqaN3D')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (4, N'Короткова', N'Аделина', N'Богдановна', N'korotadelin93', N'LGnnQF')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (5, N'Зиновьев', N'Денис', N'Данилович', N'zinovdan828', N'uOQsEB')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (6, N'Медведева', N'Наталья', N'Викторовна', N'mednat829', N'nata160')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (7, N'Медведева', N'Наталья', N'-', N'medvedevan829@mail.ru', N'1234')
INSERT [dbo].[User] ([ID_user], [surname], [name], [patronymic], [login], [password]) VALUES (8, N'test', N'test', N'test', N'1', N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Act]  WITH CHECK ADD  CONSTRAINT [FK_Act_Product] FOREIGN KEY([ID_product])
REFERENCES [dbo].[Product] ([ID_product])
GO
ALTER TABLE [dbo].[Act] CHECK CONSTRAINT [FK_Act_Product]
GO
ALTER TABLE [dbo].[Archiev]  WITH CHECK ADD  CONSTRAINT [FK_Archiev_Act] FOREIGN KEY([number_act])
REFERENCES [dbo].[Act] ([number_act])
GO
ALTER TABLE [dbo].[Archiev] CHECK CONSTRAINT [FK_Archiev_Act]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ID_category])
REFERENCES [dbo].[Category] ([ID_category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_map]  WITH CHECK ADD  CONSTRAINT [FK_Product_map_Act] FOREIGN KEY([number_act])
REFERENCES [dbo].[Act] ([number_act])
GO
ALTER TABLE [dbo].[Product_map] CHECK CONSTRAINT [FK_Product_map_Act]
GO
ALTER TABLE [dbo].[Product_map]  WITH CHECK ADD  CONSTRAINT [FK_Product_map_Responsible_persons] FOREIGN KEY([ID_responsible_persons])
REFERENCES [dbo].[Responsible_persons] ([ID_responsible_persons])
GO
ALTER TABLE [dbo].[Product_map] CHECK CONSTRAINT [FK_Product_map_Responsible_persons]
GO
ALTER TABLE [dbo].[Product_map]  WITH CHECK ADD  CONSTRAINT [FK_Product_map_Status] FOREIGN KEY([ID_status])
REFERENCES [dbo].[Status] ([ID_status])
GO
ALTER TABLE [dbo].[Product_map] CHECK CONSTRAINT [FK_Product_map_Status]
GO
ALTER TABLE [dbo].[Responsible_persons]  WITH CHECK ADD  CONSTRAINT [FK_Responsible_persons_Company] FOREIGN KEY([ID_company])
REFERENCES [dbo].[Company] ([ID_company])
GO
ALTER TABLE [dbo].[Responsible_persons] CHECK CONSTRAINT [FK_Responsible_persons_Company]
GO
ALTER TABLE [dbo].[Responsible_persons]  WITH CHECK ADD  CONSTRAINT [FK_Responsible_persons_Division] FOREIGN KEY([ID_division])
REFERENCES [dbo].[Division] ([ID_division])
GO
ALTER TABLE [dbo].[Responsible_persons] CHECK CONSTRAINT [FK_Responsible_persons_Division]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Act] FOREIGN KEY([number_act])
REFERENCES [dbo].[Act] ([number_act])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Act]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID_status])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Status]
GO
/****** Object:  Trigger [dbo].[StoryUpdate]    Script Date: 26.02.2022 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StoryUpdate]
    on [dbo].[Product_map]
    after update, insert
as
IF UPDATE (ID_status)
begin
    insert into Story (inventory_number, StatusID, ChangedDate, number_act)
	Values(((select inventory_number from inserted)), 
		   ((select ID_status from inserted)), 
		   GETDATE(),
		   ((select number_act from inserted)))   	
end
GO
ALTER TABLE [dbo].[Product_map] ENABLE TRIGGER [StoryUpdate]
GO
USE [master]
GO
ALTER DATABASE [Inventory_Items] SET  READ_WRITE 
GO
