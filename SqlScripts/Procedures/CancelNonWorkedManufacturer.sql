USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[CancelNonWorkedManufacturer]    Script Date: 10.05.2021 14:16:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Отмена указания производителя как неработающего в dbo.Производители>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[CancelNonWorkedManufacturer] 2
SELECT * FROM [dbo].[Производители]

--Clear work results:
EXEC [dbo].[SetNonWorkedManufacturer] 2
SELECT * FROM [dbo].[Производители]
*/
CREATE PROCEDURE [dbo].[CancelNonWorkedManufacturer]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Производители SET dbo.Производители.Название =
	REPLACE(dbo.Производители.Название, ' Non-Worked', '')
	WHERE dbo.Производители.Код_производителя = @id
END

