USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[SetNonWorkedManufacturer]    Script Date: 10.05.2021 14:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Указание производителя как неработающего в dbo.Производители>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[SetNonWorkedManufacturer] 3
SELECT * FROM [dbo].[Производители]

--Clear work results:
EXEC [dbo].[CancelNonWorkedManufacturer] 3
SELECT * FROM [dbo].[Производители]
*/
CREATE PROCEDURE [dbo].[SetNonWorkedManufacturer]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Производители SET dbo.Производители.Название += SPACE(1) + 'Non-Worked'
	WHERE dbo.Производители.Код_производителя = @id
END
