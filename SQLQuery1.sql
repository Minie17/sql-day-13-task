create Database Student
use Student 
  create table StudentDetalis(
  studentID int primary key,
  EnNum  varchar(50),Name varchar(50),location varchar(50)
  )

insert into StudentDetalis(studentID, EnNum, Name, location)
values(1,'s001','chaitrali','Nagpur')

