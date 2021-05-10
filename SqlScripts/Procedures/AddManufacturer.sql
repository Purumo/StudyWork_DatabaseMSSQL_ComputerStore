USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddManufacturer]    Script Date: 10.05.2021 14:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление нового производителя в dbo.Производители>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddManufacturer] 'NVIDIA'
SELECT * FROM [dbo].[Производители]

--Clear work results:
DELETE FROM [dbo].[Производители] WHERE [Название] = 'NVIDIA'
SELECT * FROM [dbo].[Производители]
*/
CREATE PROCEDURE [dbo].[AddManufacturer] 
	@producerName varchar(40)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  @newId int;
	SELECT TOP 1 @newId = Производители.Код_производителя FROM Производители 
	ORDER BY Производители.Код_производителя DESC;
	INSERT INTO Производители VALUES(@newId + 1, @producerName)
END

