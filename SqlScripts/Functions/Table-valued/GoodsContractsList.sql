USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[GoodsContractsList]    Script Date: 10.05.2021 14:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы со информацией о товарах (код товара, 
-- название товара, количество, цена за шт.) по конкретной поставке>
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[GoodsContractsList] (5)
*/
CREATE FUNCTION [dbo].[GoodsContractsList] 
(	
	@conctractId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Поставки.Код_товара AS [Код товара],
	Комплектующие.Название AS Товар,
	Поставки.Количество AS Количество,
	Поставки.Цена AS [Цена за шт.]
	FROM Поставки
	INNER JOIN Комплектующие ON Поставки.Код_товара = Комплектующие.Код_товара
	AND @conctractId = Поставки.Код_сделки
)

