USE MusicService
GO


CREATE TRIGGER Account_INSERT
ON Accounts
AFTER INSERT
AS 
	INSERT INTO Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Account added: ' + inserted.Email + ' Role: ' + Roles.Title
	FROM inserted, Roles, Accounts
	WHERE Roles.Id = Accounts.Role_id

GO


CREATE TRIGGER Account_DELETE
ON Accounts
AFTER DELETE
AS
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Account deleted: ' + deleted.Email + 'Role: ' + Roles.Title
	FROM deleted, Roles, Accounts
	WHERE Roles.Id  = Accounts.Role_id

GO
CREATE TRIGGER Album_INSERT
ON Albums
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Album added: ' + inserted.Title 
	FROM inserted

GO
CREATE TRIGGER Album_DELETE
ON Albums
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Album deleted: ' + deleted.Title
	FROM deleted

GO
CREATE TRIGGER Songs_INSERT
ON Songs
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Song added: ' + inserted.Title
	FROM inserted

GO
CREATE TRIGGER Songs_DELETE
ON Songs
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Song deleted: ' + deleted.Title
	FROM deleted

DROP TRIGGER Songs_DELETE

GO
CREATE TRIGGER Genres_INSERT
ON Genres
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Genre added: ' + inserted.Title 
	FROM inserted

GO
CREATE TRIGGER Genres_DELETE
ON Genres
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Genre deleted: ' + deleted.Title 
	FROM deleted

GO
INSERT INTO Songs(Title, Date_of_writing) VALUES ('Song', '2020-01-01')

DELETE Songs WHERE Title = 'Song'

SELECT * FROM Songs

SELECT * fROM Logs

SELECT * FROM Albums

EXEC AddAlbum 'Album', '2022-01-01'

DROP TRIGGER Album_INSERT