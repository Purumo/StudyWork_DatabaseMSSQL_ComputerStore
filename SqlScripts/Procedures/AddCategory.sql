USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 10.05.2021 14:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление категории/подкатегории в dbo.Категории>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddCategory] 5, 'Видеокарты'
SELECT * FROM [dbo].[Категории]

--Clear work results:
DELETE FROM [dbo].[Категории] WHERE [Название] = 'Видеокарты'
SELECT * FROM [dbo].[Категории]
*/
CREATE PROCEDURE [dbo].[AddCategory] 
	@categoryTopId tinyint,
	@categoryName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  @newId int;
	SELECT TOP 1 @newId = Категории.Код_подкатегории FROM Категории 
	ORDER BY Категории.Код_подкатегории DESC;
	INSERT INTO Категории VALUES(@newId + 1, @categoryTopId, @categoryName)
END

