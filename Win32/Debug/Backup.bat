"C:\Program Files (x86)\MySQL\MySQL Server 5.1\bin\mysqldump.exe" -u root --password=root --databases cartorio > "C:\DB_Backups\cartorio_%date:~-4,4%%date:~-7,2%%date:~-10,2%-%time:~0,2%%time:~3,2%.sql"