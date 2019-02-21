/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : imports

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-02-13 17:47:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'DESKTOP-MV6O7061550048798830', '1550051225844', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `dept_type` varchar(50) DEFAULT NULL COMMENT '机构类型（0，部门1，公司）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` date DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('132', '0', '0,', '微战略', '1', '1', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('133', '132', '0,132,', '技术部', '1', '0', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('134', '133', '0,132,133,', '技术1部', '1', '0', '1', '2018-07-25', null, '2018-07-25', '0');
INSERT INTO `sys_dept` VALUES ('135', '133', '0,132,133,', '技术2部', '2', '0', '1', '2018-07-25', null, null, '0');
INSERT INTO `sys_dept` VALUES ('136', '133', '0,132,133,', '美工部', '3', '0', '1', '2018-07-25', null, '2018-07-25', '0');
INSERT INTO `sys_dept` VALUES ('137', '132', '0,132,', '人事部', '2', '0', '1', '2018-07-25', null, null, '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  `customs` varchar(20) DEFAULT NULL COMMENT '报关',
  `Inspection` varchar(20) DEFAULT NULL COMMENT '报检',
  PRIMARY KEY (`id`),
  KEY `code` (`code`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `customs` (`customs`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12259 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '图片名称',
  `pic_name` varchar(50) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `pic_type` varchar(50) DEFAULT NULL COMMENT '类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `code` int(10) DEFAULT NULL COMMENT '关联id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('259', '005.jpg', 'http://localhost:8080/fileupload/20180706/fbc9117d-d1d6-43e3-bd67-e6a3074e364a.jpg', 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('260', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/056abb23-c55d-42e5-967a-d82821082d84.jpg', 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('296', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('297', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('298', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('299', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('300', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('301', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('302', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('303', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('304', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('305', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/ca618dd1-3310-4e1f-b041-1c746eca499d.jpg', 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('306', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('307', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('308', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('309', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('310', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('311', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('312', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('313', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('314', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('315', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('316', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('317', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('318', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('319', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('320', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('321', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('322', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('323', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('324', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('325', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('327', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('330', 'timg.jpg', 'http://localhost:8080/fileupload/20180706/18508407-e42e-4798-aa94-5277f901e06f.jpg', 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('331', '001.jpg', 'http://localhost:8080/fileupload/20180706/88289d3d-66ab-4766-a20a-007bdce499cd.jpg', 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('332', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('333', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('334', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('335', null, null, 'image_type_commodity', null, null, null, null, '77');
INSERT INTO `sys_image` VALUES ('336', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('337', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('338', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('339', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('340', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('341', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('342', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('343', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('344', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('345', null, null, 'image_type_commodity', null, null, null, null, '50');
INSERT INTO `sys_image` VALUES ('346', null, null, 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('347', null, null, 'image_type_commodity', null, null, null, null, '48');
INSERT INTO `sys_image` VALUES ('348', 'timg.jpg', 'http://localhost:8080/fileupload/20180801/f869ad0d-b173-4080-b3e2-b3ae68357132.jpg', 'image_type_commodity', null, null, null, null, '127');
INSERT INTO `sys_image` VALUES ('349', null, null, 'image_type_commodity', null, null, null, null, '127');
INSERT INTO `sys_image` VALUES ('350', '146.jpg', 'http://localhost:8080/fileupload/20181008/855d47d0-0174-4ca2-bad5-47f1a4a85d9f.jpg', 'image_type_commodity', null, null, null, null, '127');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `source` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fas fa-archive\",\"orderNum\":1}', '24', '0:0:0:0:0:0:0:1', '2018-06-26 14:05:48', 'PC');
INSERT INTO `sys_log` VALUES ('2', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '32', '27', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:06', 'PC');
INSERT INTO `sys_log` VALUES ('3', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '33', '5', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:11', 'PC');
INSERT INTO `sys_log` VALUES ('4', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '34', '7', '0:0:0:0:0:0:0:1', '2018-06-26 14:06:18', 'PC');
INSERT INTO `sys_log` VALUES ('5', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fas fa-archive\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-26 14:07:05', 'PC');
INSERT INTO `sys_log` VALUES ('6', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":35,\"parentName\":\"订单管理\",\"name\":\"订单查询\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-26 14:08:02', 'PC');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '86', '0:0:0:0:0:0:0:1', '2018-06-27 09:36:05', 'PC');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '297', '0:0:0:0:0:0:0:1', '2018-06-27 14:11:33', 'PC');
INSERT INTO `sys_log` VALUES ('9', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"icon\":\"fa fa-archive\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-27 16:02:41', 'PC');
INSERT INTO `sys_log` VALUES ('10', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":5,\"username\":\"p\",\"password\":\"59fb34d9b2b17674c0382b3ce714348094bbcaf9e33e1e4554d5a0caa612408a\",\"salt\":\"jqwwgXFXbr6yr2q0aWBP\",\"email\":\"123@qq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:18:07 PM\"}', '171', '0:0:0:0:0:0:0:1', '2018-06-27 17:18:08', 'PC');
INSERT INTO `sys_log` VALUES ('11', 'hjw', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":6,\"username\":\"2\",\"password\":\"1cefad859d4b423a0a525371aaaf3166f722dde082e1350bae1265aa3721fd37\",\"salt\":\"rPHNHcwUrHiZAihUFl0k\",\"email\":\"2@qq.com\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Jun 27, 2018 5:18:48 PM\"}', '15178', '0:0:0:0:0:0:0:1', '2018-06-27 17:18:50', 'PC');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"112233\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\"}', '8', '0:0:0:0:0:0:0:1', '2018-06-27 17:23:05', 'PC');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-27 17:39:34', 'PC');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":56,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"modules/contract/info.html\",\"type\":1,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-27 17:55:05', 'PC');
INSERT INTO `sys_log` VALUES ('15', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"仓储管理\",\"type\":0,\"icon\":\"fa fa-university\",\"orderNum\":3}', '4', '0:0:0:0:0:0:0:1', '2018-06-27 17:59:01', 'PC');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,37,41,42,43,44,45,56,57,58],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '62', '0:0:0:0:0:0:0:1', '2018-06-27 17:59:50', 'PC');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":56,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-27 18:02:47', 'PC');
INSERT INTO `sys_log` VALUES ('18', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"查看\",\"perms\":\"order:mxorder:info,order:mxorder:list\",\"type\":2,\"orderNum\":0}', '10', '0:0:0:0:0:0:0:1', '2018-06-28 09:35:14', 'PC');
INSERT INTO `sys_log` VALUES ('19', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"新增\",\"perms\":\"order:mxorder:save\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 09:35:54', 'PC');
INSERT INTO `sys_log` VALUES ('20', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"修改\",\"perms\":\"order:mxorder:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 09:36:20', 'PC');
INSERT INTO `sys_log` VALUES ('21', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":36,\"parentName\":\"订单查询\",\"name\":\"删除\",\"perms\":\"order:mxorder:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 09:36:44', 'PC');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理\",\"type\":0,\"icon\":\"address-book\",\"orderNum\":0}', '24', '0:0:0:0:0:0:0:1', '2018-06-28 11:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('23', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,56,57,69,70,71,72,73,74,58],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '582', '0:0:0:0:0:0:0:1', '2018-06-28 11:29:32', 'PC');
INSERT INTO `sys_log` VALUES ('24', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"仓储管理\",\"name\":\"仓库分类\",\"url\":\"modules/storage/storagerepertorycategory.html\",\"type\":1,\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:11:35', 'PC');
INSERT INTO `sys_log` VALUES ('25', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":58,\"parentName\":\"仓储管理\",\"name\":\"仓库列表\",\"url\":\"modules/storage/storagerepertory.html\",\"type\":1,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:12:41', 'PC');
INSERT INTO `sys_log` VALUES ('26', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"查询\",\"perms\":\"storage:storagerepertorycategory:list,storage:storagerepertorycategory:info\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-06-28 14:15:19', 'PC');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"新增\",\"perms\":\"storage:storagerepertorycategory:save\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 14:16:46', 'PC');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"修改\",\"perms\":\"storage:storagerepertorycategory:update\",\"type\":2,\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-28 14:17:11', 'PC');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":75,\"parentName\":\"仓库分类\",\"name\":\"删除\",\"perms\":\"storage:storagerepertorycategory:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:17:51', 'PC');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"查询\",\"perms\":\"storage:storagerepertory:list,storage:storagerepertory:info\",\"type\":2,\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-06-28 14:19:05', 'PC');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"新增\",\"perms\":\"storage:storagerepertory:save\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:19:32', 'PC');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"修改\",\"perms\":\"storage:storagerepertory:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-06-28 14:20:15', 'PC');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":76,\"parentName\":\"仓库列表\",\"name\":\"删除\",\"perms\":\"storage:storagerepertory:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 14:20:43', 'PC');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,56,57,69,70,71,72,73,74,58,76,81,82,83,84,75,77,78,79,80],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '224', '0:0:0:0:0:0:0:1', '2018-06-28 14:21:05', 'PC');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:21:14', 'PC');
INSERT INTO `sys_log` VALUES ('36', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":95,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-28 15:21:33', 'PC');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同信息\",\"url\":\"contract/info.html\",\"type\":1,\"orderNum\":0}', '1', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:07', 'PC');
INSERT INTO `sys_log` VALUES ('38', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '96', '36', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:15', 'PC');
INSERT INTO `sys_log` VALUES ('39', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"contract/info.html\",\"type\":1,\"orderNum\":0}', '16', '0:0:0:0:0:0:0:1', '2018-06-28 15:22:40', 'PC');
INSERT INTO `sys_log` VALUES ('40', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '97', '4', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:15', 'PC');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":85,\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同信息\",\"url\":\"modules/contract/info.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:31', 'PC');
INSERT INTO `sys_log` VALUES ('42', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":90,\"parentId\":95,\"parentName\":\"合同管理\",\"name\":\"合同分类\",\"url\":\"modules/contract/category.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 15:23:42', 'PC');
INSERT INTO `sys_log` VALUES ('43', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":70,\"parentId\":69,\"parentName\":\"商户管理\",\"name\":\"商户\",\"url\":\"modules/esp/merchants.html\",\"type\":1,\"icon\":\"fa fa-users\",\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-06-28 16:49:35', 'PC');
INSERT INTO `sys_log` VALUES ('44', 'p', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[83]', '6', '0:0:0:0:0:0:0:1', '2018-06-28 16:51:47', 'PC');
INSERT INTO `sys_log` VALUES ('45', 'y', '仓库分类表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.save()', '{\"id\":86,\"name\":\"D\",\"parentId\":1,\"status\":\"1\",\"type\":\"df\"}', '4', '0:0:0:0:0:0:0:1', '2018-06-28 17:41:22', 'PC');
INSERT INTO `sys_log` VALUES ('46', 'y', '仓库表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.save()', '{\"id\":54,\"serialNumber\":\"dfg\",\"name\":\"hgf\",\"categoryId\":1,\"warehousemanId\":1,\"remark\":\"gfhgfhdgf\",\"state\":\"1\"}', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:43:49', 'PC');
INSERT INTO `sys_log` VALUES ('47', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[83]', '7', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:09', 'PC');
INSERT INTO `sys_log` VALUES ('48', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[86,83]', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:20', 'PC');
INSERT INTO `sys_log` VALUES ('49', 'y', '仓库分类表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryCategoryController.delete()', '[86]', '3', '0:0:0:0:0:0:0:1', '2018-06-28 17:56:33', 'PC');
INSERT INTO `sys_log` VALUES ('50', 'y', '仓库表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.delete()', '[54]', '27', '0:0:0:0:0:0:0:1', '2018-06-28 18:02:17', 'PC');
INSERT INTO `sys_log` VALUES ('51', 'hjw', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":0}', '18', '0:0:0:0:0:0:0:1', '2018-06-29 10:51:20', 'PC');
INSERT INTO `sys_log` VALUES ('52', 'hjw', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-apple\",\"orderNum\":0}', '17', '0:0:0:0:0:0:0:1', '2018-06-29 10:55:19', 'PC');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,98,104,105,106,107],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '165', '0:0:0:0:0:0:0:1', '2018-06-29 11:14:14', 'PC');
INSERT INTO `sys_log` VALUES ('54', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":4}', '57', '0:0:0:0:0:0:0:1', '2018-06-29 11:31:32', 'PC');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户列表\",\"url\":\"modules/company/company.html\",\"type\":1,\"orderNum\":0}', '51', '0:0:0:0:0:0:0:1', '2018-06-29 13:08:56', 'PC');
INSERT INTO `sys_log` VALUES ('56', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"查询\",\"perms\":\"company:company:list,company:company:info\",\"type\":2,\"orderNum\":0}', '9', '0:0:0:0:0:0:0:1', '2018-06-29 13:11:21', 'PC');
INSERT INTO `sys_log` VALUES ('57', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"新增\",\"perms\":\"company:company:save\",\"type\":2,\"orderNum\":0}', '50', '0:0:0:0:0:0:0:1', '2018-06-29 13:11:44', 'PC');
INSERT INTO `sys_log` VALUES ('58', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"修改\",\"perms\":\"company:company:update\",\"type\":2,\"orderNum\":0}', '12', '0:0:0:0:0:0:0:1', '2018-06-29 13:12:06', 'PC');
INSERT INTO `sys_log` VALUES ('59', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":109,\"parentName\":\"客户列表\",\"name\":\"删除\",\"perms\":\"company:company:delete\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-06-29 13:12:25', 'PC');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,37,41,42,43,44,45,98,104,105,106,107,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '149', '0:0:0:0:0:0:0:1', '2018-06-29 13:13:14', 'PC');
INSERT INTO `sys_log` VALUES ('61', 'p', '仓库表保存', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.save()', '{\"id\":55}', '12', '0:0:0:0:0:0:0:1', '2018-06-29 13:38:54', 'PC');
INSERT INTO `sys_log` VALUES ('62', 'p', '仓库表删除', 'com.wzlue.imports.web.controller.storage.StorageRepertoryController.delete()', '[55]', '40', '0:0:0:0:0:0:0:1', '2018-06-29 13:38:59', 'PC');
INSERT INTO `sys_log` VALUES ('63', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":12,\"username\":\"s\",\"password\":\"ec084b37d0c737894d15f790f31a4d924e87a03a29de5256259f6cf3b94eaeb4\",\"salt\":\"C45QuiTDQ7ui4cj3ndYi\",\"email\":\"888@qq.com\",\"mobile\":\"hgfh\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Jun 29, 2018 1:43:33 PM\"}', '130', '0:0:0:0:0:0:0:1', '2018-06-29 13:43:33', 'PC');
INSERT INTO `sys_log` VALUES ('64', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[12]', '6', '0:0:0:0:0:0:0:1', '2018-06-29 13:43:44', 'PC');
INSERT INTO `sys_log` VALUES ('65', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":13,\"username\":\"a\",\"password\":\"f724f56f33d862f80e7d03c06a109be2bdb5d31b46d31d9ab2d7e14cdceb3659\",\"salt\":\"A8ibrcBjUNoA7WTMdbpG\",\"email\":\"888@qq.com\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Jun 29, 2018 1:55:26 PM\"}', '64', '0:0:0:0:0:0:0:1', '2018-06-29 13:55:27', 'PC');
INSERT INTO `sys_log` VALUES ('66', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[13]', '4', '0:0:0:0:0:0:0:1', '2018-06-29 13:55:41', 'PC');
INSERT INTO `sys_log` VALUES ('67', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '37', '140', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:20', 'PC');
INSERT INTO `sys_log` VALUES ('68', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '41', '10', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:26', 'PC');
INSERT INTO `sys_log` VALUES ('69', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '42', '25', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:32', 'PC');
INSERT INTO `sys_log` VALUES ('70', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '43', '15', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:37', 'PC');
INSERT INTO `sys_log` VALUES ('71', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '44', '6', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:42', 'PC');
INSERT INTO `sys_log` VALUES ('72', 'aa', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '45', '9', '0:0:0:0:0:0:0:1', '2018-06-29 16:59:48', 'PC');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":14,\"username\":\"zeyee\",\"password\":\"174292669168ba2da14420945304db09f9a6ac6a887ea922a0b5326fdab517af\",\"salt\":\"0o30V9IvHd2ciiJVPK6B\",\"email\":\"zeyee@vps.com\",\"mobile\":\"15895825435\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 2, 2018 9:11:22 AM\"}', '1169', '0:0:0:0:0:0:0:1', '2018-07-02 09:11:23', 'PC');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,104,105,106,107,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '14', '0:0:0:0:0:0:0:1', '2018-07-02 09:11:57', 'PC');
INSERT INTO `sys_log` VALUES ('75', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":15,\"username\":\"zz\",\"password\":\"f262142f5121cec0585310597a7f322a0d0c23ac0db2f41f9b3ca2b9c6200158\",\"salt\":\"D1iY9dCuqBPeFbH9z7Br\",\"email\":\"123@123.com\",\"mobile\":\"13888888888\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 2, 2018 9:21:52 AM\"}', '179', '0:0:0:0:0:0:0:1', '2018-07-02 09:21:53', 'PC');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '265', '0:0:0:0:0:0:0:1', '2018-07-02 10:40:18', 'PC');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '95', '0:0:0:0:0:0:0:1', '2018-07-02 13:27:18', 'PC');
INSERT INTO `sys_log` VALUES ('78', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户类型\",\"url\":\"modules/company/companytype.html\",\"type\":1,\"orderNum\":1}', '5', '0:0:0:0:0:0:0:1', '2018-07-02 14:49:11', 'PC');
INSERT INTO `sys_log` VALUES ('79', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"查看\",\"perms\":\"company:companytype:list,company:companytype:info\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-02 14:51:01', 'PC');
INSERT INTO `sys_log` VALUES ('80', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"新增\",\"perms\":\"company:companytype:save\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-07-02 14:51:41', 'PC');
INSERT INTO `sys_log` VALUES ('81', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"修改\",\"perms\":\"company:companytype:update\",\"type\":2,\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2018-07-02 14:52:01', 'PC');
INSERT INTO `sys_log` VALUES ('82', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":121,\"parentName\":\"客户类型\",\"name\":\"删除\",\"perms\":\"company:companytype:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-02 14:52:23', 'PC');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '70', '0:0:0:0:0:0:0:1', '2018-07-02 14:53:00', 'PC');
INSERT INTO `sys_log` VALUES ('84', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"自主报关\",\"type\":0,\"icon\":\"fa fa-ship\",\"orderNum\":5}', '108', '0:0:0:0:0:0:0:1', '2018-07-06 09:15:14', 'PC');
INSERT INTO `sys_log` VALUES ('85', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"进口报关\",\"type\":0,\"icon\":\"fa fa-reply\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:16:52', 'PC');
INSERT INTO `sys_log` VALUES ('86', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa fa-reply\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:17:19', 'PC');
INSERT INTO `sys_log` VALUES ('87', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 09:17:41', 'PC');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '121', '0:0:0:0:0:0:0:1', '2018-07-06 09:18:46', 'PC');
INSERT INTO `sys_log` VALUES ('89', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"Summary result message\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:21:58', 'PC');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"message/summaryResult\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 09:22:37', 'PC');
INSERT INTO `sys_log` VALUES ('91', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 09:27:29', 'PC');
INSERT INTO `sys_log` VALUES ('92', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '14', '0:0:0:0:0:0:0:1', '2018-07-06 09:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('93', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"orderNum\":6}', '6', '0:0:0:0:0:0:0:1', '2018-07-06 14:52:58', 'PC');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结构单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":9}', '6', '0:0:0:0:0:0:0:1', '2018-07-06 14:53:11', 'PC');
INSERT INTO `sys_log` VALUES ('95', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":6}', '10', '0:0:0:0:0:0:0:1', '2018-07-06 14:53:19', 'PC');
INSERT INTO `sys_log` VALUES ('96', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:06', 'PC');
INSERT INTO `sys_log` VALUES ('97', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '26', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:33', 'PC');
INSERT INTO `sys_log` VALUES ('98', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 14:54:44', 'PC');
INSERT INTO `sys_log` VALUES ('99', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"撤销申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":4}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:55:29', 'PC');
INSERT INTO `sys_log` VALUES ('100', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:56:11', 'PC');
INSERT INTO `sys_log` VALUES ('101', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 14:56:26', 'PC');
INSERT INTO `sys_log` VALUES ('102', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"1离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:03', 'PC');
INSERT INTO `sys_log` VALUES ('103', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:20', 'PC');
INSERT INTO `sys_log` VALUES ('104', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":3}', '23', '0:0:0:0:0:0:0:1', '2018-07-06 14:57:30', 'PC');
INSERT INTO `sys_log` VALUES ('105', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2018-07-06 14:59:56', 'PC');
INSERT INTO `sys_log` VALUES ('106', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":135,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:00:21', 'PC');
INSERT INTO `sys_log` VALUES ('107', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:07', 'PC');
INSERT INTO `sys_log` VALUES ('108', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":-1}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:22', 'PC');
INSERT INTO `sys_log` VALUES ('109', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":8}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:35', 'PC');
INSERT INTO `sys_log` VALUES ('110', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":131,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":7}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:44', 'PC');
INSERT INTO `sys_log` VALUES ('111', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":132,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"撤销申请单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":6}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:01:52', 'PC');
INSERT INTO `sys_log` VALUES ('112', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:00', 'PC');
INSERT INTO `sys_log` VALUES ('113', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":4}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:09', 'PC');
INSERT INTO `sys_log` VALUES ('114', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":135,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运抵单报\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":3}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:17', 'PC');
INSERT INTO `sys_log` VALUES ('115', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '4', '0:0:0:0:0:0:0:1', '2018-07-06 15:02:26', 'PC');
INSERT INTO `sys_log` VALUES ('116', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"\",\"orderNum\":1}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:25', 'PC');
INSERT INTO `sys_log` VALUES ('117', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":2}', '5', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:34', 'PC');
INSERT INTO `sys_log` VALUES ('118', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":137,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '2', '0:0:0:0:0:0:0:1', '2018-07-06 15:03:41', 'PC');
INSERT INTO `sys_log` VALUES ('119', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-06 15:04:15', 'PC');
INSERT INTO `sys_log` VALUES ('120', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '353', '0:0:0:0:0:0:0:1', '2018-07-06 15:04:30', 'PC');
INSERT INTO `sys_log` VALUES ('121', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '1596', '0:0:0:0:0:0:0:1', '2018-07-06 15:30:10', 'PC');
INSERT INTO `sys_log` VALUES ('122', 'p', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":5}', '5', '0:0:0:0:0:0:0:1', '2018-07-09 14:51:43', 'PC');
INSERT INTO `sys_log` VALUES ('123', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"查询\",\"perms\":\"message:customsinventory:list,message:customsinventory:info\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-09 14:53:05', 'PC');
INSERT INTO `sys_log` VALUES ('124', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"新增\",\"perms\":\"message:customsinventory:save\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-09 14:53:36', 'PC');
INSERT INTO `sys_log` VALUES ('125', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"修改\",\"perms\":\"message:customsinventory:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-09 14:54:00', 'PC');
INSERT INTO `sys_log` VALUES ('126', 'p', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":133,\"parentName\":\"出口清单报文\",\"name\":\"删除\",\"perms\":\"message:customsinventory:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-09 14:54:30', 'PC');
INSERT INTO `sys_log` VALUES ('127', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,129],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '82', '0:0:0:0:0:0:0:1', '2018-07-09 15:53:31', 'PC');
INSERT INTO `sys_log` VALUES ('128', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"新增\",\"perms\":\"message:summaryresult:add\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:15', 'PC');
INSERT INTO `sys_log` VALUES ('129', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"修改\",\"perms\":\"message:summaryresult:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:37', 'PC');
INSERT INTO `sys_log` VALUES ('130', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"删除\",\"perms\":\"message:summaryresult:delete\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 09:13:56', 'PC');
INSERT INTO `sys_log` VALUES ('131', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":148,\"parentId\":129,\"parentName\":\"汇总结构单报文\",\"name\":\"新增\",\"perms\":\"message:summaryresult:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 09:17:42', 'PC');
INSERT INTO `sys_log` VALUES ('132', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":129,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总结果单报文\",\"url\":\"modules/message/summary_result.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":9}', '18', '0:0:0:0:0:0:0:1', '2018-07-10 09:17:57', 'PC');
INSERT INTO `sys_log` VALUES ('133', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":16,\"username\":\"1\",\"password\":\"1722d10fd8db67a5cb44664b55a6a253de86b839a084148c490acc4aa36f9e58\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\"}', '199', '0:0:0:0:0:0:0:1', '2018-07-10 09:27:49', 'PC');
INSERT INTO `sys_log` VALUES ('134', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '146', '0:0:0:0:0:0:0:1', '2018-07-10 09:45:45', 'PC');
INSERT INTO `sys_log` VALUES ('135', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":8}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 11:00:55', 'PC');
INSERT INTO `sys_log` VALUES ('136', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"新增\",\"perms\":\"message:summaryapply:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:19', 'PC');
INSERT INTO `sys_log` VALUES ('137', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"修稿\",\"perms\":\"message:summaryapply:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:37', 'PC');
INSERT INTO `sys_log` VALUES ('138', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"删除\",\"perms\":\"message:summaryapply:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-10 11:01:52', 'PC');
INSERT INTO `sys_log` VALUES ('139', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,137,136,135,134,133,144,145,146,147,132,131,130,151,152,153,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '25', '0:0:0:0:0:0:0:1', '2018-07-10 11:02:15', 'PC');
INSERT INTO `sys_log` VALUES ('140', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/activity/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '24', '0:0:0:0:0:0:0:1', '2018-07-10 13:41:10', 'PC');
INSERT INTO `sys_log` VALUES ('141', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/activity/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 13:41:30', 'PC');
INSERT INTO `sys_log` VALUES ('142', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-07-10 13:42:06', 'PC');
INSERT INTO `sys_log` VALUES ('143', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '137', '89', '0:0:0:0:0:0:0:1', '2018-07-10 13:43:08', 'PC');
INSERT INTO `sys_log` VALUES ('144', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":130,\"parentName\":\"汇总申请单报文\",\"name\":\"详情\",\"perms\":\"message:summaryapply:info\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 10:35:58', 'PC');
INSERT INTO `sys_log` VALUES ('145', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,136,135,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '168', '0:0:0:0:0:0:0:1', '2018-07-11 10:36:09', 'PC');
INSERT INTO `sys_log` VALUES ('146', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"新增\",\"perms\":\"ceb505logistics:save\",\"type\":2,\"orderNum\":0}', '17', '0:0:0:0:0:0:0:1', '2018-07-11 16:04:22', 'PC');
INSERT INTO `sys_log` VALUES ('147', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"删除\",\"perms\":\"ceb505logistics:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 16:05:05', 'PC');
INSERT INTO `sys_log` VALUES ('148', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"修改\",\"perms\":\"ceb505logistics:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 16:05:45', 'PC');
INSERT INTO `sys_log` VALUES ('149', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"查看\",\"perms\":\"ceb505logistics:info,ceb505logistics:list\",\"type\":2,\"orderNum\":0}', '1', '0:0:0:0:0:0:0:1', '2018-07-11 16:06:17', 'PC');
INSERT INTO `sys_log` VALUES ('150', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":160,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"新增\",\"perms\":\"messgse:ceb505logistics:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:11', 'PC');
INSERT INTO `sys_log` VALUES ('151', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":161,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"删除\",\"perms\":\"messgse:ceb505logistics:delete\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:28', 'PC');
INSERT INTO `sys_log` VALUES ('152', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":162,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"修改\",\"perms\":\"messgse:ceb505logistics:update\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-11 16:27:44', 'PC');
INSERT INTO `sys_log` VALUES ('153', 'aa', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":163,\"parentId\":136,\"parentName\":\"运单报文\",\"name\":\"查看\",\"perms\":\"messgse:ceb505logistics:info,messgse:ceb505logistics:list\",\"type\":2,\"orderNum\":0}', '11', '0:0:0:0:0:0:0:1', '2018-07-11 16:28:07', 'PC');
INSERT INTO `sys_log` VALUES ('154', 'zeyee', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":138,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:list,message:customsorder:update,message:customsorder:delete,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-07-11 18:09:57', 'PC');
INSERT INTO `sys_log` VALUES ('155', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"新增\",\"perms\":\"message:customsorder:save\",\"type\":2,\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-07-11 18:10:16', 'PC');
INSERT INTO `sys_log` VALUES ('156', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"修改\",\"perms\":\"message:customsorder:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:10:37', 'PC');
INSERT INTO `sys_log` VALUES ('157', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"详情\",\"perms\":\"message:customsorder:info\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:04', 'PC');
INSERT INTO `sys_log` VALUES ('158', 'zeyee', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":138,\"parentName\":\"订单报文\",\"name\":\"删除\",\"perms\":\"message:customsorder:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:18', 'PC');
INSERT INTO `sys_log` VALUES ('159', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,128,138,164,165,166,167,136,160,161,162,163,135,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '182', '0:0:0:0:0:0:0:1', '2018-07-11 18:11:56', 'PC');
INSERT INTO `sys_log` VALUES ('160', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"新增\",\"perms\":\"message:ceb507arrival:save\",\"type\":2,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:05', 'PC');
INSERT INTO `sys_log` VALUES ('161', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"删除\",\"perms\":\"message:ceb507arrival:delete\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:24', 'PC');
INSERT INTO `sys_log` VALUES ('162', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"更新\",\"perms\":\"message:ceb507arrival:update\",\"type\":2,\"orderNum\":0}', '2', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:43', 'PC');
INSERT INTO `sys_log` VALUES ('163', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":135,\"parentName\":\"运抵单报\",\"name\":\"查看\",\"perms\":\"message:ceb507arrival:info\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-12 10:27:56', 'PC');
INSERT INTO `sys_log` VALUES ('164', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,128,138,164,165,166,167,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '2330', '0:0:0:0:0:0:0:1', '2018-07-16 13:45:12', 'PC');
INSERT INTO `sys_log` VALUES ('165', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":177,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"商品信息\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '8', '0:0:0:0:0:0:0:1', '2018-07-17 10:23:05', 'PC');
INSERT INTO `sys_log` VALUES ('166', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,177,178,179,180,181,128,138,164,165,166,167,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '180', '0:0:0:0:0:0:0:1', '2018-07-17 15:09:45', 'PC');
INSERT INTO `sys_log` VALUES ('167', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":126,\"parentName\":\"自主报关\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-17 15:20:30', 'PC');
INSERT INTO `sys_log` VALUES ('168', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":17,\"username\":\"q\",\"password\":\"a8fd29de3a9fa2e284c1c48352d4db03fa6ef47e2849356dc383a7eb2f310795\",\"salt\":\"VfpNCBdTf25anvdi63Zx\",\"email\":\"q@qq.com\",\"mobile\":\"q\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 17, 2018 3:21:24 PM\"}', '234', '0:0:0:0:0:0:0:1', '2018-07-17 15:21:25', 'PC');
INSERT INTO `sys_log` VALUES ('169', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '13', '0:0:0:0:0:0:0:1', '2018-07-17 15:22:33', 'PC');
INSERT INTO `sys_log` VALUES ('170', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '22', '0:0:0:0:0:0:0:1', '2018-07-17 15:23:12', 'PC');
INSERT INTO `sys_log` VALUES ('171', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-FILE-TEXT-o\",\"orderNum\":0}', '14', '0:0:0:0:0:0:0:1', '2018-07-19 17:53:07', 'PC');
INSERT INTO `sys_log` VALUES ('172', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":1}', '8', '0:0:0:0:0:0:0:1', '2018-07-19 17:53:37', 'PC');
INSERT INTO `sys_log` VALUES ('173', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,154,155,156,157,158,187,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '173', '0:0:0:0:0:0:0:1', '2018-07-19 17:54:28', 'PC');
INSERT INTO `sys_log` VALUES ('174', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"新增\",\"perms\":\"message:customsorder:sava\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-19 17:55:05', 'PC');
INSERT INTO `sys_log` VALUES ('175', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"列表查询\",\"perms\":\"message:customsorder:list\",\"type\":2,\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-07-19 17:55:33', 'PC');
INSERT INTO `sys_log` VALUES ('176', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"详情查询\",\"perms\":\"message:customsorder:info\",\"type\":2,\"orderNum\":0}', '70', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:00', 'PC');
INSERT INTO `sys_log` VALUES ('177', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"修改\",\"perms\":\"message:customsorder:update\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:16', 'PC');
INSERT INTO `sys_log` VALUES ('178', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":187,\"parentName\":\"订单报文(改)\",\"name\":\"删除\",\"perms\":\"message:customsorder:delete\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:33', 'PC');
INSERT INTO `sys_log` VALUES ('179', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文(改)\",\"url\":\"modules/message/customs_order2.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-19 17:56:49', 'PC');
INSERT INTO `sys_log` VALUES ('180', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '17', '0:0:0:0:0:0:0:1', '2018-07-19 17:57:02', 'PC');
INSERT INTO `sys_log` VALUES ('181', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文（海关）\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '11', '0:0:0:0:0:0:0:1', '2018-07-20 16:39:05', 'PC');
INSERT INTO `sys_log` VALUES ('182', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,138,164,165,166,167,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '161', '0:0:0:0:0:0:0:1', '2018-07-20 16:39:31', 'PC');
INSERT INTO `sys_log` VALUES ('183', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '9', '0:0:0:0:0:0:0:1', '2018-07-20 16:40:36', 'PC');
INSERT INTO `sys_log` VALUES ('184', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '138', '2', '0:0:0:0:0:0:0:1', '2018-07-21 15:52:53', 'PC');
INSERT INTO `sys_log` VALUES ('185', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '165', '23', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:02', 'PC');
INSERT INTO `sys_log` VALUES ('186', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '167', '6', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:14', 'PC');
INSERT INTO `sys_log` VALUES ('187', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '166', '6', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:28', 'PC');
INSERT INTO `sys_log` VALUES ('188', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '164', '5', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:39', 'PC');
INSERT INTO `sys_log` VALUES ('189', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '138', '5', '0:0:0:0:0:0:0:1', '2018-07-21 15:53:47', 'PC');
INSERT INTO `sys_log` VALUES ('190', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-file-text-o\",\"orderNum\":0}', '7', '0:0:0:0:0:0:0:1', '2018-07-21 15:54:02', 'PC');
INSERT INTO `sys_log` VALUES ('191', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":188,\"parentId\":187,\"parentName\":\"订单报文\",\"name\":\"新增\",\"perms\":\"message:customsorder:save\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-21 16:25:24', 'PC');
INSERT INTO `sys_log` VALUES ('192', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,131,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '314', '0:0:0:0:0:0:0:1', '2018-07-21 16:25:42', 'PC');
INSERT INTO `sys_log` VALUES ('193', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"组织架构\",\"url\":\"http://localhost:8081/index.html#modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '3', '0:0:0:0:0:0:0:1', '2018-07-23 15:32:20', 'PC');
INSERT INTO `sys_log` VALUES ('194', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,198,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '274', '0:0:0:0:0:0:0:1', '2018-07-23 15:33:06', 'PC');
INSERT INTO `sys_log` VALUES ('195', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '198', '23', '0:0:0:0:0:0:0:1', '2018-07-23 15:33:59', 'PC');
INSERT INTO `sys_log` VALUES ('196', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 15:35:02', 'PC');
INSERT INTO `sys_log` VALUES ('197', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '26', '0:0:0:0:0:0:0:1', '2018-07-23 15:35:51', 'PC');
INSERT INTO `sys_log` VALUES ('198', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '183', '0:0:0:0:0:0:0:1', '2018-07-23 15:41:59', 'PC');
INSERT INTO `sys_log` VALUES ('199', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"新增\",\"perms\":\"sys:sysdept:save\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:08:10', 'PC');
INSERT INTO `sys_log` VALUES ('200', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"删除\",\"perms\":\"sys:sysdept:delete\",\"type\":2,\"orderNum\":0}', '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:08:45', 'PC');
INSERT INTO `sys_log` VALUES ('201', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '85', '0:0:0:0:0:0:0:1', '2018-07-23 16:09:11', 'PC');
INSERT INTO `sys_log` VALUES ('202', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '2', '0:0:0:0:0:0:0:1', '2018-07-23 16:09:41', 'PC');
INSERT INTO `sys_log` VALUES ('203', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '4', '0:0:0:0:0:0:0:1', '2018-07-23 16:10:13', 'PC');
INSERT INTO `sys_log` VALUES ('204', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '234', '0:0:0:0:0:0:0:1', '2018-07-23 16:31:57', 'PC');
INSERT INTO `sys_log` VALUES ('205', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '75', '839', '0:0:0:0:0:0:0:1', '2018-07-23 16:29:48', 'PC');
INSERT INTO `sys_log` VALUES ('206', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '16', '1135', '0:0:0:0:0:0:0:1', '2018-07-23 16:33:13', 'PC');
INSERT INTO `sys_log` VALUES ('207', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '28', '837', '0:0:0:0:0:0:0:1', '2018-07-23 16:35:04', 'PC');
INSERT INTO `sys_log` VALUES ('208', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":199,\"parentName\":\"组织架构\",\"name\":\"修改\",\"perms\":\"sys:sysdept:update\",\"type\":2,\"orderNum\":0}', '5', '0:0:0:0:0:0:0:1', '2018-07-23 16:37:03', 'PC');
INSERT INTO `sys_log` VALUES ('209', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,35,36,59,60,61,62,69,70,71,72,73,74,98,116,117,118,119,120,139,140,141,142,143,58,76,81,82,83,84,75,77,78,79,80,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '15', '0:0:0:0:0:0:0:1', '2018-07-23 16:37:16', 'PC');
INSERT INTO `sys_log` VALUES ('210', 'q', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":194,\"parentId\":193,\"parentName\":\"清单总分单报文\",\"name\":\"详情\",\"perms\":\"waybill:waybill:list,waybill:waybill:info\",\"type\":2,\"orderNum\":1}', '6', '0:0:0:0:0:0:0:1', '2018-07-23 19:52:26', 'PC');
INSERT INTO `sys_log` VALUES ('211', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:06:43', 'PC');
INSERT INTO `sys_log` VALUES ('212', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:00', 'PC');
INSERT INTO `sys_log` VALUES ('213', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '2', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:17', 'PC');
INSERT INTO `sys_log` VALUES ('214', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '15', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:37', 'PC');
INSERT INTO `sys_log` VALUES ('215', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '4', '0:0:0:0:0:0:0:1', '2018-07-25 10:07:54', 'PC');
INSERT INTO `sys_log` VALUES ('216', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '3', '0:0:0:0:0:0:0:1', '2018-07-25 10:08:19', 'PC');
INSERT INTO `sys_log` VALUES ('217', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '6', '0:0:0:0:0:0:0:1', '2018-07-25 10:09:21', 'PC');
INSERT INTO `sys_log` VALUES ('218', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '19436', '0:0:0:0:0:0:0:1', '2018-07-25 10:11:53', 'PC');
INSERT INTO `sys_log` VALUES ('219', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '247', '0:0:0:0:0:0:0:1', '2018-07-25 16:58:48', 'PC');
INSERT INTO `sys_log` VALUES ('220', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '6', '0:0:0:0:0:0:0:1', '2018-07-25 16:59:03', 'PC');
INSERT INTO `sys_log` VALUES ('221', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:00:07', 'PC');
INSERT INTO `sys_log` VALUES ('222', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":136}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:01:15', 'PC');
INSERT INTO `sys_log` VALUES ('223', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":135}', '8327', '0:0:0:0:0:0:0:1', '2018-07-25 17:01:55', 'PC');
INSERT INTO `sys_log` VALUES ('224', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134}', '6386', '0:0:0:0:0:0:0:1', '2018-07-25 17:10:46', 'PC');
INSERT INTO `sys_log` VALUES ('225', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '95', '0:0:0:0:0:0:0:1', '2018-07-25 17:13:58', 'PC');
INSERT INTO `sys_log` VALUES ('226', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '17635', '0:0:0:0:0:0:0:1', '2018-07-25 17:15:12', 'PC');
INSERT INTO `sys_log` VALUES ('227', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '2154', '0:0:0:0:0:0:0:1', '2018-07-25 17:18:59', 'PC');
INSERT INTO `sys_log` VALUES ('228', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":16,\"username\":\"1\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\",\"departmentId\":137}', '7', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:18', 'PC');
INSERT INTO `sys_log` VALUES ('229', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":18,\"username\":\"ssshao\",\"password\":\"ca5cc1209ead245d10e60daae98b8d636dcd576a26df72175041bf6d733f3ffd\",\"salt\":\"V85lRhcnuEAE1lHigWee\",\"email\":\"145@qq.com\",\"mobile\":\"15555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 25, 2018 5:19:47 PM\",\"departmentId\":134}', '27', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:48', 'PC');
INSERT INTO `sys_log` VALUES ('230', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":18,\"username\":\"ssshao\",\"salt\":\"V85lRhcnuEAE1lHigWee\",\"email\":\"145@qq.com\",\"mobile\":\"15555\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jul 25, 2018 5:19:48 PM\",\"departmentId\":136,\"departmentName\":\"技术1部\"}', '6', '0:0:0:0:0:0:0:1', '2018-07-25 17:19:55', 'PC');
INSERT INTO `sys_log` VALUES ('231', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":4,\"username\":\"aa\",\"salt\":\"AzqDHoXpI10ou0DC9LkN\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 26, 2018 1:35:17 PM\",\"departmentId\":135,\"departmentName\":\"技术1部\"}', '37', '0:0:0:0:0:0:0:1', '2018-07-25 20:03:53', 'PC');
INSERT INTO `sys_log` VALUES ('232', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":95,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"合同管理--作废\",\"type\":0,\"icon\":\"fa fa-file\",\"orderNum\":100}', '6', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:18', 'PC');
INSERT INTO `sys_log` VALUES ('233', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理--作废\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:46', 'PC');
INSERT INTO `sys_log` VALUES ('234', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商户管理--作废\",\"type\":0,\"icon\":\"glyphicon glyphicon-tasks\",\"orderNum\":101}', '3', '0:0:0:0:0:0:0:1', '2018-08-09 17:33:57', 'PC');
INSERT INTO `sys_log` VALUES ('235', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":58,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"仓储管理--作废\",\"type\":0,\"icon\":\"fa fa-university\",\"orderNum\":102}', '5', '0:0:0:0:0:0:0:1', '2018-08-09 17:34:12', 'PC');
INSERT INTO `sys_log` VALUES ('236', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":35,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理-备用\",\"type\":0,\"icon\":\"fa fa-archive\",\"orderNum\":104}', '4', '0:0:0:0:0:0:0:1', '2018-08-09 17:34:37', 'PC');
INSERT INTO `sys_log` VALUES ('237', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构--重写\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '6', '0:0:0:0:0:0:0:1', '2018-08-09 17:37:54', 'PC');
INSERT INTO `sys_log` VALUES ('238', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,108,109,110,111,112,113,121,122,123,124,125,126,127,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '152', '0:0:0:0:0:0:0:1', '2018-08-27 16:46:11', 'PC');
INSERT INTO `sys_log` VALUES ('239', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,126,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '35', '0:0:0:0:0:0:0:1', '2018-08-27 16:47:10', 'PC');
INSERT INTO `sys_log` VALUES ('240', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-09-30 09:26:57', 'PC');
INSERT INTO `sys_log` VALUES ('241', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '3', '0:0:0:0:0:0:0:1', '2018-09-30 09:27:19', 'PC');
INSERT INTO `sys_log` VALUES ('242', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":1}', '3', '0:0:0:0:0:0:0:1', '2018-09-30 09:27:37', 'PC');
INSERT INTO `sys_log` VALUES ('243', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '99', '0:0:0:0:0:0:0:1', '2018-09-30 09:28:22', 'PC');
INSERT INTO `sys_log` VALUES ('244', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', '6', '0:0:0:0:0:0:0:1', '2018-10-09 10:30:20', 'PC');
INSERT INTO `sys_log` VALUES ('245', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '117', '0:0:0:0:0:0:0:1', '2018-10-09 11:11:02', 'PC');
INSERT INTO `sys_log` VALUES ('246', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '98', '0:0:0:0:0:0:0:1', '2018-10-10 09:44:22', 'PC');
INSERT INTO `sys_log` VALUES ('247', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '129', '0:0:0:0:0:0:0:1', '2018-10-11 11:25:11', 'PC');
INSERT INTO `sys_log` VALUES ('248', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,6,7,8,9,10,11,12,13,14,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Jun 25, 2018 5:46:46 PM\"}', '124', '0:0:0:0:0:0:0:1', '2018-10-11 11:25:33', 'PC');
INSERT INTO `sys_log` VALUES ('249', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"fe048887cb4568a0ca7cd850532c064f7a90b4dd79a97bac4152398260ca403a\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\"}', '340', '0:0:0:0:0:0:0:1', '2018-10-25 18:04:53', 'PC');
INSERT INTO `sys_log` VALUES ('250', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":22,\"username\":\"5\",\"password\":\"b31a251070af43c0a5d8fd97335f8645aa84e35d7d7df8c8aa2aa06b334d96aa\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832232\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '131', '0:0:0:0:0:0:0:1', '2018-11-07 09:08:42', 'PC');
INSERT INTO `sys_log` VALUES ('251', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":22,\"username\":\"544\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832235\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '152', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:01', 'PC');
INSERT INTO `sys_log` VALUES ('252', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":22,\"username\":\"544\",\"salt\":\"z6ZjCDgzQ3pemiuW7Y5L\",\"email\":\"484848885@qq.com\",\"mobile\":\"13265832235\",\"status\":0,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 9:08:42 AM\"}', '387', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:07', 'PC');
INSERT INTO `sys_log` VALUES ('253', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[22]', '330', '0:0:0:0:0:0:0:1', '2018-11-07 09:09:13', 'PC');
INSERT INTO `sys_log` VALUES ('254', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"2\",\"remark\":\"2\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:10:59 AM\"}', '376', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:00', 'PC');
INSERT INTO `sys_log` VALUES ('255', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":2,\"roleName\":\"2\",\"remark\":\"2333\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:11:00 AM\"}', '131', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:07', 'PC');
INSERT INTO `sys_log` VALUES ('256', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[2]', '386', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:17', 'PC');
INSERT INTO `sys_log` VALUES ('257', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":3,\"roleName\":\"222\",\"remark\":\"222\",\"createUserId\":1,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:11:35 AM\"}', '134', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:35', 'PC');
INSERT INTO `sys_log` VALUES ('258', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[3]', '99', '0:0:0:0:0:0:0:1', '2018-11-07 09:11:52', 'PC');
INSERT INTO `sys_log` VALUES ('259', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"11111\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"icon\":\"1\",\"orderNum\":0}', '34', '0:0:0:0:0:0:0:1', '2018-11-07 09:12:40', 'PC');
INSERT INTO `sys_log` VALUES ('260', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":203,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"11111\",\"url\":\"1\",\"perms\":\"1\",\"type\":0,\"icon\":\"1\",\"orderNum\":0}', '36', '0:0:0:0:0:0:0:1', '2018-11-07 09:13:29', 'PC');
INSERT INTO `sys_log` VALUES ('261', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '203', '116', '0:0:0:0:0:0:0:1', '2018-11-07 09:13:42', 'PC');
INSERT INTO `sys_log` VALUES ('262', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":26,\"username\":\"7415\",\"password\":\"f797fbf1614434519e0826f91dcf0e7933290d880690e14e441b8240e20e405f\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@qq.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '149', '0:0:0:0:0:0:0:1', '2018-11-07 09:17:09', 'PC');
INSERT INTO `sys_log` VALUES ('263', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":26,\"username\":\"7415\",\"password\":\"2cd4898cfee8cfb6ab52b4f515f3a3946d09a7c83976387b4caba527b032c23b\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@qq.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '198', '0:0:0:0:0:0:0:1', '2018-11-07 09:17:22', 'PC');
INSERT INTO `sys_log` VALUES ('264', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":27,\"username\":\"8585\",\"password\":\"5cee50bb13f2bed905cd70fbb7f11f0dca49c63c24e8ca9ee4ec9257f4fd7ad9\",\"salt\":\"43FtIEIBQq5RTkij3LRj\",\"email\":\"764686889@qq.com\",\"mobile\":\"45623568911\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:18:03 AM\"}', '212', '0:0:0:0:0:0:0:1', '2018-11-07 09:18:04', 'PC');
INSERT INTO `sys_log` VALUES ('265', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":26,\"username\":\"7415\",\"salt\":\"uQSqFukhMz6wnYzdUHJP\",\"email\":\"764686848@ss.com\",\"mobile\":\"13562532232\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 7, 2018 9:17:08 AM\"}', '197', '0:0:0:0:0:0:0:1', '2018-11-07 09:19:37', 'PC');
INSERT INTO `sys_log` VALUES ('266', '1', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[27,26]', '152', '0:0:0:0:0:0:0:1', '2018-11-07 09:20:59', 'PC');
INSERT INTO `sys_log` VALUES ('267', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":4,\"roleName\":\"1\",\"remark\":\"1\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:22:43 AM\"}', '241', '0:0:0:0:0:0:0:1', '2018-11-07 09:22:44', 'PC');
INSERT INTO `sys_log` VALUES ('268', '1', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":4,\"roleName\":\"1\",\"remark\":\"1222\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:22:44 AM\"}', '236', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:03', 'PC');
INSERT INTO `sys_log` VALUES ('269', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[4]', '162', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:29', 'PC');
INSERT INTO `sys_log` VALUES ('270', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":5,\"roleName\":\"2222\",\"remark\":\"11111\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:23:45 AM\"}', '238', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:46', 'PC');
INSERT INTO `sys_log` VALUES ('271', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[5]', '155', '0:0:0:0:0:0:0:1', '2018-11-07 09:23:51', 'PC');
INSERT INTO `sys_log` VALUES ('272', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":6,\"roleName\":\"55557777\",\"remark\":\"5555\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:24:34 AM\"}', '223', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:35', 'PC');
INSERT INTO `sys_log` VALUES ('273', '1', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":7,\"roleName\":\"5586868\",\"remark\":\"68688\",\"createUserId\":16,\"menuIdList\":[],\"createTime\":\"Nov 7, 2018 9:24:44 AM\"}', '467', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:45', 'PC');
INSERT INTO `sys_log` VALUES ('274', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[6]', '151', '0:0:0:0:0:0:0:1', '2018-11-07 09:24:49', 'PC');
INSERT INTO `sys_log` VALUES ('275', '1', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[7]', '157', '0:0:0:0:0:0:0:1', '2018-11-07 09:25:40', 'PC');
INSERT INTO `sys_log` VALUES ('276', '1', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"858585\",\"url\":\"8\",\"type\":1,\"orderNum\":0}', '54', '0:0:0:0:0:0:0:1', '2018-11-07 09:26:04', 'PC');
INSERT INTO `sys_log` VALUES ('277', '1', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":204,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"858585\",\"url\":\"8\",\"type\":0,\"orderNum\":0}', '52', '0:0:0:0:0:0:0:1', '2018-11-07 09:26:45', 'PC');
INSERT INTO `sys_log` VALUES ('278', '1', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '204', '186', '0:0:0:0:0:0:0:1', '2018-11-07 09:28:09', 'PC');
INSERT INTO `sys_log` VALUES ('279', '1', '删除定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.delete()', '[1]', '266', '0:0:0:0:0:0:0:1', '2018-11-07 09:30:50', 'PC');
INSERT INTO `sys_log` VALUES ('280', '1', '恢复定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.resume()', '[2]', '161', '0:0:0:0:0:0:0:1', '2018-11-07 09:31:13', 'PC');
INSERT INTO `sys_log` VALUES ('281', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":29,\"username\":\"3\",\"password\":\"71115bd7a12198a6f3c380b5dcb310e72a6bf4005a4007de36284aac45b271ce\",\"salt\":\"EX9BGu11kTySjgamWYoH\",\"email\":\"2@qq.com\",\"mobile\":\"11\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 4:56:56 PM\",\"departmentId\":133}', '231', '0:0:0:0:0:0:0:1', '2018-11-07 16:56:57', 'PC');
INSERT INTO `sys_log` VALUES ('282', '1', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"1\",\"newPassword\":\"123456\"}', '53', '0:0:0:0:0:0:0:1', '2018-11-08 10:16:21', 'PC');
INSERT INTO `sys_log` VALUES ('283', '1', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"123456\",\"newPassword\":\"1\"}', '52', '0:0:0:0:0:0:0:1', '2018-11-08 10:16:45', 'PC');
INSERT INTO `sys_log` VALUES ('284', 'p', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":30,\"username\":\"房东\",\"password\":\"9b9fcdf9263f42a967e01b7f85ac2f1829243bba169ef2e633c84b17540cdc71\",\"salt\":\"Kk5yZHdVj4QmF2qxl7bF\",\"email\":\"141@qq.com\",\"mobile\":\"和规范化\",\"status\":1,\"roleIdList\":[],\"createUserId\":5,\"createTime\":\"Nov 8, 2018 3:50:22 PM\"}', '305', '0:0:0:0:0:0:0:1', '2018-11-08 15:50:22', 'PC');
INSERT INTO `sys_log` VALUES ('285', 'p', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[30]', '161', '0:0:0:0:0:0:0:1', '2018-11-08 16:09:58', 'PC');
INSERT INTO `sys_log` VALUES ('286', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":9,\"roleName\":\"admin123\",\"remark\":\"123\",\"createUserId\":1,\"menuIdList\":[1,31],\"createTime\":\"Nov 8, 2018 4:37:50 PM\"}', '260', '0:0:0:0:0:0:0:1', '2018-11-08 16:37:51', 'PC');
INSERT INTO `sys_log` VALUES ('287', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[9]', '138', '0:0:0:0:0:0:0:1', '2018-11-08 16:37:59', 'PC');
INSERT INTO `sys_log` VALUES ('288', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[1]', '136', '0:0:0:0:0:0:0:1', '2018-11-08 16:38:10', 'PC');
INSERT INTO `sys_log` VALUES ('289', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,135,168,169,170,171,134,133,144,145,146,147,132,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '353', '0:0:0:0:0:0:0:1', '2018-11-08 16:50:44', 'PC');
INSERT INTO `sys_log` VALUES ('290', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":2,\"username\":\"hjw\",\"salt\":\"r10CHP0w4gmzg042steA\",\"email\":\"love@und.win\",\"mobile\":\"123456\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 25, 2018 5:45:41 PM\",\"departmentId\":134,\"departmentName\":\"技术1部\"}', '351', '0:0:0:0:0:0:0:1', '2018-11-08 16:51:27', 'PC');
INSERT INTO `sys_log` VALUES ('291', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":16,\"username\":\"1\",\"salt\":\"PWYfKvb0OllUgwdQJsB1\",\"email\":\"1@qqq.com\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jul 10, 2018 9:27:49 AM\",\"departmentId\":137,\"departmentName\":\"人事部\"}', '236', '0:0:0:0:0:0:0:1', '2018-11-08 16:51:36', 'PC');
INSERT INTO `sys_log` VALUES ('292', 'aa', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":11,\"roleName\":\"test56\",\"remark\":\"123\",\"createUserId\":4,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Nov 8, 2018 4:56:07 PM\"}', '247', '0:0:0:0:0:0:0:1', '2018-11-08 16:56:08', 'PC');
INSERT INTO `sys_log` VALUES ('293', 'aa', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[11]', '136', '0:0:0:0:0:0:0:1', '2018-11-08 16:56:13', 'PC');
INSERT INTO `sys_log` VALUES ('294', 'aa', '暂停定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.pause()', '[2]', '163', '0:0:0:0:0:0:0:1', '2018-11-08 16:59:09', 'PC');
INSERT INTO `sys_log` VALUES ('295', 'aa', '恢复定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.resume()', '[2]', '139', '0:0:0:0:0:0:0:1', '2018-11-08 16:59:13', 'PC');
INSERT INTO `sys_log` VALUES ('296', 'aa', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"test\",\"url\":\"#\",\"type\":1,\"orderNum\":0}', '45', '0:0:0:0:0:0:0:1', '2018-11-08 17:01:55', 'PC');
INSERT INTO `sys_log` VALUES ('297', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,129,148,149,150,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '314', '0:0:0:0:0:0:0:1', '2018-11-08 17:40:06', 'PC');
INSERT INTO `sys_log` VALUES ('298', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":5,\"username\":\"p\",\"password\":\"59fb34d9b2b17674c0382b3ce714348094bbcaf9e33e1e4554d5a0caa612408a\",\"salt\":\"jqwwgXFXbr6yr2q0aWBP\",\"email\":\"me@qq.com\",\"mobile\":\"18888888888\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:18:08 PM\",\"departmentId\":134,\"departmentName\":\"美工部\"}', '244', '0:0:0:0:0:0:0:1', '2018-11-08 19:07:48', 'PC');
INSERT INTO `sys_log` VALUES ('299', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"18356666666\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\",\"departmentId\":124}', '132', '0:0:0:0:0:0:0:1', '2018-11-08 19:08:15', 'PC');
INSERT INTO `sys_log` VALUES ('300', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":11,\"username\":\"y\",\"password\":\"6db1e100fd361ace04a2cca117b3569655e141ed2abfa29004432da91801be10\",\"salt\":\"vqi6Km3L4bTidkVyxVwo\",\"email\":\"me@qq.com\",\"mobile\":\"18356666666\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jun 27, 2018 5:23:05 PM\",\"departmentId\":134}', '166', '0:0:0:0:0:0:0:1', '2018-11-08 19:08:28', 'PC');
INSERT INTO `sys_log` VALUES ('301', '1', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":31,\"username\":\"s\",\"password\":\"9a414fd7395ea1011b6d94d1aa57f979b7f98ecaf9b0da4459d9b6c36ad17de1\",\"salt\":\"owXnVGZIUUyfnBApYtsO\",\"email\":\"764686887@qq.com\",\"mobile\":\"13260536302\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 9, 2018 9:45:48 AM\"}', '196', '0:0:0:0:0:0:0:1', '2018-11-09 09:45:49', 'PC');
INSERT INTO `sys_log` VALUES ('302', '1', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":31,\"username\":\"s\",\"salt\":\"owXnVGZIUUyfnBApYtsO\",\"email\":\"764686887@qq.com\",\"mobile\":\"13260536308\",\"status\":1,\"roleIdList\":[],\"createUserId\":16,\"createTime\":\"Nov 9, 2018 9:45:49 AM\"}', '180', '0:0:0:0:0:0:0:1', '2018-11-09 09:45:59', 'PC');
INSERT INTO `sys_log` VALUES ('303', '1', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[31]', '134', '0:0:0:0:0:0:0:1', '2018-11-09 09:46:06', 'PC');
INSERT INTO `sys_log` VALUES ('304', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,98,116,117,118,119,120,139,140,141,142,143,172,173,174,175,176,182,183,184,185,186,128,187,188,189,190,191,192,193,194,195,196,197,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,130,151,152,153,159,108,109,110,111,112,113,121,122,123,124,125],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '403', '0:0:0:0:0:0:0:1', '2018-11-09 10:27:08', 'PC');
INSERT INTO `sys_log` VALUES ('305', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":29,\"username\":\"3\",\"password\":\"71115bd7a12198a6f3c380b5dcb310e72a6bf4005a4007de36284aac45b271ce\",\"salt\":\"EX9BGu11kTySjgamWYoH\",\"email\":\"2@qq.com\",\"mobile\":\"15625252525\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 7, 2018 4:56:57 PM\",\"departmentId\":133,\"departmentName\":\"技术部\"}', '421', '0:0:0:0:0:0:0:1', '2018-11-09 10:49:35', 'PC');
INSERT INTO `sys_log` VALUES ('306', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fas fa-cart-plus\",\"orderNum\":0}', '72', '0:0:0:0:0:0:0:1', '2018-11-09 16:30:26', 'PC');
INSERT INTO `sys_log` VALUES ('307', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":187,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"订单报文\",\"url\":\"modules/message/customs_order.html\",\"perms\":\"message:customsorder:sava,message:customsorder:LIST,message:customsorder:UPDATE,message:customsorder:DELETE,message:customsorder:info\",\"type\":1,\"icon\":\"fa fa-cart-plus\",\"orderNum\":0}', '69', '0:0:0:0:0:0:0:1', '2018-11-09 16:30:55', 'PC');
INSERT INTO `sys_log` VALUES ('308', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":154,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"收款单报文\",\"url\":\"modules/message/customsreceipts.html\",\"type\":1,\"icon\":\"fa fa-jpy\",\"orderNum\":1}', '64', '0:0:0:0:0:0:0:1', '2018-11-09 16:36:19', 'PC');
INSERT INTO `sys_log` VALUES ('309', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-align-left\",\"orderNum\":0}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:37:41', 'PC');
INSERT INTO `sys_log` VALUES ('310', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-align-right\",\"orderNum\":5}', '66', '0:0:0:0:0:0:0:1', '2018-11-09 16:38:04', 'PC');
INSERT INTO `sys_log` VALUES ('311', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-folder-open\",\"orderNum\":8}', '70', '0:0:0:0:0:0:0:1', '2018-11-09 16:41:22', 'PC');
INSERT INTO `sys_log` VALUES ('312', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":136,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"运单报文\",\"url\":\"modules/message/ceb505logistics.html\",\"type\":1,\"icon\":\"fa fa-truck\",\"orderNum\":2}', '67', '0:0:0:0:0:0:0:1', '2018-11-09 16:43:15', 'PC');
INSERT INTO `sys_log` VALUES ('313', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/departure/departure.html\",\"perms\":\"departure:departure:save,departure:departure:info,departure:departure:update,departure:departure:delete\",\"type\":1,\"icon\":\"fa fa-plane\",\"orderNum\":4}', '85', '0:0:0:0:0:0:0:1', '2018-11-09 16:45:58', 'PC');
INSERT INTO `sys_log` VALUES ('314', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":109,\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户列表\",\"url\":\"modules/company/company.html\",\"type\":1,\"icon\":\"fa fa-list-ol\",\"orderNum\":0}', '78', '0:0:0:0:0:0:0:1', '2018-11-09 16:46:34', 'PC');
INSERT INTO `sys_log` VALUES ('315', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":121,\"parentId\":108,\"parentName\":\"客户管理\",\"name\":\"客户类型\",\"url\":\"modules/company/companytype.html\",\"type\":1,\"icon\":\"fa fa-list-ul\",\"orderNum\":1}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:47:16', 'PC');
INSERT INTO `sys_log` VALUES ('316', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":0}', '51', '0:0:0:0:0:0:0:1', '2018-11-09 16:50:25', 'PC');
INSERT INTO `sys_log` VALUES ('317', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-cc\",\"orderNum\":0}', '53', '0:0:0:0:0:0:0:1', '2018-11-09 16:50:59', 'PC');
INSERT INTO `sys_log` VALUES ('318', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":116,\"parentId\":98,\"parentName\":\"商品管理\",\"name\":\"商品\",\"url\":\"modules/commodity/commodity.html\",\"type\":1,\"icon\":\"fa fa-cubes\",\"orderNum\":0}', '79', '0:0:0:0:0:0:0:1', '2018-11-09 16:52:17', 'PC');
INSERT INTO `sys_log` VALUES ('319', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":139,\"parentId\":98,\"parentName\":\"商品管理\",\"name\":\"商品单位\",\"url\":\"modules/commodity/commodityunit.html\",\"type\":1,\"icon\":\"fa fa-cube\",\"orderNum\":0}', '78', '0:0:0:0:0:0:0:1', '2018-11-09 16:52:47', 'PC');
INSERT INTO `sys_log` VALUES ('320', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":128,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"出口报关\",\"type\":0,\"icon\":\"fa fa-share\",\"orderNum\":0}', '39', '0:0:0:0:0:0:0:1', '2018-11-13 13:54:53', 'PC');
INSERT INTO `sys_log` VALUES ('321', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":108,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":1}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:06', 'PC');
INSERT INTO `sys_log` VALUES ('322', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":182,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"HScode\",\"url\":\"modules/commodity/hscode2018.html\",\"type\":1,\"icon\":\"fa fa-cc\",\"orderNum\":3}', '50', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:26', 'PC');
INSERT INTO `sys_log` VALUES ('323', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":172,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"草稿库\",\"url\":\"modules/excel/importexcel.html\",\"type\":1,\"icon\":\"fa fa-archive\",\"orderNum\":4}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:37', 'PC');
INSERT INTO `sys_log` VALUES ('324', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":98,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"icon\":\"glyphicon glyphicon-apple\",\"orderNum\":5}', '37', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:45', 'PC');
INSERT INTO `sys_log` VALUES ('325', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":108,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"客户管理\",\"type\":0,\"icon\":\"fa fa-user-circle\",\"orderNum\":6}', '40', '0:0:0:0:0:0:0:1', '2018-11-13 13:55:53', 'PC');
INSERT INTO `sys_log` VALUES ('326', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":1,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"系统管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":7}', '38', '0:0:0:0:0:0:0:1', '2018-11-13 13:56:03', 'PC');
INSERT INTO `sys_log` VALUES ('327', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":134,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"离境单报文\",\"url\":\"modules/departure/departure.html\",\"perms\":\"departure:departure:save,departure:departure:info,departure:departure:update,departure:departure:delete\",\"type\":1,\"icon\":\"fa fa-plane\",\"orderNum\":3}', '57', '0:0:0:0:0:0:0:1', '2018-11-13 13:56:50', 'PC');
INSERT INTO `sys_log` VALUES ('328', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":133,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"出口清单报文\",\"url\":\"modules/message/customsinventory.html\",\"type\":1,\"icon\":\"fa fa-align-right\",\"orderNum\":4}', '57', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:10', 'PC');
INSERT INTO `sys_log` VALUES ('329', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":193,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"清单总分单报文\",\"url\":\"modules/message/waybill.html\",\"type\":1,\"icon\":\"fa fa-align-left\",\"orderNum\":5}', '54', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:18', 'PC');
INSERT INTO `sys_log` VALUES ('330', '3', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":130,\"parentId\":128,\"parentName\":\"出口报关\",\"name\":\"汇总申请单报文\",\"url\":\"modules/message/summary_apply.html\",\"perms\":\"message:summaryapply:save,message:summaryapply:update,message:summaryapply:delete\",\"type\":1,\"icon\":\"fa fa-folder-open\",\"orderNum\":6}', '54', '0:0:0:0:0:0:0:1', '2018-11-13 13:57:28', 'PC');
INSERT INTO `sys_log` VALUES ('331', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '466', '0:0:0:0:0:0:0:1', '2018-11-19 10:10:55', 'PC');
INSERT INTO `sys_log` VALUES ('332', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '3223', '0:0:0:0:0:0:0:1', '2018-11-19 10:10:58', 'PC');
INSERT INTO `sys_log` VALUES ('333', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":19,\"username\":\"muxiang\",\"password\":\"4be76c90c1306a2583a73041b1feea106d7513719509a2395287ffe5cc3abadf\",\"salt\":\"htfZ3fkji03kKHNhZfnb\",\"email\":\"1163044261@qq.com\",\"mobile\":\"15952085407\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Oct 25, 2018 6:04:53 PM\",\"departmentId\":134}', '4499', '0:0:0:0:0:0:0:1', '2018-11-19 10:11:00', 'PC');
INSERT INTO `sys_log` VALUES ('334', 'hjw', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":6,\"username\":\"2\",\"password\":\"f808877518e3931fb15d1f879c130e6d60e06b31ef64d174993710030e79b2f3\",\"salt\":\"rPHNHcwUrHiZAihUFl0k\",\"email\":\"2@qq.com\",\"mobile\":\"15333331111\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Jun 27, 2018 5:18:49 PM\",\"departmentId\":136,\"departmentName\":\"美工部\"}', '430', '0:0:0:0:0:0:0:1', '2018-11-19 11:35:23', 'PC');
INSERT INTO `sys_log` VALUES ('335', 'hjw', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[6]', '389', '0:0:0:0:0:0:0:1', '2018-11-19 11:35:57', 'PC');
INSERT INTO `sys_log` VALUES ('336', 'hjw', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":34,\"username\":\"test\",\"password\":\"f3c086f1e900dae44f262ad930dff7970ef916955a500de60544203343280322\",\"salt\":\"5QODc00jTBYPUlsjWh9t\",\"email\":\"123@qq.com\",\"mobile\":\"15233331233\",\"status\":0,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Nov 19, 2018 11:37:37 AM\"}', '233', '0:0:0:0:0:0:0:1', '2018-11-19 11:37:38', 'PC');
INSERT INTO `sys_log` VALUES ('337', 'hjw', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[34]', '129', '0:0:0:0:0:0:0:1', '2018-11-19 13:25:37', 'PC');
INSERT INTO `sys_log` VALUES ('338', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fas fa-bezier-curve\",\"orderNum\":3}', '78', '0:0:0:0:0:0:0:1', '2018-11-19 13:28:27', 'PC');
INSERT INTO `sys_log` VALUES ('339', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":37,\"username\":\"4\",\"password\":\"99a92607ecf849d72fc45c2d7cf0a9b7ce485d9ee93e7f7361f920957b05e2f1\",\"salt\":\"OBEFdAJvZT8cSbphnA1I\",\"email\":\"1@qq.com\",\"mobile\":\"15911111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:29:02 PM\"}', '395', '0:0:0:0:0:0:0:1', '2018-11-19 13:29:03', 'PC');
INSERT INTO `sys_log` VALUES ('340', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[37]', '109', '0:0:0:0:0:0:0:1', '2018-11-19 13:29:08', 'PC');
INSERT INTO `sys_log` VALUES ('341', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":38,\"username\":\"韩\",\"password\":\"de83cb5724b84d090e1842e71d88df7c549b8c44a5bca856d53587a558e98396\",\"salt\":\"3VcmjtwA7X8g5NWzHgnd\",\"email\":\"1@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:33:31 PM\"}', '259', '0:0:0:0:0:0:0:1', '2018-11-19 13:33:31', 'PC');
INSERT INTO `sys_log` VALUES ('342', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[38]', '109', '0:0:0:0:0:0:0:1', '2018-11-19 13:34:32', 'PC');
INSERT INTO `sys_log` VALUES ('343', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":39,\"username\":\"test1\",\"password\":\"6c19e33a6c7f685dfed4e6456aaa0627b48982a221553c6a89d31bfd7f548db9\",\"salt\":\"o5BSPXvCvpAbIlaK2Bon\",\"email\":\"1@qq.com\",\"mobile\":\"15911111111\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 19, 2018 1:36:56 PM\"}', '208', '0:0:0:0:0:0:0:1', '2018-11-19 13:36:56', 'PC');
INSERT INTO `sys_log` VALUES ('344', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":134}', '265', '0:0:0:0:0:0:0:1', '2018-11-20 10:30:48', 'PC');
INSERT INTO `sys_log` VALUES ('345', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":134,\"departmentName\":\"技术1部\"}', '287', '0:0:0:0:0:0:0:1', '2018-11-20 10:33:31', 'PC');
INSERT INTO `sys_log` VALUES ('346', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":12,\"roleName\":\"zhu\",\"remark\":\"dd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150],\"createTime\":\"Nov 20, 2018 10:35:34 AM\"}', '291', '0:0:0:0:0:0:0:1', '2018-11-20 10:35:34', 'PC');
INSERT INTO `sys_log` VALUES ('347', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":12,\"roleName\":\"zhu\",\"remark\":\"ddd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150,98,116,117,118,119,120,139,140,141,142,143],\"createTime\":\"Nov 20, 2018 10:35:34 AM\"}', '279', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:14', 'PC');
INSERT INTO `sys_log` VALUES ('348', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[12]', '163', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:20', 'PC');
INSERT INTO `sys_log` VALUES ('349', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"password\":\"4fad928a2b32e12ef5c2740de5bd5e1f41c6bf061e7d443758e5e77d6c83ec9e\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":133,\"departmentName\":\"技术1部\"}', '276', '0:0:0:0:0:0:0:1', '2018-11-20 10:37:45', 'PC');
INSERT INTO `sys_log` VALUES ('350', 'admin', '保存角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.save()', '{\"roleId\":13,\"roleName\":\"zhuzhu\",\"remark\":\"ddd\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,135,168,169,170,171,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,132,129,148,149,150,98,116,117,118,119,120,139,140,141,142,143],\"createTime\":\"Nov 20, 2018 10:39:30 AM\"}', '201', '0:0:0:0:0:0:0:1', '2018-11-20 10:39:31', 'PC');
INSERT INTO `sys_log` VALUES ('351', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":41,\"username\":\"dd\",\"password\":\"8694e88f259dd0a62f5e92a72b2ca4e5c532a7d75df4e5d5c4112c96288c6a6e\",\"salt\":\"MnhW2AffWm8xOJjD0dbb\",\"email\":\"aa@qq.com\",\"mobile\":\"18022333333\",\"status\":1,\"roleIdList\":[10,13],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:42:02 AM\",\"departmentId\":133}', '189', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:03', 'PC');
INSERT INTO `sys_log` VALUES ('352', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":41,\"username\":\"dd\",\"salt\":\"MnhW2AffWm8xOJjD0dbb\",\"email\":\"aa@qq.com\",\"mobile\":\"18022333333\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:42:03 AM\",\"departmentId\":133,\"departmentName\":\"技术部\"}', '272', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:45', 'PC');
INSERT INTO `sys_log` VALUES ('353', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[41]', '175', '0:0:0:0:0:0:0:1', '2018-11-20 10:42:51', 'PC');
INSERT INTO `sys_log` VALUES ('354', 'admin', '修改用户', 'com.wzlue.imports.web.controller.sys.SysUserController.update()', '{\"userId\":40,\"username\":\"zhujunwei\",\"salt\":\"OugleDNc8Px6bQpUdDbN\",\"email\":\"aa@qq.com\",\"mobile\":\"18021222222\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Nov 20, 2018 10:30:48 AM\",\"departmentId\":133,\"departmentName\":\"hh\"}', '201', '0:0:0:0:0:0:0:1', '2018-11-20 10:44:50', 'PC');
INSERT INTO `sys_log` VALUES ('355', 'admin', '删除角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.delete()', '[13]', '111', '0:0:0:0:0:0:0:1', '2018-11-20 10:45:18', 'PC');
INSERT INTO `sys_log` VALUES ('356', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '40', '0:0:0:0:0:0:0:1', '2018-11-20 10:49:49', 'PC');
INSERT INTO `sys_log` VALUES ('357', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '56', '0:0:0:0:0:0:0:1', '2018-11-20 10:50:04', 'PC');
INSERT INTO `sys_log` VALUES ('358', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.update()', null, '34', '0:0:0:0:0:0:0:1', '2018-11-20 10:50:51', 'PC');
INSERT INTO `sys_log` VALUES ('359', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.save()', null, '54', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:09', 'PC');
INSERT INTO `sys_log` VALUES ('360', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '139', '123', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:18', 'PC');
INSERT INTO `sys_log` VALUES ('361', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysDeptController.delete()', '138', '123', '0:0:0:0:0:0:0:1', '2018-11-20 10:51:22', 'PC');
INSERT INTO `sys_log` VALUES ('362', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29,95,85,86,87,88,89,90,91,92,93,94,69,70,71,72,73,74,58,76,81,82,83,84,75,77,78,79,80],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '186', '0:0:0:0:0:0:0:1', '2018-11-20 10:53:16', 'PC');
INSERT INTO `sys_log` VALUES ('363', '1', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '205', '260', '0:0:0:0:0:0:0:1', '2018-11-20 16:27:46', 'PC');
INSERT INTO `sys_log` VALUES ('364', 'hjw', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"1\",\"newPassword\":\"1\"}', '43', '0:0:0:0:0:0:0:1', '2018-11-22 09:40:56', 'PC');
INSERT INTO `sys_log` VALUES ('365', 'hjw', '修改密码', 'com.wzlue.imports.web.controller.sys.SysUserController.password()', '{\"password\":\"123456\",\"newPassword\":\"123456\"}', '38', '0:0:0:0:0:0:0:1', '2018-11-22 09:43:01', 'PC');
INSERT INTO `sys_log` VALUES ('366', 'hjw', '暂停定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.pause()', '[2]', '331', '0:0:0:0:0:0:0:1', '2018-11-23 09:54:42', 'PC');
INSERT INTO `sys_log` VALUES ('367', 'hjw', '删除定时任务', 'com.wzlue.imports.web.controller.schedule.ScheduleJobController.delete()', '[2]', '249', '0:0:0:0:0:0:0:1', '2018-11-23 10:03:18', 'PC');
INSERT INTO `sys_log` VALUES ('368', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,30,29],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '290', '0:0:0:0:0:0:0:1', '2018-11-25 13:27:31', 'PC');
INSERT INTO `sys_log` VALUES ('369', 'admin', '修改角色', 'com.wzlue.imports.web.controller.sys.SysRoleController.update()', '{\"roleId\":10,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[128,187,188,189,190,191,192,154,155,156,157,158,136,160,161,162,163,134,133,144,145,146,147,193,194,195,196,197,130,151,152,153,159,182,183,184,185,186,172,173,174,175,176,98,116,117,118,119,120,139,140,141,142,143,108,109,110,111,112,113,121,122,123,124,125,1,31,46,47,48,49,50,51,52,53,54,55,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,199,200,201,202,5,6,7,8,9,10,11,12,13,14,27,29],\"createTime\":\"Nov 8, 2018 4:50:43 PM\"}', '232', '0:0:0:0:0:0:0:1', '2018-12-14 18:58:03', 'PC');
INSERT INTO `sys_log` VALUES ('370', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":199,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"组织架构\",\"url\":\"modules/sys/dept.html\",\"type\":1,\"icon\":\"fa fa-users\",\"orderNum\":3}', '45', '0:0:0:0:0:0:0:1', '2018-12-14 19:01:42', 'PC');
INSERT INTO `sys_log` VALUES ('371', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[39,40,33,29,19,18,17,15,14]', '218', '0:0:0:0:0:0:0:1', '2018-12-24 10:51:40', 'PC');
INSERT INTO `sys_log` VALUES ('372', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[5,4,11]', '63', '0:0:0:0:0:0:0:1', '2018-12-24 10:51:55', 'PC');
INSERT INTO `sys_log` VALUES ('373', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":41,\"username\":\"hanjinwu1\",\"password\":\"24e2e3c9aced9906d4afd248aead83b21fb0f1adcf3ca14f5a9705eea671b530\",\"salt\":\"CBKJvBL8CLOtUpOcDVFy\",\"email\":\"qq@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Dec 24, 2018 10:52:52 AM\"}', '314', '0:0:0:0:0:0:0:1', '2018-12-24 10:52:53', 'PC');
INSERT INTO `sys_log` VALUES ('374', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[41]', '51', '0:0:0:0:0:0:0:1', '2018-12-24 10:52:58', 'PC');
INSERT INTO `sys_log` VALUES ('375', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":17,\"username\":\"wangfang\",\"password\":\"7cbf6253433be8b85be6c2232f9b6d64ab76175dc4ca84318854382ee80b9ed4\",\"salt\":\"hpwCED1racsEgTNsNuV5\",\"email\":\"1576946790@qq.com\",\"mobile\":\"15111111111\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jan 14, 2019 6:49:37 PM\"}', '268', '11.11.11.1', '2019-01-14 18:49:38', 'PC');
INSERT INTO `sys_log` VALUES ('376', 'admin', '保存用户', 'com.wzlue.imports.web.controller.sys.SysUserController.save()', '{\"userId\":18,\"username\":\"wuyan\",\"password\":\"e0dd9bca490df38afaa2cef6740fde12e64319db5a6db6f5aefcb63078cd27df\",\"salt\":\"akoM34UjmDlc1uFV0RUV\",\"email\":\"wuyan@suhangguoji.com\",\"mobile\":\"13776644103\",\"status\":1,\"roleIdList\":[10],\"createUserId\":1,\"createTime\":\"Jan 15, 2019 10:16:46 AM\"}', '147', '11.11.11.1', '2019-01-15 10:16:47', 'PC');
INSERT INTO `sys_log` VALUES ('377', 'hjw', '用户登录', 'com.wzlue.imports.web.controller.sys.SysLoginController.login()', '{\"username\":\"hjw\",\"password\":\"123456\",\"captcha\":\"\"}', '44', '0:0:0:0:0:0:0:1', '2019-01-16 14:37:48', 'PC');
INSERT INTO `sys_log` VALUES ('378', 'hjw', '用户退出', 'com.wzlue.imports.web.controller.sys.SysLoginController.logout()', null, '32', '127.0.0.1', '2019-01-16 14:40:24', 'PC');
INSERT INTO `sys_log` VALUES ('379', 'admin', '删除用户', 'com.wzlue.imports.web.controller.sys.SysUserController.delete()', '[2,16,17,18]', '123', '0:0:0:0:0:0:0:1', '2019-02-13 16:47:50', 'PC');
INSERT INTO `sys_log` VALUES ('380', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '35', '1', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:08', 'PC');
INSERT INTO `sys_log` VALUES ('381', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '36', '2', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:15', 'PC');
INSERT INTO `sys_log` VALUES ('382', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '36', '2', '0:0:0:0:0:0:0:1', '2019-02-13 16:57:45', 'PC');
INSERT INTO `sys_log` VALUES ('383', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '62', '48', '0:0:0:0:0:0:0:1', '2019-02-13 16:58:21', 'PC');
INSERT INTO `sys_log` VALUES ('384', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '134', '34', '0:0:0:0:0:0:0:1', '2019-02-13 16:58:28', 'PC');
INSERT INTO `sys_log` VALUES ('385', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"范围\",\"url\":\"#\",\"perms\":\"#\",\"type\":1,\"orderNum\":0}', '47', '0:0:0:0:0:0:0:1', '2019-02-13 17:26:43', 'PC');
INSERT INTO `sys_log` VALUES ('386', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"orderNum\":0}', '37', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:09', 'PC');
INSERT INTO `sys_log` VALUES ('387', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"商家\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '42', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:29', 'PC');
INSERT INTO `sys_log` VALUES ('388', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"C端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '34', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:50', 'PC');
INSERT INTO `sys_log` VALUES ('389', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"C端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":1}', '34', '0:0:0:0:0:0:0:1', '2019-02-13 17:27:57', 'PC');
INSERT INTO `sys_log` VALUES ('390', 'admin', '删除菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.delete()', '206', '54', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:04', 'PC');
INSERT INTO `sys_log` VALUES ('391', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"orderNum\":0}', '42', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:41', 'PC');
INSERT INTO `sys_log` VALUES ('392', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":208,\"parentName\":\"订单管理\",\"name\":\"订单类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '41', '0:0:0:0:0:0:0:1', '2019-02-13 17:28:56', 'PC');
INSERT INTO `sys_log` VALUES ('393', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单列表\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:09', 'PC');
INSERT INTO `sys_log` VALUES ('394', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":210,\"parentId\":208,\"parentName\":\"订单管理\",\"name\":\"订单列表\",\"url\":\"2\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '33', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:20', 'PC');
INSERT INTO `sys_log` VALUES ('395', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"求助管理\",\"type\":0,\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:40', 'PC');
INSERT INTO `sys_log` VALUES ('396', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"求助类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '31', '0:0:0:0:0:0:0:1', '2019-02-13 17:29:54', 'PC');
INSERT INTO `sys_log` VALUES ('397', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":212,\"parentId\":211,\"parentName\":\"求助管理\",\"name\":\"求助类型\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '22', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:04', 'PC');
INSERT INTO `sys_log` VALUES ('398', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":211,\"parentName\":\"求助管理\",\"name\":\"求助列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '43', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:19', 'PC');
INSERT INTO `sys_log` VALUES ('399', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙管理\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '37', '0:0:0:0:0:0:0:1', '2019-02-13 17:30:42', 'PC');
INSERT INTO `sys_log` VALUES ('400', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":214,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙管理\",\"url\":\"1\",\"perms\":\"1\",\"type\":0,\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:36', 'PC');
INSERT INTO `sys_log` VALUES ('401', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"帮忙列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '62', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:47', 'PC');
INSERT INTO `sys_log` VALUES ('402', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":215,\"parentId\":214,\"parentName\":\"帮忙管理\",\"name\":\"帮忙列表\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:31:55', 'PC');
INSERT INTO `sys_log` VALUES ('403', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":205,\"parentId\":204,\"parentName\":\"用户管理\",\"name\":\"B端\",\"url\":\"@\",\"perms\":\"2\",\"type\":1,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:15', 'PC');
INSERT INTO `sys_log` VALUES ('404', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户资料\",\"type\":0,\"orderNum\":0}', '38', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:43', 'PC');
INSERT INTO `sys_log` VALUES ('405', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"积分\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '28', '0:0:0:0:0:0:0:1', '2019-02-13 17:32:54', 'PC');
INSERT INTO `sys_log` VALUES ('406', 'admin', '修改菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.update()', '{\"menuId\":217,\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"积分\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '32', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:01', 'PC');
INSERT INTO `sys_log` VALUES ('407', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"投诉管理\",\"type\":0,\"orderNum\":0}', '36', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:44', 'PC');
INSERT INTO `sys_log` VALUES ('408', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"评价管理\",\"type\":0,\"orderNum\":0}', '39', '0:0:0:0:0:0:0:1', '2019-02-13 17:33:54', 'PC');
INSERT INTO `sys_log` VALUES ('409', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"留言管理\",\"type\":0,\"orderNum\":0}', '27', '0:0:0:0:0:0:0:1', '2019-02-13 17:34:11', 'PC');
INSERT INTO `sys_log` VALUES ('410', 'admin', '保存菜单', 'com.wzlue.imports.web.controller.sys.SysMenuController.save()', '{\"parentId\":216,\"parentName\":\"用户资料\",\"name\":\"用户属性\",\"url\":\"1\",\"perms\":\"1\",\"type\":1,\"orderNum\":0}', '29', '0:0:0:0:0:0:0:1', '2019-02-13 17:35:19', 'PC');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '7');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '代码生成', 'modules/generator/generator.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '1', '数据字典表', 'modules/sys/dict.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '详情', null, 'sys:dict:list,sys:dict:info', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('48', '46', '新增', null, 'sys:dict:save', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('49', '46', '修改', null, 'sys:dict:update', '2', null, '3');
INSERT INTO `sys_menu` VALUES ('50', '46', '删除', null, 'sys:dict:delete', '2', null, '4');
INSERT INTO `sys_menu` VALUES ('51', '1', '编码规则', 'modules/sys/numberrule.html', null, '1', 'fa fa-file-code-o', '0');
INSERT INTO `sys_menu` VALUES ('52', '51', '详情', null, 'sys:numberrule:list,sys:numberrule:info', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('53', '51', '新增', null, 'sys:numberrule:save', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('54', '51', '修改', null, 'sys:numberrule:update', '2', null, '3');
INSERT INTO `sys_menu` VALUES ('55', '51', '删除', null, 'sys:numberrule:delete', '2', null, '4');
INSERT INTO `sys_menu` VALUES ('203', '0', '范围', '#', '#', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('204', '0', '用户管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('205', '204', 'B端', '@', '2', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('207', '204', 'C端', '@', '2', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('208', '0', '订单管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('209', '208', '订单类型', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('210', '208', '订单列表', '2', '2', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('211', '0', '求助管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('212', '211', '求助类型', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('213', '211', '求助列表', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('214', '0', '帮忙管理', '1', '1', '0', null, '0');
INSERT INTO `sys_menu` VALUES ('215', '214', '帮忙列表', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('216', '0', '用户资料', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('217', '216', '积分', '1', '1', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('218', '0', '投诉管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('219', '0', '评价管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('220', '0', '留言管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('221', '216', '用户属性', '1', '1', '1', null, '0');

-- ----------------------------
-- Table structure for sys_number_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_number_rule`;
CREATE TABLE `sys_number_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '编号类型：',
  `name` varchar(20) DEFAULT NULL COMMENT '规则名称',
  `prefix` varchar(20) DEFAULT NULL COMMENT '前缀',
  `time_type` varchar(20) DEFAULT NULL COMMENT '日期类型',
  `length` int(10) DEFAULT NULL COMMENT '流水长度',
  `sample` varchar(50) DEFAULT NULL COMMENT '示例',
  `status` varchar(255) DEFAULT NULL COMMENT '状态：0 关闭 1 开启',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改日期',
  `num_count` int(11) DEFAULT '0' COMMENT '此规则对应长度后缀的生成的数字时多少',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='编码规则';

-- ----------------------------
-- Records of sys_number_rule
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('10', '系统管理员', '系统管理员', '1', '2018-11-08 16:50:43');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5244 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('5136', '10', '128');
INSERT INTO `sys_role_menu` VALUES ('5137', '10', '187');
INSERT INTO `sys_role_menu` VALUES ('5138', '10', '188');
INSERT INTO `sys_role_menu` VALUES ('5139', '10', '189');
INSERT INTO `sys_role_menu` VALUES ('5140', '10', '190');
INSERT INTO `sys_role_menu` VALUES ('5141', '10', '191');
INSERT INTO `sys_role_menu` VALUES ('5142', '10', '192');
INSERT INTO `sys_role_menu` VALUES ('5143', '10', '154');
INSERT INTO `sys_role_menu` VALUES ('5144', '10', '155');
INSERT INTO `sys_role_menu` VALUES ('5145', '10', '156');
INSERT INTO `sys_role_menu` VALUES ('5146', '10', '157');
INSERT INTO `sys_role_menu` VALUES ('5147', '10', '158');
INSERT INTO `sys_role_menu` VALUES ('5148', '10', '136');
INSERT INTO `sys_role_menu` VALUES ('5149', '10', '160');
INSERT INTO `sys_role_menu` VALUES ('5150', '10', '161');
INSERT INTO `sys_role_menu` VALUES ('5151', '10', '162');
INSERT INTO `sys_role_menu` VALUES ('5152', '10', '163');
INSERT INTO `sys_role_menu` VALUES ('5154', '10', '133');
INSERT INTO `sys_role_menu` VALUES ('5155', '10', '144');
INSERT INTO `sys_role_menu` VALUES ('5156', '10', '145');
INSERT INTO `sys_role_menu` VALUES ('5157', '10', '146');
INSERT INTO `sys_role_menu` VALUES ('5158', '10', '147');
INSERT INTO `sys_role_menu` VALUES ('5159', '10', '193');
INSERT INTO `sys_role_menu` VALUES ('5160', '10', '194');
INSERT INTO `sys_role_menu` VALUES ('5161', '10', '195');
INSERT INTO `sys_role_menu` VALUES ('5162', '10', '196');
INSERT INTO `sys_role_menu` VALUES ('5163', '10', '197');
INSERT INTO `sys_role_menu` VALUES ('5164', '10', '130');
INSERT INTO `sys_role_menu` VALUES ('5165', '10', '151');
INSERT INTO `sys_role_menu` VALUES ('5166', '10', '152');
INSERT INTO `sys_role_menu` VALUES ('5167', '10', '153');
INSERT INTO `sys_role_menu` VALUES ('5168', '10', '159');
INSERT INTO `sys_role_menu` VALUES ('5169', '10', '182');
INSERT INTO `sys_role_menu` VALUES ('5170', '10', '183');
INSERT INTO `sys_role_menu` VALUES ('5171', '10', '184');
INSERT INTO `sys_role_menu` VALUES ('5172', '10', '185');
INSERT INTO `sys_role_menu` VALUES ('5173', '10', '186');
INSERT INTO `sys_role_menu` VALUES ('5174', '10', '172');
INSERT INTO `sys_role_menu` VALUES ('5175', '10', '173');
INSERT INTO `sys_role_menu` VALUES ('5176', '10', '174');
INSERT INTO `sys_role_menu` VALUES ('5177', '10', '175');
INSERT INTO `sys_role_menu` VALUES ('5178', '10', '176');
INSERT INTO `sys_role_menu` VALUES ('5179', '10', '98');
INSERT INTO `sys_role_menu` VALUES ('5180', '10', '116');
INSERT INTO `sys_role_menu` VALUES ('5181', '10', '117');
INSERT INTO `sys_role_menu` VALUES ('5182', '10', '118');
INSERT INTO `sys_role_menu` VALUES ('5183', '10', '119');
INSERT INTO `sys_role_menu` VALUES ('5184', '10', '120');
INSERT INTO `sys_role_menu` VALUES ('5185', '10', '139');
INSERT INTO `sys_role_menu` VALUES ('5186', '10', '140');
INSERT INTO `sys_role_menu` VALUES ('5187', '10', '141');
INSERT INTO `sys_role_menu` VALUES ('5188', '10', '142');
INSERT INTO `sys_role_menu` VALUES ('5189', '10', '143');
INSERT INTO `sys_role_menu` VALUES ('5190', '10', '108');
INSERT INTO `sys_role_menu` VALUES ('5191', '10', '109');
INSERT INTO `sys_role_menu` VALUES ('5192', '10', '110');
INSERT INTO `sys_role_menu` VALUES ('5193', '10', '111');
INSERT INTO `sys_role_menu` VALUES ('5194', '10', '112');
INSERT INTO `sys_role_menu` VALUES ('5195', '10', '113');
INSERT INTO `sys_role_menu` VALUES ('5196', '10', '121');
INSERT INTO `sys_role_menu` VALUES ('5197', '10', '122');
INSERT INTO `sys_role_menu` VALUES ('5198', '10', '123');
INSERT INTO `sys_role_menu` VALUES ('5199', '10', '124');
INSERT INTO `sys_role_menu` VALUES ('5200', '10', '125');
INSERT INTO `sys_role_menu` VALUES ('5201', '10', '1');
INSERT INTO `sys_role_menu` VALUES ('5202', '10', '31');
INSERT INTO `sys_role_menu` VALUES ('5203', '10', '46');
INSERT INTO `sys_role_menu` VALUES ('5204', '10', '47');
INSERT INTO `sys_role_menu` VALUES ('5205', '10', '48');
INSERT INTO `sys_role_menu` VALUES ('5206', '10', '49');
INSERT INTO `sys_role_menu` VALUES ('5207', '10', '50');
INSERT INTO `sys_role_menu` VALUES ('5208', '10', '51');
INSERT INTO `sys_role_menu` VALUES ('5209', '10', '52');
INSERT INTO `sys_role_menu` VALUES ('5210', '10', '53');
INSERT INTO `sys_role_menu` VALUES ('5211', '10', '54');
INSERT INTO `sys_role_menu` VALUES ('5212', '10', '55');
INSERT INTO `sys_role_menu` VALUES ('5213', '10', '2');
INSERT INTO `sys_role_menu` VALUES ('5214', '10', '15');
INSERT INTO `sys_role_menu` VALUES ('5215', '10', '16');
INSERT INTO `sys_role_menu` VALUES ('5216', '10', '17');
INSERT INTO `sys_role_menu` VALUES ('5217', '10', '18');
INSERT INTO `sys_role_menu` VALUES ('5218', '10', '3');
INSERT INTO `sys_role_menu` VALUES ('5219', '10', '19');
INSERT INTO `sys_role_menu` VALUES ('5220', '10', '20');
INSERT INTO `sys_role_menu` VALUES ('5221', '10', '21');
INSERT INTO `sys_role_menu` VALUES ('5222', '10', '22');
INSERT INTO `sys_role_menu` VALUES ('5223', '10', '4');
INSERT INTO `sys_role_menu` VALUES ('5224', '10', '23');
INSERT INTO `sys_role_menu` VALUES ('5225', '10', '24');
INSERT INTO `sys_role_menu` VALUES ('5226', '10', '25');
INSERT INTO `sys_role_menu` VALUES ('5227', '10', '26');
INSERT INTO `sys_role_menu` VALUES ('5228', '10', '199');
INSERT INTO `sys_role_menu` VALUES ('5229', '10', '200');
INSERT INTO `sys_role_menu` VALUES ('5230', '10', '201');
INSERT INTO `sys_role_menu` VALUES ('5231', '10', '202');
INSERT INTO `sys_role_menu` VALUES ('5232', '10', '5');
INSERT INTO `sys_role_menu` VALUES ('5233', '10', '6');
INSERT INTO `sys_role_menu` VALUES ('5234', '10', '7');
INSERT INTO `sys_role_menu` VALUES ('5235', '10', '8');
INSERT INTO `sys_role_menu` VALUES ('5236', '10', '9');
INSERT INTO `sys_role_menu` VALUES ('5237', '10', '10');
INSERT INTO `sys_role_menu` VALUES ('5238', '10', '11');
INSERT INTO `sys_role_menu` VALUES ('5239', '10', '12');
INSERT INTO `sys_role_menu` VALUES ('5240', '10', '13');
INSERT INTO `sys_role_menu` VALUES ('5241', '10', '14');
INSERT INTO `sys_role_menu` VALUES ('5242', '10', '27');
INSERT INTO `sys_role_menu` VALUES ('5243', '10', '29');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `department_id` bigint(20) DEFAULT NULL COMMENT '所属部门id',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11', '135');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'd4a29b9b2dcf3cb1174548e7ff25f483', '2019-02-14 05:07:01', '2019-02-13 17:07:01');
INSERT INTO `sys_user_token` VALUES ('2', '2355064fb478b41ae038f0cf2f40d68e', '2019-02-12 22:18:55', '2019-02-12 10:18:55');
INSERT INTO `sys_user_token` VALUES ('4', '753679b3868b02f522a4932f0b9c084e', '2018-11-12 21:24:18', '2018-11-12 09:24:18');
INSERT INTO `sys_user_token` VALUES ('5', '4d023b9cc346852e6b5223ea1a01b764', '2018-11-14 02:56:14', '2018-11-13 14:56:14');
INSERT INTO `sys_user_token` VALUES ('6', 'dfdf8356ed55401d493317a6f0d272af', '2018-11-09 23:08:52', '2018-11-09 11:08:52');
INSERT INTO `sys_user_token` VALUES ('11', 'e2ae6db1795eae0d0ed2167399419c11', '2018-12-15 06:33:17', '2018-12-14 18:33:17');
INSERT INTO `sys_user_token` VALUES ('14', '06f5b8a60f588fece8f566c7988d5ab2', '2018-10-12 22:34:31', '2018-10-12 10:34:31');
INSERT INTO `sys_user_token` VALUES ('15', '4e1206160b690e3ec65dcfb31b30d3f8', '2018-08-10 02:47:14', '2018-08-09 14:47:14');
INSERT INTO `sys_user_token` VALUES ('16', 'c1890df38d6bb4cf83c46b9c19bc4af2', '2018-12-13 07:02:02', '2018-12-12 19:02:02');
INSERT INTO `sys_user_token` VALUES ('17', 'f00e2f538e1f054f3a6e4c023bf86cd9', '2019-02-12 21:38:39', '2019-02-12 09:38:39');
INSERT INTO `sys_user_token` VALUES ('18', '36ff55e3abfab4d4cc40e54b890a01c6', '2019-02-12 21:42:52', '2019-02-12 09:42:52');
INSERT INTO `sys_user_token` VALUES ('19', '98d822de073513501273bb936dde8ad4', '2018-11-19 22:11:02', '2018-11-19 10:11:02');
INSERT INTO `sys_user_token` VALUES ('29', 'd9ed05313cade1652c40652a92885839', '2018-11-17 05:36:18', '2018-11-16 17:36:18');
INSERT INTO `sys_user_token` VALUES ('32', '1fdd7eade55118b3c96fec688edc5e48', '2018-11-09 23:10:32', '2018-11-09 11:10:32');
INSERT INTO `sys_user_token` VALUES ('33', '1a2c5759033ed9b35881c7b0a67951a4', '2018-11-15 01:35:50', '2018-11-14 13:35:50');
INSERT INTO `sys_user_token` VALUES ('38', 'c70e7f9abd2bd08b63d94a56dad856cd', '2018-11-20 01:33:41', '2018-11-19 13:33:41');
INSERT INTO `sys_user_token` VALUES ('39', 'a3bf113ffc040a8cb8e79a2eecded318', '2018-11-20 01:37:05', '2018-11-19 13:37:05');
INSERT INTO `sys_user_token` VALUES ('40', 'e2554949f43f0a5465ac520d11cb01db', '2018-11-27 05:24:25', '2018-11-26 17:24:25');

-- ----------------------------
-- View structure for v
-- ----------------------------
DROP VIEW IF EXISTS `v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v` AS select `i`.`guid` AS `guid`,`i`.`batch_code` AS `batch_code`,`i`.`app_type` AS `app_type`,`i`.`app_time` AS `app_time`,`i`.`app_status` AS `app_status`,`i`.`return_status` AS `return_status`,`i`.`customs_code` AS `customs_code`,`i`.`ebp_code` AS `ebp_code`,`i`.`ebp_name` AS `ebp_name`,`i`.`order_no` AS `order_no`,`i`.`logistics_code` AS `logistics_code`,`i`.`logistics_name` AS `logistics_name`,`i`.`logistics_no` AS `logistics_no`,`i`.`cop_no` AS `cop_no`,`i`.`pre_no` AS `pre_no`,`i`.`invt_no` AS `invt_no`,`i`.`ie_flag` AS `ie_flag`,`i`.`port_code` AS `port_code`,`i`.`ie_date` AS `ie_date`,`i`.`statistics_flag` AS `statistics_flag`,`i`.`agent_code` AS `agent_code`,`i`.`agent_name` AS `agent_name`,`i`.`ebc_code` AS `ebc_code`,`i`.`ebc_name` AS `ebc_name`,`i`.`owner_code` AS `owner_code`,`i`.`owner_name` AS `owner_name`,`i`.`iac_code` AS `iac_code`,`i`.`iac_name` AS `iac_name`,`i`.`ems_no` AS `ems_no`,`i`.`trade_mode` AS `trade_mode`,`i`.`traf_mode` AS `traf_mode`,`i`.`traf_name` AS `traf_name`,`i`.`voyage_no` AS `voyage_no`,`i`.`bill_no` AS `bill_no`,`i`.`total_package_no` AS `total_package_no`,`i`.`loct_no` AS `loct_no`,`i`.`license_no` AS `license_no`,`i`.`country` AS `country`,`i`.`POD` AS `POD`,`i`.`freight` AS `freight`,`i`.`f_currency` AS `f_currency`,`i`.`f_flag` AS `f_flag`,`i`.`insured_fee` AS `insured_fee`,`i`.`i_currency` AS `i_currency`,`i`.`i_flag` AS `i_flag`,`i`.`wrap_type` AS `wrap_type`,`i`.`pack_no` AS `pack_no`,`i`.`gross_weight` AS `gross_weight`,`i`.`net_weight` AS `net_weight`,`i`.`note` AS `note`,`i`.`create_by` AS `create_by`,`i`.`create_time` AS `create_time`,`i`.`ishz` AS `ishz`,`i`.`consignee` AS `consignee`,`i`.`consignee_address` AS `consignee_address`,`i`.`consignee_telephone` AS `consignee_telephone`,`i`.`consignee_country_code` AS `consignee_country_code`,`i`.`consignee_zip_code` AS `consignee_zip_code`,`i`.`buyerId_number` AS `buyerId_number`,`i`.`addresser_address` AS `addresser_address`,`i`.`addresser_telephone` AS `addresser_telephone`,`i`.`addresser_country_code` AS `addresser_country_code`,`i`.`addresser_name` AS `addresser_name`,`i`.`buyer_reg_no` AS `buyer_reg_no`,`i`.`consignee_ditrict` AS `consignee_ditrict`,`g`.`item_name` AS `item_name`,`g`.`item_no` AS `item_no`,`g`.`gcode` AS `gcode`,`g`.`qty` AS `qty`,`g`.`qty1` AS `qty1`,`g`.`unit` AS `unit`,`g`.`unit1` AS `unit1`,`g`.`unit2` AS `unit2`,`g`.`qty2` AS `qty2`,`g`.`gmodel` AS `gmodel`,`g`.`barCode` AS `barCode`,`g`.`price` AS `price`,`g`.`total_price` AS `total_price`,(select `imports`.`way_bill`.`goods_info` from `way_bill` where (`imports`.`way_bill`.`logistics_no` = `i`.`logistics_no`)) AS `goods_info`,(select sum(`imports`.`customs_inventory_goods`.`total_price`) from `customs_inventory_goods` where (`imports`.`customs_inventory_goods`.`guid` = `i`.`guid`)) AS `goods_price`,(select count(`imports`.`customs_inventory_goods`.`total_price`) from `customs_inventory_goods` where (`imports`.`customs_inventory_goods`.`guid` = `i`.`guid`)) AS `goods_count`,(select `imports`.`sys_dict`.`name` from `sys_dict` where ((`imports`.`sys_dict`.`type` = '币制代码表') and (`imports`.`sys_dict`.`customs` = `g`.`currency`)) limit 1) AS `currency`,(select `imports`.`sys_dict`.`name` from `sys_dict` where ((`imports`.`sys_dict`.`type` = '币制代码表') and (`imports`.`sys_dict`.`customs` = `i`.`f_currency`)) limit 1) AS `f_currency_name`,(select `imports`.`sys_dict`.`name` from `sys_dict` where ((`imports`.`sys_dict`.`type` = '包装种类代码表') and (`imports`.`sys_dict`.`customs` = `i`.`wrap_type`)) limit 1) AS `wrap_type_name`,(select `imports`.`sys_dict`.`name` from `sys_dict` where ((`imports`.`sys_dict`.`type` = '关区代码表') and (`imports`.`sys_dict`.`code` = `i`.`port_code`)) limit 1) AS `port_code_name` from (`customs_inventory` `i` left join `customs_inventory_goods` `g` on((`g`.`guid` = `i`.`guid`))) ;

-- ----------------------------
-- Procedure structure for checkBatchCodeAndE
-- ----------------------------
DROP PROCEDURE IF EXISTS `checkBatchCodeAndE`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkBatchCodeAndE`(IN batchCode VARCHAR (50))
BEGIN
	declare flag int DEFAULT 0;
	declare count int DEFAULT 0;
	SELECT count(1) INTO flag FROM customs_order WHERE batch_code = batchCode;
	set count=flag+count;
	SELECT count(1) INTO flag FROM customs_receipts WHERE batch_code = batchCode;
	set count=flag+count;
	SELECT count(1) INTO flag FROM way_bill WHERE batch_code = batchCode;
	set count=flag+count;
	SELECT count(1) INTO flag FROM customs_departure WHERE batch_code = batchCode;
	set count=flag+count;
	SELECT count(1) INTO flag FROM customs_inventory WHERE batch_code = batchCode;
	set count=flag+count;
	select count;
END
;;
DELIMITER ;
