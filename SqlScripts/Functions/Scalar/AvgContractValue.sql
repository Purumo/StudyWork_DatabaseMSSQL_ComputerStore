USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[AvgContractValue]    Script Date: 10.05.2021 14:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат информации о средней стоимости заключённого договора за заданный период>
-- =============================================
--Usage:
/*
--Execute:
DECLARE @data1 date = '2017-08-01', @data2 date = '2017-08-15'
SELECT [dbo].[AvgContractValue] (@data1, @data2)
*/
CREATE FUNCTION [dbo].[AvgContractValue]
(
	@date1 date,
	@date2 date
)
RETURNS int
AS
BEGIN
	DECLARE @avg int
	SELECT @avg = ROUND(AVG(Договоры.Стоимость), 2) FROM Договоры
	WHERE Договоры.Дата BETWEEN @date1 AND @date2
	RETURN @avg
END

