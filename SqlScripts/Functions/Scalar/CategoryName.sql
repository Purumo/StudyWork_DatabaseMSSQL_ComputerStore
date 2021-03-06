USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[CategoryName]    Script Date: 10.05.2021 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат названия категории/подкатегории по id>
-- =============================================
--Usage:
/*
--Execute:
SELECT [dbo].[CategoryName] (1)
*/
CREATE FUNCTION [dbo].[CategoryName] 
(
	@id tinyint
)
RETURNS nvarchar(50)
AS
BEGIN
	DECLARE @name nvarchar(50) = ''

	SELECT TOP 1 @name = Категории.Название
	FROM Категории 
	WHERE Категории.Код_подкатегории = @id

	RETURN @name
END

