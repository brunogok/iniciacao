-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 03/12/2012 às 19h15min
-- Versão do Servidor: 5.5.20
-- Versão do PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `iniciacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaa_empresa`
--

CREATE TABLE IF NOT EXISTS `aaa_empresa` (
  `aaa_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaa_nome` varchar(100) NOT NULL COMMENT 'Nome da Empresa',
  PRIMARY KEY (`aaa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados da Empresa' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aab_filial`
--

CREATE TABLE IF NOT EXISTS `aab_filial` (
  `aab_id` int(11) NOT NULL AUTO_INCREMENT,
  `aab_endereco` text NOT NULL COMMENT 'Endereço da Filial',
  `aab_empresa` int(11) NOT NULL,
  PRIMARY KEY (`aab_id`),
  KEY `aab_empresa` (`aab_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados da Filial' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aac_reparticao`
--

CREATE TABLE IF NOT EXISTS `aac_reparticao` (
  `aac_id` int(11) NOT NULL AUTO_INCREMENT,
  `aac_filial` int(11) NOT NULL,
  `aac_nome` varchar(50) NOT NULL COMMENT 'Nome da Repartição',
  PRIMARY KEY (`aac_id`),
  KEY `aac_filial` (`aac_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados da Reparticao' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aad_metodo_agil`
--

CREATE TABLE IF NOT EXISTS `aad_metodo_agil` (
  `aad_id` int(11) NOT NULL AUTO_INCREMENT,
  `aad_nome` varchar(60) NOT NULL COMMENT 'Nome do Método',
  `aad_tipo` int(11) NOT NULL,
  `aad_bibliografia` text NOT NULL COMMENT 'Bibliografia ',
  PRIMARY KEY (`aad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Dados do Método Agil' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aae_modelo`
--

CREATE TABLE IF NOT EXISTS `aae_modelo` (
  `aae_id` int(11) NOT NULL AUTO_INCREMENT,
  `aae_nome` varchar(60) NOT NULL COMMENT 'Nome do Modelo',
  `aae_sigla` varchar(15) NOT NULL,
  PRIMARY KEY (`aae_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dados do Modelo de Maturação' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `aae_modelo`
--

INSERT INTO `aae_modelo` (`aae_id`, `aae_nome`, `aae_sigla`) VALUES
(1, 'Melhoria de Processamento de Software Brasileiro', 'MPS.BR'),
(2, 'Integração de Modelos de Maturidade da Capacidade', 'CMMI');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaf_reparticao_modelo_metodo`
--

CREATE TABLE IF NOT EXISTS `aaf_reparticao_modelo_metodo` (
  `aaf_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaf_ano` year(4) NOT NULL COMMENT 'Ano da Análise',
  `aaf_metodo` int(11) NOT NULL,
  `aaf_modelo` int(11) NOT NULL,
  `aaf_reparticao` int(11) NOT NULL,
  PRIMARY KEY (`aaf_id`),
  KEY `aaf_metodo` (`aaf_metodo`),
  KEY `aaf_modelo` (`aaf_modelo`),
  KEY `aaf_reparticao` (`aaf_reparticao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados da Análise' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aag_licao_aprendida`
--

CREATE TABLE IF NOT EXISTS `aag_licao_aprendida` (
  `aag_id` int(11) NOT NULL AUTO_INCREMENT,
  `aag_tipo` smallint(6) NOT NULL COMMENT 'Informa se é uma lição positiva ou negativa',
  `aag_observacao` text NOT NULL,
  PRIMARY KEY (`aag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados das Lições Aprendidas' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aah_reparticao_modelo_metodo_licao`
--

CREATE TABLE IF NOT EXISTS `aah_reparticao_modelo_metodo_licao` (
  `aah_id` int(11) NOT NULL AUTO_INCREMENT,
  `aah_licao_aprendida` int(11) NOT NULL,
  `aah_reparticao_modelo_metodo` int(11) NOT NULL,
  `aah_ferramentas` int(11) NOT NULL,
  PRIMARY KEY (`aah_id`),
  KEY `aah_reparticao_modelo_metodo` (`aah_reparticao_modelo_metodo`),
  KEY `aah_licao_aprendida` (`aah_licao_aprendida`),
  KEY `aah_ferramentas` (`aah_ferramentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aai_nivel`
--

CREATE TABLE IF NOT EXISTS `aai_nivel` (
  `aai_id` int(11) NOT NULL AUTO_INCREMENT,
  `aai_nome` varchar(30) NOT NULL COMMENT 'Nome do Nível',
  `aai_sigla` varchar(2) NOT NULL COMMENT 'Sigla do Nível',
  `aai_modelo` int(11) NOT NULL,
  PRIMARY KEY (`aai_id`),
  KEY `aai_modelo` (`aai_modelo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dados do Nível do Modelo' AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `aai_nivel`
--

INSERT INTO `aai_nivel` (`aai_id`, `aai_nome`, `aai_sigla`, `aai_modelo`) VALUES
(8, 'Em Otimização', 'A', 1),
(9, 'Gerenciado Quantitativamente', 'B', 1),
(10, 'Definido', 'C', 1),
(11, 'Largamente Definido', 'D', 1),
(12, 'Parcialmente Definido', 'E', 1),
(13, 'Gerenciado', 'F', 1),
(14, 'Parcialmente Gerenciado', 'G', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaj_processo`
--

CREATE TABLE IF NOT EXISTS `aaj_processo` (
  `aaj_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaj_nome` varchar(70) NOT NULL,
  `aaj_sigla` varchar(20) NOT NULL,
  `aaj_descricao` text NOT NULL,
  PRIMARY KEY (`aaj_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dados do Processo' AUTO_INCREMENT=24 ;

--
-- Extraindo dados da tabela `aaj_processo`
--

INSERT INTO `aaj_processo` (`aaj_id`, `aaj_nome`, `aaj_sigla`, `aaj_descricao`) VALUES
(1, 'Gerência de Projetos', 'GPR', ''),
(2, 'Gerência de Requisitos', 'GRE', ''),
(3, 'Aquisição', 'AQU', ''),
(4, 'Gerência de Configuração', 'GCO', ''),
(5, 'Gerência de Portfólio de Projetos ', 'GPP', ''),
(6, 'Garantia de Qualidade', 'GQA', ''),
(7, 'Medição', 'MED', ''),
(8, 'Avaliação e Melhoria de Processo Organizacional', 'AMP', ''),
(9, 'Definição do Processo Organizacional', 'DFP', ''),
(10, 'Gerência de Recursos Humanos', 'GRH', ''),
(11, 'Gerência de Reutilização', 'GRU', ''),
(14, 'Desenvolvimento de Requisito', 'DRE', ''),
(15, 'Integração do Produto', 'ITP', ''),
(16, 'Projeto e Construção do Produto', 'PCP', ''),
(17, 'Validação', 'VAL', ''),
(18, 'Verificação', 'VER', ''),
(19, 'Gerência de Decisões', 'GDE', ''),
(20, 'Desenvolvimento para Reutilização', 'DRU', ''),
(21, 'Gerência de Riscos', 'GRI', ''),
(23, '(sem processo específico)', 'sem proc específico', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aak_processo_licao_reparticao`
--

CREATE TABLE IF NOT EXISTS `aak_processo_licao_reparticao` (
  `aak_id` int(11) NOT NULL AUTO_INCREMENT,
  `aak_processo` int(11) NOT NULL,
  `aak_licao_aprendida` int(11) NOT NULL,
  `aak_reparticao_modelo_metodo` int(11) NOT NULL,
  `aak_ferramenta` int(11) NOT NULL,
  PRIMARY KEY (`aak_id`),
  KEY `aak_processo` (`aak_processo`),
  KEY `aak_licao_aprendida` (`aak_licao_aprendida`),
  KEY `aak_reparticao_modelo_metodo` (`aak_reparticao_modelo_metodo`),
  KEY `aak_ferramenta` (`aak_ferramenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aal_atributo_licao_reparticao`
--

CREATE TABLE IF NOT EXISTS `aal_atributo_licao_reparticao` (
  `aal_id` int(11) NOT NULL AUTO_INCREMENT,
  `aal_atributo` int(11) NOT NULL,
  `aal_licao_aprendida` int(11) NOT NULL,
  `aal_reparticao_modelo_metodo` int(11) NOT NULL,
  `aal_ferramenta` int(11) NOT NULL,
  PRIMARY KEY (`aal_id`),
  KEY `aal_ferramenta` (`aal_ferramenta`),
  KEY `aal_licao_aprendida` (`aal_licao_aprendida`),
  KEY `aal_atributo` (`aal_atributo`),
  KEY `aal_reparticao_modelo_metodo` (`aal_reparticao_modelo_metodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aam_atributo`
--

CREATE TABLE IF NOT EXISTS `aam_atributo` (
  `aam_id` int(11) NOT NULL AUTO_INCREMENT,
  `aam_nome` varchar(60) NOT NULL,
  `aam_sigla` varchar(10) NOT NULL,
  `aam_decricao` varchar(250) NOT NULL,
  PRIMARY KEY (`aam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Dados do Atributo' AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `aam_atributo`
--

INSERT INTO `aam_atributo` (`aam_id`, `aam_nome`, `aam_sigla`, `aam_decricao`) VALUES
(1, 'O processo é executado', 'AP 1.1', 'Este atributo evidencia o quanto o processo atinge o seu propósito.'),
(2, 'O processo é gerenciado', 'AP 2.1', 'Este atributo evidencia o quanto a execução do processo é gerenciada.'),
(3, 'Os produtos de trabalho do processo são gerenciados', 'AP 2.2', 'Este atributo evidencia o quanto os produtos de trabalho produzidos pelo processo são gerenciados apropriadamente.'),
(4, 'O processo é definido', 'AP 3.1', 'Este atributo evidencia o quanto um processo padrão é mantido para apoiar a implementação do processo definido.'),
(5, 'O processo está implementado', 'AP 3.2', 'Este atributo evidencia o quanto o processo padrão é efetivamente implementado como um processo definido para atingir seus resultados.'),
(6, 'O processo é medido', 'AP 4.1', 'Este atributo evidencia o quanto os resultados de medição são usados para assegurar que a execução do processo atinge os seus objetivos de desempenho e apoia o alcance dos objetivos de negócio definidos.'),
(7, 'O processo é controlado', 'AP 4.2', 'Este atributo evidencia o quanto o processo é controlado estatisticamente para produzir um processo estável, capaz e previsível dentro de limites estabelecidos.'),
(8, 'O processo é objeto de melhorias incrementais e inovações', 'AP 5.1', 'Este atributo evidencia o quanto as mudanças no processo são identificadas a partir da análise de defeitos, problemas, causas comuns de variação do desempenho e da investigação de enfoques inovadores para a definição e implementação do processo.'),
(9, 'O processo é otimizado continuamente', 'AP 5.2', 'Este atributo evidencia o quanto as mudanças na definição, gerência e desempenho do processo têm impacto efetivo para o alcance dos objetivos relevantes de melhoria do processo.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aan_nivel_processo`
--

CREATE TABLE IF NOT EXISTS `aan_nivel_processo` (
  `aan_id` int(11) NOT NULL AUTO_INCREMENT,
  `aan_nivel` int(11) NOT NULL,
  `aan_processo` int(11) NOT NULL,
  PRIMARY KEY (`aan_id`),
  KEY `aan_nivel` (`aan_nivel`),
  KEY `aan_processo` (`aan_processo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Extraindo dados da tabela `aan_nivel_processo`
--

INSERT INTO `aan_nivel_processo` (`aan_id`, `aan_nivel`, `aan_processo`) VALUES
(1, 14, 1),
(2, 14, 2),
(3, 13, 3),
(4, 13, 4),
(5, 13, 5),
(6, 13, 6),
(7, 13, 7),
(8, 12, 8),
(9, 12, 9),
(10, 12, 10),
(11, 12, 11),
(12, 12, 1),
(13, 11, 14),
(14, 11, 15),
(15, 11, 16),
(16, 11, 17),
(17, 11, 18),
(18, 10, 19),
(19, 10, 20),
(20, 10, 21),
(21, 9, 1),
(22, 8, 23),
(23, 13, 1),
(24, 13, 2),
(25, 12, 2),
(26, 12, 3),
(27, 12, 4),
(28, 12, 5),
(29, 12, 6),
(30, 12, 7),
(31, 11, 1),
(32, 11, 2),
(33, 11, 3),
(34, 11, 4),
(35, 11, 5),
(36, 11, 6),
(37, 11, 7),
(38, 11, 8),
(39, 11, 9),
(40, 11, 10),
(41, 11, 11),
(42, 10, 1),
(43, 10, 2),
(44, 10, 3),
(45, 10, 4),
(46, 10, 5),
(47, 10, 6),
(48, 10, 7),
(49, 10, 8),
(50, 10, 9),
(51, 10, 10),
(52, 10, 11),
(53, 10, 14),
(54, 10, 15),
(55, 10, 16),
(56, 10, 17),
(57, 10, 18),
(58, 9, 2),
(59, 9, 3),
(60, 9, 4),
(61, 9, 5),
(62, 9, 6),
(63, 9, 7),
(64, 9, 8),
(65, 9, 9),
(66, 9, 10),
(67, 9, 11),
(68, 9, 14),
(69, 9, 15),
(70, 9, 16),
(71, 9, 17),
(72, 9, 18),
(73, 9, 19),
(74, 9, 20),
(75, 9, 21),
(76, 8, 1),
(77, 8, 2),
(78, 8, 3),
(79, 8, 4),
(80, 8, 5),
(81, 8, 6),
(82, 8, 7),
(83, 8, 8),
(84, 8, 9),
(85, 8, 10),
(86, 8, 11),
(87, 8, 14),
(88, 8, 15),
(89, 8, 16),
(90, 8, 17),
(91, 8, 18),
(92, 8, 20),
(93, 8, 19),
(94, 8, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aao_processo_resultado`
--

CREATE TABLE IF NOT EXISTS `aao_processo_resultado` (
  `aao_id` int(11) NOT NULL AUTO_INCREMENT,
  `aao_sigla` varchar(10) NOT NULL,
  `aao_descricao` varchar(250) NOT NULL,
  PRIMARY KEY (`aao_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Extraindo dados da tabela `aao_processo_resultado`
--

INSERT INTO `aao_processo_resultado` (`aao_id`, `aao_sigla`, `aao_descricao`) VALUES
(1, 'GPR 1', 'O escopo do trabalho para o projeto é definido.'),
(2, 'GPR 2', 'As tarefas e os produtos de trabalho do projeto são dimensionados utilizando métodos apropriados'),
(3, 'GPR 3', 'O modelo e as fases do ciclo de vida do projeto são definidos;'),
(4, 'GPR 4', 'O esforço e o custo para a execução das tarefas e dos produtos de trabalho são estimados com base em dados históricos ou referências técnicas'),
(5, 'GPR 4', 'O planejamento e as estimativas das tarefas do projeto são feitos baseados no repositório de estimativas e no conjunto de ativos de processo organizacional'),
(6, 'GPR 5', 'O orçamento e o cronograma do projeto, incluindo a definição de marcos e pontos de controle, são estabelecidos e mantidos'),
(7, 'GPR 6', 'Os riscos do projeto são identificados e o seu impacto, probabilidade de ocorrência e prioridade de tratamento são determinados e documentados'),
(8, 'GPR 7', 'Os recursos humanos para o projeto são planejados considerando o perfil e o conhecimento necessários para executá-lo;'),
(9, 'GPR 8', 'Os recursos e o ambiente de trabalho necessários para executar o projeto são planejados;'),
(10, 'GPR 8', 'Os recursos e o ambiente de trabalho necessários para executar os projetos são planejados a partir dos ambientes padrão de trabalho da organização;'),
(11, 'GPR 9', 'Os dados relevantes do projeto são identificados e planejados quanto à forma de coleta, armazenamento e distribuição. Um mecanismo é estabelecido para acessá-los, incluindo, se pertinente, questões de privacidade e segurança;'),
(12, 'GPR 10', 'Um plano geral para a execução do projeto é estabelecido com a integração de planos específicos;'),
(13, 'GPR 11', 'A viabilidade de atingir as metas do projeto é explicitamente avaliada considerando restrições e recursos disponíveis. Se necessário, ajustes são realizados;'),
(14, 'GPR 12', 'O Plano do Projeto é revisado com todos os interessados e o compromisso com ele é obtido e mantido;'),
(15, 'GPR 13', 'O escopo, as tarefas, as estimativas, o orçamento e o cronograma do projeto são monitorados em relação ao planejado;'),
(16, 'GPR 14', 'Os recursos materiais e humanos bem como os dados relevantes do projeto são monitorados em relação ao planejado;'),
(17, 'GPR 15', 'Os riscos são monitorados em relação ao planejado;'),
(18, 'GPR 16', 'O envolvimento das partes interessadas no projeto é planejado, monitorado e mantido;'),
(19, 'GPR 17', 'Revisões são realizadas em marcos do projeto e conforme estabelecido no planejamento;'),
(20, 'GPR 18', 'Registros de problemas identificados e o resultado da análise de questões pertinentes, incluindo dependências críticas, são estabelecidos e tratados com as partes interessadas;'),
(21, 'GPR 19', 'Ações para corrigir desvios em relação ao planejado e para prevenir a repetição dos problemas identificados são estabelecidas, implementadas e acompanhadas até a sua conclusão;'),
(22, 'GPR 20', 'Equipes envolvidas no projeto são estabelecidas e mantidas a partir das regras e diretrizes para estruturação, formação e atuação;'),
(23, 'GPR 21', 'Experiências relacionadas aos processos contribuem para os ativos de processo organizacional;'),
(24, 'GPR 22', 'Um processo definido para o projeto é estabelecido de acordo com a estratégia para adaptação do processo da organização;'),
(25, 'GPR 22', 'Os objetivos de qualidade e de desempenho do processo definido para o projeto são estabelecidos e mantidos;'),
(26, 'GPR 23', 'O processo definido para o projeto que o possibilita atender seus objetivos de qualidade e de desempenho é composto com base em técnicas estatísticas e outras técnicas quantitativas;'),
(27, 'GPR 24', 'Subprocessos e atributos críticos para avaliar o desempenho e que estão relacionados ao alcance dos objetivos de qualidade e de desempenho do processo do projeto são selecionados;'),
(28, 'GPR 25', 'Selecionar medidas e técnicas analíticas a serem utilizadas na gerência quantitativa;'),
(29, 'GPR 26', 'O desempenho dos subprocessos escolhidos para gerência quantitativa é monitorado usando técnicas estatísticas e outras técnicas quantitativas;'),
(30, 'GPR 27', 'O projeto é gerenciado usando técnicas estatísticas e outras técnicas quantitativas para determinar se seus objetivos de qualidade e de desempenho do processo serão atingidos;'),
(31, 'GPR 28', 'Questões que afetam os objetivos de qualidade e de desempenho do processo do projeto são alvo de análise de causa raiz.'),
(32, 'GRE 1', 'O entendimento dos requisitos é obtido junto aos fornecedores de requisitos;'),
(33, 'GRE 2', 'Os requisitos são avaliados com base em critérios objetivos e um comprometimento da equipe técnica com estes requisitos é obtido;'),
(34, 'GRE 3', 'A rastreabilidade bidirecional entre os requisitos e os produtos de trabalho é estabelecida e mantida'),
(35, 'GRE 4', 'Revisões em planos e produtos de trabalho do projeto são realizadas visando identificar e corrigir inconsistências em relação aos requisitos;'),
(36, 'GRE 5', 'Mudanças nos requisitos são gerenciadas ao longo do projeto.'),
(37, 'AQU 1', 'As necessidades de aquisição, as metas, os critérios de aceitação do produto, os tipos e a estratégia de aquisição são definidos;'),
(38, 'AQU 2', 'Os critérios de seleção do fornecedor são estabelecidos e usados para avaliar os potenciais fornecedores;'),
(39, 'AQU 3', 'O fornecedor é selecionado com base na avaliação das propostas e dos critérios estabelecidos;'),
(40, 'AQU 4', 'Um acordo que expresse claramente as expectativas, responsabilidades e obrigações de ambas as partes (cliente e fornecedor) é estabelecido e negociado entre elas;'),
(41, 'AQU 5', 'Um produto que satisfaça a necessidade expressa pelo cliente é adquirido baseado na análise dos potenciais candidatos;'),
(42, 'AQU 6', 'A aquisição é monitorada de forma que as condições especificadas sejam atendidas, tais como custo, cronograma e qualidade, gerando ações corretivas quando necessário;'),
(43, 'AQU 7', 'O produto é entregue e avaliado em relação ao acordado e os resultados são documentados;'),
(44, 'AQU 8', 'O produto adquirido é incorporado ao projeto, caso pertinente.'),
(45, 'GCO 1', 'Um Sistema de Gerência de Configuração é estabelecido e mantido;'),
(46, 'GCO 2', 'Os itens de configuração são identificados com base em critérios estabelecidos;'),
(47, 'GCO 3', 'Os itens de configuração sujeitos a um controle formal são colocados sob baseline;'),
(48, 'GCO 4', 'A situação dos itens de configuração e das baselines é registrada ao longo do tempo e disponibilizada;'),
(49, 'GCO 5', 'Modificações em itens de configuração são controladas;'),
(50, 'GCO 6', 'Auditorias de configuração são realizadas objetivamente para assegurar que as baselines e os itens de configuração estejam íntegros, completos e consistentes.'),
(51, 'GCO 7', 'O armazenamento, o manuseio e a liberação de itens de configuração e baselines são controlados;'),
(52, 'GQA 1', 'A aderência dos produtos de trabalho aos padrões, procedimentos e requisitos aplicáveis é avaliada objetivamente, antes dos produtos serem entregues e em marcos predefinidos ao longo do ciclo de vida do projeto;'),
(53, 'GQA 2', 'A aderência dos processos executados às descrições de processo, padrões e procedimentos é avaliada objetivamente;'),
(54, 'GQA 3', 'Os problemas e as não-conformidades são identificados, registrados e comunicados;'),
(55, 'GQA 4', 'Ações corretivas para as não-conformidades são estabelecidas e acompanhadas até as suas efetivas conclusões. Quando necessário, o escalamento das ações corretivas para níveis superiores é realizado, de forma a garantir sua solução;'),
(56, 'GPP1', 'As oportunidades de negócio, as necessidades e os investimentos são identificados, qualificados, priorizados e selecionados em relação aos objetivos estratégicos da organização por meio de critérios objetivos;'),
(57, 'GPP2', 'Os recursos e orçamentos para cada projeto são identificados e alocados;'),
(58, 'GPP3', 'A responsabilidade e autoridade pelo gerenciamento dos projetos são estabelecidas;'),
(59, 'GPP4', 'O portfólio é monitorado em relação aos critérios que foram utilizados para a priorização;'),
(60, 'GPP5', 'Ações para corrigir desvios no portfólio e para prevenir a repetição dos problemas identificados são estabelecidas, implementadas e acompanhadas até a sua conclusão;'),
(61, 'GPP6', 'Os conflitos sobre recursos entre projetos são tratados e resolvidos, de acordo com os critérios utilizados para a priorização;'),
(62, 'GPP7', 'Projetos que atendem aos acordos e requisitos que levaram à sua aprovação são mantidos, e os que não atendem são redirecionados ou cancelados;'),
(63, 'GPP8', 'A situação do portfólio de projetos é comunicada para as partes interessadas, com periodicidade definida ou quando o portfólio for alterado.'),
(64, 'MED 1', 'Objetivos de medição são estabelecidos e mantidos a partir dos objetivos de negócio da organização e das necessidades de informação de processos técnicos e gerenciais;'),
(65, 'MED 2', 'Um conjunto adequado de medidas, orientado pelos objetivos de medição, é identificado e definido, priorizado, documentado, revisado e, quando pertinente, atualizado;'),
(66, 'MED 3', 'Os procedimentos para a coleta e o armazenamento de medidas são especificados;'),
(67, 'MED 4', 'Os procedimentos para a análise das medidas são especificados;'),
(68, 'MED 5', 'Os dados requeridos são coletados e analisados;'),
(69, 'MED 6', 'Os dados e os resultados das análises são armazenados;'),
(70, 'MED 7', 'Os dados e os resultados das análises são comunicados aos interessados e são utilizados para apoiar decisões.'),
(71, 'AMP 1', 'A descrição das necessidades e os objetivos dos processos da organização são estabelecidos e mantidos;'),
(72, 'AMP 2', 'As informações e os dados relacionados ao uso dos processos padrão para projetos específicos existem e são mantidos;'),
(73, 'AMP 3', 'Avaliações dos processos padrão da organização são realizadas para identificar seus pontos fortes, pontos fracos e oportunidades de melhoria;'),
(74, 'AMP 4', 'Registros das avaliações realizadas são mantidos acessíveis;'),
(75, 'AMP 5', 'Os objetivos de melhoria dos processos são identificados e priorizados;'),
(76, 'AMP 6', 'Um plano de implementação de melhorias nos processos é definido e executado, e os efeitos desta implementação são monitorados e confirmados com base nos objetivos de melhoria;'),
(77, 'AMP 7', 'Ativos de processo organizacional são implantados na organização;'),
(78, 'AMP 8', 'Os processos padrão da organização são utilizados em projetos a serem iniciados e, se pertinente, em projetos em andamento;'),
(79, 'AMP 9', 'A implementação dos processos padrão da organização e o uso dos ativos de processo organizacional nos projetos são monitorados;'),
(80, 'AMP 10', 'Experiências relacionadas aos processos são incorporadas aos ativos de processo organizacional.'),
(81, 'DFP1', 'Um conjunto definido de processos padrão é estabelecido e mantido, juntamente com a indicação da aplicabilidade de cada processo;'),
(82, 'DFP2', 'Uma biblioteca de ativos de processo organizacional é estabelecida e mantida;'),
(83, 'DFP3', 'Tarefas, atividades, papéis e produtos de trabalho associados aos processos padrão são identificados e detalhados, juntamente com o desempenho esperado do processo;'),
(84, 'DFP4', 'As descrições dos modelos de ciclo de vida a serem utilizados nos projetos da organização são estabelecidas e mantidas;'),
(85, 'DFP5', 'Uma estratégia para adaptação do processo padrão é desenvolvida considerando as necessidades dos projetos;'),
(86, 'DFP6', 'O repositório de medidas da organização é estabelecido e mantido;'),
(87, 'DFP7', 'Os ambientes padrão de trabalho da organização são estabelecidos e mantidos;'),
(88, 'DFP8', 'Regras e guias para a estruturação, formação e atuação de equipes são estabelecidos e mantidos.'),
(91, 'GRH 1', 'As necessidades estratégicas da organização e dos projetos são revistas para identificar recursos, conhecimentos e habilidades requeridos e, de acordo com a necessidade, planejar como desenvolvê-los ou contratá-los;'),
(92, 'GRH 2', 'Indivíduos com as habilidades e competências requeridas são identificados e recrutados;'),
(93, 'GRH 3', 'As necessidades de treinamento que são responsabilidade da organização são identificadas;'),
(94, 'GRH 4', 'Uma estratégia de treinamento é definida, com o objetivo de atender às necessidades de treinamento dos projetos e da organização;'),
(95, 'GRH 5', 'Um plano tático de treinamento é definido, com o objetivo de implementar a estratégia de treinamento;'),
(96, 'GRH 6', 'Os treinamentos identificados como sendo responsabilidade da organização são conduzidos e registrados;'),
(97, 'GRH 7', 'A efetividade do treinamento é avaliada;'),
(98, 'GRH 8', 'Critérios objetivos para avaliação do desempenho de grupos e indivíduos são definidos e monitorados para prover informações sobre este desempenho e melhorá-lo;'),
(99, 'GRH 9', 'Uma estratégia apropriada de gerência de conhecimento é planejada, estabelecida e mantida para compartilhar informações na organização;'),
(100, 'GRH 10', 'Uma rede de especialistas na organização é estabelecida e um mecanismo de apoio à troca de informações entre os especialistas e os projetos é implementado;'),
(101, 'GRH 11', 'O conhecimento é disponibilizado e compartilhado na organização.'),
(102, 'GRU 1', 'Uma estratégia de gerenciamento de ativos é documentada, contemplando a definição de ativo reutilizável, além dos critérios para aceitação, certificação, classificação, descontinuidade e avaliação de ativos reutilizáveis;'),
(103, 'GRU 2', 'Um mecanismo de armazenamento e recuperação de ativos reutilizáveis é implantado;'),
(104, 'GRU 3', 'Os dados de utilização dos ativos reutilizáveis são registrados;'),
(105, 'GRU 4', 'Os ativos reutilizáveis são periodicamente mantidos, segundo os critérios definidos, e suas modificações são controladas ao longo do seu ciclo de vida;'),
(106, 'GRU 5', 'Os usuários de ativos reutilizáveis são notificados sobre problemas detectados, modificações realizadas, novas versões disponibilizadas e descontinuidade de ativos.'),
(107, 'DRE 1', 'As necessidades, expectativas e restrições do cliente, tanto do produto quanto de suas interfaces, são identificadas;'),
(108, 'DRE 2', 'Um conjunto definido de requisitos do cliente é especificado e priorizado a partir das necessidades, expectativas e restrições identificadas;'),
(109, 'DRE 3', 'Um conjunto de requisitos funcionais e não-funcionais, do produto e dos componentes do produto que descrevem a solução do problema a ser resolvido, é definido e mantido a partir dos requisitos do cliente;'),
(110, 'DRE 4', 'Os requisitos funcionais e não-funcionais de cada componente do produto são refinados, elaborados e alocados;Interfaces internas e externas do produto e de cada componente do produto são definidas;'),
(111, 'DRE 5', 'Conceitos operacionais e cenários são desenvolvidos;'),
(112, 'DRE 6', 'Os requisitos são analisados, usando critérios definidos, para balancear as necessidades dos interessados com as restrições existentes;'),
(113, 'DRE 7', 'Os requisitos são validados.'),
(114, 'ITP 1', 'Uma estratégia de integração, consistente com o projeto (design) e com os requisitos do produto, é desenvolvida e mantida para os componentes do produto;'),
(115, 'ITP 2', 'Um ambiente para integração dos componentes do produto é estabelecido e mantido;'),
(116, 'ITP 3', 'A compatibilidade das interfaces internas e externas dos componentes do produto é assegurada;'),
(117, 'ITP 4', 'As definições, o projeto (design) e as mudanças nas interfaces internas e externas são gerenciados para o produto e para os componentes do produto;'),
(118, 'ITP 5', 'Cada componente do produto é verificado, utilizando-se critérios definidos, para confirmar que estes estão prontos para a integração;'),
(119, 'ITP 6', 'Os componentes do produto são integrados, de acordo com a estratégia determinada e seguindo os procedimentos e critérios para integração;'),
(120, 'ITP 7', 'Os componentes do produto integrados são avaliados e os resultados da integração são registrados;'),
(121, 'ITP 8', 'Uma estratégia de teste de regressão é desenvolvida e aplicada para uma nova verificação do produto, caso ocorra uma mudança nos componentes do produto (incluindo requisitos, projeto (design) e códigos associados);'),
(122, 'ITP 9', 'O produto e a documentação relacionada são preparados e entregues ao cliente.'),
(123, 'PCP 1', 'Alternativas de solução e critérios de seleção são desenvolvidos para atender aos requisitos definidos de produto e componentes de produto;'),
(124, 'PCP 2', 'Soluções são selecionadas para o produto ou componentes do produto, com base em cenários definidos e em critérios identificados;'),
(125, 'PCP 3', 'O produto e/ou componente do produto é projetado e documentado;'),
(126, 'PCP 4', 'As interfaces entre os componentes do produto são projetadas com base em critérios predefinidos;'),
(127, 'PCP 5', 'Uma análise dos componentes do produto é conduzida para decidir sobre sua construção, compra ou reutilização;'),
(128, 'PCP 6', 'Os componentes do produto são implementados e verificados de acordo com o que foi projetado;'),
(129, 'PCP 7', 'A documentação é identificada, desenvolvida e disponibilizada de acordo com os padrões estabelecidos;'),
(130, 'PCP 8', 'A documentação é mantida de acordo com os critérios definidos.'),
(131, 'VAL 1', 'Produtos de trabalho a serem validados são identificados;'),
(132, 'VAL 2', 'Uma estratégia de validação é desenvolvida e implementada, estabelecendo cronograma, participantes envolvidos, métodos para validação e qualquer material a ser utilizado na validação;'),
(133, 'VAL 3', 'Critérios e procedimentos para validação dos produtos de trabalho a serem validados são identificados e um ambiente para validação é estabelecido;'),
(134, 'VAL 4', 'Atividades de validação são executadas para garantir que o produto esteja pronto para uso no ambiente operacional pretendido;'),
(135, 'VAL 5', 'Problemas são identificados e registrados;'),
(136, 'VAL 6', 'Resultados de atividades de validação são analisados e disponibilizados para as partes interessadas;'),
(137, 'VAL 7', 'Evidências de que os produtos de software desenvolvidos estão prontos para o uso pretendido são fornecidas.'),
(138, 'VER 1', 'Produtos de trabalho a serem verificados são identificados;'),
(139, 'VER 2', 'Uma estratégia de verificação é desenvolvida e implementada, estabelecendo cronograma, revisores envolvidos, métodos para verificação e qualquer material a ser utilizado na verificação;'),
(140, 'VER 3', 'Critérios e procedimentos para verificação dos produtos de trabalho a serem verificados são identificados e um ambiente para verificação é estabelecido;'),
(141, 'VER 4', 'Atividades de verificação, incluindo testes e revisões por pares, são executadas;'),
(142, 'VER 5', 'Defeitos são identificados e registrados;'),
(143, 'VER 6', 'Resultados de atividades de verificação são analisados e disponibilizados para as partes interessadas.'),
(144, 'DRU 1', 'Domínios de aplicação em que serão investigadas oportunidades de reutilização de ativos ou nos quais se pretende praticar reutilização são identificados, detectando os respectivos potenciais de reutilização;'),
(145, 'DRU 2', 'A capacidade de reutilização sistemática da organização é avaliada e ações corretivas são tomadas, caso necessário;'),
(146, 'DRU 3', 'Um programa de reutilização, envolvendo propósitos, escopo, metas e objetivos, é planejado com a finalidade de atender às necessidades de reutilização de domínios;'),
(147, 'DRU 4', 'O programa de reutilização é implantado, monitorado e avaliado;'),
(148, 'DRU 5', 'Propostas de reutilização são avaliadas de forma a garantir que o resultado da reutilização seja apropriado para a aplicação alvo;'),
(149, 'DRU 6', 'Formas de representação para modelos de domínio e arquiteturas de domínio são selecionadas;'),
(150, 'DRU 7', 'Um modelo de domínio é desenvolvido e seus limites e relações com outros domínios são estabelecidos e mantidos. Este modelo deve ser capaz de capturar características, capacidades, conceitos e funções comuns, variantes, opcionais e obrigatórios;'),
(151, 'DRU 8', 'Uma arquitetura de domínio descrevendo uma família de aplicações para o domínio é desenvolvida e mantida por todo o seu ciclo de vida;'),
(152, 'DRU 9', 'Ativos do domínio são especificados; adquiridos ou desenvolvidos, e mantidos por todo o seu ciclo de vida.'),
(153, 'GDE 1', 'Guias organizacionais para a gerência de decisões são estabelecidos e mantidos;'),
(154, 'GDE 2', 'O problema ou questão a ser objeto de um processo formal de tomada de decisão é definido;'),
(155, 'GDE 3', 'Critérios para avaliação das alternativas de solução são estabelecidos e mantidos em ordem de importância, de forma que os critérios mais importantes exerçam mais influência na avaliação;'),
(156, 'GDE 4', 'Alternativas de solução aceitáveis para o problema ou questão são identificadas;'),
(157, 'GDE 5', 'Os métodos de avaliação das alternativas de solução são selecionados de acordo com sua viabilidade de aplicação;'),
(158, 'GDE 6', 'Soluções alternativas são avaliadas usando os critérios e métodos estabelecidos;'),
(159, 'GDE 7', 'Decisões são tomadas com base na avaliação das alternativas utilizando os critérios de avaliação estabelecidos.'),
(160, 'GRI 1', 'O escopo da gerência de riscos é determinado;'),
(161, 'GRI 2', 'As origens e as categorias de riscos são determinadas e os parâmetros usados para analisar riscos, categorizá-los e controlar o esforço da gerência de riscos são definidos;'),
(162, 'GRI 3', 'As estratégias apropriadas para a gerência de riscos são definidas e implementadas;'),
(163, 'GRI 4', 'Os riscos do projeto são identificados e documentados, incluindo seu contexto, condições e possíveis consequências para o projeto e as partes interessadas;'),
(164, 'GRI 5', 'Os riscos são priorizados, estimados e classificados de acordo com as categorias e os parâmetros definidos;'),
(165, 'GRI 6', 'Planos para a mitigação de riscos são desenvolvidos;'),
(166, 'GRI 7', 'Os riscos são analisados e a prioridade de aplicação dos recursos para o monitoramento desses riscos é determinada;'),
(167, 'GRI 8', 'Os riscos são avaliados e monitorados para determinar mudanças em sua situação e no progresso das atividades para seu tratamento;'),
(168, 'GRI 9', 'Ações apropriadas são executadas para corrigir ou evitar o impacto do risco, baseadas na sua prioridade, probabilidade, consequência ou outros parâmetros definidos.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aap_processo_resultado_licao_reparticao`
--

CREATE TABLE IF NOT EXISTS `aap_processo_resultado_licao_reparticao` (
  `aap_id` int(11) NOT NULL AUTO_INCREMENT,
  `aap_processo_resultado` int(11) NOT NULL,
  `aap_licao_aprendida` int(11) NOT NULL,
  `aap_reparticao_modelo_metodo` int(11) NOT NULL,
  `aap_ferramenta` int(11) NOT NULL,
  PRIMARY KEY (`aap_id`),
  KEY `aap_processo_resultado` (`aap_processo_resultado`),
  KEY `aap_licao_aprendida` (`aap_licao_aprendida`),
  KEY `aap_reparticao_modelo_metodo` (`aap_reparticao_modelo_metodo`),
  KEY `aap_ferramenta` (`aap_ferramenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaq_nivel_atributo`
--

CREATE TABLE IF NOT EXISTS `aaq_nivel_atributo` (
  `aaq_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaq_nivel` int(11) NOT NULL,
  `aaq_atributo` int(11) NOT NULL,
  PRIMARY KEY (`aaq_id`),
  KEY `aaq_nivel` (`aaq_nivel`),
  KEY `aaq_atributo` (`aaq_atributo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `aaq_nivel_atributo`
--

INSERT INTO `aaq_nivel_atributo` (`aaq_id`, `aaq_nivel`, `aaq_atributo`) VALUES
(1, 14, 1),
(2, 14, 2),
(3, 13, 1),
(4, 13, 2),
(5, 13, 3),
(6, 12, 1),
(7, 12, 2),
(8, 12, 3),
(9, 12, 4),
(10, 12, 5),
(11, 11, 1),
(12, 11, 2),
(13, 11, 3),
(14, 11, 4),
(15, 11, 5),
(16, 10, 1),
(17, 10, 2),
(18, 10, 3),
(19, 10, 4),
(20, 10, 5),
(21, 9, 1),
(22, 9, 2),
(23, 9, 3),
(24, 9, 4),
(25, 9, 5),
(26, 9, 6),
(27, 9, 7),
(28, 8, 1),
(29, 8, 2),
(30, 8, 3),
(31, 8, 4),
(32, 8, 5),
(33, 8, 6),
(34, 8, 7),
(35, 8, 8),
(36, 8, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aar_rap`
--

CREATE TABLE IF NOT EXISTS `aar_rap` (
  `aar_id` int(11) NOT NULL AUTO_INCREMENT,
  `aar_nome` varchar(20) NOT NULL,
  `aar_descricao` varchar(400) NOT NULL,
  PRIMARY KEY (`aar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Extraindo dados da tabela `aar_rap`
--

INSERT INTO `aar_rap` (`aar_id`, `aar_nome`, `aar_descricao`) VALUES
(1, 'RAP 1', 'O processo atinge seus resultados definidos.'),
(2, 'RAP 2', 'Existe uma política organizacional estabelecida e mantida para o processo.'),
(3, 'RAP 3', 'A execução do processo é planejada.'),
(4, 'RAP 4', 'A execução do processo é monitorada e ajustes são realizados.'),
(5, 'RAP 4', 'Medidas são planejadas e coletadas para monitoração da execução do processo e ajustes são realizados.'),
(6, 'RAP 5', 'As informações e os recursos necessários para a execução do processo são identificados e disponibilizados;'),
(7, 'RAP 6', 'As responsabilidades e a autoridade para executar o processo são definidas, atribuídas e comunicadas'),
(8, 'RAP 6', 'Os papéis requeridos, responsabilidades e autoridade para execução do processo definido são atribuídos e comunicados.'),
(9, 'RAP 7', 'As pessoas que executam o processo são competentes em termos de formação, treinamento e experiência.'),
(10, 'RAP 8', 'A comunicação entre as partes interessadas no processo é planejada e executada de forma a garantir o seu envolvimento.'),
(11, 'RAP 9', 'Os resultados do processo são revistos com a gerência de alto nível para fornecer visibilidade sobre a sua situação na organização.'),
(12, 'RAP 9', 'Métodos adequados para monitorar a eficácia e adequação do processo são determinados e os resultados do processo são revistos com a gerência de alto nível para fornecer visibilidade sobre a sua situação na organização.'),
(13, 'RAP 10', 'O processo planejado para o projeto é executado.'),
(14, 'RAP 10', 'A aderência dos processos executados às descrições de processo, padrões e procedimentos é avaliada objetivamente e são tratadas as não conformidades'),
(15, 'RAP 11', 'Os requisitos dos produtos de trabalho do processo são identificados.'),
(16, 'RAP 12', 'Requisitos para documentação e controle dos produtos de trabalho são estabelecidos.'),
(17, 'RAP 13', 'Os produtos de trabalho são colocados em níveis apropriados de controle.'),
(18, 'RAP 14', 'Os produtos de trabalho são avaliados objetivamente com relação aos padrões, procedimentos e requisitos aplicáveis e são tratadas as não conformidades.'),
(19, 'RAP 15', 'Um processo padrão é descrito, incluindo diretrizes para sua adaptação.'),
(20, 'RAP 16', 'A sequência e interação do processo padrão com outros processos são determinadas.'),
(21, 'RAP 17', 'Os papéis e competências requeridos para executar o processo são identificados como parte do processo padrão.'),
(22, 'RAP 18', 'A infra-estrutura e o ambiente de trabalho requeridos para executar o processo são identificados como parte do processo padrão.'),
(23, 'RAP 19', 'Um processo definido é implementado baseado nas diretrizes para seleção e/ou adaptação do processo padrão.'),
(24, 'RAP 20', 'A infra-estrutura e o ambiente de trabalho requeridos para executar o processo definido são disponibilizados, gerenciados e mantidos.'),
(25, 'RAP 21', 'Dados apropriados são coletados e analisados, constituindo uma base para o entendimento do comportamento do processo, para demonstrar a adequação e a eficácia do processo, e avaliar onde pode ser feita a melhoria contínua do processo.'),
(26, 'RAP 22', 'As necessidades de informação dos usuários dos processos, requeridas para apoiar objetivos de negócio relevantes da organização, são identificadas.'),
(27, 'RAP 23', 'Objetivos de medição organizacionais dos processos e/ou subprocessos são derivados das necessidades de informação dos usuários do processo.'),
(28, 'RAP 24', 'Objetivos quantitativos organizacionais de qualidade e de desempenho dos processos e/ou subprocessos são definidos para apoiar os objetivos de negócio.'),
(29, 'RAP 25', 'Os processos e/ou subprocessos que serão objeto de análise de desempenho são selecionados a partir do conjunto de processos padrão da organização e das necessidades de informação dos usuários dos processos.'),
(30, 'RAP 26', 'Medidas, bem como a frequência de realização de suas medições, são identificadas e definidas de acordo com os objetivos de medição do processo/subprocesso e os objetivos quantitativos de qualidade e de desempenho do processo.'),
(31, 'RAP 27', 'Resultados das medições são coletados, analisados, utilizando técnicas estatísticas e outras técnicas quantitativas apropriadas, e são comunicados para monitorar o alcance dos objetivos quantitativos de qualidade e de desempenho do processo/subprocesso.'),
(32, 'RAP 28', 'Resultados de medição são utilizados para caracterizar o desempenho do processo/subprocesso.'),
(33, 'RAP 29', 'Modelos de desempenho do processo são estabelecidos e mantidos.'),
(34, 'RAP 30', 'Técnicas de análise e de controle para a gerência quantitativa dos processos/subprocessos são identificadas e aplicadas quando necessário.'),
(35, 'RAP 31', 'Limites de controle de variação são estabelecidos para o desempenho normal do processo.'),
(36, 'RAP 32', 'Dados de medição são analisados com relação a causas especiais de variação.'),
(37, 'RAP 33', 'Ações corretivas e preventivas são realizadas para tratar causas especiais, ou de outros tipos, de variação.'),
(38, 'RAP 34', 'Limites de controle são restabelecidos, quando necessário, seguindo as ações corretivas, de forma que os processos continuem estáveis, capazes e previsíveis.'),
(39, 'RAP 35', 'Objetivos de negócio da organização são mantidos com base no entendimento das estratégias de negócio e resultados de desempenho do processo.'),
(40, 'RAP 36', 'Objetivos de melhoria do processo são definidos com base no entendimento do desempenho do processo, de forma a verificar que os objetivos de negócio relevantes são atingíveis.'),
(41, 'RAP 37', 'Dados que influenciam o desempenho do processo são identificados, classificados e selecionados para análise de causas.'),
(42, 'RAP 38', 'Dados selecionados são analisados para identificar causas raiz e propor soluções aceitáveis para evitar ocorrências futuras de resultados similares ou incorporar melhores práticas no processo.'),
(43, 'RAP 39', 'Dados adequados são analisados para identificar causas comuns de variação no desempenho do processo.'),
(44, 'RAP 40', 'Dados adequados são analisados para identificar oportunidades para aplicar melhores práticas e inovações com impacto no alcance dos objetivos de negócio.'),
(45, 'RAP 41', 'Oportunidades de melhoria derivadas de novas tecnologias e conceitos de processo são identificadas, avaliadas e selecionadas com base no impacto no alcance dos objetivos de negócio.'),
(46, 'RAP 42', 'Uma estratégia de implementação para as melhorias selecionadas é estabelecida para alcançar os objetivos de melhoria do processo e para resolver problemas.'),
(47, 'RAP 43', 'O impacto de todas as mudanças propostas é avaliado com relação aos objetivos do processo definido e do processo padrão.'),
(48, 'RAP 44', 'A implementação de todas as mudanças acordadas é gerenciada para assegurar que qualquer alteração no desempenho do processo seja entendida e que sejam tomadas as ações pertinentes.'),
(49, 'RAP 45', 'As ações implementadas para resolução de problemas e melhoria no processo são acompanhadas, com uso de técnicas estatísticas e outras técnicas quantitativas, para verificar se as mudanças no processo corrigiram o problema e melhoraram o seu desempenho.'),
(50, 'RAP 46', 'Dados da análise de causas e de resolução são armazenados para uso em situações similares.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aas_ferramentas`
--

CREATE TABLE IF NOT EXISTS `aas_ferramentas` (
  `aas_id` int(11) NOT NULL AUTO_INCREMENT,
  `aas_nome` varchar(30) NOT NULL,
  `aas_descricao` text NOT NULL,
  `aas_versao` varchar(30) NOT NULL,
  `aas_licenca` varchar(30) NOT NULL,
  PRIMARY KEY (`aas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aat_rap_licao_reparticao`
--

CREATE TABLE IF NOT EXISTS `aat_rap_licao_reparticao` (
  `aat_id` int(11) NOT NULL AUTO_INCREMENT,
  `aat_reparticao_modelo_metodo` int(11) NOT NULL,
  `aat_licao_aprendida` int(11) NOT NULL,
  `aat_ferramenta` int(11) NOT NULL,
  `aat_rap` int(11) NOT NULL,
  PRIMARY KEY (`aat_id`),
  KEY `aat_reparticao_modelo_metodo` (`aat_reparticao_modelo_metodo`),
  KEY `aat_licao_aprendida` (`aat_licao_aprendida`),
  KEY `aat_ferramenta` (`aat_ferramenta`),
  KEY `aat_rap` (`aat_rap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aau_nivel_licao_reparticao`
--

CREATE TABLE IF NOT EXISTS `aau_nivel_licao_reparticao` (
  `aau_id` int(11) NOT NULL,
  `aau_licao_aprendida` int(11) NOT NULL,
  `aau_reparticao_modelo_metodo` int(11) NOT NULL,
  `aau_nivel` int(11) NOT NULL,
  `aau_ferramenta` int(11) NOT NULL,
  KEY `aau_licao_aprendida` (`aau_licao_aprendida`),
  KEY `aau_reparticao_modelo_metodo` (`aau_reparticao_modelo_metodo`),
  KEY `aau_nivel` (`aau_nivel`),
  KEY `aau_ferramenta` (`aau_ferramenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aav_nivel_atributo_rap`
--

CREATE TABLE IF NOT EXISTS `aav_nivel_atributo_rap` (
  `aav_id` int(11) NOT NULL AUTO_INCREMENT,
  `aav_nivel_atributo` int(11) NOT NULL,
  `aav_rap` int(11) NOT NULL,
  PRIMARY KEY (`aav_id`),
  KEY `aav_nivel_atributo` (`aav_rap`),
  KEY `aav_rap` (`aav_nivel_atributo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=173 ;

--
-- Extraindo dados da tabela `aav_nivel_atributo_rap`
--

INSERT INTO `aav_nivel_atributo_rap` (`aav_id`, `aav_nivel_atributo`, `aav_rap`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 6, 1),
(4, 11, 1),
(5, 16, 1),
(6, 21, 1),
(7, 28, 1),
(8, 2, 2),
(9, 4, 2),
(10, 7, 2),
(11, 12, 2),
(12, 17, 2),
(13, 22, 2),
(14, 29, 2),
(15, 2, 3),
(16, 4, 3),
(17, 7, 3),
(18, 12, 3),
(19, 17, 3),
(20, 22, 3),
(21, 29, 3),
(22, 2, 4),
(23, 4, 5),
(24, 7, 5),
(25, 12, 5),
(26, 17, 5),
(27, 22, 5),
(28, 29, 5),
(29, 2, 6),
(30, 4, 6),
(31, 7, 6),
(32, 12, 6),
(33, 17, 6),
(34, 22, 6),
(35, 29, 6),
(36, 2, 7),
(37, 4, 7),
(38, 7, 8),
(39, 12, 8),
(40, 17, 8),
(41, 22, 8),
(42, 29, 8),
(43, 2, 9),
(44, 4, 9),
(45, 7, 9),
(46, 12, 9),
(47, 17, 9),
(48, 22, 9),
(49, 29, 9),
(50, 2, 10),
(51, 4, 10),
(52, 7, 10),
(53, 12, 10),
(54, 17, 10),
(55, 22, 10),
(56, 29, 10),
(57, 2, 11),
(58, 4, 11),
(59, 7, 12),
(60, 12, 12),
(61, 17, 12),
(62, 22, 12),
(63, 29, 12),
(64, 2, 13),
(65, 4, 14),
(66, 7, 14),
(67, 12, 14),
(68, 17, 14),
(69, 22, 14),
(70, 29, 14),
(71, 5, 15),
(72, 8, 15),
(73, 13, 15),
(74, 18, 15),
(75, 23, 15),
(76, 30, 15),
(77, 5, 16),
(78, 8, 16),
(79, 13, 16),
(80, 18, 16),
(81, 23, 16),
(82, 30, 16),
(83, 5, 17),
(84, 8, 17),
(85, 13, 17),
(86, 18, 17),
(87, 23, 17),
(88, 30, 17),
(89, 5, 18),
(90, 8, 18),
(91, 13, 18),
(92, 18, 18),
(93, 23, 18),
(94, 30, 18),
(95, 9, 19),
(96, 14, 19),
(97, 19, 19),
(98, 24, 19),
(99, 31, 19),
(100, 9, 20),
(101, 14, 20),
(102, 19, 20),
(103, 24, 20),
(104, 31, 20),
(105, 9, 21),
(106, 14, 21),
(107, 19, 21),
(108, 24, 21),
(109, 31, 21),
(110, 9, 22),
(111, 14, 22),
(112, 19, 22),
(113, 24, 22),
(114, 31, 22),
(115, 10, 23),
(116, 15, 23),
(117, 20, 23),
(118, 25, 23),
(119, 32, 23),
(120, 10, 24),
(121, 15, 24),
(122, 20, 24),
(123, 25, 24),
(124, 32, 24),
(125, 10, 25),
(126, 15, 25),
(127, 20, 25),
(128, 25, 25),
(129, 32, 25),
(130, 26, 26),
(131, 33, 26),
(132, 26, 27),
(133, 33, 27),
(134, 26, 28),
(135, 33, 28),
(136, 26, 29),
(137, 33, 29),
(138, 26, 30),
(139, 33, 30),
(140, 26, 31),
(141, 33, 31),
(142, 26, 32),
(143, 33, 32),
(144, 26, 33),
(145, 33, 33),
(146, 27, 34),
(147, 34, 34),
(148, 27, 35),
(149, 34, 35),
(150, 27, 36),
(151, 34, 36),
(156, 27, 37),
(157, 34, 37),
(158, 27, 38),
(159, 34, 38),
(161, 35, 39),
(162, 35, 40),
(163, 35, 41),
(164, 35, 42),
(165, 35, 43),
(166, 35, 44),
(167, 35, 45),
(168, 35, 46),
(169, 36, 47),
(170, 36, 48),
(171, 36, 49),
(172, 36, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaw_nivel_processo_resultado`
--

CREATE TABLE IF NOT EXISTS `aaw_nivel_processo_resultado` (
  `aaw_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaw_nivel_processo` int(11) NOT NULL,
  `aaw_processo_resultado` int(11) NOT NULL,
  PRIMARY KEY (`aaw_id`),
  KEY `aaw_nivel_processo` (`aaw_nivel_processo`),
  KEY `aaw_processo_resultado` (`aaw_processo_resultado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=793 ;

--
-- Extraindo dados da tabela `aaw_nivel_processo_resultado`
--

INSERT INTO `aaw_nivel_processo_resultado` (`aaw_id`, `aaw_nivel_processo`, `aaw_processo_resultado`) VALUES
(1, 1, 1),
(2, 23, 1),
(3, 12, 1),
(4, 31, 1),
(5, 42, 1),
(6, 21, 1),
(7, 76, 1),
(8, 1, 2),
(9, 23, 2),
(10, 12, 2),
(11, 31, 2),
(12, 42, 2),
(13, 21, 2),
(14, 76, 2),
(15, 1, 3),
(16, 23, 3),
(17, 12, 3),
(18, 31, 3),
(19, 42, 3),
(20, 21, 3),
(21, 76, 3),
(22, 1, 4),
(23, 23, 4),
(24, 12, 5),
(25, 31, 5),
(26, 42, 5),
(27, 21, 5),
(28, 76, 5),
(29, 1, 6),
(30, 23, 6),
(31, 12, 6),
(32, 31, 6),
(33, 42, 6),
(34, 21, 6),
(35, 76, 6),
(36, 1, 7),
(37, 23, 7),
(38, 12, 7),
(39, 31, 7),
(40, 42, 7),
(41, 21, 7),
(42, 76, 7),
(43, 1, 8),
(44, 23, 8),
(45, 12, 8),
(46, 31, 8),
(47, 42, 8),
(48, 21, 8),
(49, 76, 8),
(50, 1, 9),
(51, 23, 9),
(52, 12, 10),
(53, 31, 10),
(54, 42, 10),
(55, 21, 10),
(56, 76, 10),
(57, 1, 11),
(58, 23, 11),
(59, 12, 11),
(60, 31, 11),
(61, 42, 11),
(62, 21, 11),
(63, 76, 11),
(64, 1, 12),
(65, 23, 12),
(66, 12, 12),
(67, 31, 12),
(68, 42, 12),
(69, 21, 12),
(70, 76, 12),
(71, 1, 13),
(72, 23, 13),
(73, 12, 13),
(74, 31, 13),
(75, 42, 13),
(76, 21, 13),
(77, 76, 13),
(78, 1, 14),
(79, 23, 14),
(80, 12, 14),
(81, 31, 14),
(82, 42, 14),
(83, 21, 14),
(84, 76, 14),
(85, 1, 15),
(86, 23, 15),
(87, 12, 15),
(88, 31, 15),
(89, 42, 15),
(90, 21, 15),
(91, 76, 15),
(92, 1, 16),
(93, 23, 16),
(94, 12, 16),
(95, 31, 16),
(96, 42, 16),
(97, 21, 16),
(98, 76, 16),
(99, 1, 17),
(100, 23, 17),
(101, 12, 17),
(102, 31, 17),
(103, 42, 17),
(104, 21, 17),
(105, 76, 17),
(106, 1, 18),
(107, 23, 18),
(108, 12, 18),
(109, 31, 18),
(110, 42, 18),
(111, 21, 18),
(112, 76, 18),
(113, 1, 19),
(114, 23, 19),
(115, 12, 19),
(116, 31, 19),
(117, 42, 19),
(118, 21, 19),
(119, 76, 19),
(120, 1, 20),
(121, 23, 20),
(122, 12, 20),
(123, 31, 20),
(124, 42, 20),
(125, 21, 20),
(126, 76, 20),
(127, 1, 21),
(128, 23, 21),
(129, 12, 21),
(130, 31, 21),
(131, 42, 21),
(132, 21, 21),
(133, 76, 21),
(134, 12, 22),
(135, 31, 22),
(136, 42, 22),
(137, 21, 22),
(138, 76, 22),
(139, 12, 23),
(140, 31, 23),
(141, 42, 23),
(142, 21, 23),
(143, 76, 23),
(144, 12, 24),
(145, 31, 24),
(146, 42, 24),
(147, 21, 25),
(148, 76, 25),
(149, 21, 26),
(150, 76, 26),
(151, 21, 27),
(152, 76, 27),
(153, 21, 28),
(154, 76, 28),
(155, 21, 29),
(156, 76, 29),
(157, 21, 30),
(158, 76, 30),
(159, 21, 31),
(160, 76, 31),
(161, 2, 32),
(162, 24, 32),
(163, 25, 32),
(164, 32, 32),
(165, 43, 32),
(166, 58, 32),
(167, 77, 32),
(168, 2, 33),
(169, 24, 33),
(170, 25, 33),
(171, 32, 33),
(172, 43, 33),
(173, 58, 33),
(174, 77, 33),
(175, 2, 34),
(176, 24, 34),
(177, 25, 34),
(178, 32, 34),
(179, 43, 34),
(180, 58, 34),
(181, 77, 34),
(182, 2, 35),
(183, 24, 35),
(184, 25, 35),
(185, 32, 35),
(186, 43, 35),
(187, 58, 35),
(188, 77, 35),
(189, 2, 36),
(190, 24, 36),
(191, 25, 36),
(192, 32, 36),
(193, 43, 36),
(194, 58, 36),
(195, 77, 36),
(196, 3, 37),
(197, 26, 37),
(198, 33, 37),
(199, 44, 37),
(200, 59, 37),
(201, 78, 37),
(202, 3, 38),
(203, 26, 38),
(204, 33, 38),
(205, 44, 38),
(206, 59, 38),
(207, 78, 38),
(208, 3, 39),
(209, 26, 39),
(210, 33, 39),
(211, 44, 39),
(212, 59, 39),
(213, 78, 39),
(214, 3, 40),
(215, 26, 40),
(216, 33, 40),
(217, 44, 40),
(218, 59, 40),
(219, 78, 40),
(220, 3, 41),
(221, 26, 41),
(222, 33, 41),
(223, 44, 41),
(224, 59, 41),
(225, 78, 41),
(226, 3, 42),
(227, 26, 42),
(228, 33, 42),
(229, 44, 42),
(230, 59, 42),
(231, 78, 42),
(232, 3, 43),
(233, 26, 43),
(234, 33, 43),
(235, 44, 43),
(236, 59, 43),
(237, 78, 43),
(238, 3, 44),
(239, 26, 44),
(240, 33, 44),
(241, 44, 44),
(242, 59, 44),
(243, 78, 44),
(244, 4, 45),
(245, 27, 45),
(246, 34, 45),
(247, 45, 45),
(248, 60, 45),
(249, 79, 45),
(250, 4, 46),
(251, 27, 46),
(252, 34, 46),
(253, 45, 46),
(254, 60, 46),
(255, 79, 46),
(256, 4, 47),
(257, 27, 47),
(258, 34, 47),
(259, 45, 47),
(260, 60, 47),
(261, 79, 47),
(262, 4, 48),
(263, 27, 48),
(264, 34, 48),
(265, 45, 48),
(266, 60, 48),
(267, 79, 48),
(268, 4, 49),
(269, 27, 49),
(270, 34, 49),
(271, 45, 49),
(272, 60, 49),
(273, 79, 49),
(274, 4, 50),
(275, 27, 50),
(276, 34, 50),
(277, 45, 50),
(278, 60, 50),
(279, 79, 50),
(280, 4, 51),
(281, 27, 51),
(282, 34, 51),
(283, 45, 51),
(284, 60, 51),
(285, 79, 51),
(286, 6, 52),
(287, 29, 52),
(288, 36, 52),
(289, 47, 52),
(290, 62, 52),
(291, 81, 52),
(292, 6, 53),
(293, 29, 53),
(294, 36, 53),
(295, 47, 53),
(296, 62, 53),
(297, 81, 53),
(298, 6, 54),
(299, 29, 54),
(300, 36, 54),
(301, 47, 54),
(302, 62, 54),
(303, 81, 54),
(304, 6, 55),
(305, 29, 55),
(306, 36, 55),
(307, 47, 55),
(308, 62, 55),
(309, 81, 55),
(310, 5, 56),
(311, 28, 56),
(312, 35, 56),
(313, 46, 56),
(314, 61, 56),
(315, 80, 56),
(316, 5, 57),
(317, 28, 57),
(318, 35, 57),
(319, 46, 57),
(320, 61, 57),
(321, 80, 57),
(322, 5, 58),
(323, 28, 58),
(324, 35, 58),
(325, 46, 58),
(326, 61, 58),
(327, 80, 58),
(328, 5, 59),
(329, 28, 59),
(330, 35, 59),
(331, 46, 59),
(332, 61, 59),
(333, 80, 59),
(334, 5, 60),
(335, 28, 60),
(336, 35, 60),
(337, 46, 60),
(338, 61, 60),
(339, 80, 60),
(340, 5, 61),
(341, 28, 61),
(342, 35, 61),
(343, 46, 61),
(344, 61, 61),
(345, 80, 61),
(346, 5, 62),
(347, 28, 62),
(348, 35, 62),
(349, 46, 62),
(350, 61, 62),
(351, 80, 62),
(352, 5, 63),
(353, 28, 63),
(354, 35, 63),
(355, 46, 63),
(356, 61, 63),
(357, 80, 63),
(358, 7, 64),
(359, 30, 64),
(360, 37, 64),
(361, 48, 64),
(362, 63, 64),
(363, 82, 64),
(364, 7, 65),
(365, 30, 65),
(366, 37, 65),
(367, 48, 65),
(368, 63, 65),
(369, 82, 65),
(370, 7, 66),
(371, 30, 66),
(372, 37, 66),
(373, 48, 66),
(374, 63, 66),
(375, 82, 66),
(376, 7, 67),
(377, 30, 67),
(378, 37, 67),
(379, 48, 67),
(380, 63, 67),
(381, 82, 67),
(382, 7, 68),
(383, 30, 68),
(384, 37, 68),
(385, 48, 68),
(386, 63, 68),
(387, 82, 68),
(388, 7, 69),
(389, 30, 69),
(390, 37, 69),
(391, 48, 69),
(392, 63, 69),
(393, 82, 69),
(394, 7, 70),
(395, 30, 70),
(396, 37, 70),
(397, 48, 70),
(398, 63, 70),
(399, 82, 70),
(400, 8, 71),
(401, 38, 71),
(402, 49, 71),
(403, 64, 71),
(404, 83, 71),
(405, 8, 72),
(406, 38, 72),
(407, 49, 72),
(408, 64, 72),
(409, 83, 72),
(410, 8, 73),
(411, 38, 73),
(412, 49, 73),
(413, 64, 73),
(414, 83, 73),
(415, 8, 74),
(416, 38, 74),
(417, 49, 74),
(418, 64, 74),
(419, 83, 74),
(420, 8, 75),
(421, 38, 75),
(422, 49, 75),
(423, 64, 75),
(424, 83, 75),
(425, 8, 76),
(426, 38, 76),
(427, 49, 76),
(428, 64, 76),
(429, 83, 76),
(430, 8, 77),
(431, 38, 77),
(432, 49, 77),
(433, 64, 77),
(434, 83, 77),
(435, 8, 78),
(436, 38, 78),
(437, 49, 78),
(438, 64, 78),
(439, 83, 78),
(440, 8, 79),
(441, 38, 79),
(442, 49, 79),
(443, 64, 79),
(444, 83, 79),
(445, 8, 80),
(446, 38, 80),
(447, 49, 80),
(448, 64, 80),
(449, 83, 80),
(450, 9, 81),
(451, 39, 81),
(452, 50, 81),
(453, 65, 81),
(454, 84, 81),
(455, 9, 82),
(456, 39, 82),
(457, 50, 82),
(458, 65, 82),
(459, 84, 82),
(460, 9, 83),
(461, 39, 83),
(462, 50, 83),
(463, 65, 83),
(464, 84, 83),
(465, 9, 84),
(466, 39, 84),
(467, 50, 84),
(468, 65, 84),
(469, 84, 84),
(470, 9, 85),
(471, 39, 85),
(472, 50, 85),
(473, 65, 85),
(474, 84, 85),
(475, 9, 86),
(476, 39, 86),
(477, 50, 86),
(478, 65, 86),
(479, 84, 86),
(480, 9, 87),
(481, 39, 87),
(482, 50, 87),
(483, 65, 87),
(484, 84, 87),
(485, 9, 88),
(486, 39, 88),
(487, 50, 88),
(488, 65, 88),
(489, 84, 88),
(490, 10, 91),
(491, 40, 91),
(492, 51, 91),
(493, 66, 91),
(494, 85, 91),
(495, 10, 92),
(496, 40, 92),
(497, 51, 92),
(498, 66, 92),
(499, 85, 92),
(500, 10, 93),
(501, 40, 93),
(502, 51, 93),
(503, 66, 93),
(504, 85, 93),
(505, 10, 94),
(506, 40, 94),
(507, 51, 94),
(508, 66, 94),
(509, 85, 94),
(510, 10, 95),
(511, 40, 95),
(512, 51, 95),
(513, 66, 95),
(514, 85, 95),
(515, 10, 96),
(516, 40, 96),
(517, 51, 96),
(518, 66, 96),
(519, 85, 96),
(520, 10, 97),
(521, 40, 97),
(522, 51, 97),
(523, 66, 97),
(524, 85, 97),
(525, 10, 98),
(526, 40, 98),
(527, 51, 98),
(528, 66, 98),
(529, 85, 98),
(530, 10, 99),
(531, 40, 99),
(532, 51, 99),
(533, 66, 99),
(534, 85, 99),
(535, 10, 100),
(536, 40, 100),
(537, 51, 100),
(538, 66, 100),
(539, 85, 100),
(540, 10, 101),
(541, 40, 101),
(542, 51, 101),
(543, 66, 101),
(544, 85, 101),
(545, 11, 102),
(546, 41, 102),
(547, 52, 102),
(548, 67, 102),
(549, 86, 102),
(550, 11, 103),
(551, 41, 103),
(552, 52, 103),
(553, 67, 103),
(554, 86, 103),
(555, 11, 104),
(556, 41, 104),
(557, 52, 104),
(558, 67, 104),
(559, 86, 104),
(560, 11, 105),
(561, 41, 105),
(562, 52, 105),
(563, 67, 105),
(564, 86, 105),
(565, 11, 106),
(566, 41, 106),
(567, 52, 106),
(568, 67, 106),
(569, 86, 106),
(570, 13, 107),
(571, 53, 107),
(572, 68, 107),
(573, 87, 107),
(574, 13, 108),
(575, 53, 108),
(576, 68, 108),
(577, 87, 108),
(578, 13, 109),
(579, 53, 109),
(580, 68, 109),
(581, 87, 109),
(582, 13, 110),
(583, 53, 110),
(584, 68, 110),
(585, 87, 110),
(586, 13, 111),
(587, 53, 111),
(588, 68, 111),
(589, 87, 111),
(590, 13, 112),
(591, 53, 112),
(592, 68, 112),
(593, 87, 112),
(594, 13, 113),
(595, 53, 113),
(596, 68, 113),
(597, 87, 113),
(598, 14, 114),
(599, 54, 114),
(600, 69, 114),
(601, 88, 114),
(602, 14, 115),
(603, 54, 115),
(604, 69, 115),
(605, 88, 115),
(606, 14, 116),
(607, 54, 116),
(608, 69, 116),
(609, 88, 116),
(610, 14, 117),
(611, 54, 117),
(612, 69, 117),
(613, 88, 117),
(614, 14, 118),
(615, 54, 118),
(616, 69, 118),
(617, 88, 118),
(618, 14, 119),
(619, 54, 119),
(620, 69, 119),
(621, 88, 119),
(622, 14, 120),
(623, 54, 120),
(624, 69, 120),
(625, 88, 120),
(626, 14, 121),
(627, 54, 121),
(628, 69, 121),
(629, 88, 121),
(630, 14, 122),
(631, 54, 122),
(632, 69, 122),
(633, 88, 122),
(634, 15, 123),
(635, 55, 123),
(636, 70, 123),
(637, 89, 123),
(638, 15, 124),
(639, 55, 124),
(640, 70, 124),
(641, 89, 124),
(642, 15, 125),
(643, 55, 125),
(644, 70, 125),
(645, 89, 125),
(646, 15, 126),
(647, 55, 126),
(648, 70, 126),
(649, 89, 126),
(650, 15, 127),
(651, 55, 127),
(652, 70, 127),
(653, 89, 127),
(654, 15, 128),
(655, 55, 128),
(656, 70, 128),
(657, 89, 128),
(658, 15, 129),
(659, 55, 129),
(660, 70, 129),
(661, 89, 129),
(662, 15, 130),
(663, 55, 130),
(664, 70, 130),
(665, 89, 130),
(666, 16, 131),
(667, 56, 131),
(668, 71, 131),
(669, 90, 131),
(670, 16, 132),
(671, 56, 132),
(672, 71, 132),
(673, 90, 132),
(674, 16, 133),
(675, 56, 133),
(676, 71, 133),
(677, 90, 133),
(678, 16, 134),
(679, 56, 134),
(680, 71, 134),
(681, 90, 134),
(682, 16, 135),
(683, 56, 135),
(684, 71, 135),
(685, 90, 135),
(686, 16, 136),
(687, 56, 136),
(688, 71, 136),
(689, 90, 136),
(690, 16, 137),
(691, 56, 137),
(692, 71, 137),
(693, 90, 137),
(694, 17, 138),
(695, 57, 138),
(696, 72, 138),
(697, 91, 138),
(698, 17, 139),
(699, 57, 139),
(700, 72, 139),
(701, 91, 139),
(702, 17, 140),
(703, 57, 140),
(704, 72, 140),
(705, 91, 140),
(706, 17, 141),
(707, 57, 141),
(708, 72, 141),
(709, 91, 141),
(710, 17, 142),
(711, 57, 142),
(712, 72, 142),
(713, 91, 142),
(714, 17, 143),
(715, 57, 143),
(716, 72, 143),
(717, 91, 143),
(718, 19, 144),
(719, 74, 144),
(720, 92, 144),
(721, 19, 145),
(722, 74, 145),
(723, 92, 145),
(724, 19, 146),
(725, 74, 146),
(726, 92, 146),
(727, 19, 147),
(728, 74, 147),
(729, 92, 147),
(730, 19, 148),
(731, 74, 148),
(732, 92, 148),
(733, 19, 149),
(734, 74, 149),
(735, 92, 149),
(736, 19, 150),
(737, 74, 150),
(738, 92, 150),
(739, 19, 151),
(740, 74, 151),
(741, 92, 151),
(742, 19, 152),
(743, 74, 152),
(744, 92, 152),
(745, 18, 153),
(746, 73, 153),
(747, 93, 153),
(748, 18, 154),
(749, 73, 154),
(750, 93, 154),
(751, 18, 155),
(752, 73, 155),
(753, 93, 155),
(754, 18, 156),
(755, 73, 156),
(756, 93, 156),
(757, 18, 157),
(758, 73, 157),
(759, 93, 157),
(760, 18, 158),
(761, 73, 158),
(762, 93, 158),
(763, 18, 159),
(764, 73, 159),
(765, 93, 159),
(766, 20, 160),
(767, 75, 160),
(768, 94, 160),
(769, 20, 161),
(770, 75, 161),
(771, 94, 161),
(772, 20, 162),
(773, 75, 162),
(774, 94, 162),
(775, 20, 163),
(776, 75, 163),
(777, 94, 163),
(778, 20, 164),
(779, 75, 164),
(780, 94, 164),
(781, 20, 165),
(782, 75, 165),
(783, 94, 165),
(784, 20, 166),
(785, 75, 166),
(786, 94, 166),
(787, 20, 167),
(788, 75, 167),
(789, 94, 167),
(790, 20, 168),
(791, 75, 168),
(792, 94, 168);

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `aab_filial`
--
ALTER TABLE `aab_filial`
  ADD CONSTRAINT `aab_filial_ibfk_1` FOREIGN KEY (`aab_empresa`) REFERENCES `aaa_empresa` (`aaa_id`);

--
-- Restrições para a tabela `aac_reparticao`
--
ALTER TABLE `aac_reparticao`
  ADD CONSTRAINT `aac_reparticao_ibfk_2` FOREIGN KEY (`aac_filial`) REFERENCES `aab_filial` (`aab_id`);

--
-- Restrições para a tabela `aaf_reparticao_modelo_metodo`
--
ALTER TABLE `aaf_reparticao_modelo_metodo`
  ADD CONSTRAINT `aaf_reparticao_modelo_metodo_ibfk_1` FOREIGN KEY (`aaf_metodo`) REFERENCES `aad_metodo_agil` (`aad_id`),
  ADD CONSTRAINT `aaf_reparticao_modelo_metodo_ibfk_2` FOREIGN KEY (`aaf_modelo`) REFERENCES `aad_metodo_agil` (`aad_id`),
  ADD CONSTRAINT `aaf_reparticao_modelo_metodo_ibfk_3` FOREIGN KEY (`aaf_reparticao`) REFERENCES `aac_reparticao` (`aac_filial`);

--
-- Restrições para a tabela `aah_reparticao_modelo_metodo_licao`
--
ALTER TABLE `aah_reparticao_modelo_metodo_licao`
  ADD CONSTRAINT `aah_reparticao_modelo_metodo_licao_ibfk_1` FOREIGN KEY (`aah_reparticao_modelo_metodo`) REFERENCES `aah_reparticao_modelo_metodo_licao` (`aah_id`),
  ADD CONSTRAINT `aah_reparticao_modelo_metodo_licao_ibfk_2` FOREIGN KEY (`aah_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aah_reparticao_modelo_metodo_licao_ibfk_3` FOREIGN KEY (`aah_ferramentas`) REFERENCES `aas_ferramentas` (`aas_id`);

--
-- Restrições para a tabela `aai_nivel`
--
ALTER TABLE `aai_nivel`
  ADD CONSTRAINT `aai_nivel_ibfk_1` FOREIGN KEY (`aai_modelo`) REFERENCES `aae_modelo` (`aae_id`);

--
-- Restrições para a tabela `aak_processo_licao_reparticao`
--
ALTER TABLE `aak_processo_licao_reparticao`
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_1` FOREIGN KEY (`aak_processo`) REFERENCES `aaj_processo` (`aaj_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_2` FOREIGN KEY (`aak_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_3` FOREIGN KEY (`aak_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_4` FOREIGN KEY (`aak_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`);

--
-- Restrições para a tabela `aal_atributo_licao_reparticao`
--
ALTER TABLE `aal_atributo_licao_reparticao`
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_1` FOREIGN KEY (`aal_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_2` FOREIGN KEY (`aal_atributo`) REFERENCES `aam_atributo` (`aam_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_3` FOREIGN KEY (`aal_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_4` FOREIGN KEY (`aal_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`);

--
-- Restrições para a tabela `aan_nivel_processo`
--
ALTER TABLE `aan_nivel_processo`
  ADD CONSTRAINT `aan_nivel_processo_ibfk_1` FOREIGN KEY (`aan_nivel`) REFERENCES `aai_nivel` (`aai_id`),
  ADD CONSTRAINT `aan_nivel_processo_ibfk_2` FOREIGN KEY (`aan_processo`) REFERENCES `aaj_processo` (`aaj_id`);

--
-- Restrições para a tabela `aap_processo_resultado_licao_reparticao`
--
ALTER TABLE `aap_processo_resultado_licao_reparticao`
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_1` FOREIGN KEY (`aap_processo_resultado`) REFERENCES `aao_processo_resultado` (`aao_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_2` FOREIGN KEY (`aap_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_3` FOREIGN KEY (`aap_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_4` FOREIGN KEY (`aap_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`);

--
-- Restrições para a tabela `aaq_nivel_atributo`
--
ALTER TABLE `aaq_nivel_atributo`
  ADD CONSTRAINT `aaq_nivel_atributo_ibfk_1` FOREIGN KEY (`aaq_nivel`) REFERENCES `aai_nivel` (`aai_id`),
  ADD CONSTRAINT `aaq_nivel_atributo_ibfk_2` FOREIGN KEY (`aaq_atributo`) REFERENCES `aam_atributo` (`aam_id`);

--
-- Restrições para a tabela `aat_rap_licao_reparticao`
--
ALTER TABLE `aat_rap_licao_reparticao`
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_1` FOREIGN KEY (`aat_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_2` FOREIGN KEY (`aat_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_3` FOREIGN KEY (`aat_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_4` FOREIGN KEY (`aat_rap`) REFERENCES `aar_rap` (`aar_id`);

--
-- Restrições para a tabela `aau_nivel_licao_reparticao`
--
ALTER TABLE `aau_nivel_licao_reparticao`
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_1` FOREIGN KEY (`aau_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_2` FOREIGN KEY (`aau_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_3` FOREIGN KEY (`aau_nivel`) REFERENCES `aai_nivel` (`aai_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_4` FOREIGN KEY (`aau_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`);

--
-- Restrições para a tabela `aav_nivel_atributo_rap`
--
ALTER TABLE `aav_nivel_atributo_rap`
  ADD CONSTRAINT `aav_nivel_atributo_rap_ibfk_1` FOREIGN KEY (`aav_nivel_atributo`) REFERENCES `aaq_nivel_atributo` (`aaq_id`),
  ADD CONSTRAINT `aav_nivel_atributo_rap_ibfk_2` FOREIGN KEY (`aav_rap`) REFERENCES `aar_rap` (`aar_id`);

--
-- Restrições para a tabela `aaw_nivel_processo_resultado`
--
ALTER TABLE `aaw_nivel_processo_resultado`
  ADD CONSTRAINT `aaw_nivel_processo_resultado_ibfk_1` FOREIGN KEY (`aaw_nivel_processo`) REFERENCES `aan_nivel_processo` (`aan_id`),
  ADD CONSTRAINT `aaw_nivel_processo_resultado_ibfk_2` FOREIGN KEY (`aaw_processo_resultado`) REFERENCES `aao_processo_resultado` (`aao_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
