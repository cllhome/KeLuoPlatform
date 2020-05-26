CREATE DATABASE  IF NOT EXISTS `keluo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `keluo`;
-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: keluo
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dict_department`
--

DROP TABLE IF EXISTS `dict_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_department` (
  `code` varchar(45) NOT NULL COMMENT '科室代码',
  `name` varchar(100) NOT NULL COMMENT '科室名称',
  `PYCode` varchar(100) NOT NULL COMMENT '拼音代码',
  `isEnabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效标志',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='科室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict_durg`
--

DROP TABLE IF EXISTS `dict_durg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_durg` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `code` varchar(50) NOT NULL COMMENT '药品代码',
  `name` varchar(100) NOT NULL COMMENT '药品名称',
  `miniSpec` varchar(50) NOT NULL COMMENT '最小不可拆分包装规格：ml、mg 等',
  `miniUnit` varchar(50) NOT NULL COMMENT '最小不可拆分包装单位：片、粒、支等',
  `miniDose` double DEFAULT '1' COMMENT '最小包装规格所含剂量',
  `doseUnit` varchar(50) DEFAULT NULL COMMENT '最小包装规格所含剂量单位',
  `packageSpec` varchar(45) NOT NULL COMMENT '零售包装规格：2mg x 100、1mg/板 x 2 等',
  `packageUnit` varchar(45) NOT NULL COMMENT '零售包装单位：盒、瓶等',
  `packageRatio` double NOT NULL DEFAULT '1' COMMENT '零售包装拆零为最小包装的转换系数',
  `drugClass` varchar(45) DEFAULT NULL COMMENT '药品类别: 西药、中药、草药等',
  `drugForm` varchar(45) DEFAULT NULL COMMENT '药品剂型：片剂、针剂、胶囊等',
  `drugAttribute` varchar(45) DEFAULT NULL COMMENT '药品属性：普通、麻醉、精神等',
  `drugProperty` varchar(45) DEFAULT NULL COMMENT '药品性质：口服、外用、注射等',
  `drugRefrigerated` tinyint(4) DEFAULT '0' COMMENT '冷藏药品标志(0: 不冷藏；1: 冷藏)',
  `drugControlled` tinyint(4) DEFAULT '0' COMMENT '管制药品标志(0: 管制；1: 管制)',
  `firmName` varchar(100) NOT NULL COMMENT '厂家',
  `PYCode` varchar(100) NOT NULL COMMENT '药品查询码',
  `supervisionCode` varchar(100) DEFAULT NULL COMMENT '药品监管码',
  `barCode` varchar(45) DEFAULT NULL COMMENT '药品条码',
  `sizeL` int(11) DEFAULT NULL COMMENT '尺寸：长',
  `sizeW` int(11) DEFAULT NULL COMMENT '尺寸：宽',
  `sizeH` int(11) DEFAULT NULL COMMENT '尺寸：高',
  `weight` float DEFAULT NULL COMMENT '重量',
  `isEnabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效标志（0：无效；1：有效）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict_pharmacy`
--

DROP TABLE IF EXISTS `dict_pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_pharmacy` (
  `code` varchar(45) NOT NULL COMMENT '药房代码',
  `name` varchar(100) NOT NULL COMMENT '药房名称',
  `PYCode` varchar(100) NOT NULL COMMENT '拼音代码',
  `isEnabled` tinyint(4) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药房表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict_ward`
--

DROP TABLE IF EXISTS `dict_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_ward` (
  `code` varchar(45) NOT NULL COMMENT '病区代码',
  `name` varchar(100) NOT NULL COMMENT '病区名称',
  `PYCode` varchar(100) NOT NULL COMMENT '拼音代码',
  `isEnabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '有效标志（0:无效；1:有效）',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='病区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inh_order_his`
--

DROP TABLE IF EXISTS `inh_order_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inh_order_his` (
  `orderNo` varchar(45) NOT NULL COMMENT '医嘱处方 号',
  `orderType` varchar(10) DEFAULT '0' COMMENT '医嘱类型: 0-长期，1-临时',
  `inHospitalNo` varchar(45) DEFAULT NULL COMMENT '住院号',
  `patientID` varchar(45) NOT NULL COMMENT '病人唯一 码',
  `patientName` varchar(45) NOT NULL COMMENT '病人名称',
  `patientPYName` varchar(45) DEFAULT NULL COMMENT '病人拼音码',
  `patientGender` varchar(10) DEFAULT NULL COMMENT '病人性别',
  `patientBirth` datetime DEFAULT NULL COMMENT '病人出生日期',
  `patientAge` int(11) DEFAULT NULL COMMENT '病人年龄',
  `identity` varchar(45) DEFAULT NULL COMMENT '病人身份',
  `insuranceType` varchar(45) DEFAULT NULL COMMENT '医保类型',
  `chargeType` varchar(45) DEFAULT NULL COMMENT '收费类别',
  `bedNo` varchar(10) NOT NULL COMMENT '病人住院床位号',
  `deptCode` varchar(20) NOT NULL COMMENT '科室代码',
  `deptName` varchar(45) DEFAULT NULL COMMENT '科室名称',
  `wardCode` varchar(20) NOT NULL COMMENT '病区代码',
  `wardName` varchar(45) DEFAULT NULL COMMENT '病区名称',
  `doctCode` varchar(45) DEFAULT NULL COMMENT '就诊医生代码',
  `doctName` varchar(45) DEFAULT NULL COMMENT '就诊医生名称',
  `diagnosis` varchar(200) DEFAULT NULL COMMENT '临床诊断',
  `drugCode` varchar(45) NOT NULL COMMENT '药品代码',
  `drugName` varchar(80) NOT NULL COMMENT '药品名称',
  `drugSpec` varchar(45) NOT NULL COMMENT '药品规格',
  `firmName` varchar(100) NOT NULL COMMENT '厂家',
  `amount` double NOT NULL COMMENT '单餐药品数量',
  `takeUnit` varchar(20) NOT NULL COMMENT '发药单位',
  `takeMethod` varchar(45) DEFAULT NULL COMMENT '服用类型',
  `takeTime` varchar(45) DEFAULT NULL COMMENT '服用时间： yyyy-MM-dd HH:mi:ss，如果按频次发送医嘱，这里只要日期部分不要时间部分',
  `takeFreq` varchar(45) DEFAULT NULL COMMENT '服用频次',
  `freqCounts` int(11) DEFAULT '1' COMMENT '频次数量',
  `takeDays` int(11) DEFAULT '1' COMMENT '发药天数',
  `takeNote` varchar(100) DEFAULT NULL COMMENT '服用备注说明',
  `orderSort` int(11) DEFAULT NULL COMMENT '处理顺序',
  `pharmacyCode` varchar(45) NOT NULL COMMENT '药房代码',
  `orderDT` datetime NOT NULL COMMENT '医嘱执行时间',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='住院医嘱数据：由HIS 向该表中插入医嘱数据，DIH 只做读取操';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oupt_order_his`
--

DROP TABLE IF EXISTS `oupt_order_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oupt_order_his` (
  `orderNo` varchar(45) NOT NULL,
  `orderType` varchar(45) NOT NULL DEFAULT 'M' COMMENT '处方类型: M-门诊, J-急诊, O-其他',
  `windowNo` int(11) DEFAULT NULL COMMENT '取药窗口号 （由DIH 分配窗口时置0）',
  `outpNo` varchar(45) DEFAULT NULL COMMENT '门诊病历号',
  `visitNo` varchar(45) DEFAULT NULL COMMENT '就诊号',
  `groupNo` varchar(45) DEFAULT NULL COMMENT '患者配药（报到）组号',
  `patientID` varchar(45) NOT NULL COMMENT '病人唯一 码',
  `patientName` varchar(45) NOT NULL COMMENT '病人姓名',
  `patientPYName` varchar(45) DEFAULT NULL COMMENT '病人拼音码',
  `patientGender` varchar(45) DEFAULT NULL COMMENT '病人性别',
  `patientAge` int(11) DEFAULT NULL COMMENT '病人年龄',
  `identity` varchar(45) DEFAULT NULL COMMENT '病人身份',
  `insuranceType` varchar(45) DEFAULT NULL COMMENT '医保类型',
  `chargeType` varchar(45) DEFAULT NULL COMMENT '收费类别',
  `deptCode` varchar(45) DEFAULT NULL COMMENT '就诊科室代码',
  `deptName` varchar(45) DEFAULT NULL COMMENT '就诊科室名称',
  `doctCode` varchar(45) DEFAULT NULL COMMENT '就诊医生代码',
  `doctName` varchar(45) DEFAULT NULL COMMENT '就诊医生名称',
  `diagnosis` varchar(200) DEFAULT NULL COMMENT '临床诊断',
  `drugCode` varchar(45) NOT NULL COMMENT '药品代码',
  `drugName` varchar(100) NOT NULL COMMENT '药品名称',
  `drugSpec` varchar(45) NOT NULL COMMENT '药品规格',
  `firmName` varchar(100) NOT NULL COMMENT '厂家',
  `amount` int(11) NOT NULL COMMENT '药品数量',
  `takeUnit` varchar(45) NOT NULL COMMENT '发药单位',
  `takeMethod` varchar(45) DEFAULT NULL COMMENT '服用方法',
  `takeType` varchar(45) DEFAULT NULL COMMENT '服用类型',
  `takeNote` varchar(100) DEFAULT NULL COMMENT '服用备注说明',
  `orderSort` int(11) NOT NULL COMMENT '处理顺序',
  `pharmacyCode` varchar(45) NOT NULL COMMENT '药房代码',
  `paymentDT` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderNo`,`drugCode`,`orderSort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门诊处方(HIS写，DIH读)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oupt_pharmacy_process`
--

DROP TABLE IF EXISTS `oupt_pharmacy_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oupt_pharmacy_process` (
  `windowNo` varchar(45) NOT NULL COMMENT '窗口号',
  `patientID` varchar(45) NOT NULL COMMENT '患者唯一ID',
  `groupNo` varchar(45) NOT NULL COMMENT '患者配药组号',
  `type` tinyint(4) NOT NULL COMMENT '流程类型（1: 配药完成; 2: 取药通知; 3: 发药完成）',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`windowNo`,`patientID`,`groupNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='门诊配药流程表（配药、取药、取药完成）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oupt_pharmacy_window`
--

DROP TABLE IF EXISTS `oupt_pharmacy_window`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oupt_pharmacy_window` (
  `windowIP` varchar(45) NOT NULL COMMENT '窗口IP地址',
  `windowNo` varchar(45) NOT NULL COMMENT '窗口号',
  `window_status` tinyint(4) DEFAULT NULL COMMENT '窗口状态：1: open-打开、2: close-关闭、3: pause-暂停',
  `window_type` tinyint(4) DEFAULT NULL COMMENT '窗口工作类型：1: direct-直发；2: indirect-预配；3: all-混合',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`windowIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药房发药窗口状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18 16:20:58
