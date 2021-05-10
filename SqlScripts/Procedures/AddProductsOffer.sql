USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddProductsOffer]    Script Date: 10.05.2021 14:13:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление товаров в dbo.Список_товаров для предложения о поставке>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddProductsOffer] 9, 5, 4, 50000
SELECT * FROM [dbo].[Список_товаров]

--Clear work results:
DELETE FROM [dbo].[Список_товаров] WHERE [Код_товара] = 9 AND [Код_сделки] = 5 AND [Количество] = 4
SELECT * FROM [dbo].[Список_товаров]
*/
CREATE PROCEDURE [dbo].[AddProductsOffer] 
	@offerCode smallint,
	@productId smallint,
	@quantity tinyint,
	@price money
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT Предложения.Код_сделки FROM Комплектующие, Предложения
	WHERE Комплектующие.Код_товара = @productId
	AND Предложения.Код_сделки = @offerCode)
	BEGIN
	INSERT INTO Список_товаров VALUES(@offerCode, @productId, @quantity, @price)
	END
END

