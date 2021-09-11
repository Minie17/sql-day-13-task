----------Rate--------
select BusinessEntityID,Rate,
ROW_NUMBER() over (order by Rate desc)'series',
RANK() over (order by Rate desc) 'rank',
DENSE_RANK() over(order by Rate desc)'WithoutGap'
from HumanResources.EmployeePayHistory

----------Analytical function------
create table empsales
(
productid int not null,
month int not null,
sales int not null
)
insert into EmpSales(productid,month,sales)
values (1,1,2000),(1,2,4500),(2,3,4800),(3,4,5600),(4,5,1500)
select*
from empsales


select month,sales 'Current Month',
Lag (Sales) over (order by Month) 'Next Month',
Lead(Sales)over(order by Month)'Previous Month'
from empsales

-------Joins-------
select BusinessEntityID,JobTitle,VacationHours
from HumanResources.Employee
where VacationHours<>Any(Select VacationHours
from HumanResources.Employee
where JobTitle='Recruiter')
order by VacationHours


select BusinessEntityID,JobTitle,VacationHours
from HumanResources.Employee
where VacationHours<>All(Select VacationHours
from HumanResources.Employee
where JobTitle='Recruiter')
order by VacationHours

select BusinessEntityID,JobTitle,VacationHours
from HumanResources.Employee
where VacationHours<all(Select VacationHours
from HumanResources.Employee
where JobTitle='Recruiter')
order by VacationHours


select BusinessEntityID,JobTitle,VacationHours
from HumanResources.Employee
where VacationHours<any(Select VacationHours
from HumanResources.Employee
where JobTitle='Recruiter')
order by VacationHours

select JobTitle, Vacationhours
from HumanResources.Employee e1
where JobTitle in ('Buyer','Recruiter') and
e1.VacationHours>(select avg(VacationHours)
from HumanResources.Employee e2
where e1.JobTitle=e2.JobTitle
)

------Batches-------
select @rate=max(Rate)
from HumanResources.EmployeePayHistory
print @rate
if (@rate>120)
begin 
print 'No need to revise'
end
go


-------stored procedures------
create proc prcSales
as
begin
select*
from empsales
end

exec prcSales

-----input parmeter-----
create proc prcMonthSales @m int
as
begin
select*
from empsales
where month=@m
end

exec prcMonthSales 3


create proc prcEmpTitle @title varchar(20)
as
begin
select BusinessEntityID,LoginID,Gender
from HumanResources.Employee
where JobTitle=@title
end

exec prcEmpTitle 'buyer'
---------display vactionhours as output for given JobTitle at runtime---
alter proc prcTitleVH @title varchar(16), @vh int output
as
begin
select @vh=VacationHours
from HumanResources.Employee
where JobTitle=@title
end

Declare @v int 
exec prcTitleVH 'Tool Designer', @v output
print @v

------display id,gender for the value JobTitle at runtime---
create proc prcEmpTtile @title varchar(17)
as
begin
select BusinessEntityID,LoginID,Gender
from HumanResources.Employee
where JobTitle=@title
end

exec prcEmpTitle 'buyer'

---display vh as output for given JobTitle at runtime---
alter proc prcTitleVH @title varchar(20), @vh int output
as
begin
select @vh=VacationHours
from JobTitle=@title
end

Declare @v int 
exec prcTitleVH 'Tool Designer', @v output
print @v


create proc prcEmpname @e int 
as
begin
select Name
from HumanResources.Department d
where DepartmentID=(select DepartmentID
from HumanResources.EmployeeDepartmentHistory
where BusinessEntityID=@e)
end

exec prcEmpDName 12

-----creating a proc which will create a table and insert values by calling it---
create proc prcInsert
(
@sampleid int,
@samplename varchar(20)
)
as
begin
declare @tblSample Table(id int, Name varchar(20))
insert into @tblSample (id,Name) values(@sampleid,@samplename)
select * from @tblSample
end
go

---create another proc and call the previous proc---
create proc prcCall @sid int, @sname varchar(20)
as
begin
exec prcInsert @sampleid=@sid, @samplename =@sname
end

exec prcCall 3,'Sample3'






