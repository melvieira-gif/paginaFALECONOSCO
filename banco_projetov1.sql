-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para banco_projeto
DROP DATABASE IF EXISTS `banco_projeto`;
CREATE DATABASE IF NOT EXISTS `banco_projeto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `banco_projeto`;

-- Copiando estrutura para tabela banco_projeto.cadastro_login
DROP TABLE IF EXISTS `cadastro_login`;
CREATE TABLE IF NOT EXISTS `cadastro_login` (
  `id_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compl` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` text DEFAULT NULL,
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.cadastro_login: ~2 rows (aproximadamente)
DELETE FROM `cadastro_login`;
INSERT INTO `cadastro_login` (`id_cadastro`, `nome_compl`, `email`, `senha`) VALUES
	(1, 'Melissa Cristina Gomes Vieira', 'melissacv1@gmail.com', '42b10cea24483140e478ca886dce271ccaa264fd71b4cad268ee998c951ec133'),
	(2, 'Francine Souza', 'francinesouza@hotmail.com', '60f20966ce8cde77c5b5ae2d48ad76e48c876f8b666e691701a5a5bfb7b6ec36');

-- Copiando estrutura para tabela banco_projeto.faleconosco
DROP TABLE IF EXISTS `faleconosco`;
CREATE TABLE IF NOT EXISTS `faleconosco` (
  `id_fale` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `assunto` text NOT NULL,
  `mensagem` text NOT NULL,
  `status_lei` varchar(50) DEFAULT NULL,
  `hr_status` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_fale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela banco_projeto.faleconosco: ~6 rows (aproximadamente)
DELETE FROM `faleconosco`;
INSERT INTO `faleconosco` (`id_fale`, `nome`, `email`, `assunto`, `mensagem`, `status_lei`, `hr_status`) VALUES
	(1, 'Melissa cristina', 'melissac1@gmail.com', 'Site poderia ter melhores', 'O site esta com problema no botão', NULL, NULL),
	(2, 'Lauane pasquini', 'lauanepasquini@gmail.com', 'Site poderia ter melhores', 'O site esta com problema no botão', NULL, NULL),
	(3, 'Francine souza', 'francinesouza@gmail.com', 'Elogio', 'O site está funcionando perfeitamente', NULL, NULL),
	(4, 'Lauane pasquini', 'lauanepasquini@gmail.com', 'Site poderia ter melhores', 'O site esta com problema no botão', NULL, NULL),
	(5, 'Michele Viei', 'melissacgv1@gmail.com', 'Elogio', 'Esta muito sobcarregado', NULL, NULL),
	(6, 'Francine souza', 'melissacgv1@gmail.com', 'Elogio', 'O site está funcionando perfeitamente', 'Aguardando resposta', '2025-11-18 18:07:39');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
