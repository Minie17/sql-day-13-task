select*
from HumanResources.Employee

select JobTitle,BusinessEntityID,LoginID,OrganizationLevel
from HumanResources.Employee

select *
from HumanResources.Employee
where OrganizationLevel=4

select*
from HumanResources.Employee
where BusinessEntityID=9

select Gender='F'
from HumanResources.Employee

select min(SickLeaveHours)
from HumanResources.Employee 


select max(VacationHours)
from HumanResources.Employee 


select VacationHours
from HumanResources.Employee
where BusinessEntityID=14

select BusinessEntityID as 'ID Number',
VacationHours as 'Holday Hours',
OrganizationLevel as 'OrgLevel',
'Join Date' = HireDate
from HumanResources.Employee



