---------------------------
-- Pesquisa número 1
---------------------------
SELECT M.MNL_NOME "Nome Proprietário",
    V.TOTAL_VEICULOS "Total de Veículos registrados"
FROM (
        SELECT M.MNL_ID,
            M.MNL_NOME
        FROM MENSALISTAS "M"
    ) "M"
    INNER JOIN (
        SELECT V.VCL_MNL_ID,
            COUNT(V.VCL_MNL_ID) "TOTAL_VEICULOS"
        FROM VEICULOS "V"
        GROUP BY (V.VCL_MNL_ID)
    ) "V" ON V.VCL_MNL_ID = M.MNL_ID
ORDER BY V.TOTAL_VEICULOS DESC;
--------------------------
-- Pesquisa número 2
--------------------------
SELECT M.NOME_CLIENTE "Nome do cliente",
    'R$ ' || TO_CHAR(P.TOTAL_REAIS, 'FM900.00') "Soma dos pagamentos em reais",
    P.QUANTIDADE_PAGAMENTOS "Quantidade de Pagamentos"
FROM (
        SELECT MNL_ID,
            MNL_NOME "NOME_CLIENTE"
        FROM MENSALISTAS
    ) "M"
    INNER JOIN (
        SELECT PGT_MNL_ID "ID_CLIENTE",
            COUNT(PGT_MNL_ID) "QUANTIDADE_PAGAMENTOS",
            SUM(PGT_VALOR) "TOTAL_REAIS"
        FROM PAGAMENTOS
        GROUP BY PGT_MNL_ID
    ) "P" ON M.MNL_ID = P.ID_CLIENTE
ORDER BY P.TOTAL_REAIS DESC;