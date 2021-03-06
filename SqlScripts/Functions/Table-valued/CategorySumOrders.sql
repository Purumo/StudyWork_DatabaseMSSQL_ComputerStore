USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[CategorySumOrders]    Script Date: 10.05.2021 14:20:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы с суммой заказов и количеством товаров по категориям в промежутке времени на основе данных из dbo.Сбыт>
-- =============================================
-- Usage:
/*
--Execute:
DECLARE @data1 date = '2017-08-01', @data2 date = '2017-08-15'
SELECT * FROM [dbo].[CategorySumOrders] (@data1, @data2)
*/
CREATE FUNCTION [dbo].[CategorySumOrders] 
(
	@date1 date, 
	@date2 date
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Категории.Название, 
	sum(Сбыт.Количество) AS [Количество товаров], 
	sum(Сбыт.Цена) AS [Сумма заказов], 
	Заказы.Дата AS Дата
	FROM Категории
	INNER JOIN Комплектующие ON Комплектующие.Код_подкатегории = Категории.Код_подкатегории
	INNER JOIN Склад ON Комплектующие.Код_товара = Склад.Код_товара
	INNER JOIN Сбыт ON Склад.Код_товара = Сбыт.Код_товара
	INNER JOIN Заказы ON Сбыт.Номер_заказа = Заказы.Номер_заказа 
	AND Дата BETWEEN @date1 AND @date2
	GROUP BY Категории.Название, Заказы.Дата
)
