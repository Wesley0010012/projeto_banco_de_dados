-- Pesquisa Número 1: Identificação de quais estabelecimentos conveniados possuem mais clientes que já estiveram no estacionamento: 
SELECT C.CNV_RAZAO_SOCIAL AS "Estabelecimento Conveniado",
    TOTAL_VENDAS AS "Total de abatimentos"
FROM (
        SELECT C.CNV_ID,
            C.CNV_RAZAO_SOCIAL
        FROM "CONVENIADOS" "C"
    ) "C"
    INNER JOIN (
        SELECT COUNT(NF.NTF_CNV_ID) AS TOTAL_VENDAS
        FROM NOTAS_FISCAIS "NF"
        GROUP BY NF.NTF_CNV_ID
    ) "NF" ON NF.TOTAL_VENDAS = C.CNV_ID
ORDER BY NF.TOTAL_VENDAS DESC;
-- Pesquisa Número 2: Identificar qual foi o lucro bruto obtido diretamente por categoria de veículo e as melhores tendências veiculares
SELECT 'R$ ' || CE.TOTAL_VENDAS as "Lucro bruto total por categoria",
    TO_CHAR(
        (CE.TOTAL_VENDAS / CE.LUCRO_TOTAL) * 100,
        'FM09.90'
    ) || '%' AS "Porcentagem em relação ao lucro total",
    CE.QUANTIDADE_VENDAS_POR_VEICULO as "Quantidade de vendas por categoria",
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