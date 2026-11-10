SchoolMS - Visual Studio 2022 Setup
===================================

PROJECT TYPE
ASP.NET Web Forms / C# / .NET Framework 4.7.2 / SQL Server LocalDB.
Open schoolms.sln in Visual Studio 2022.

REQUIRED VISUAL STUDIO COMPONENTS
- ASP.NET and web development workload
- .NET Framework 4.7.2 targeting/developer pack
- SQL Server Data Tools (recommended for SQL Server Object Explorer)

DATABASE SETUP
1. Open Visual Studio 2022.
2. View -> SQL Server Object Explorer.
3. Find (localdb)\MSSQLLocalDB.
4. Right-click it -> New Query.
5. Open SchoolMS_Database.sql from this project and Execute.
6. The script is idempotent: it creates/upgrades the SchoolMS database and seeds demo data.

APPLICATION SETUP
1. Open schoolms.sln.
2. Build -> Rebuild Solution.
3. Press F5 (IIS Express).
4. Open Login.aspx if Visual Studio does not choose a start page automatically.

DATABASE CONNECTION
Web.config uses:
Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=SchoolMS;Integrated Security=True;

For SQL Express instead, edit the "constr" connection string in Web.config.

DEMO LOGINS
Admin:
  Email: admin@school.com
  Password: Admin@123

Teacher:
  Email: teacher@school.com
  Password: Teacher@123

Student:
  Enrollment: ENR001
  Password: Student@123

WORKING MODULES
Admin:
  Login/Register, Dashboard, Student CRUD, Teacher CRUD, Courses, Class timetable.

Teacher:
  Login, Dashboard, Profile, Classes/weekly schedule, Assignments, Communication, Teacher Schedule.

Student:
  Login, Dashboard, Profile, Schedule, Fees, Exams.

NOTES
- The old App_Data/SchoolMS.mdf and .ldf files are included only as legacy project artifacts. The application uses the named LocalDB database from Web.config; the SQL script is the source of truth.
- The previous CodeDom NuGet dependency was removed so the project does not fail because a packages folder is missing. Visual Studio's normal ASP.NET/.NET Framework compiler is used.
