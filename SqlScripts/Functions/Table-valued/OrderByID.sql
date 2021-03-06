USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[OrderByID]    Script Date: 10.05.2021 14:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат информации о заданном заказе
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[OrderByID] (0)
*/
CREATE FUNCTION [dbo].[OrderByID] 
(	
	@orderId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT TOP 1 Заказы.Сумма_заказа AS [Суммы заказов], Заказы.Дата AS Дата
	FROM Заказы
	WHERE Заказы.Номер_заказа = @orderId
)

