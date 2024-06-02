-- Pesquisa Número 1: Identificação de quais estabelecimentos conveniados possuem mais clientes que já estiveram no estacionamento: 
SELECT C.CNV_RAZAO_SOCIAL AS "Estabelecimento Conveniado",
    'R$ ' || TO_CHAR(NF.TOTAL_AMORTIZADO, 'FM999.00') AS "Total de Abatimentos em Reais",
    NF.TOTAL_VENDAS AS "Quantidade de abatimentos"
FROM (
        SELECT C.CNV_ID,
            C.CNV_RAZAO_SOCIAL
        FROM "CONVENIADOS" "C"
    ) "C"
    INNER JOIN (
        SELECT COUNT(NF.NTF_CNV_ID) AS TOTAL_VENDAS,
            SUM(NF.NTF_DESCONTO_TOTAL) AS TOTAL_AMORTIZADO,
            NF.NTF_CNV_ID
        FROM NOTAS_FISCAIS "NF"
        GROUP BY NF.NTF_CNV_ID
    ) "NF" ON NF.NTF_CNV_ID = C.CNV_ID
ORDER BY NF.TOTAL_AMORTIZADO DESC;
-- Pesquisa Número 2: Identificar qual foi o lucro bruto obtido diretamente por categoria de veículo
SELECT 'R$ ' || CE.TOTAL_VENDAS as "Lucro bruto total por categoria",
    TO_CHAR(
        (CE.TOTAL_VENDAS / CE.LUCRO_TOTAL) * 100,
        'FM09.90'
    ) || '%' AS "Porcentagem em relação ao lucro total",
    CE.QUANTIDADE_VENDAS_POR_VEICULO as "Quantidade de alocações por categoria",
    TV.CATEGORIA_VEICULO as "Categoria do veículo"
FROM (
        SELECT *
        FROM (
                SELECT SUM(CE.CES_PRECO) AS TOTAL_VENDAS,
                    COUNT(CE.CES_TPV_ID) AS QUANTIDADE_VENDAS_POR_VEICULO,
                    CE.CES_TPV_ID
                FROM CUSTOS_ESTACIONAMENTO "CE"
                GROUP BY CE.CES_TPV_ID
            )
            CROSS JOIN (
                SELECT SUM(CE.CES_PRECO) AS LUCRO_TOTAL
                FROM CUSTOS_ESTACIONAMENTO "CE"
            )
    ) "CE"
    INNER JOIN (
        SELECT TV.TPV_ID,
            TV.TPV_CATEGORIA AS CATEGORIA_VEICULO
        FROM TIPOS_VAGAS "TV"
    ) "TV" ON CE.CES_TPV_ID = TV.TPV_ID
ORDER BY CE.TOTAL_VENDAS DESC;
---------------------------------------------------------------------
--- Pesquisas Avançadas
---------------------------------------------------------------------
-- Pesquisa A: Observação do total de alocações por categoria e amortização.
SELECT 'R$ ' || TO_CHAR(CE.TOTAL_VENDAS, 'FM900.00') as "Lucro bruto total sem amortização por categoria",
    TO_CHAR(
        (CE.TOTAL_VENDAS / CE.LUCRO_TOTAL) * 100,
        'FM09.90'
    ) || '%' AS "Porcentagem em relação ao lucro total sem amortização",
    'R$ ' || TO_CHAR(
        CE.TOTAL_VENDAS - CE.TOTAL_VENDAS_COM_ABATIMENTO,
        'FM900.00'
    ) as "Lucro bruto total por categoria",
    TO_CHAR(
        (
            (CE.TOTAL_VENDAS - CE.TOTAL_VENDAS_COM_ABATIMENTO) / CE.LUCRO_TOTAL
        ) * 100,
        'FM09.90'
    ) || '%' AS "Porcentagem em relação ao lucro total com amortização",
    CE.QUANTIDADE_VENDAS_POR_VEICULO as "Quantidade de alocações por categoria",
    TV.CATEGORIA_VEICULO as "Categoria do veículo"
FROM (
        SELECT *
        FROM (
                SELECT SUM(CE.CES_PRECO) AS TOTAL_VENDAS,
                    SUM(
                        CASE
                            WHEN(CE.CES_PRECO - CE.NTF_DESCONTO_TOTAL >= 0) THEN CE.CES_PRECO - CE.NTF_DESCONTO_TOTAL
                            ELSE CE.CES_PRECO
                        END
                    ) AS TOTAL_VENDAS_COM_ABATIMENTO,
                    COUNT(CE.CES_TPV_ID) AS QUANTIDADE_VENDAS_POR_VEICULO,
                    CE.CES_TPV_ID
                FROM (
                        SELECT CE.CES_PRECO,
                            NF.NTF_DESCONTO_TOTAL,
                            CE.CES_TPV_ID
                        FROM CUSTOS_ESTACIONAMENTO "CE"
                            INNER JOIN NOTAS_FISCAIS "NF" ON CE.CES_ID = NF.NTF_CES_ID
                    ) "CE"
                GROUP BY CE.CES_TPV_ID
            )
            CROSS JOIN (
                SELECT SUM(CE.CES_PRECO) AS LUCRO_TOTAL,
                    SUM(NF.NTF_DESCONTO_TOTAL) TOTAL_AMORTIZADO
                FROM CUSTOS_ESTACIONAMENTO "CE"
                    INNER JOIN NOTAS_FISCAIS "NF" ON NF.NTF_CES_ID = CE.CES_ID
            )
    ) "CE"
    INNER JOIN (
        SELECT TV.TPV_ID,
            TV.TPV_CATEGORIA AS CATEGORIA_VEICULO
        FROM TIPOS_VAGAS "TV"
    ) "TV" ON CE.CES_TPV_ID = TV.TPV_ID
ORDER BY CE.TOTAL_VENDAS DESC;