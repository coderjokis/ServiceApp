
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
FarFoxValue int,
ClientValue int,
LocationID int foreign key references tbLocation(LocationID)
--CurrentLocation varchar(max)--should references LocationID
)
go

create table tbEquipment(
EquipmentID int identity(1,1) primary key, --will reference by item table
Description varchar(max),
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

select * from tbClients
select * from tbItem
select * from tbEquipment
select * from tbInventory
select * from tbLocation
select * from tbContacts

----############PROCS############----

----Generic Join, this will provide references for a proper selection.
select ClientName, ItemType, Description, InstallDate, FarFoxValue, ClientValue, LocationName ,PhoneNumber , Address, ContactName
		from tbEquipment e
			join tbItem i on i.ItemID=e.ItemID
			join tbInventory s on s.ItemID=i.ItemID
			join tbLocation l on s.LocationID=l.LocationID
			join tbClients c on e.ClientID=c.ClientID
			join tbContacts a on a.ContactID=c.ClientID

go

--------Proc for the Tracking Page-------
create procedure spLoadAllInfo
as begin
	select ClientName, ItemType, Description, InstallDate, FarFoxValue, ClientValue, LocationName ,PhoneNumber , Address, ContactName
		from tbEquipment e
			join tbItem i on i.ItemID=e.ItemID
			join tbInventory s on s.ItemID=i.ItemID
			join tbLocation l on s.LocationID=l.LocationID
			join tbClients c on e.ClientID=c.ClientID
			join tbContacts a on a.ContactID=c.ClientID
end
go

exec spLoadAllInfo