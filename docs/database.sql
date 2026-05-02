CREATE DATABASE IF NOT EXISTS `ssm_youtiansys`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `ssm_youtiansys`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `t_alarmStats`;
DROP TABLE IF EXISTS `t_dailyAlarms`;
DROP TABLE IF EXISTS `t_safetyInfo`;
DROP TABLE IF EXISTS `t_sensorData`;
DROP TABLE IF EXISTS `t_oilFieldInfo`;
DROP TABLE IF EXISTS `t_aramType`;
DROP TABLE IF EXISTS `t_sensorType`;
DROP TABLE IF EXISTS `t_gonggao`;
DROP TABLE IF EXISTS `t_role`;
DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_username` varchar(100) DEFAULT NULL,
  `u_password` varchar(100) DEFAULT NULL,
  `u_name` varchar(100) DEFAULT NULL,
  `u_birthday` varchar(100) DEFAULT NULL,
  `u_sex` varchar(20) DEFAULT NULL,
  `u_tel` varchar(50) DEFAULT NULL,
  `u_qq` varchar(50) DEFAULT NULL,
  `u_phone` varchar(50) DEFAULT NULL,
  `u_jg` varchar(255) DEFAULT NULL,
  `u_address` varchar(255) DEFAULT NULL,
  `u_bm` varchar(255) DEFAULT NULL,
  `u_type` varchar(50) DEFAULT NULL,
  `u_by_1` int DEFAULT 0,
  `u_by_2` varchar(255) DEFAULT NULL,
  `u_by_3` varchar(255) DEFAULT NULL,
  `u_bz` varchar(500) DEFAULT NULL,
  `u_photo` varchar(255) DEFAULT NULL,
  `u_percent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_username` (`u_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_gonggao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_title` varchar(255) DEFAULT NULL,
  `t_content` text,
  `t_shijian` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_oilFieldInfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_location` varchar(255) DEFAULT NULL,
  `t_status` varchar(100) DEFAULT NULL,
  `t_production` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_aramType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_stype` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_sensorType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_stype` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_safetyInfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_shijian` varchar(100) DEFAULT NULL,
  `t_overall` varchar(255) DEFAULT NULL,
  `t_incident` varchar(255) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `oilFieldInfo_id` int DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_safety_oil_field` (`oilFieldInfo_id`),
  CONSTRAINT `fk_safety_oil_field` FOREIGN KEY (`oilFieldInfo_id`) REFERENCES `t_oilFieldInfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_sensorData` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_sensorid` varchar(100) DEFAULT NULL,
  `t_value` varchar(100) DEFAULT NULL,
  `t_time` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `sensorType_id` int DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sensor_data_type` (`sensorType_id`),
  CONSTRAINT `fk_sensor_data_type` FOREIGN KEY (`sensorType_id`) REFERENCES `t_sensorType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_dailyAlarms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_status` varchar(100) DEFAULT NULL,
  `t_time` varchar(100) DEFAULT NULL,
  `t_location` varchar(255) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `oilFieldInfo_id` int DEFAULT NULL,
  `sensorType_id` int DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_daily_alarm_oil_field` (`oilFieldInfo_id`),
  KEY `idx_daily_alarm_sensor_type` (`sensorType_id`),
  CONSTRAINT `fk_daily_alarm_oil_field` FOREIGN KEY (`oilFieldInfo_id`) REFERENCES `t_oilFieldInfo` (`id`),
  CONSTRAINT `fk_daily_alarm_sensor_type` FOREIGN KEY (`sensorType_id`) REFERENCES `t_sensorType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `t_alarmStats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_count` varchar(100) DEFAULT NULL,
  `t_date` varchar(100) DEFAULT NULL,
  `t_bz` varchar(500) DEFAULT NULL,
  `oilFieldInfo_id` int DEFAULT NULL,
  `aramType_id` int DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_alarm_stats_oil_field` (`oilFieldInfo_id`),
  KEY `idx_alarm_stats_aram_type` (`aramType_id`),
  CONSTRAINT `fk_alarm_stats_oil_field` FOREIGN KEY (`oilFieldInfo_id`) REFERENCES `t_oilFieldInfo` (`id`),
  CONSTRAINT `fk_alarm_stats_aram_type` FOREIGN KEY (`aramType_id`) REFERENCES `t_aramType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `t_user`
  (`id`, `u_username`, `u_password`, `u_name`, `u_sex`, `u_type`, `u_by_1`, `u_bz`, `u_photo`, `u_percent`)
VALUES
  (1, 'admin', 'admin', '管理员', '男', 'admin', 0, '系统管理员', 'person.png', '100%');

INSERT INTO `t_role` (`id`, `t_name`, `t_bz`, `addTime`) VALUES
  (1, '管理员', '系统管理员角色', NOW()),
  (2, '普通用户', '普通用户角色', NOW());

INSERT INTO `t_oilFieldInfo` (`id`, `t_location`, `t_status`, `t_production`, `t_bz`, `addTime`) VALUES
  (1, '一号油田', '正常', '120 吨/日', '演示数据', NOW());

INSERT INTO `t_sensorType` (`id`, `t_stype`, `t_bz`, `addTime`) VALUES
  (1, '压力传感器', '演示数据', NOW()),
  (2, '温度传感器', '演示数据', NOW());

INSERT INTO `t_aramType` (`id`, `t_stype`, `t_bz`, `addTime`) VALUES
  (1, '压力异常', '演示数据', NOW()),
  (2, '温度异常', '演示数据', NOW());

INSERT INTO `t_gonggao` (`id`, `t_title`, `t_content`, `t_shijian`, `t_bz`, `addTime`) VALUES
  (1, '系统公告', '欢迎使用智慧油田感传控管理系统。', DATE_FORMAT(NOW(), '%Y-%m-%d'), '演示数据', NOW());

INSERT INTO `t_safetyInfo` (`id`, `t_shijian`, `t_overall`, `t_incident`, `t_bz`, `oilFieldInfo_id`, `addTime`) VALUES
  (1, DATE_FORMAT(NOW(), '%Y-%m-%d'), '安全', '无', '演示数据', 1, NOW());

INSERT INTO `t_sensorData` (`id`, `t_sensorid`, `t_value`, `t_time`, `t_bz`, `sensorType_id`, `addTime`) VALUES
  (1, 'S-001', '28.6', DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'), '演示数据', 2, NOW());

INSERT INTO `t_dailyAlarms` (`id`, `t_status`, `t_time`, `t_location`, `t_bz`, `oilFieldInfo_id`, `sensorType_id`, `addTime`) VALUES
  (1, '已处理', DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'), '一号油田', '演示数据', 1, 1, NOW());

INSERT INTO `t_alarmStats` (`id`, `t_count`, `t_date`, `t_bz`, `oilFieldInfo_id`, `aramType_id`, `addTime`) VALUES
  (1, '1', DATE_FORMAT(NOW(), '%Y-%m-%d'), '演示数据', 1, 1, NOW());

SET FOREIGN_KEY_CHECKS = 1;

