USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddProductsStock]    Script Date: 10.05.2021 14:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление товаров в dbo.Склад>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddProductsStock] 6
SELECT * FROM [dbo].[Склад]

--Clear work results:
DELETE FROM [dbo].[Склад] WHERE [Код_товара] = 6
SELECT * FROM [dbo].[Склад]
*/
CREATE PROCEDURE [dbo].[AddProductsStock] 
	@productId smallint
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT Комплектующие.Код_товара FROM Комплектующие 
	WHERE Комплектующие.Код_товара = @productId)
	BEGIN
	INSERT INTO Склад VALUES(@productId, 0, 0)
	END 
END

