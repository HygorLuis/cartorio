: MySQl DB user
SET dbuser=root

:: MySQl DB users password
SET dbpass=root

:: Switch to the MySQL data directory and collect the folder names
PUSHD "C:\ProgramData\MySQL\MySQL Server 5.1\data"

FOR /D %%F IN (*) DO ("C:\Program Files (x86)\MySQL\MySQL Server 5.1\bin\mysqldump.exe" -f -u %dbuser% -p%dbpass% -P 3306 %%F > "C:\DB_Backups\%%F_%date:~-4,4%%date:~-7,2%%date:~-10,2%.sql")

