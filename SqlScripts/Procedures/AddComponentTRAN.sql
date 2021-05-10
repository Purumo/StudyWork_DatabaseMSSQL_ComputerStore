USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddComponentTRAN]    Script Date: 10.05.2021 14:08:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление комплектующего в dbo.Комплектующие с обработкой ошибок>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddComponentTRAN] 'Ryzen 9', 5, 0
SELECT * FROM [dbo].[Комплектующие]

--Clear work results:
DELETE FROM [dbo].[Комплектующие] WHERE [Название] = 'Ryzen 9'
SELECT * FROM [dbo].[Комплектующие]
*/
CREATE PROCEDURE [dbo].[AddComponentTRAN] 
	@productName nvarchar(100),
	@categoryId tinyint,
	@producerId tinyint
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN;

		DECLARE  @newId int;

		SELECT TOP 1 @newId = Комплектующие.Код_товара 
		FROM Комплектующие ORDER BY Комплектующие.Код_товара DESC;

		INSERT INTO Комплектующие 
		VALUES(@newId + 1, @productName, @categoryId, @producerId)

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS [Номер ошибки],
				ERROR_PROCEDURE() AS [Имя процедуры],
				 ERROR_MESSAGE() AS [Текст ошибки]
		ROLLBACK TRAN;
	END CATCH
END

