select*
from StudentInfo

create table stu
(
 mail varchar(40),
 mobileNumber int,
 deptmentname varchar(20)
 )
  insert into stu
  (mail,mobileNumber,deptmentname)
  values
  ('chaitrali@gmail.com',346577737,'CSE'),
  ('anjali@gmail.com',3663487384,'IT'),
  ('ujwala@gmail.com',3667733778,'EE'),
  ('smita@gmail.com',67588869699,'ETC')

  select deptmentname
  from stu
  where Name ='Anjali'

  select mail
  from stu 
  where deptmentname='IT'

  select*
  from stu

  select deptmentname
  from stu
  where mail=(
  select mail
  from  stu where deptmentname='CSE'
              )

///Joins

select*
from HumanResources.Employee


select Name
from HumanResources.Employee Department  d Join
HumanResources.EmployeeDepartmentHistory edh
on d.DepertmentID=edh.DepartmentID
where edh.BusinessEntityID=46

select BusinessEntityID, ea.AddressID
from Person.BusinessEntityAddress ea
inner join Person.Address a
on ea.AddressID=a.AddressID
where City='Bothell'
order by ea.AddressID


select BusinessEntityID
from Person.BusinessEntityAddress
where AddressID in(
select AddressID
from Person.Address
where city='Bothell')


Select emp.BusinessEntityID, JobTitle, Rate
from HumanResources.Employee emp inner join
HumanResources.EmployeePayHistory eph
on emp.BusinessEntityID=eph.BusinessEntityID
where Rate>40

select Distinct sp.ProductID, sd.SpecialOfferID, UnitPrice
from Sales.SpecialOfferProduct sp 
left outer join
Sales.SalesOrderDetail sd
on sp.ProductID=sd.ProductID

select Name
from HumanResources.Department d inner join
HumanResources.EmployeeDepartmentHistory ed on d.DepartmentID=ed.DepartmentID
join Person.EmailAddress ea on ed.BusinessEntityID=ea.BusinessEntityID
where ea.EmailAddress='ken0@adventure-works.com'

select Name
from HumanResources.Department
where DepartmentID=(Select DepartmentID
from HumanResources.EmployeeDepartmentHistory
where BusinessEntityID=(Select BusinessEntityID
from Person.EmailAddress
where EmailAddress='ken0@adventure-works.com'))







