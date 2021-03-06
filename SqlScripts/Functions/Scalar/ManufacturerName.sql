USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[ManufacturerName]    Script Date: 10.05.2021 14:29:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат названия производителя по id>
-- =============================================
--Usage:
/*
--Execute:
SELECT [dbo].[ManufacturerName] (7)
*/
CREATE FUNCTION [dbo].[ManufacturerName] 
(
	@id tinyint
)
RETURNS nvarchar(50)
AS
BEGIN
	DECLARE @name nvarchar(50) = ''

	SELECT TOP 1 @name = Производители.Название
	FROM Производители 
	WHERE Производители.Код_производителя = @id

	RETURN @name
END

