USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[CountOrderGoods]    Script Date: 10.05.2021 14:28:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат количества товаров в заказе по id заказа>
-- =============================================
--Usage:
/*
--Execute:
SELECT [dbo].[CountOrderGoods] (3)
*/
CREATE FUNCTION [dbo].[CountOrderGoods] 
(
	@id int
)
RETURNS int
AS
BEGIN
	DECLARE @count int
	SELECT @count = COUNT(Сбыт.Номер_заказа) FROM Сбыт
	WHERE Сбыт.Номер_заказа = @id
	RETURN @count
END

