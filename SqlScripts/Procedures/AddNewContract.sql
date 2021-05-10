USE [CS]
GO
/****** Object:  StoredProcedure [dbo].[AddNewContract]    Script Date: 10.05.2021 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Diana Pavlova>
-- Description:	<Добавление контракта в dbo.Договоры (из dbo.Предложения)>
-- =============================================
-- Usage:
/*
--Execute:
EXEC [dbo].[AddNewContract] 7
SELECT * FROM [dbo].[Договоры]

--Clear work results:
DELETE FROM [dbo].[Договоры] WHERE [Код_сделки] = 7
SELECT * FROM [dbo].[Договоры]
*/
CREATE PROCEDURE [dbo].[AddNewContract] 
	@contractCode smallint
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT TOP 1 Предложения.Код_сделки FROM Предложения 
	WHERE Предложения.Код_сделки = @contractCode)
	BEGIN
	INSERT INTO Договоры VALUES(@contractCode, 0, CAST(GETDATE() AS datetime))
	END
END

