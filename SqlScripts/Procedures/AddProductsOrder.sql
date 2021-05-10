USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddProductsOrder]    Script Date: 10.05.2021 14:14:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление информации о сбыте (продаже покупателю магазином) товаре со склада>
-- =============================================
CREATE PROCEDURE [dbo].[AddProductsOrder] 
	@orderId int,
	@productId smallint,
	@quantity tinyint,
	@price money
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT Заказы.Номер_заказа FROM Заказы, Склад 
	WHERE Заказы.Номер_заказа = @orderId 
	AND Склад.Код_товара = @productId
	AND @quantity <= Склад.Количество
	AND @price <= Склад.Цена)
	BEGIN
	INSERT INTO Сбыт VALUES(@orderId, @productId, @quantity, @price)
	UPDATE Заказы SET Заказы.Сумма_заказа += @price * @quantity WHERE Заказы.Номер_заказа = @orderId
	UPDATE Склад SET Склад.Количество -= @quantity WHERE Склад.Код_товара = @productId
	END
END

