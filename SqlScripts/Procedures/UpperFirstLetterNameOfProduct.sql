USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[UpperFirstLetterNameOfProduct]    Script Date: 10.05.2021 14:19:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Корректировка названия комплектующего (преобразование первой буквы в верхний регистр) в dbo.Комплектующие>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[UpperFirstLetterNameOfProduct] 4
SELECT * FROM [dbo].[Комплектующие]

--Clear work results:
UPDATE [dbo].[Комплектующие] SET [Название] = 'mi Band 3' WHERE [Код_товара] = 4
SELECT * FROM [dbo].[Комплектующие]
*/
CREATE PROCEDURE [dbo].[UpperFirstLetterNameOfProduct]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @letter CHAR
	SELECT @letter = SUBSTRING(dbo.Комплектующие.Название, 1, 1) 
	FROM dbo.Комплектующие WHERE dbo.Комплектующие.Код_товара = @id

	UPDATE dbo.Комплектующие SET dbo.Комплектующие.Название = 
	STUFF(dbo.Комплектующие.Название, 1, 1, UPPER(@letter))
	WHERE dbo.Комплектующие.Код_товара = @id
END

