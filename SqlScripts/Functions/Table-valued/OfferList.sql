USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[OfferList]    Script Date: 10.05.2021 14:24:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы со списком предложений о поставке товаров для заданного производителя
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[OfferList] ('AMD')
*/
CREATE FUNCTION [dbo].[OfferList] 
(	
	@producerName varchar(40)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Предложения.Код_сделки AS [Код предложения],
	Производители.Название AS [Производитель],
	Предложения.Дата AS Дата
	FROM Предложения, Производители
	WHERE Производители.Код_производителя = Предложения.Код_производителя 
	AND @producerName = Производители.Название
)

