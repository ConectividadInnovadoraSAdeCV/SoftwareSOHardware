USE [weon]
GO
/****** Object:  UserDefinedFunction [gps].[GetStatus]    Script Date: 23/09/2015 03:10:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JUAN PABLO ALVAREZ DE LA CRUZ
-- Create date: 03/09/15
-- Description:	DEVUELVE EL ESTATUS DE UN CAMION DEVOLVIENDO LA FECHA DE HOY MENOS EL PARAMETRO
-- =============================================
ALTER FUNCTION [gps].[GetStatus]
(
	@Camion INT,
	@Dias INT
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar BIT

	--CASE WHEN CAST(TablaEstatus.Camion AS int) > 0 THEN 1 ELSE 0 END
	SELECT @ResultVar=Camion
	FROM            usr.Conexiones AS ConToday WITH (NOLOCK)
	WHERE        Camion =@Camion AND (Fecha = CONVERT(DATETIME, CONVERT(NVARCHAR(10), GETDATE(), 20), 20) - @Dias)

	SET @ResultVar= CASE WHEN CAST(@ResultVar AS int) > 0 THEN 1 ELSE 0 END

	-- Return the result of the function
	RETURN @ResultVar

END
