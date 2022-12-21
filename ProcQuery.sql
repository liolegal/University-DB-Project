Use MusicService

GO
CREATE PROC AddAccount 
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	INSERT INTO Accounts(Email, Password, Role_id)
	VALUES (
			@email, 
			@password, 
			(SELECT Roles.Id FROM Roles WHERE Roles.Title = @roleTitle)
		   )  
GO

CREATE PROC AddVisitor

	@name VARCHAR(200),
	@nickname VARCHAR(20),
	@dateBirth DATE,
	
	
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS

	EXEC AddAccount @email, @password, @roleTitle

	INSERT INTO Visitors(Name, Nickname, Date_of_birth, Account_id)
	VALUES (
		@name,
		@nickname,
		@dateBirth,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))
		 
	)

GO


CREATE PROC AddArtist  

	@name VARCHAR(200),
	@alias VARCHAR(100),
	@dateBirth DATE,


	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	EXEC AddAccount @email, @password, @roleTitle

	INSERT INTO Artists(Name, Alias, Date_of_birth, Account_id)
	VALUES(
		@name, 
		@alias,
		@dateBirth,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))
		)
GO


CREATE PROC AddGroup
	@title VARCHAR(100),
	@foundingDate DATE,
	@numberArtist INT,

	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	EXEC AddAccount @email, @password, @roleTitle
	
	INSERT INTO Groups(Title, Founding_date, Number_of_artist, Account_id)
	VALUES(
		@title,
		@foundingDate, 
		@numberArtist,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))		
		)
GO

CREATE PROC AddSong
	@title VARCHAR(100),
	@dateWriting DATE
AS
	INSERT INTO Songs(Title, Date_of_writing)
	VALUES (@title, @dateWriting)
GO

CREATE PROC AddGenre
	@title VARCHAR(100)
AS
	INSERT INTO Genres(Title) VALUES (@title)
GO

CREATE PROC AddAlbum
	@title VARCHAR(100), 
	@dateWriting DATE
AS
	INSERT INTO Albums(Title, Date_of_writing) VALUES (@title, @dateWriting)
GO


CREATE PROC RemoveAccount 
	@email VARCHAR(100)
AS
	DELETE Accounts
	WHERE Email = @email
GO

CREATE PROC RemoveSong
	@title VARCHAR(100)
AS
	DELETE Songs
	WHERE Title = @title
GO

CREATE PROC RemoveAlbum
	@title VARCHAR(100)
AS
	DELETE Albums
	WHERE Title = @title
GO

CREATE PROC RemoveGenre
	@title VARCHAR(100)
AS
	DELETE Genres
	WHERE Title = @title
GO