---Viewing the dataset.  
Select *
from HRCompanyData

Select *
from Diversity

Select *
from Job_profile_mapping

--Cleaning dataset 
Update HRCompanyData
Set Job_Title = Replace (Job_title, '"','')

Update Job_profile_mapping
Set Job_Title = Replace (Job_title, '"','')

--creating new columnn
Alter table HRcompanyData
Add Active_2023_status varchar(1)

Alter table Hrcompanydata
alter column Termination_date date

Alter table Hrcompanydata
add Today date

Update HRCompanyData
Set Today = GETDATE()

Update HRCompanyData
Set Active_2023_status = Case 
                         When Termination_Date > Today then 1
						 Else 0
						 end

 --- Querying Datasets for desired column for Dashboard.
 
 Select HR.EmployeeID, 
 HR.City, 
 HR.StateFull,
 HR.ZipCode,
 HR.CountryFull, 
 HR.Age, 
 HR.Office, 
 HR.Office_Type,
 HR.Start_Date, 
 HR.Termination_Date, 
 HR.Active_2023_status,
 D.Gender, 
 HR.Department, 
 d.Education, 
 d.Race_Ethnicity, 
 HR.Level, 
 HR.Salary, 
 HR.Job_title, 
 J.Job_Profile
 From HRCompanyData HR Join Diversity D On HR.EmployeeID = D.EmployeeID
 Join Job_profile_mapping J On HR.Job_Profile = J.Job_Profile
 where HR.EmployeeID = D.EmployeeID
 And HR.Job_Profile = J.Job_Profile
