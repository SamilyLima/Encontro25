--Crie uma Store Procedure, cujo par�metro de entrada seja o c�digo IBGE7 do Munic�pio, e retorno um RESULTSET contendo:
--- Nome do Estado
--
--- Nome do Mesoregi�o
--
--- Nome do Microregi�o
--
--- CEP.


CREATE PROCEDURE sp_PesquisarPorIBGE7EstadoMesoregiaoMicroregiaoCEP
(
	@IBGE7 INT
)
AS
SELECT 
		UFS.Descricao AS Estado,
		MES.Descricao AS NomeMesoregiao,
		MIC.Descricao AS NomeMicroregiao,
	    MUN.CEP
FROM Municipio AS MUN
INNER JOIN Mesoregiao AS MES
	ON MUN.MesoregiaoID = MES.MesoregiaoID
INNER JOIN Microregiao AS MIC
	ON MUN.MicroregiaoID = MIC.MicroregiaoID
INNER JOIN UnidadesFederacao AS UFS
	ON MUN.UFID = UFS.UFID
WHERE MUN.IBGE7 = @IBGE7;