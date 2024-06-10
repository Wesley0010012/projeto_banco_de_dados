-------------------------
-- PESQUISA 1
-------------------------
SELECT ATIVO "Total de clientes ativos",
    NAO_ATIVO "Total de clientes não ativos"
FROM (
        SELECT "'Ativo'" "ATIVO",
            "'Inativo'" "NAO_ATIVO"
        FROM (
                SELECT CASE
                        WHEN MNL_ATIVO = 1 THEN 'Ativo'
                        ELSE 'Inativo'
                    END "STATUS",
                    COUNT (MNL_ATIVO) "TOTAL_MENSALISTAS"
                FROM MENSALISTAS
                GROUP BY (MNL_ATIVO)
            ) pivot (
                MIN(TOTAL_MENSALISTAS) FOR STATUS in ('Ativo', 'Inativo')
            )
    );
-------------------------
-- PESQUISA 2
-------------------------
SELECT CATEGORIA "Categoria do veículo",
    TOTAL_VEICULOS "Quantidade de veículos"
FROM (
        SELECT TIPO_VEICULO,
            SUM(TOTAL) "TOTAL_VEICULOS"
        FROM (
                (
                    SELECT VCL_TPV_ID AS "TIPO_VEICULO",
                        COUNT(VCL_PLACA) AS "TOTAL"
                    FROM VEICULOS
                    GROUP BY VCL_TPV_ID
                )
                UNION ALL
                (
                    SELECT CES_TPV_ID AS "TIPO_VEICULO",
                        COUNT(CES_PLACA) AS "TOTAL"
                    FROM CUSTOS_ESTACIONAMENTO
                    GROUP BY CES_TPV_ID
                )
            )
        GROUP BY TIPO_VEICULO
        ORDER BY TIPO_VEICULO
    ) "SOMA"
    INNER JOIN (
        SELECT TPV_ID,
            TPV_CATEGORIA "CATEGORIA"
        FROM TIPOS_VAGAS
    ) "CATEGORIAS" ON SOMA.TIPO_VEICULO = CATEGORIAS.TPV_ID
ORDER BY TOTAL_VEICULOS DESC;