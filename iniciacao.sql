-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 22/10/2012 às 00h06min
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
  PRIMARY KEY (`aae_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados do Modelo de Maturação' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados do Nível do Modelo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aaj_processo`
--

CREATE TABLE IF NOT EXISTS `aaj_processo` (
  `aaj_id` int(11) NOT NULL AUTO_INCREMENT,
  `aaj_nome` varchar(40) NOT NULL,
  `aaj_sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`aaj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados do Processo' AUTO_INCREMENT=1 ;

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
  `aam_nome` int(11) NOT NULL,
  `aam_atributo` int(11) NOT NULL,
  PRIMARY KEY (`aam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados do Atributo' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aao_processo_resultado`
--

CREATE TABLE IF NOT EXISTS `aao_processo_resultado` (
  `aao_id` int(11) NOT NULL AUTO_INCREMENT,
  `aao_nivel_processo` int(11) NOT NULL,
  `aao_nome` varchar(30) NOT NULL,
  `aao_sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`aao_id`),
  KEY `aao_nivel_processo` (`aao_nivel_processo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aar_rap`
--

CREATE TABLE IF NOT EXISTS `aar_rap` (
  `aar_id` int(11) NOT NULL AUTO_INCREMENT,
  `aar_nivel_atributo` int(11) NOT NULL,
  `aar_nome` varchar(30) NOT NULL,
  `aar_sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`aar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_4` FOREIGN KEY (`aak_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_1` FOREIGN KEY (`aak_processo`) REFERENCES `aaj_processo` (`aaj_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_2` FOREIGN KEY (`aak_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aak_processo_licao_reparticao_ibfk_3` FOREIGN KEY (`aak_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`);

--
-- Restrições para a tabela `aal_atributo_licao_reparticao`
--
ALTER TABLE `aal_atributo_licao_reparticao`
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_4` FOREIGN KEY (`aal_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_1` FOREIGN KEY (`aal_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_2` FOREIGN KEY (`aal_atributo`) REFERENCES `aam_atributo` (`aam_id`),
  ADD CONSTRAINT `aal_atributo_licao_reparticao_ibfk_3` FOREIGN KEY (`aal_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`);

--
-- Restrições para a tabela `aan_nivel_processo`
--
ALTER TABLE `aan_nivel_processo`
  ADD CONSTRAINT `aan_nivel_processo_ibfk_1` FOREIGN KEY (`aan_nivel`) REFERENCES `aai_nivel` (`aai_id`),
  ADD CONSTRAINT `aan_nivel_processo_ibfk_2` FOREIGN KEY (`aan_processo`) REFERENCES `aaj_processo` (`aaj_id`);

--
-- Restrições para a tabela `aao_processo_resultado`
--
ALTER TABLE `aao_processo_resultado`
  ADD CONSTRAINT `aao_processo_resultado_ibfk_1` FOREIGN KEY (`aao_nivel_processo`) REFERENCES `aan_nivel_processo` (`aan_id`);

--
-- Restrições para a tabela `aap_processo_resultado_licao_reparticao`
--
ALTER TABLE `aap_processo_resultado_licao_reparticao`
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_4` FOREIGN KEY (`aap_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_1` FOREIGN KEY (`aap_processo_resultado`) REFERENCES `aao_processo_resultado` (`aao_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_2` FOREIGN KEY (`aap_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aap_processo_resultado_licao_reparticao_ibfk_3` FOREIGN KEY (`aap_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`);

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
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_4` FOREIGN KEY (`aat_rap`) REFERENCES `aar_rap` (`aar_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_1` FOREIGN KEY (`aat_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_2` FOREIGN KEY (`aat_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aat_rap_licao_reparticao_ibfk_3` FOREIGN KEY (`aat_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`);

--
-- Restrições para a tabela `aau_nivel_licao_reparticao`
--
ALTER TABLE `aau_nivel_licao_reparticao`
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_4` FOREIGN KEY (`aau_ferramenta`) REFERENCES `aas_ferramentas` (`aas_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_1` FOREIGN KEY (`aau_licao_aprendida`) REFERENCES `aag_licao_aprendida` (`aag_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_2` FOREIGN KEY (`aau_reparticao_modelo_metodo`) REFERENCES `aaf_reparticao_modelo_metodo` (`aaf_id`),
  ADD CONSTRAINT `aau_nivel_licao_reparticao_ibfk_3` FOREIGN KEY (`aau_nivel`) REFERENCES `aai_nivel` (`aai_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
