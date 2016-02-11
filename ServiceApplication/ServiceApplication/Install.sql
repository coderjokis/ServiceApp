
--create database ServiceDatabase
--go
use ServiceDatabase
go

create table tbClients
(
ClientID int identity(1,1) primary key,
ClientName varchar(max),
PhoneNumber varchar(max),
Address varchar(max)
)
--insert into tbClients(ClientName,Contact,PhoneNumber,Address) values('test','Andrew','555-5555','whatever st')
go

create table tbItem(
ItemID int identity(1,1) primary key,
ItemType varchar(max),
Description varchar(max),
FarFoxValue int,
ClientValue int,
CurrentLocation varchar(max)
)
go

create table tbEquipment(
EquipmentID int identity(1,1) primary key, --will reference by item table
EquipmentName varchar(max),
Description varchar(max),
Location varchar(max),
InstallDate varchar(max),
ClientID int foreign key references tbClients(ClientID),
ItemID int foreign key references tbItem(ItemID)
)
--insert into tbEquipment(EquipmentName,Description,Location,ClientID) values('test','hello','winnipeg',1)
go

--two keys Location, item
create table tbInventory(
InventoryID int identity(1,1) primary key,
ItemID int foreign key references tbItem(ItemID),
LocationID int foreign key references tbLocation(LocationID)
)
--insert into tbInventory(TypeofItem,Telephone,Software,Hardware,Consulting,Other) values('test','111-1111','microsoft','idk','hello','random')
go

create table tbLocation(
LocationID int identity(1,1) primary key,
LocationName varchar(max)
)
go

create table tbContacts(
ContactID int identity(1,1) primary key,
ContactName varchar(max),
ClientID int foreign key references tbClients(ClientID)
)

--New Table for location
--new table for contacts
--new item table

select * from tbClients
select * from tbItem
select * from tbEquipment
select * from tbInventory
select * from tbLocation
select * from tbContacts