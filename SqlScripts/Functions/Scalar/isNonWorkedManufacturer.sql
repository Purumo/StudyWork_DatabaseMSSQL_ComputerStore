USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[isNonWorkedManufacturer]    Script Date: 10.05.2021 14:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат информации о том, помечен ли заданный производитель по id как неработающий>
-- =============================================
--Usage:
/*
--Execute:
SELECT [dbo].[isNonWorkedManufacturer] (3)
*/
CREATE FUNCTION [dbo].[isNonWorkedManufacturer] 
(
	@id int
)
RETURNS bit
AS
BEGIN
	DECLARE @isNonWorked int = 0
	SELECT @isNonWorked = CHARINDEX(' Non-Worked', dbo.Производители.Название) 
	FROM dbo.Производители WHERE dbo.Производители.Код_производителя = @id

	IF @isNonWorked = 0 RETURN 0
	ELSE RETURN 1
	RETURN NULL
END
