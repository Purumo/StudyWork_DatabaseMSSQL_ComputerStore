USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[ContractInfo]    Script Date: 10.05.2021 14:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат информации по договору о поставке товаров (имя производителя, стоимость и дата заключения договора)>
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[ContractInfo] (5)
*/
CREATE FUNCTION [dbo].[ContractInfo] 
(	
	@conctractId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Договоры.Код_сделки AS [Код договора],
	Производители.Название AS Производитель,
	Договоры.Стоимость AS [Стоимость договора],
	Договоры.Дата AS Дата
	FROM Договоры, Производители, Предложения
	WHERE @conctractId = Договоры.Код_сделки
	AND Договоры.Код_сделки = Предложения.Код_сделки
	AND Предложения.Код_производителя = Производители.Код_производителя
)

