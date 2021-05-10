USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddNewOffer]    Script Date: 10.05.2021 14:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление предложения о поставке в dbo.Предложения>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddNewOffer] 5
SELECT * FROM [dbo].[Предложения]

--Clear work results:
DELETE FROM [dbo].[Предложения] WHERE [Код_сделки] = 5
SELECT * FROM [dbo].[Предложения] 
*/
CREATE PROCEDURE [dbo].[AddNewOffer] 
	@producerId tinyint
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT TOP 1 Производители.Код_производителя FROM Производители 
	WHERE Производители.Код_производителя = @producerId)
	BEGIN
	DECLARE @newId int;
	SELECT TOP 1 @newId = Предложения.Код_сделки FROM Предложения ORDER BY Предложения.Код_сделки DESC;
	INSERT INTO Предложения VALUES (@newId + 1, @producerId, CAST(GETDATE() AS datetime))
	END
END

