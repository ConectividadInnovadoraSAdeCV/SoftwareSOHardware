USE [weon]
GO

/****** Object:  View [gps].[WebStatus]    Script Date: 23/09/2015 03:25:38 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [gps].[WebStatus]
as
SELECT        ROW_NUMBER() OVER(ORDER BY Camion.Economico) AS ID,
			  Ruta.Descripcion AS Ruta, 
			  Camion.Economico, 
			  Camion.Rampa, 
			  gps.GetStatus(Camion.ID, 0) AS EstatusInternet, 
			  CASE WHEN DATEDIFF(dd,GETDATE(),gps.UbicacionActual.Fecha)=0 THEN 1 ELSE 0 END AS EstausGPS,
			  gps.GetStatus(Camion.ID, 1) AS E1, 
              gps.GetStatus(Camion.ID, 2) AS E2, 
			  gps.GetStatus(Camion.ID, 3) AS E3, 
			  gps.GetStatus(Camion.ID, 4) AS E4, 
			  gps.GetStatus(Camion.ID, 5) AS E5, 
              gps.GetStatus(Camion.ID, 6) AS E6, 
			  gps.GetStatus(Camion.ID, 7) AS E7, 
			  ISNULL(DerConexiones.Conexiones,0) AS Pasajeros
FROM            gps.Rutas AS Ruta WITH (nolock) 
						INNER JOIN gps.Camiones AS Camion WITH (NOLOCK) 
					ON Ruta.ID = Camion.Ruta 
						INNER JOIN gps.UbicacionActual 
					ON Camion.ID = gps.UbicacionActual.Camion
						LEFT JOIN	(
										SELECT        Camion, COUNT(Hora) AS Conexiones
										FROM            usr.Conexiones AS Con WITH (nolock)
										WHERE        (Fecha = CONVERT(DATETIME, CONVERT(NVARCHAR(10), GETDATE(), 20), 20))
										GROUP BY Camion
									) AS DerConexiones
					ON Camion.ID=DerConexiones.Camion

GO


