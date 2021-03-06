USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[ManufacturersSumOrders]    Script Date: 10.05.2021 14:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы с информацией о заказах 
-- (название товара, количество товаров, сумма заказа, дата заказа)
-- =============================================
-- Usage:
/*
--Execute:
DECLARE @data1 date = '2017-08-01', @data2 date = '2017-08-15'
SELECT * FROM [dbo].[ManufacturersSumOrders] (@data1, @data2)
*/
CREATE FUNCTION [dbo].[ManufacturersSumOrders] 
(
	@date1 date, 
	@date2 date
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Производители.Название, 
	sum(Сбыт.Количество) AS [Количество товаров], 
	sum(Сбыт.Цена) AS [Сумма заказа], 
	Заказы.Дата AS Дата
	FROM Производители
	INNER JOIN Комплектующие ON Комплектующие.Код_подкатегории = Производители.Код_производителя
	INNER JOIN Склад ON Комплектующие.Код_товара = Склад.Код_товара
	INNER JOIN Сбыт ON Склад.Код_товара = Сбыт.Код_товара
	INNER JOIN Заказы ON Сбыт.Номер_заказа = Заказы.Номер_заказа 
	AND Дата BETWEEN @date1 AND @date2
	GROUP BY Производители.Название, Заказы.Дата
)

