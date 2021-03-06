USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[Subcategories]    Script Date: 10.05.2021 14:25:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Получение списка подкатегорий для заданной категории/подкатегории>
-- =============================================
--Usage:
/*
--Execute:
SELECT * FROM [dbo].[Subcategories](2)
*/
CREATE FUNCTION [dbo].[Subcategories] 
(	
	@categoryId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Категории.Код_подкатегории AS [Код подкатегории], 
	Категории.Название AS Название
	FROM Категории
	WHERE @categoryId = Код_категории
)

