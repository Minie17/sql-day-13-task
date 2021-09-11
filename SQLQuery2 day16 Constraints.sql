create database TQdb
use TQdb 
create table Student 
(
StudentID int Identity (1,1)not null,
Studentname varchar(10) not null,
)

insert into Student (Studentname) values('Chaitrali'),('Anju'),('Shivani'),
('Shradha'),('Ujwala')

select*
from Student

drop table Student 

alter table Student 
add constraint pkstudid primary key (StudentID)

delete from Student where StudentID=3

insert into Student (Studentname)values('palu')

set Identity_Insert Student ON
Insert into Student (StudentID,Studentname) values(3,'Shiv')

create table ScienceLab
(
InstID varchar(40) not null,
InstName varchar (30) not null,
chemicalName varchar(20) not null,

StudentID int constraint fkstudid Foreign key references Student (StudentID),
DateIssue date constraint date default getdate(),
Returndays int constraint chkday check (Returndays<=3),

)
insert into ScienceLab (InstID, InstName,chemicalName,StudentID)
values('Sci002','Glass jar','null','2')

insert into Sciencelab (InstID,InstName,chemicalName,StudentID)
values ('Sci004','tube','h2so','3')

select *
from ScienceLab

update ScienceLab
set Returndays=5
where InstID='Sci002'

alter table ScienceLab
add ReturnDate date constraint dfreturn default getdate()

update ScienceLab
set ReturnDate =DATEADD(dd,5,DateIssue)
where InstID='Sci002'

alter table ScienceLab
drop column ReturnDays

alter table ScienceLab
drop constraint chkday

sp_rename 'ScienceLab.InstID','InstNo.','column'


sp_rename 'ScienceLab','Chemicalstore'

sp_rename'TQdb','ThinkQuotientdb'

sp_help Chemicalstore

sp_help 


sp_help ThinkQuotientdb