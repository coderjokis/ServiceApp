use master
go
drop database ServiceDatabase
go
create database ServiceDatabase
go
use ServiceDatabase
go

create table tbClients
(
ClientID int identity(1,1) primary key,
ClientName varchar(max),
Contact varchar(max), -- contact will be itsw own table
PhoneNumber varchar(max),
Address varchar(max)
)
--insert into tbClients(ClientName,Contact,PhoneNumber,Address) values('test','Andrew','555-5555','whatever st')

go
create table tbEquipment(
EquipmentID int identity(1,1) primary key, --will reference by item table
EquipmentName varchar(max),
Description varchar(max),
Location varchar(max),
ClientID int foreign key references tbClients(ClientID)
)
--insert into tbEquipment(EquipmentName,Description,Location,ClientID) values('test','hello','winnipeg',1)
go

--two keys Location, item
create table tbInventory(
InventoryID int identity(1,1) primary key,
TypeofItem varchar(max),
Telephone varchar(max),
Software varchar(max),
Hardware varchar(max),
Consulting varchar(max),
Other varchar(max)
)
--insert into tbInventory(TypeofItem,Telephone,Software,Hardware,Consulting,Other) values('test','111-1111','microsoft','idk','hello','random')
go

--New Table for location
--new table for contacts
--new item table

select * from tbClients
select * from tbEquipment
select * from tbInventory