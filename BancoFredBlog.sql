-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.33-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para web
DROP DATABASE IF EXISTS `web`;
CREATE DATABASE IF NOT EXISTS `web` /*!40100 DEFAULT CHARACTER SET latin1 */; USE `web`;

-- Copiando estrutura para tabela web.blog
CREATE TABLE IF NOT EXISTS `blog` (
 `blog_codigo` INT(11) NOT NULL AUTO_INCREMENT,
 `blog_bloginfo_codigo` INT(11) NOT NULL DEFAULT '0',
 `blog_blogimgs_codigo` INT(11) NOT NULL DEFAULT '0',
 `blog_usuario_codigo` INT(11) NOT NULL DEFAULT '0', PRIMARY KEY (`blog_codigo`), KEY `FK_blog_bloginfo` (`blog_bloginfo_codigo`), KEY `FK_blog_blogimgs` (`blog_blogimgs_codigo`), KEY `FK_blog_usuario` (`blog_usuario_codigo`), CONSTRAINT `FK_blog_blogimgs` FOREIGN KEY (`blog_blogimgs_codigo`) REFERENCES `blogimgs` (`blogimgs_codigo`), CONSTRAINT `FK_blog_bloginfo` FOREIGN KEY (`blog_bloginfo_codigo`) REFERENCES `bloginfo` (`bloginfo_codigo`), CONSTRAINT `FK_blog_usuario` FOREIGN KEY (`blog_usuario_codigo`) REFERENCES `usuario` (`usuario_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela web.blog: ~3 rows (aproximadamente)
DELETE
FROM `blog`;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`blog_codigo`, `blog_bloginfo_codigo`, `blog_blogimgs_codigo`, `blog_usuario_codigo`) VALUES
	(1, 1, 3, 2),
	(4, 1, 5, 2),
	(5, 2, 2, 1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- Copiando estrutura para tabela web.blogimgs
CREATE TABLE IF NOT EXISTS `blogimgs` (
 `blogimgs_codigo` INT(11) NOT NULL AUTO_INCREMENT,
 `blogimgs_nome` VARCHAR(250) DEFAULT NULL, PRIMARY KEY (`blogimgs_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela web.blogimgs: ~5 rows (aproximadamente)
DELETE
FROM `blogimgs`;
/*!40000 ALTER TABLE `blogimgs` DISABLE KEYS */;
INSERT INTO `blogimgs` (`blogimgs_codigo`, `blogimgs_nome`) VALUES
	(1, 'hulk.jpg'),
	(2, 'hulk2.webp'),
	(3, 'wolverine.jpg'),
	(4, 'ww.webp'),
	(5, 'ww2.jpg');
/*!40000 ALTER TABLE `blogimgs` ENABLE KEYS */;

-- Copiando estrutura para tabela web.bloginfo
CREATE TABLE IF NOT EXISTS `bloginfo` (
 `bloginfo_codigo` INT(11) NOT NULL AUTO_INCREMENT,
 `bloginfo_titulo` VARCHAR(250) DEFAULT NULL,
 `bloginfo_corpo` LONGTEXT,
 `bloginfo_data` TIMESTAMP NULL DEFAULT NULL, PRIMARY KEY (`bloginfo_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela web.bloginfo: ~4 rows (aproximadamente)
DELETE
FROM `bloginfo`;
/*!40000 ALTER TABLE `bloginfo` DISABLE KEYS */;
INSERT INTO `bloginfo` (`bloginfo_codigo`, `bloginfo_titulo`, `bloginfo_corpo`, `bloginfo_data`) VALUES
	(1, 'Título 1', 'Lorem ipsum 1', '2023-04-26 19:04:21'),
	(2, 'Título 2', 'Lorem ipsum 2', '2023-04-26 19:04:21'),
	(3, 'Título 3', 'Lorem ipsum 3', '2023-04-26 19:04:21'),
	(4, 'Título 4', 'Lorem ipsum 4', '2023-04-26 19:04:21');
/*!40000 ALTER TABLE `bloginfo` ENABLE KEYS */;

-- Copiando estrutura para tabela web.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
 `usuario_codigo` INT(11) NOT NULL AUTO_INCREMENT,
 `usuario_nome` VARCHAR(250) NOT NULL DEFAULT '0',
 `usuario_email` VARCHAR(250) NOT NULL DEFAULT '0',
 `usuario_senha` VARCHAR(250) NOT NULL DEFAULT '0', PRIMARY KEY (`usuario_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela web.usuario: ~2 rows (aproximadamente)
DELETE
FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_codigo`, `usuario_nome`, `usuario_email`, `usuario_senha`) VALUES
	(1, 'João', 'joao@email.com', '123'),
	(2, 'Maria', 'maria@email.com', '321');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

SELECT * FROM blog INNER JOIN bloginfo ON blog_bloginfo_codigo = bloginfo_codigo INNER JOIN blogimgs ON blog_blogimgs_codigo = blogimgs_codigo INNER JOIN usuario ON blog_usuario_codigo = usuario_codigo