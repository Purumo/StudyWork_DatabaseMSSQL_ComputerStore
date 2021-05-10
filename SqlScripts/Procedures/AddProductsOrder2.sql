USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddProductsOrder2]    Script Date: 10.05.2021 14:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление информации о сбыте (продаже покупателю магазином) товаре со склада с использованием MERGE>
-- =============================================
CREATE PROCEDURE [dbo].[AddProductsOrder2] 
	@orderId int = NULL,
	@productId smallint,
	@quantity tinyint,
	@price money
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @newId int
	SET @newId = (SELECT TOP 1 Заказы.Номер_заказа FROM Заказы ORDER BY Заказы.Номер_заказа DESC) + 1

	MERGE Заказы
	USING (SELECT Сбыт.Номер_заказа FROM Сбыт GROUP BY Сбыт.Номер_заказа) AS src
	ON Заказы.Номер_заказа = src.Номер_заказа
	WHEN MATCHED THEN 
		UPDATE SET Сумма_заказа += @price * @quantity
	WHEN NOT MATCHED THEN
		INSERT VALUES (@newId, @price * @quantity, CAST(GETDATE() AS datetime));
	IF (SELECT count(Сбыт.Номер_заказа) FROM Сбыт WHERE Сбыт.Номер_заказа = @orderId AND Сбыт.Код_товара = @productId) = 0
		INSERT INTO Сбыт VALUES (@newId, @productId, @quantity, @price)
	ELSE
		UPDATE Сбыт SET Количество += @quantity, Цена = @price WHERE Сбыт.Номер_заказа = @orderId AND Сбыт.Код_товара = @productId
	UPDATE Склад SET Склад.Количество -= @quantity WHERE Склад.Код_товара = @productId;
END

