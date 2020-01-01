-- If 'hotels' database exits, disconnect and delete it

DECLARE @DBName varchar(50) = 'hotels'

WHILE EXISTS(select NULL from sys.databases where name = @DBName )
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';' FROM MASTER..SysProcesses WHERE DBId = DB_ID(@DBName) AND SPId <> @@SPId
    EXEC(@SQL)
    EXEC('DROP DATABASE ' + @DBName)
END
GO

-- create new and empty 'hotels' database

CREATE DATABASE hotels
GO
