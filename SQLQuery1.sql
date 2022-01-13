use [master]
go
create database [crmDB]
go
use [crmDB]
go
create table [dbo].[TaskStatuses](
	[Id] [int] not null,
	[Name] [nvarchar] (max) null,
constraint [PK_TaskStatuses] primary key clustered
(
	[Id] asc
)
) on [primary]
go
create table [dbo].[Contacts](
	[Id] [int] not null,
	[Email] [nvarchar] (256) not null,
	[Company] [nvarchar] (256) null,
	[LastName] [nvarchar] (256) null,
	[FirstName] [nvarchar] (256) null,
	[Phone] [nvarchar] (256) null,
constraint [PK_Contacts] primary key clustered
(
	[Id] asc
)
) on [primary]
go
create table [dbo].[OpportunityStatuses](
	[Id] [int] not null,
	[Name] [nvarchar] (max) null,
constraint [PK_OpportunityStatuses] primary key clustered
(
	[Id] asc
)
) on [primary]
go
create table [dbo].[TaskTypes](
	[Id] [int] not null,
	[Name] [nvarchar](max) not null,
 constraint [PK_TaskTypes] primary key clustered
(
	[Id] asc
)
) on [primary]
go
create table [dbo].[Opportunities](
	[Id] [int] not null,
	[Amount] [money] not null,
	[UserId] [int] not null,
	[ContactId] [int] not null,
		constraint FK_ContactId foreign key (ContactId)
		references Contacts (Id),
	[StatusId] [int] not null,
		constraint FK_StatusId foreign key (StatusId)
		references OpportunityStatuses (Id),
	[CloseDate] [datetime] not null,
	[Name] [nvarchar] (256) null,
constraint [PK_Opportunities] primary key clustered
(
	[Id] asc
)
) on [primary]
go
create table [dbo].[Tasks](
	[Id] [int] not null,
	[Title] [nvarchar](256) null,
	[OpportunityId] [int] not null,
		constraint FK__OpportunityId FOREIGN KEY (OpportunityId)
		references Opportunities (Id),
	[DueDate] [datetime] not null,
	[TypeId] [int] not null,
		constraint FK_TypeId foreign key (TypeId)
		references TaskTypes (Id),
	[StatusId] [int] null,
		constraint FK__StatusId foreign key (StatusId)
		references TaskStatuses (Id),
constraint [PK_Tasks] primary key clustered
(
	[Id] asc
)
) on [primary]



