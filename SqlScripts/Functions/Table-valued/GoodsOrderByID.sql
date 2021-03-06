USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[GoodsOrderByID]    Script Date: 10.05.2021 14:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы со списком товаров конкретного заказа на основе данных из dbo.Сбыт>
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[GoodsOrderByID] (3)
*/
CREATE FUNCTION [dbo].[GoodsOrderByID] 
(	
	@orderId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Сбыт.Код_товара AS [Код товара], 
	Производители.Название AS Производитель,
	Комплектующие.Название AS Название, 
	Сбыт.Количество AS Количество, 
	sum(Сбыт.Цена*Сбыт.Количество) AS [Сумма за позицию]
	FROM Сбыт
	INNER JOIN Комплектующие ON Комплектующие.Код_товара = Сбыт.Код_товара AND Сбыт.Номер_заказа = @orderId
	INNER JOIN Производители ON Производители.Код_производителя = Комплектующие.Код_производителя
	GROUP BY Сбыт.Код_товара, Производители.Название, Комплектующие.Название, Сбыт.Количество, Сбыт.Цена, Сбыт.Количество
)

