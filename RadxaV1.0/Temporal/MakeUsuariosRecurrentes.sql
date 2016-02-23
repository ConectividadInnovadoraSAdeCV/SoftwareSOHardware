USE [weon]
GO

/****** Object:  UserDefinedFunction [gps].[UsuariosRecurrentes]    Script Date: 02/10/2015 08:18:07 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Diego Orlando Lopez Aguirre
-- Create date: 2015 10 02
-- Description:	Usuarios recurrentes
-- =============================================
CREATE FUNCTION [gps].[UsuariosRecurrentes]
(	
	@Fecha as DATETIME
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT        Usuario, COUNT(ID) AS Recurrencia
	FROM            usr.Conexiones
	WHERE        (Fecha >= @Fecha)
	GROUP BY Usuario, Fecha
)

GO


