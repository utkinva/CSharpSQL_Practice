use [master]
go
create database [HotelDB]
go
use [HotelDB]
go
create table [dbo].[Type](
[TypeNum] [int] not null,
[CType] [nvarchar] (50) not null,

constraint [PK_TypeNum] primary key clustered(
[TypeNum] asc)
) on [primary]



create table [dbo].[Admin](
[AdId] [int] not null,
[AdPasswd] [nvarchar] (50) not null,
[AdName] [nvarchar] (50) not null,
[AdContact] [nvarchar] (50) not null,
[AdEmail] [nvarchar] (50) not null,

constraint [PK_AdId] primary key clustered(
[AdId] asc)
) on [primary]


create table [dbo].[Room](
RmId int not null,
RmType nvarchar (50) not null,
RmBedding nvarchar (50) not null,
RmPrice nvarchar (50) not null,
RmStatus nvarchar (50) not null,

constraint PK_RmId primary key clustered(
RmId asc)
) on [primary]


create table [dbo].[Rating](
RatingId int not null,
Rating nvarchar(50) not null,
RmID int not null,
	constraint FK_RmId foreign key (RmId)
	references Room (RmId),

constraint PK_RatingId primary key clustered(
RatingId asc)
) on [primary]


create table [dbo].[Customer](
CId int not null,
CPasswd nvarchar(50) not null,
CTitle nvarchar(50) not null,
CFname nvarchar(50) not null,
CLname nvarchar(50) not null,
CIC nvarchar(50) not null,
CNationality nvarchar(50) not null,
CContact nvarchar(50) not null,
CEmail nvarchar(50) not null,
CBnakAcc nvarchar(50) not null,
CBank nvarchar(50) not null,
TypeNum int not null,
	constraint FK_TypeNum foreign key (TypeNum)
	references Type (TypeNum),

constraint PK_CId primary key clustered(
CId asc)
) on [primary]


create table [dbo].[Reservation](
RxNum int not null,
CIN nvarchar(50) not null,
COUT nvarchar(50) not null,
NON nvarchar(50) not null,
Status nvarchar(50) not null,
CID int not null,
	constraint FK_CID foreign key (CID)
	references Customer (CID),
AdID int not null,
	constraint FK_AdID foreign key (AdID)
	references Admin (AdID),
RmID int not null,
	constraint FK_RmID_1 foreign key (RmID)
	references Room (RmID),

constraint PK_RxNum primary key clustered(
RxNum asc)
) on [primary]


create table [dbo].[Invoice](
INum int not null,
TotalFee nvarchar(50) not null,
Description nvarchar(300) not null,
Date datetime not null,
RxNum int not null,
	constraint FK_RxRum foreign key (RxNum)
	references Reservation (RxNum),

constraint PK_INum primary key clustered(
INum asc)
) on [primary]
