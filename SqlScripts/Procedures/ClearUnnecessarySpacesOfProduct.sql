USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[ClearUnnecessarySpacesOfProduct]    Script Date: 10.05.2021 14:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Корректировка названия комплектующего (удаление лишних пробелов) в dbo.Комплектующие>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[ClearUnnecessarySpacesOfProduct] 0
SELECT * FROM [dbo].[Комплектующие]

--Clear work results:
UPDATE [dbo].[Комплектующие] SET [Название] = '     Ryzen 7    ' WHERE [Код_товара] = 0
SELECT * FROM [dbo].[Комплектующие]
*/
CREATE PROCEDURE [dbo].[ClearUnnecessarySpacesOfProduct]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Комплектующие SET dbo.Комплектующие.Название = LTRIM(RTRIM(dbo.Комплектующие.Название))
	WHERE dbo.Комплектующие.Код_товара = @id
END

