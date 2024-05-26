----------------------------------------------
-- COMENTARIOS
----------------------------------------------
-- COMENTARIOS - CONVENIADOS
COMMENT ON TABLE CONVENIADOS IS 'RELACAO RESPONSAVEL POR PERSISTIR OS ESTABELECIMENTOS CONVENIADOS AO ESTACIONAMENTO';
COMMENT ON COLUMN CONVENIADOS.CNV_ID IS 'CODIGO IDENTIFICADOR UNICO DOS ESTABELECIMENTOS CONVENIADOS';
COMMENT ON COLUMN CONVENIADOS.CNV_RAZAO_SOCIAL IS 'RAZAO SOCIAL DOS ESTABELECIMENTOS CONVENIADOS';
COMMENT ON COLUMN CONVENIADOS.CNV_CNPJ IS 'CNPJ DOS ESTABELECIMENTOS CONVENIADOS';
-- COMENTARIOS - CUSTOS ESTACIONAMENTO
COMMENT ON TABLE CUSTOS_ESTACIONAMENTO IS 'RELACAO RESPONSAVEL POR PERSISTIR OS CUSTOS GERAIS DOS VEICULOS GERAIS ALOCADOS NO ESTACIONAMENTO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_ID IS 'CODIGO IDENTIFICADOR UNICO DO CUSTO DE ALOCACAO DE UM VEICULO NO ESTACIONAMENTO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_PLACA IS 'PLACA DO VEICULO QUE FEZ A ALOCACAO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_DATA_HORA_ENTRADA IS 'DATA E HORA DE ALOCACAO DO VEICULO NO ESTACIONAMENTO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_DATA_HORA_SAIDA IS 'DATA E HORA DO FIM DA  ALOCACAO DO VEICULO NO ESTACIONAMENTO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_PRECO IS 'CUSTO TOTAL DO PERIODO DE ALOCACAO DO VEICULO';
COMMENT ON COLUMN CUSTOS_ESTACIONAMENTO.CES_TPV_ID IS 'CODIGO EXTERNO REFERENCIADOR DO TIPO DE VAGA UTILIZADA PELO VEICULO';
-- COMENTARIOS - MENSALISTAS
COMMENT ON TABLE MENSALISTAS IS 'RELACAO RESPONSAVEL POR PERSISTIR OS CLIENTES MENSALISTAS UTILIZADORES DO ESTACIONAMENTO';
COMMENT ON COLUMN MENSALISTAS.MNL_ID IS 'CODIGO IDENTIFICADOR UNICO DOS CLIENTES MENSALISTAS DO ESTACIONAMENTO';
COMMENT ON COLUMN MENSALISTAS.MNL_NOME IS 'NOME DOS CLIENTE MENSALISTA DO ESTACIONAMENTO';
COMMENT ON COLUMN MENSALISTAS.MNL_COD_UNICO IS 'CODIGO UNICO UTILIZADO PARA ACESSO EXCLUSIVO AS VAGAS DO CLIENTE MENSALISTA';
COMMENT ON COLUMN MENSALISTAS.MNL_DATA_INCLUSAO IS 'DATA DE INCLUSAO DE CADASTRO MENSAL DO CLIENTE NO ESTACIONAMENTO';
COMMENT ON COLUMN MENSALISTAS.MNL_ATIVO IS 'IDENTIFICADOR DE ATIVIDADE DE PAGAMENTO MENSAL DO CLIENTE';
-- COMENTARIOS - NOTAS FISCAIS
COMMENT ON TABLE NOTAS_FISCAIS IS 'RELACAO RESPONSAVEL POR PERSISTIR AS NOTAS FISCAIS DE ESTACIONAMENTO CONVENIADOS ENTREGUES POR CLIENTES GERAIS DO ESTACIONAMENTO PARA AMORTIZAR O PAGAMENTO DO CUSTO DE ESTACIONAMENTO';
COMMENT ON COLUMN NOTAS_FISCAIS.NTF_ID IS 'CODIGO IDENTIFICADOR UNICO DAS NOTAS FISCAIS';
COMMENT ON COLUMN NOTAS_FISCAIS.NTF_NFE IS 'CODIGO IDENTIFICADOR DA NOTA FISCAL GERADA NA IMPRESSAO NO ESTABELECIMENTO';
COMMENT ON COLUMN NOTAS_FISCAIS.NTF_DESCONTO_TOTAL IS 'VALOR DE AMORTIZACAO PROFERIDA PELA NOTA FISCAL';
COMMENT ON COLUMN NOTAS_FISCAIS.NTF_CES_ID IS 'CODIGO EXTERNO REFERENCIADOR DO CUSTO DE ESTACIONAMENTO DO QUAL UTILIZOU DA AMORTIZACAO';
COMMENT ON COLUMN NOTAS_FISCAIS.NTF_CNV_ID IS 'CODIGO EXTERNO DO ESTABELECIMENTO CONVENIADO QUE IMPRIMIU A NOTA FISCAL';
-- COMENTARIOS - PAGAMENTOS
COMMENT ON TABLE PAGAMENTOS IS 'RELACAO RESPONSAVEL POR PERSISTIR OS PAGAMENTOS EXECUTADOS PELOS CLIENTES MENSALISTAS DO ESTACIONAMENTO';
COMMENT ON COLUMN PAGAMENTOS.PGT_ID IS 'CODIGO IDENTIFICADOR UNICO DOS PAGAMENTOS';
COMMENT ON COLUMN PAGAMENTOS.PGT_VALOR IS 'VALOR NUMERICO RESPONSAVEL POR DEFINIR O TOTAL A SER PAGO';
COMMENT ON COLUMN PAGAMENTOS.PGT_MNL_ID IS 'CODIGO IDENTIFICADOR EXTERNO REFERENCIADOR DO CLIENTE MENSALISTA DEVEDOR';
-- COMENTARIOS - TIPOS VAGAS
COMMENT ON TABLE TIPOS_VAGAS IS 'RELACAO RESPONSAVEL POR PERSISTIR OS TIPOS DE VAGAS DISPONIVEIS NO ESTACIONAMENTO';
COMMENT ON COLUMN TIPOS_VAGAS.TPV_ID IS 'CODIGO IDENTIFICADOR UNICO DO TIPO DE VAGA POSSIVEL PARA ALOCACAO NO ESTACIONAMENTO';
COMMENT ON COLUMN TIPOS_VAGAS.TPV_CATEGORIA IS 'CATEGORIA REPRESENTATIVA DO TIPO DE VAGA EXISTENTE NO ESTACIONAMENTO';
COMMENT ON COLUMN TIPOS_VAGAS.TPV_PRECO IS 'CUSTO FIXO DE ALOCACAO DO TIPO DA VAGA';
-- COMENTARIOS - VEICULOS
COMMENT ON TABLE VEICULOS IS 'RELACAO RESPONSAVEL POR PERSISTIR OS VEICULOS UTILIZADOS PELOS CLIENTES MENSALISTAS DO ESTACIONAMENTO';
COMMENT ON COLUMN VEICULOS.VCL_ID IS 'CODIGO IDENTIFICADOR UNICO DOS VEICULOS UTILIZADOS PELOS CLIENTES MENSALISTAS';
COMMENT ON COLUMN VEICULOS.VCL_PLACA IS 'PLACA DOS VEICULOS UTILIZADOS PELOS CLIENTES MENSALISTAS';
COMMENT ON COLUMN VEICULOS.VCL_TPV_ID IS 'CODIGO EXTERNO REFERENCIADOR DO TIPO DE VAGA UTILIZADO PELOS VEICULOS';
COMMENT ON COLUMN VEICULOS.VCL_MNL_ID IS 'CODIGO EXTERNO REFERENCIADOR DO CLIENTE MENSALISTA DONO DO VEICULO';
----------------------------------------------
-- FIM - COMENTARIOS
----------------------------------------------