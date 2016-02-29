
--create database ServiceDatabase
--go(

use ServiceDatabase
go

create table tbContacts(
ContactID int identity(1,1) primary key,
ContactName varchar(max),
ClientID int foreign key references tbClients(ClientID)
)
--insert into tbContacts values ('Contact TestOne',1),
--								('Test Two',1),
--								('Test Third',1),
--								('Fourth Contact',2),
--								('Fifth Agent',2),
--								('Sixth Contact',2)
go

create table tbClients
(
ClientID int identity(1,1) primary key,
ClientName varchar(max),
PhoneNumber varchar(max),
Address varchar(max)
)
--insert into tbClients(ClientName,PhoneNumber,Address) values
--					('TestClientOne','555-5555','Whatever Test st'),
--					('TestClientTwo','555-6666','Whatever Test2 st')
--insert into tbClients(ClientName,PhoneNumber,Address) values ('TestClient3','222-6666','Whatever thirdtest st')

select * from tbClients
go

create table tbItem
(ItemID int identity(1,1) primary key,
ItemType varchar(max)
)
go
--insert into tbItem (ItemType) values 
--					('Telephone'),
--					('Software'),
--					('Service')
select * from tbItem
go
create table tbEquipment(
EquipmentID int identity(1,1) primary key,
Description varchar(max),
InstallDate date,
FarFoxValue decimal(10,2),
ClientValue decimal(10,2),
LocationID int foreign key references tbLocation(LocationID),
ItemID int foreign key references tbItem(ItemID),
ContactID int foreign key references tbContacts(ContactID)
)
--insert into tbEquipment(Description,InstallDate,FarFoxValue,ClientValue,LocationID,ItemID,ContactID) values
--						('testdescription11','12 July 2012',399.99,1399.99,1,1,2),
--						('testdescription22','12 June 2015',399.99,1399.99,3,2,2),
--						('testdescription33','12 May 2015',399.99,1399.99,4,3,1),
--						('testdescription44','12 April 2014',399.99,1399.99,2,2,1),
--						('testdescription55','12 December 2013',399.99,1399.99,2,3,3)
select *from tbEquipment
go

--two keys Location, item
create table tbInventory(
InventoryID int identity(1,1) primary key,
EquipmentID int foreign key references tbEquipment(EquipmentID),
Quantity int,
ClientID int foreign key references tbClients(ClientID)
)
go
insert into tbInventory values (3,20,1),(2,15,2),(4,5,1)
go
create table tbLocation(
LocationID int identity(1,1) primary key,
LocationName varchar(max)
)
go
--insert into tbLocation values ('Far Fox'),('Local'),('Online'),('Globals')
--select * from tbInventory
----############PROCS############----

----Generic Join, this will provide references for a proper selection.
select c.ClientName, i.ItemType, e.Description, e.InstallDate, e.FarFoxValue, e.ClientValue, l.LocationName ,c.PhoneNumber , c.Address, a.ContactName
		from tbEquipment e
			join tbItem i on i.ItemID=e.ItemID
			join tbInventory s on s.EquipmentID=e.EquipmentID
			join tbLocation l on e.LocationID=l.LocationID
			join tbClients c on s.ClientID=c.ClientID
			join tbContacts a on a.ClientID=c.ClientID
		

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
				right outer join tbClients c on s.ClientID=c.ClientID
				right outer join tbContacts a on a.ContactID=e.ContactID			
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
go
-----Crud for EQ------
----Create/Insert-----
create procedure spAddEquipment
(
@Description varchar(max),
@ItemID int,
@ClientID int
)
as begin
	insert into tbEquipment(Description, InstallDate, ItemID, ClientID) 
			values (@Description, getdate(), @ItemID, @ClientID)
end
go
exec spAddEquipment @Description='DescTest' , @ItemID=2, @ClientID=2
go
------Read/Get-------FORMAT(InstallDate,'d MMMM yyyy')as
alter procedure spGetEquipmentInfo
(
@EquipmentID int =null
)
as begin
	select e.EquipmentID, i.ItemType, e.Description, l.LocationName,FORMAT(InstallDate,'d MMMM yyyy')as InstallDate, i.FarFoxValue, i.ClientValue,  a.ContactName 
				from tbEquipment e
				join tbItem i on i.ItemID=e.ItemID
				join tbLocation l on i.LocationID=l.LocationID
				join tbClients c on e.ClientID=c.ClientID
				join tbContacts a on a.ContactID=c.ClientID
					where e.EquipmentID= isnull(@EquipmentID,EquipmentID)
end
go

------Update---------

alter procedure spUpdateEQuipmentInfo
(
@EquipmentID int,
@Description varchar(max)= null,
@InstallDate date=null,
@ContactName varchar(max)=null,
@ClientName varchar(max)=null,
@ItemType varchar(max)=null,
@ItemID int=null,
@ClientID int = null,
@ContactID int = null,
@FarFoxValue decimal = null,
@ClientValue decimal = null
)
as begin
		update tbEquipment set
			Description = isnull(@Description,Description),
			InstallDate = isnull(@InstallDate,InstallDate)			
			where EquipmentID=@EquipmentID

		update tbItem set
			ItemType = isnull(@ItemType,ItemType),
			FarFoxValue = isnull(@FarFoxValue,FarFoxValue),
			ClientValue= isnull (@ClientValue,ClientValue)
			from tbEquipment e
				join tbItem i on i.ItemID=e.ItemID
				--join tbLocation l on i.LocationID=l.LocationID
				--join tbClients c on e.ClientID=c.ClientID
				--join tbContacts a on a.ClientID=c.ClientID
			where e.EquipmentID=@EquipmentID
	--if @ContactName!=null
	--	update tbContacts set
	--		ContactName=isnull(@ContactName,ContactName)
	--		from tbContacts a
	--			--join tbItem i on i.ItemID=e.ItemID
	--			--join tbLocation l on i.LocationID=l.LocationID
	--			join tbClients c on a.ClientID=c.ClientID
	--			join tbEquipment e on e.ClientID=c.ClientID
	--		where e.EquipmentID=@EquipmentID
	--if @ClientName != null
	--	update tbClients set
	--		ClientName=isnull(@ClientName,ClientName)
	--	from tbClients c
	--			--join tbItem i on i.ItemID=e.ItemID
	--			--join tbLocation l on i.LocationID=l.LocationID
	--			join tbEquipment e on e.ClientID=c.ClientID
	--			--join tbContacts a on a.ClientID=c.ClientID
	--		where e.EquipmentID=@EquipmentID
	--if @@ERROR !=0
	--	select e.EquipmentID, i.ItemType, e.Description, l.LocationName, e.InstallDate, i.FarFoxValue, i.ClientValue ,c.ClientName
	--			from tbEquipment e
	--			join tbItem i on i.ItemID=e.ItemID
	--			join tbLocation l on i.LocationID=l.LocationID
	--			join tbClients c on e.ClientID=c.ClientID
	--			join tbContacts a on a.ContactID=c.ClientID
	--			where e.EquipmentID=@EquipmentID
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

exec spGetEquipmentInfo 
exec spUpdateEQuipmentInfo @EquipmentID = 6,@ItemType='Software'
exec spUpdateEQuipmentInfo @EquipmentID = 3,@Description= 'Testingupdate2'
exec spUpdateEQuipmentInfo @EquipmentID = 2,@ContactName = 'NotNuller'
exec spUpdateEQuipmentInfo @EquipmentID = 3,@InstallDate = '29 January 2015'
exec spUpdateEQuipmentInfo @EquipmentID = 4,@FarFoxValue = 399.99
exec spUpdateEQuipmentInfo @EquipmentID = 2,@ClientValue = 1225.99
exec spGetEquipmentInfo @EquipmentID = 6
select * from tbClients
select * from tbItem
select * from tbEquipment
select * from tbLocation
select * from tbContacts