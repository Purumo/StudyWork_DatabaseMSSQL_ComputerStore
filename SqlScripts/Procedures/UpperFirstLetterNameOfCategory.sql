USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[UpperFirstLetterNameOfCategory]    Script Date: 10.05.2021 14:18:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Корректировка названия категории (подкатегории) (преобразование первой буквы в верхний регистр) в dbo.Категории>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[UpperFirstLetterNameOfCategory] 9
SELECT * FROM [dbo].[Категории]

--Clear work results:
UPDATE [dbo].[Категории] SET [Название] = 'игровые' WHERE [Код_подкатегории] = 9
SELECT * FROM [dbo].[Категории]
*/
CREATE PROCEDURE [dbo].[UpperFirstLetterNameOfCategory]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @letter CHAR
	SELECT @letter = LEFT(dbo.Категории.Название, 1) 
	FROM dbo.Категории WHERE dbo.Категории.Код_подкатегории = @id
	
	UPDATE dbo.Категории SET dbo.Категории.Название = 
	STUFF(dbo.Категории.Название, 1, 1, UPPER(@letter))
	WHERE dbo.Категории.Код_подкатегории = @id
END

