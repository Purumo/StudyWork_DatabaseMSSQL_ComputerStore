USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddProductsContract]    Script Date: 10.05.2021 14:12:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление поставки товаров в dbo.Поставки>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddProductsContract] 9, 2, 3, 100000
SELECT * FROM [dbo].[Поставки]

--Clear work results:
DELETE FROM [dbo].[Поставки] WHERE [Код_сделки] = 9 AND [Код_товара] = 2 AND [Количество] = 3
SELECT * FROM [dbo].[Поставки]
*/
CREATE PROCEDURE [dbo].[AddProductsContract] 
	@contractCode smallint,
	@productId smallint,
	@quantity tinyint,
	@price money
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT Склад.Код_товара FROM Склад, Договоры, Список_товаров
	WHERE Склад.Код_товара = @productId
	AND Договоры.Код_сделки = @contractCode
	AND @quantity <= Список_товаров.Количество
	AND @price <= Список_товаров.Цена)
	BEGIN
	INSERT INTO Поставки VALUES(@contractCode, @productId, @quantity, @price, CAST(GETDATE() AS datetime))
	END
END

