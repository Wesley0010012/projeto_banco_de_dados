---------------------------
-- Pesquisa número 1
---------------------------
SELECT TV.CATEGORIA,
    V.TOTAL_VEICULOS
FROM (
        SELECT VCL_TPV_ID "CODIGO_TPV",
            COUNT(VCL_TPV_ID) "TOTAL_VEICULOS"
        FROM VEICULOS
        GROUP BY VCL_TPV_ID
    ) "V"
    INNER JOIN (
        SELECT TPV_ID,
            TPV_CATEGORIA "CATEGORIA"
        FROM TIPOS_VAGAS
    ) "TV" ON V.CODIGO_TPV = TV.TPV_ID
ORDER BY TOTAL_VEICULOS DESC;
---------------------------
-- Pesquisa número 2
---------------------------
SELECT COMUNS "Total de clientes comuns",
    TO_CHAR(
        (((COMUNS / (COMUNS + MENSALISTAS))) * 100),
        'FM90.00'
    ) || '%' "Porcentagem clientes comuns em relação ao total",
    MENSALISTAS "Total de clientes mensalistas",
    TO_CHAR(
        TO_CHAR(
            (((MENSALISTAS / (COMUNS + MENSALISTAS))) * 100),
            'FM90.00'
        )
    ) || '%' "Porcentagem de clientes mensalistas em relação ao total"
FROM (
        SELECT COUNT(CES_ID) "COMUNS"
        FROM CUSTOS_ESTACIONAMENTO
    )
    CROSS JOIN (
        SELECT COUNT(MNL_ID) "MENSALISTAS"
        FROM MENSALISTAS
    );