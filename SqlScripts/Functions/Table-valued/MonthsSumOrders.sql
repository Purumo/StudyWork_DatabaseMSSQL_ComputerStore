USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[MonthsSumOrders]    Script Date: 10.05.2021 14:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы с разбиением суммы заказов по месяцам в заданном годовом промежутке времени>
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[MonthsSumOrders] (2012, 2017)
*/
CREATE FUNCTION [dbo].[MonthsSumOrders] 
(
	@year1 int,
	@year2 int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT sum(Заказы.Сумма_заказа) AS [Сумма заказов], 
	MONTH(Заказы.Дата) AS Месяц, YEAR(Заказы.Дата) AS Год
	FROM Заказы
	WHERE YEAR(Заказы.Дата) BETWEEN @year1 AND @year2
	GROUP BY MONTH(Заказы.Дата), YEAR(Заказы.Дата)	
)

