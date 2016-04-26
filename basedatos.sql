

SET FOREIGN_KEY_CHECKS=0;

CREATE SCHEMA IF NOT EXISTS `bdsgcd`;

USE `bdsgcd`;

-- ----------------------------
-- Table structure for Cespecialidad
-- ----------------------------
DROP TABLE IF EXISTS `Cespecialidad`;
CREATE TABLE `Cespecialidad` (
  `id_esp` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `des_esp` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_esp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Cespecialidad
-- ----------------------------
INSERT INTO `Cespecialidad` VALUES ('esp0000000001', 'Ortodoncia');
INSERT INTO `Cespecialidad` VALUES ('esp0000000002', 'Endodoncia');
INSERT INTO `Cespecialidad` VALUES ('esp0000000003', 'Odontopediatría');
INSERT INTO `Cespecialidad` VALUES ('esp0000000004', 'Implantología');

-- ----------------------------
-- Table structure for Crol
-- ----------------------------
DROP TABLE IF EXISTS `Crol`;
CREATE TABLE `Crol` (
  `id_rol` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `des_rol` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Crol
-- ----------------------------
INSERT INTO `Crol` VALUES ('rol0000000001', 'Administrador');
INSERT INTO `Crol` VALUES ('rol0000000002', 'Médico');
INSERT INTO `Crol` VALUES ('rol0000000003', 'Paciente');

-- ----------------------------
-- Table structure for Cservicio
-- ----------------------------
DROP TABLE IF EXISTS `Cservicio`;
CREATE TABLE `Cservicio` (
  `id_serv` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `des_serv` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Cservicio
-- ----------------------------
INSERT INTO `Cservicio` VALUES ('srv000000001', 'Limpieza Dental');
INSERT INTO `Cservicio` VALUES ('srv000000002', 'Colocación y Cambio de Amalgama');
INSERT INTO `Cservicio` VALUES ('srv000000003', 'Colocación y Cambio de Resina');
INSERT INTO `Cservicio` VALUES ('srv000000004', 'Extracción de Piezas Dentales');

-- ----------------------------
-- Table structure for CtipoVisita
-- ----------------------------
DROP TABLE IF EXISTS `CtipoVisita`;
CREATE TABLE `CtipoVisita` (
  `id_tipo` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `des_tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of CtipoVisita
-- ----------------------------
INSERT INTO `CtipoVisita` VALUES ('tvi0000000001', 'Cita');
INSERT INTO `CtipoVisita` VALUES ('tvi0000000002', 'Consulta');

-- ----------------------------
-- Table structure for Despecialidad
-- ----------------------------
DROP TABLE IF EXISTS `Despecialidad`;
CREATE TABLE `Despecialidad` (
  `id_esp` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `id_usu` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_esp`,`id_usu`),
  KEY `FK_esp_usu` (`id_usu`),
  CONSTRAINT `FK_esp_tipo` FOREIGN KEY (`id_esp`) REFERENCES `cespecialidad` (`id_esp`) ON UPDATE CASCADE,
  CONSTRAINT `FK_esp_usu` FOREIGN KEY (`id_usu`) REFERENCES `musuario` (`id_usu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Despecialidad
-- ----------------------------
INSERT INTO `Despecialidad` VALUES ('esp0000000002', 'marvinmg');
INSERT INTO `Despecialidad` VALUES ('esp0000000004', 'josegg');
INSERT INTO `Despecialidad` VALUES ('esp0000000010', 'usu0000009999');

-- ----------------------------
-- Table structure for Dvisita
-- ----------------------------
DROP TABLE IF EXISTS `Dvisita`;
CREATE TABLE `Dvisita` (
  `id_vis` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `id_tipo` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `id_serv` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `id_usu_pac` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `id_usu_den` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `fec_vis` date NOT NULL,
  `hora_vis` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_vis`),
  KEY `FK_vis_tipo` (`id_tipo`),
  KEY `FK_vis_pac` (`id_usu_pac`),
  KEY `FK_vis_den` (`id_usu_den`),
  KEY `FK_vis_serv` (`id_serv`),
  CONSTRAINT `FK_vis_den` FOREIGN KEY (`id_usu_den`) REFERENCES `musuario` (`id_usu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vis_pac` FOREIGN KEY (`id_usu_pac`) REFERENCES `musuario` (`id_usu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vis_serv` FOREIGN KEY (`id_serv`) REFERENCES `cservicio` (`id_serv`) ON UPDATE CASCADE,
  CONSTRAINT `FK_vis_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `ctipovisita` (`id_tipo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Dvisita
-- ----------------------------

-- ----------------------------
-- Table structure for Musuario
-- ----------------------------
DROP TABLE IF EXISTS `Musuario`;
CREATE TABLE `Musuario` (
  `id_usu` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `pas_usu` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `pat_usu` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `mat_usu` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `nom_usu` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `dir_usu` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pto_adm` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_usu`),
  KEY `FK_usu_rol` (`id_rol`),
  CONSTRAINT `FK_usu_rol` FOREIGN KEY (`id_rol`) REFERENCES `crol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- ----------------------------
-- Records of Musuario
-- ----------------------------
INSERT INTO `Musuario` VALUES ('josegg', '575d10f68f66cacd36f222d054ad29f8', 'rol0000000002', 'González', 'García', 'José Gerardo', null, null);
INSERT INTO `Musuario` VALUES ('karlaov', 'b161569c77e51412e033a5908f8cf9f1', 'rol0000000001', 'Oropeza', 'Vázquez', 'Karla Patricia', null, 'Secretaria');
INSERT INTO `Musuario` VALUES ('luispa', '6c93f247dd2d16bf32d2eab68dcaa49', 'rol0000000003', 'Pérez', 'Ambrosio', 'Luis Javier', null, null);
INSERT INTO `Musuario` VALUES ('marvinmg', 'a31dbabb49e781968288796d7dcf2a45', 'rol0000000002', 'Méndez', 'García', 'Marvin André', null, null);

-- ----------------------------
-- View structure for vwlogin
-- ----------------------------
DROP VIEW IF EXISTS `vwlogin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vwlogin` AS SELECT
Musuario.id_usu,
Musuario.id_rol,
Crol.des_rol,
Musuario.pas_usu,
Musuario.pat_usu,
Musuario.mat_usu,
Musuario.nom_usu
FROM
Musuario
INNER JOIN Crol ON Musuario.id_rol = Crol.id_rol ;

-- ----------------------------
-- View structure for vwusuarios
-- ----------------------------
DROP VIEW IF EXISTS `vwusuarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vwusuarios` AS SELECT
Musuario.id_usu,
Musuario.pat_usu,
Musuario.mat_usu,
Musuario.nom_usu,
Musuario.dir_usu,
Musuario.pto_adm,
Crol.id_rol,
Crol.des_rol,
Cespecialidad.des_esp
FROM
Musuario
LEFT JOIN Crol ON Musuario.id_rol = Crol.id_rol
LEFT JOIN Despecialidad ON Musuario.id_usu = Despecialidad.id_usu
LEFT JOIN Cespecialidad ON Despecialidad.id_esp = Cespecialidad.id_esp ;

SET FOREIGN_KEY_CHECKS=1;
