select*
from HumanResources.Employee

select*
from HumanResources.Employee
where  JobTitle='Design Engineer'or BusinessEntityID='15'

select*
from HumanResources.Employee
where SickLeaveHours>=35 and SickLeaveHours<78

select*
from HumanResources.Employee
where VacationHours between 46 and 68

select *
from HumanResources.Employee
where JobTitle='Buyer' or JobTitle='Network Manager' or JobTitle='Database Administrator'
or JobTitle='Information Services Manager'

select*
from HumanResources.Employee
where JobTitle in ('Buyer','Network Manager','Database Administration')

select *
from HumanResources.Employee
where CurrentFlag is  not null

select *
from HumanResources.Employee
Where JobTitle Like '%S'

select *
from HumanResources.Employee
where JobTitle Like '%ing'

select *
from HumanResources.Employee
where JobTitle Like '%cru%'


select *
from HumanResources.Employee
where JobTitle Like '%R' or JobTitle Like'%r'

select *
from HumanResources.Employee
where JobTitle Like 'R%r'

select *
from HumanResources.Employee
where JobTitle Like 'S___K%'

select*
from HumanResources.Employee
where JobTitle Like '[M-P%]'

select BusinessEntityID, JobTitle,VacationHours 
from HumanResources.Employee
where VacationHours>=34 and VacationHours<=67
order by JobTitle 

select BusinessEntityID, JobTitle,VacationHours 
from HumanResources.Employee
where VacationHours>=0 and VacationHours<=70
order by 2

select BusinessEntityID, JobTitle,VacationHours 'vh'
from HumanResources.Employee
where VacationHours>=50 and VacationHours<=70
order by vh

select sum(VacationHours) 'Total' , max(VacationHours) 'Maximum',
min(VacationHours) 'Minimum', count(*) '# of Records',
AVG(VacationHours) 'Average'
from HumanResources.Employee



select top 3 *
from HumanResources.Employee
order by VacationHours desc

select  top 7 with ties  * 
from HumanResources.EmployeePayHistory
order by Rate desc

select * 
from HumanResources.Employee
where JobTitle in ('Tool Designer','Design Engineer', 'Marketing Assistant',
'Marketing Manager')
order by JobTitle

select lower(left(JobTitle,1))+
upper(SUBSTRING(JobTitle,2,len(JobTitle)))
from HumanResources.Employee


select 'CHAITRALI'+Space(3)+'TAGDE'


select *
from HumanResources.Employee
Order by BusinessEntityID
OFFset 7 Rows
Fetch Next 10 Rows only


select getdate()
select BusinessEntityID,HireDate
from HumanResources.Employee

select BusinessEntityID,BirthDate,Gender,HireDate,MONTH(HireDate),
DATENAME(yy,HireDate),YEAR(Hiredate)
from HumanResources.Employee


Select  BusinessEntityID as EmployeeID,  
DATENAME(mm, Hiredate) + ','+CONVERT(varchar, Year(HireDate)) as Joining 
from HumanResources.Employee 

Select BusinessEntityID,BirthDate,Gender,HireDate,
Concat(DATENAME(mm,HireDate),',',YEAR(HireDate))
from HumanResources.Employee

select DB_ID('AdventureWorks2012')
select OBJECT_ID('HumanResources.Employee')
select HOST_ID()

select BusinessEntityID, HireDate , DATEDIFF(yy,HireDate,getdate()) 
'# of years'
from HumanResources.Employee

select  PayFrequency , Sum(Rate)				
from HumanResources.EmployeePayHistory			
where Rate>10							
group by PayFrequency					


select  PayFrequency , Sum(Rate)
from HumanResources.EmployeePayHistory
group by PayFrequency


select JobTitle, count(JobTitle)
from HumanResources.Employee
group by JobTitle

select Rate, ROUND(Rate,2) 'Round',
Floor(Rate) 'smallest integer',
CEILING(Rate) 'Largest integer' 
from HumanResources.EmployeePayHistory







