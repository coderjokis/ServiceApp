--create database ServiceDatabase
--go
use ServiceDatabase
go

create table tbClients(
ClientID int identity(1,1) primary key,
ClientName varchar(max),
Contact varchar(max),
PhoneNumber varchar(max),
Address varchar(max)
)
insert into tbClients(ClientName,Contact,PhoneNumber,Address) values
					 ('test','Andrew','555-5555','whatever st')
go

create table tbEquipment(
EquipmentID int identity(1,1) primary key,
EquipmentName varchar(max),
Description varchar(max),
Location varchar(max),
ClientID int foreign key references tbClients(ClientID)
)
insert into tbEquipment(EquipmentName,Description,Location,ClientID) values
					   ('test','hello','winnipeg',1)
go

create table tbInventory(
InventoryID int identity(1,1) primary key,
TypeofItem varchar(max),
Telephone varchar(max),
Software varchar(max),
Hardware varchar(max),
Consulting varchar(max),
Other varchar(max)
)
insert into tbInventory(TypeofItem,Telephone,Software,Hardware,Consulting,Other) values
					   ('test','111-1111','microsoft','idk','hello','random')
go

drop  FK__tbEquipme__Clien__1A55A60E 
select * from tbClients
select * from tbEquipment
select * from tbInventory