USE [CS]
GO
/****** Object:  UserDefinedFunction [dbo].[GoodsInStock]    Script Date: 10.05.2021 14:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Возврат таблицы со информацией об оставшихся на складе товарах (код товара, 
-- производитель, название товара, категория, оставшееся количество, цена за шт.)>
-- =============================================
-- Usage:
/*
--Execute:
SELECT * FROM [dbo].[GoodsInStock] ('Ryzen 7', 'AMD', 'Комплектующие')
*/
CREATE FUNCTION [dbo].[GoodsInStock] 
(	
	@productName nvarchar(100) = '',
	@producerName varchar(40) = '',
	@categoryName nvarchar(50) = ''
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Склад.Код_товара AS [Код товара], 
	Производители.Название AS Производитель,
	Комплектующие.Название AS Название,
	Категории.Название AS Категория,
	Склад.Количество AS Количество,
	Склад.Цена AS [Цена за шт.]
	FROM Склад
	INNER JOIN Комплектующие ON Склад.Код_товара = Комплектующие.Код_товара
	INNER JOIN Производители ON Комплектующие.Код_производителя = Производители.Код_производителя
	INNER JOIN Категории ON Комплектующие.Код_подкатегории = Категории.Код_подкатегории
	WHERE NOT Склад.Количество = 0
	AND Комплектующие.Название LIKE @productName + '%'
	AND Производители.Название LIKE @producerName + '%'
	AND Категории.Название LIKE @categoryName + '%'
)