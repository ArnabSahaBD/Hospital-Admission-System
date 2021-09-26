Alter login sa with password = '12345'

Alter login sa enable

Create Database ProjectHospitalAdmission;

Use ProjectHospitalAdmission;

--drop table NewPatientTable

drop table NewPatientTable
drop table DoctorTable
drop table BedTable
drop table ChargeTable
drop table DoctorAvailability
drop table InpatientTable
drop table PatientAssigned
drop table ChargeTable

create table NewPatientTable(
PatientID int Identity(0020001,1) not null primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
Gender varchar(50) not null,
Age INT not null,
BloodGroup varchar(50)not null,
DateOfBirth varchar(50) not null,
Height float null,
Weight float not null,
MartialStatus varchar(50) not null,
Occupation varchar(50) not null,
NameFather varchar(50) null,
NameMother varchar(50) null,
PresentAddress varchar(1000) not null,
ContactNo varchar(50) not null unique,
Diseases varchar(1000) not null
);
select * from NewPatientTable

truncate table  NewPatientTable




create table DoctorTable(

     DoctorID  int Identity(3001,1) not null primary key,
	 DoctorName varchar(50) not Null,
	 DotorDesignation varchar(50) null,
	 Department varchar(50) not null,
	 PhoneNo varchar(50) not null,
	 DEmail varchar(50) not null,
	 JoinigDate varchar(50) not null,
	
);


select * from DoctorTable

create table DoctorAvailability(
DoctorID  int not null foreign key references DoctorTable(DoctorID),
DoctorName varchar(50) not null ,
WardA varchar(50) not null,
WardB varchar(50) not null,
WardC varchar(50) not null,
ICU varchar(50) not null,
CCU varchar(50) not null,
OperationTheatre varchar(50) not null,

);

select * from DoctorAvailability



--drop table InpatientTable

create table InpatientTable(
    AdmissionNo Int Identity(004001,1) not null primary key,
	PatientId int not null foreign key references NewPatientTable(PatientID),
	PatientName varchar(50) not null,
	RefDoctorID int not null foreign key references DoctorTable(DoctorID),
	RefDepartment varchar(50) not null,
	DateOfAdmission date not null,
    WardName varchar(50) not null,
	Block varchar(50) not null,
	BedNo varchar(50)  not null,
	BedType varchar(50)not  null,
	AttendantName Varchar(50) Not Null,
    Address Varchar(50) Not Null,
    ContactNo Varchar(50) Not Null
);

select * from InpatientTable

truncate table InpatientTable



select PatientId,PatientName,RefDepartment,WardName,Block,BedNo,BedType INTO PatientAssigned FROM InpatientTable

truncate table PatientAssigned

select * from PatientAssigned

--drop table BEDTable


create table BedTable(
    WardName varchar(50) not null,
    BedNo varchar(50) primary key,
	BedType varchar(50)not  null,
	BedStatus varchar(50)

);

SELECT COUNT(*)  FROM BEDTable

truncate table BedTable

select * from BEDTable




create table  ChargeTable(
     BillNo int Identity(005001,1)  primary key,
	 PatientID int not null foreign key references NewPatientTable(PatientID),
	 BillType varchar(50) not null,
	 DischargeDate varchar(50),
	 BedNo varchar(50),
	 BedCharge  decimal(7,2) null,
	 CabinCharge decimal(7,2)  null,
	 NursingCharge decimal(7,2) not null,
	 DoctorCharge decimal(7,2)  not null,
	 OtherExpenses decimal(7,2)  not null,
	 AdvancePayment decimal(7,2) check (AdvancePayment>=3000.00),
	 Due decimal(7,2) null,
	 PaymentDate varchar(50)  null 

);

      select * from ChargeTable

	  truncate table ChargeTable





SELECT InpatientTable.PatientId,InpatientTable.DateOfAdmission,BEDTable.WardName,BEDTable.BedNo,BEDTable.BedType,ChargeTable.DischargeDate from BedTable join InpatientTable on BedTable.BedNo=InPatientTable.BedNo join ChargeTable on BedTable.BedNo=ChargeTable.BedNo





 
  