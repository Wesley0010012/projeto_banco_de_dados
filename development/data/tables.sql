---------------------------------------
-- RELACOES
---------------------------------------
-- RELACAO CONVENIADOS
CREATE TABLE IF NOT EXISTS "CONVENIADOS" (
    cnv_id NUMBER (3),
    cnv_razao_social VARCHAR2 (30),
    cnv_cnpj VARCHAR2 (14)
);
-- RELACAO CUSTOS ESTACIONAMENTO
CREATE TABLE IF NOT EXISTS "CUSTOS_ESTACIONAMENTO" (
    ces_id NUMBER (5),
    ces_placa NUMBER (7),
    ces_data_hora_entrada DATE,
    ces_data_hora_saida DATE,
    ces_preco NUMBER (5, 2),
    ces_tpv_id NUMBER (3)
);
-- RELACAO MENSALISTAS
CREATE TABLE IF NOT EXISTS "MENSALISTAS" (
    mnl_id NUMBER (4),
    mnl_nome VARCHAR2 (30),
    mnl_cod_unico VARCHAR2 (32),
    mnl_data_inclusao DATE,
    mnl_ativo NUMBER
);
-- RELACAO NOTAS FISCAIS
CREATE TABLE IF NOT EXISTS "NOTAS_FISCAIS" (
    ntf_id NUMBER (5),
    ntf_nfe VARCHAR2 (44),
    ntf_desconto_total NUMBER (5, 2),
    ntf_ces_id NUMBER (5),
    ntf_cnv_id NUMBER (3)
);
-- RELACAO PAGAMENTOS
CREATE TABLE IF NOT EXISTS "PAGAMENTOS" (
    pgt_id NUMBER(3),
    pgt_valor NUMBER (5, 2) pgt_mnl_id (4)
);
-- RELACAO TIPOS VAGAS
CREATE TABLE IF NOT EXISTS "TIPOS_VAGAS" (
    tpv_id NUMBER (3),
    tpv_categoria VARCHAR2 (30),
    tpv_preco NUMBER (3, 2)
);
-- RELACAO VEICULOS
CREATE TABLE IF NOT EXISTS "VEICULOS" (
    vcl_id NUMBER (5),
    vcl_placa VARCHAR2 (7),
    vcl_tpv_id NUMBER (3),
    vcl_mnl_id NUMBER (4)
)
---------------------------------------
-- FIM - RELACOES
---------------------------------------