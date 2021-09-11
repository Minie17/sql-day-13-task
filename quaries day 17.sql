---user define views----
use AdventureWorks2012

select*
from HumanResources.Employee

------create views---------
 
 create view vwDesignEng
 as
 select BusinessEntityID,BirthDate,Gender,HireDate
 from HumanResources.Employee
 where JobTitle='Design Engineer'

 drop view vwDesignEng

 -----to list the object of my current dp-----
sp_help

-------vitual table-----
select*
from vwDesignEng

----view does not contains data-------
sp_helptext vwDesignEng

-----adding a column -------
alter view vwDesignEng
as
select BusinessEntityID,BirthDate,Gender,HireDate,VacationHours
from HumanResources.Employee
where JobTitle='Design Engineer'

----If i have to change the vationhours to 15 for beid=5
----data is update in original table through views.

update vwDesignEng 
set VacationHours=15
where BusinessEntityID>=5

-----update multiple columns of a table---
update HumanResources.Employee
set VacationHours=20,SickLeaveHours=19
where BusinessEntityID=16

select *
from HumanResources.Employee

create view vwEmployeeDepartment
as
select Name,d.ModifiedDate ,Groupname, 
edh.BusinessEntityID,edh.ShiftID
from HumanResources.Department d join 
HumanResources.EmployeeDepartmentHistory edh
on d.DepartmentID=edh.DepartmentID
where BusinessEntityID=47

select*
from vwEmployeeDepartment

----cannot update multiple base tables using single update-
update vwEmployeeDepartment
set GroupName='Manufcng',ShiftID=2
where BusinessEntityID=46

drop view vwEmployeeDepartment

select*
from HumanResources.Employee

sp_rename  'vwDesignEng','vwDesignEngineer'

----permanently drop object------
drop view vwEmployeeDepartment 

select*
from HumanResources.Employee

create view vwEmployee
as
select JobTitle,MaritalStatus,Gender
from HumanResources.Employee

select*
from vwEmployee

------view doesn't contains data----
View contains definition of itself

create view vwEmployeePH 
as 
select*
from HumanResources.EmployeePayHistory
order by Rate desc 

sp_helptext vwEmployee

alter view vwEmployee
as 
select JobTitle,MaritalStatus,Gender,VacationHours
from HumanResources.Employee


create view vwDeptName
as
select Name
from HumanResources.Department
where DepartmentID=(select DepartmentID 
from HumanResources.EmployeeDepartmentHistory
where  BusinessEntityID=46 and EndDate is null)

select *
from vwEmployee


Create view vwCananda
as 
select StateProvinceID,StateProvinceCode,Name,TerritoryID
from Person.StateProvince
where CountryRegionCode='CA'

Create view vwUS
as
select StateProvinceID,StateProvinceCode,Name,TerritoryID
from Person.StateProvince
where CountryRegionCode='US'

select*
from Person.StateProvince

------Multiple Database------
Multiple Database
create view vwEmployeeBooks
as
select emp.EmployeeNmae,cw.BookName
from Crossworld cw,
[Espiredb].[dbo].[Employee] emp

 select Designation
from Employee
where EmployeeName='Vikas'

select EmployeeName
from Employee
where Designation='Project Manager'

select BusinessEntityID, LoginID, VacationHours
from HumanResources.Employee where
VacationHours>(select AVG(VacationHours)
from HumanResources.Employee)
order by VacationHours

---using joins----
select BusinessEntityID,d.DepartmentID,ShiftID
from HumanResources.Department d
inner join HumanResources.EmployeeDepartmentHistory dh
on d.DepartmentID=dh.DepartmentID
where BusinessEntityID=46
order by DepartmentID

-----deptname of empid 46---
select Name
from HumanResources.Department
where DepartmentID=(select DepartmentID
from HumanResources.EmployeeDepartmentHistory 
where BusinessEntityID=46)

---using joins-----
select Name
from HumanResources.Department d
join HumanResources.EmployeeDepartmentHistory dh
on d.DepartmentID=dh.DepartmentID
where BusinessEntityID=46

---list the employeeid of city bothhell----
-----using joins-----
select BusinessEntityID, ea.AddressID
from Person.BusinessEntityAddress ea 
inner join Person.Address a
on ea.AddressID=a.AddressID
where City='Bothell'

----using subquery----
select BusinessEntityID
from Person.BusinessEntityAddress 
where AddressID in(select AddressID
from Person.Address 
where City='Bothell')
















