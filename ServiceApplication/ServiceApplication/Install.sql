
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
FarFoxValue smallmoney,
ClientValue smallmoney,
LocationID int foreign key references tbLocation(LocationID)
--CurrentLocation varchar(max)--should references LocationID
)
go
insert into tbItem (ItemType,FarFoxValue,ClientValue,LocationID) values ('Telephone','299.99','1299.99','1')
go
create table tbEquipment(
EquipmentID int identity(1,1) primary key, --will reference by item table
Description varchar(max),
InstallDate varchar(max),
ClientID int foreign key references tbClients(ClientID),
ItemID int foreign key references tbItem(ItemID)
)
insert into tbEquipment(Description,InstallDate,ClientID,ItemID) values('testdescription',GETDATE(),1,1)
go

--two keys Location, item
--drop table tbInventory(
--InventoryID int identity(1,1) primary key,
--ItemID int foreign key references tbItem(ItemID),
--LocationID int foreign key references tbLocation(LocationID)
--)
--go

create table tbLocation(
LocationID int identity(1,1) primary key,
LocationName varchar(max)
)
go
--insert into tbLocation values('Far Fox')
create table tbContacts(
ContactID int identity(1,1) primary key,
ContactName varchar(max),
ClientID int foreign key references tbClients(ClientID)
)

select * from tbClients
select * from tbItem
select * from tbEquipment

select * from tbLocation
select * from tbContacts
--select * from tbInventory
----############PROCS############----

----Generic Join, this will provide references for a proper selection.
select c.ClientName, i.ItemType, e.Description, e.InstallDate, i.FarFoxValue, i.ClientValue, l.LocationName ,c.PhoneNumber , c.Address, a.ContactName
		from tbEquipment e
			join tbItem i on i.ItemID=e.ItemID
			join tbInventory s on s.ItemID=i.ItemID
			join tbLocation l on s.LocationID=l.LocationID
			join tbClients c on e.ClientID=c.ClientID
			join tbContacts a on a.ContactID=c.ClientID

go

--------Proc for the Tracking Page-------
alter procedure spLoadAllInfo
--(
--@ClientID int =null
--)
as begin
	--select * from tbClients where @ClientID=isnull(@ClientID,ClientID)
	--if exists(select * from tbClients where ClientID=@ClientID)
	--		select c.ClientName, i.ItemType, e.Description, e.InstallDate, i.FarFoxValue, i.ClientValue, l.LocationName ,c.PhoneNumber , c.Address, a.ContactName
	--			from tbEquipment e
	--			join tbItem i on i.ItemID=e.ItemID
	--			join tbLocation l on i.LocationID=l.LocationID
	--			join tbClients c on e.ClientID=c.ClientID
	--			join tbContacts a on a.ContactID=c.ClientID
	--		where c.ClientID= @ClientID
	--else
	--	select 'You are in Here' as Result
		select c.ClientName, i.ItemType, e.Description, e.InstallDate, i.FarFoxValue, i.ClientValue, l.LocationName ,c.PhoneNumber , c.Address, a.ContactName
				from tbEquipment e
				join tbItem i on i.ItemID=e.ItemID
				join tbLocation l on i.LocationID=l.LocationID
				join tbClients c on e.ClientID=c.ClientID
				join tbContacts a on a.ContactID=c.ClientID
			
end
go
--join tbInventory s on s.ItemID=i.ItemID
exec spLoadAllInfo
go
-- loading info into ddl in client page
create procedure spLoadDDLClient
as begin
	select ClientID, ClientName from tbClients
end
go

-----Loading GV with Complete client Info---

alter procedure spGetAllClientsInfo
(
@ClientID int = null
)
as begin
	if exists(select * from tbClients where ClientID=@ClientID)
		select c.ClientID, ClientName, ContactName, PhoneNumber, Address 
			from tbClients c 
				join tbContacts a on a.ContactID=c.ClientID
			where c.ClientID=@ClientID
	else
		select c.ClientID, ClientName, ContactName, PhoneNumber, Address 
			from tbClients c 
				join tbContacts a on a.ContactID=c.ClientID
end
go

exec  spGetAllClientsInfo @ClientID=1
go

alter procedure spAddClient
(
@ClientName varchar(max),
@PhoneNumber varchar(max),
@Address varchar(max)
)
as begin
	insert into tbClients (ClientName, PhoneNumber, Address)
		values (@ClientName,@PhoneNumber, @Address)
end
go

--exec spAddClient @ClientName='NameTest', @PhoneNumber='123-123-1234', @Address='TestingAddress'
go

alter procedure spAddContact
(
@ContactName varchar(max),
@ClientID int
)
as begin
	insert into tbContacts (ContactName, ClientID) values (@ContactName, @ClientID)
end
go
exec spAddContact @ContactName='TestContactName', @ClientID=1
go
alter procedure spEditClient
(
@ClientID int,
@ClientName varchar(max)=null,
@PhoneNumber varchar(max)=null,
@Address varchar(max)=null
)
as begin
	update tbClients set
		ClientName=isnull(@ClientName,ClientID),
		PhoneNumber=isnull(@PhoneNumber,PhoneNumber),
		Address=isnull(@Address,Address)
	where ClientID=@ClientID	
end
go

-------Getcontactinfo to load DDL edit client------
go
create procedure spGetContactFromClient
(
@ClientID int
)
as begin
	select * from tbContacts c
		join tbClients i on i.ClientID=c.ClientID
		where  c.ClientID = @ClientID
end
go

exec spGetContactFromClient @ClientID=1

