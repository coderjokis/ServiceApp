﻿ use ServiceDatabase
go

----------LOCATION---------
create table tbLocation(
LocationID int identity(0,1) primary key,
LocationName varchar(max)
)
go
--insert into tbLocation values ('Far Fox')

---------ITEM--------------
create table tbItem
(ItemID int identity(0,1) primary key,
ItemType varchar(max)
)
go
--insert into tbItem (ItemType) values ('Telephone'),('Software')
go

-----------EQUIPMENT---------
create table tbEquipment(
EquipmentID int identity(0,1) primary key,
Description varchar(max),
InstallDate date,
FarFoxValue decimal(10,2),
ClientValue decimal(10,2),
LocationID int foreign key references tbLocation(LocationID),
ItemID int foreign key references tbItem(ItemID)
)
go
insert into tbEquipment(Description,InstallDate,FarFoxValue,ClientValue,LocationID,ItemID) values
						('TestDESC','12 December 2013',399.99,1399.99,0,0)

select * from tbEquipment

-------------CONTACTS-------------
create table tbContacts(
ContactID int identity(0,1) primary key,
ContactName varchar(max),
EquipmentID int foreign key references tbEquipment(EquipmentID)
)
insert into tbContacts values ('TestContact',0)
								
go


--insert into tbClients(ClientName,PhoneNumber,Address) values
--					('TestClientOne','555-5555','Whatever Test st'),
--					('TestClientTwo','555-6666','Whatever Test2 st')
--insert into tbClients(ClientName,PhoneNumber,Address) values ('TestClient3','222-6666','Whatever thirdtest st')
select * from tbContacts
select * from tbClients
go



select * from tbItem
go


-------------INVENTORY---------------------
create table tbInventory(
InventoryID int identity(0,1) primary key,
EquipmentID int foreign key references tbEquipment(EquipmentID),
Quantity int
)
go

------------------CLIENTS------------
create table tbClients(
ClientID int identity(0,1) primary key,
ClientName varchar(max),
PhoneNumber varchar(max),
Address varchar(max),
ContactID int foreign key references tbContacts(ContactID),
InventoryID int foreign key references tbInventory(InventoryID)
)
--insert into tbInventory values (3,20,1),(2,15,2),(4,5,1)
go

------------SHOPPING CART----------
create table tbShoppingCart(
ShoppingCartID int primary key identity(0,1),
ClientID int foreign key references tbClients(ClientID),
InventoryID int foreign key references tbInventory(InventoryID)
)
go


------------------PROCS---------------

----Generic Join, this will provide references for a proper selection.
select c.ClientName, i.ItemType, e.Description, e.InstallDate, e.FarFoxValue, e.ClientValue, l.LocationName ,c.PhoneNumber , c.Address, a.ContactName
		from tbEquipment e
			join tbItem i on i.ItemID=e.ItemID
			join tbInventory s on s.EquipmentID=e.EquipmentID
			join tbLocation l on e.LocationID=l.LocationID
			join tbClients c on s.InventoryID=c.InventoryID
			join tbContacts a on a.ContactID=c.ContactID
		

go

--------Proc for the Tracking Page-------
alter procedure spLoadAllInfo
as begin
		select c.ClientID,c.ClientName, i.ItemType, e.Description, e.InstallDate, e.FarFoxValue, e.ClientValue, l.LocationName ,
				c.PhoneNumber , c.Address, a.ContactName,s.Quantity
			from tbEquipment e
				right outer join tbItem i on i.ItemID=e.ItemID
				right outer join tbInventory s on s.EquipmentID=e.EquipmentID
				right outer join tbLocation l on e.LocationID=l.LocationID
				right outer join tbClients c on s.InventoryID=c.InventoryID
				right outer join tbContacts a on a.ContactID=c.ContactID							
end
go
exec spLoadAllInfo
go
-- loading info into ddl in client page
create procedure spLoadDDLClient
as begin
	select ClientID, ClientName from tbClients
end
go
-------load itemtype
create procedure spLoadItemType
as begin
	select * from tbItem
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
-----------------PRocs for Contacts------------------
create procedure spLoadDDLContactbyClientID
(
@ClientID int
)
as begin
	select * from tbContacts i
		Join tbClients c on c.ContactID=i.ContactID
		 where c.ClientID = @ClientID
end
go


alter procedure spAddContact
(
@ContactID int =null,
@ContactName varchar(max),
@ClientID int
)
as begin
	insert into tbContacts (ContactName) values (@ContactName)
		begin
			select @ContactID = tbContacts.ContactID from tbContacts
				where tbContacts.ContactID= @@IDENTITY
				update tbClients set
					ContactID = isnull (@ContactID,@@IDENTITY)
				where ClientID = @ClientID
		end
end
go
--exec spAddContact @ContactName='TestContactName', @ClientID=1
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
go
-----Crud for EQ------
----Create/Insert-----
alter procedure spAddEquipment
(
@Description varchar(max),
@ItemID int,
@InstallDate date,
@FarFoxValue decimal,
@ClientValue decimal,
@LocationID int
)
as begin
	insert into tbEquipment(Description, InstallDate, ItemID, FarFoxValue,ClientValue,LocationID) 
			values (@Description, @InstallDate, @ItemID, @FarFoxValue,@ClientValue,@LocationID)
end
go
--exec spAddEquipment @Description='DescTest' ,@InstallDate='2015-2-22', @ItemID=2,  @FarFoxValue=299.99, @ClientValue=1999.99,@LocationID=2
select * from tbEquipment
go
------Read/Get-------FORMAT(InstallDate,'d MMMM yyyy')as
alter procedure spGetEquipmentInfo
(
@EquipmentID int =null
)
as begin
	select e.EquipmentID,i.ItemID, i.ItemType, e.Description, l.LocationName,l.LocationID,
				FORMAT(InstallDate,'d MMMM yyyy')as InstallDate, e.FarFoxValue, e.ClientValue--,  a.ContactName ,s.Quantity
				from tbEquipment e
				join tbItem i on i.ItemID=e.ItemID
				--join tbInventory s on s.EquipmentID=e.EquipmentID
				join tbLocation l on e.LocationID=l.LocationID
				--join tbClients c on s.InventoryID=c.InventoryID
				--join tbContacts a on a.ContactID=c.ClientID
					where e.EquipmentID= isnull(@EquipmentID,e.EquipmentID)
end
go

------Update---------

alter procedure spUpdateEQuipmentInfo
(
@EquipmentID int,
@Description varchar(max)= null,
@InstallDate date=null,
@ItemID int=null,
@ContactID int = null,
@FarFoxValue decimal = null,
@ClientValue decimal = null,
@LocationID int =null
)
as begin
		update tbEquipment set
			Description = isnull(@Description,Description),
			InstallDate = isnull(@InstallDate,InstallDate),
			FarFoxValue = isnull(@FarFoxValue,FarFoxValue),
			ClientValue= isnull (@ClientValue,ClientValue),
			ItemID = isnull(@ItemID,@ItemID),
			LocationID = isnull (@LocationID,LocationID)
			where EquipmentID=@EquipmentID
end
go

--------Procs for Location------
create proc spAddLocation
(
@LocationName varchar(max)
)
as begin
	insert into tbLocation(LocationName) values (@LocationName)
end
go

create procedure spDeleteLocation
(@LocationID int)
as begin
	delete from tbLocation where LocationID = @LocationID
end
go
exec spDeleteLocation @LocationID=7
------------GEtEQinfo------------
exec spGetEquipmentInfo 

select * from tbClients
select * from tbItem
select * from tbEquipment
select * from tbLocation
select * from tbContacts

----Crud for item----
go 
create procedure spAddItem
(@ItemType varchar(max)
)
as begin
	insert into tbItem(ItemType) values (@ItemType)
end
go
create procedure spUpdateItem
(@ItemID int,
@ItemType varchar(max)
)
as begin
	UPDATE tbItem set
		ItemType = @ItemType
		where ItemID=@ItemID
end
go
--exec spUpdateItem @ItemType='Telephone', @ItemID = 1
select * from tbItem
go
create procedure spGetItem
(
@ItemID int
)
as begin
	select * from tbItem where ItemID = @ItemID
end
go


---------------------Shopping Cart Proc---------------------
create procedure spAddtoInventory
(
@InventoryID int,
@EquipmentID int,
@ClientID int,
@Quantity int
)
as
begin
		insert into tbInventory (EquipmentID,Quantity) values
								(@EquipmentID,@Quantity)
		select 'success' as Result
		begin
			select @ClientID = tbClients.ClientID from tbClients
				where InventoryID = @InventoryID
					update tbClients set
					 InventoryID = isnull(@InventoryID,InventoryID)
					 where ClientID=@ClientID
		end	
end
go
	
create procedure spGetItemInventory
(@EquipmentID int)
as
begin
	select Quantity as Result from tbInventory where EquipmentID=@EquipmentID
end
go


create procedure spUpdateShoppingCart
(
@ItemID int,
@UserID int
)
as
begin
	update tbShoppingCart
	set CheckOut=1
	where ItemID=@ItemID and UserID=@UserID
end
go
