USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddNewOrder]    Script Date: 10.05.2021 14:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление заказа покупателя в dbo.Заказы>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddNewOrder]
SELECT * FROM [dbo].[Заказы]

--Clear work results:
DELETE FROM [dbo].[Заказы] WHERE [Номер_заказа] = 12
SELECT * FROM [dbo].[Заказы]
*/
CREATE PROCEDURE [dbo].[AddNewOrder] 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  @newId int;
	SELECT TOP 1 @newId = Заказы.Номер_заказа FROM Заказы ORDER BY Заказы.Номер_заказа DESC;
	INSERT INTO Заказы VALUES (@newId + 1, 0, CAST(GETDATE() AS datetime))
END

