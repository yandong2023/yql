-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: yql
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `yql_about`
--

DROP TABLE IF EXISTS `yql_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_about` (
  `aboutid` int(10) NOT NULL AUTO_INCREMENT,
  `about` text NOT NULL,
  `verstion` varchar(20) NOT NULL,
  PRIMARY KEY (`aboutid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_about`
--

LOCK TABLES `yql_about` WRITE;
/*!40000 ALTER TABLE `yql_about` DISABLE KEYS */;
INSERT INTO `yql_about` VALUES (1,'关于一起来','1.0版本');
/*!40000 ALTER TABLE `yql_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_activity`
--

DROP TABLE IF EXISTS `yql_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_activity` (
  `activityid` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `categoryid` int(11) NOT NULL COMMENT '分类',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `starttime` int(30) NOT NULL COMMENT '开始时间',
  `endtime` int(30) NOT NULL COMMENT '结束时间',
  `content` text NOT NULL COMMENT '内容',
  `phone` int(11) DEFAULT NULL COMMENT '手机',
  `provinceid` varchar(20) NOT NULL COMMENT '省',
  `cityid` varchar(20) NOT NULL COMMENT '市',
  `areaid` varchar(20) NOT NULL COMMENT '区/县',
  `cost` float(10,2) DEFAULT NULL COMMENT '花费',
  `createtime` varchar(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `type` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activityid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_activity`
--

LOCK TABLES `yql_activity` WRITE;
/*!40000 ALTER TABLE `yql_activity` DISABLE KEYS */;
INSERT INTO `yql_activity` VALUES (1,1,'北京体育学院',121231231,123123123,'一起踢足球，总共找22人，分两队，有奖品。',1239090923,'1','62','',NULL,'',2,0),(2,1,'北京体育学院',121231231,123123123,'一起踢足球，总共找22人，分两队，有奖品。',1239090923,'1','62','',NULL,'',1,0);
/*!40000 ALTER TABLE `yql_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_address`
--

DROP TABLE IF EXISTS `yql_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_address` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `addressname` varchar(20) NOT NULL,
  `parentid` int(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=733 DEFAULT CHARSET=utf8 COMMENT='城市信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_address`
--

LOCK TABLES `yql_address` WRITE;
/*!40000 ALTER TABLE `yql_address` DISABLE KEYS */;
INSERT INTO `yql_address` VALUES (62,'西城区',1),(63,'崇文区',1),(64,'宣武区',1),(65,'朝阳区',1),(66,'丰台区',1),(67,'石景山区',1),(68,'海淀区',1),(69,'门头沟区',1),(70,'房山区',1),(71,'通州区',1),(72,'顺义区',1),(73,'昌平区',1),(74,'大兴区',1),(75,'怀柔区',1),(76,'平谷区',1),(77,'延庆县',1),(78,'密云县',1),(102,'唐山市',5),(103,'秦皇岛市',5),(104,'邯郸市',5),(105,'邢台市',5),(106,'保定市',5),(107,'张家口市',5),(108,'承德市',5),(109,'沧州市',5),(110,'廊坊市',5),(111,'衡水市',5),(122,'大同市',6),(123,'阳泉市',6),(124,'长治市',6),(125,'晋城市',6),(126,'朔州市',6),(127,'晋中市',6),(128,'运城市',6),(129,'忻州市',6),(130,'临汾市',6),(131,'吕梁市',6),(142,'高雄市',7),(143,'基隆市',7),(144,'台中市',7),(145,'台南市',7),(146,'新竹市',7),(147,'嘉义市',7),(148,'台北县',7),(149,'宜兰县',7),(150,'桃园县',7),(151,'新竹县',7),(152,'苗栗县',7),(153,'台中县',7),(154,'彰化县',7),(155,'南投县',7),(156,'云林县',7),(157,'嘉义县',7),(158,'台南县',7),(159,'高雄县',7),(160,'屏东县',7),(161,'澎湖县',7),(162,'台东县',7),(163,'花莲县',7),(182,'大连市',8),(183,'鞍山市',8),(184,'抚顺市',8),(185,'本溪市',8),(186,'丹东市',8),(187,'锦州市',8),(188,'营口市',8),(189,'阜新市',8),(190,'辽阳市',8),(191,'盘锦市',8),(192,'铁岭市',8),(193,'朝阳市',8),(194,'葫芦岛市',8),(202,'吉林市',9),(203,'四平市',9),(204,'辽源市',9),(205,'通化市',9),(206,'白山市',9),(207,'松原市',9),(208,'白城市',9),(209,'延边朝鲜族自治州',9),(222,'齐齐哈尔市',10),(223,'鹤 岗 市',10),(224,'双鸭山市',10),(225,'鸡 西 市',10),(226,'大 庆 市',10),(227,'伊 春 市',10),(228,'牡丹江市',10),(229,'佳木斯市',10),(230,'七台河市',10),(231,'黑 河 市',10),(232,'绥 化 市',10),(233,'大兴安岭地区',10),(242,'无锡市',11),(243,'徐州市',11),(244,'常州市',11),(245,'苏州市',11),(246,'南通市',11),(247,'连云港市',11),(248,'淮安市',11),(249,'盐城市',11),(250,'扬州市',11),(251,'镇江市',11),(252,'泰州市',11),(253,'宿迁市',11),(282,'宁波市',12),(283,'温州市',12),(284,'嘉兴市',12),(285,'湖州市',12),(286,'绍兴市',12),(287,'金华市',12),(288,'衢州市',12),(289,'舟山市',12),(290,'台州市',12),(291,'丽水市',12),(302,'芜湖市',13),(303,'蚌埠市',13),(304,'淮南市',13),(305,'马鞍山市',13),(306,'淮北市',13),(307,'铜陵市',13),(308,'安庆市',13),(309,'黄山市',13),(310,'滁州市',13),(311,'阜阳市',13),(312,'宿州市',13),(313,'巢湖市',13),(314,'六安市',13),(315,'亳州市',13),(316,'池州市',13),(317,'宣城市',13),(322,'厦门市',14),(323,'莆田市',14),(324,'三明市',14),(325,'泉州市',14),(326,'漳州市',14),(327,'南平市',14),(328,'龙岩市',14),(329,'宁德市',14),(342,'景德镇市',15),(343,'萍乡市',15),(344,'九江市',15),(345,'新余市',15),(346,'鹰潭市',15),(347,'赣州市',15),(348,'吉安市',15),(349,'宜春市',15),(350,'抚州市',15),(351,'上饶市',15),(362,'青岛市',16),(363,'淄博市',16),(364,'枣庄市',16),(365,'东营市',16),(366,'烟台市',16),(367,'潍坊市',16),(368,'济宁市',16),(369,'泰安市',16),(370,'威海市',16),(371,'日照市',16),(372,'莱芜市',16),(373,'临沂市',16),(374,'德州市',16),(375,'聊城市',16),(376,'滨州市',16),(377,'菏泽市',16),(402,'开封市',17),(403,'洛阳市',17),(404,'平顶山市',17),(405,'安阳市',17),(406,'鹤壁市',17),(407,'新乡市',17),(408,'焦作市',17),(409,'濮阳市',17),(410,'许昌市',17),(411,'漯河市',17),(412,'三门峡市',17),(413,'南阳市',17),(414,'商丘市',17),(415,'信阳市',17),(416,'周口市',17),(417,'驻马店市',17),(418,'济源市',17),(422,'黄石市',18),(423,'十堰市',18),(424,'荆州市',18),(425,'宜昌市',18),(426,'襄樊市',18),(427,'鄂州市',18),(428,'荆门市',18),(429,'孝感市',18),(430,'黄冈市',18),(431,'咸宁市',18),(432,'随州市',18),(433,'仙桃市',18),(434,'天门市',18),(435,'潜江市',18),(436,'神农架林区',18),(437,'恩施土家族苗族自治州',18),(442,'株洲市',19),(443,'湘潭市',19),(444,'衡阳市',19),(445,'邵阳市',19),(446,'岳阳市',19),(447,'常德市',19),(448,'张家界市',19),(449,'益阳市',19),(450,'郴州市',19),(451,'永州市',19),(452,'怀化市',19),(453,'娄底市',19),(454,'湘西土家族苗族自治州',1),(456,'深圳市',20),(457,'珠海市',20),(458,'汕头市',20),(459,'韶关市',20),(460,'佛山市',20),(461,'江门市',20),(462,'湛江市',20),(463,'茂名市',20),(464,'肇庆市',20),(465,'惠州市',20),(466,'梅州市',20),(467,'汕尾市',20),(468,'河源市',20),(469,'阳江市',20),(470,'清远市',20),(485,'东莞市',20),(486,'中山市',20),(487,'潮州市',20),(488,'揭阳市',20),(489,'云浮市',20),(472,'金昌市',21),(473,'白银市',21),(474,'天水市',21),(475,'嘉峪关市',21),(476,'武威市',21),(477,'张掖市',21),(478,'平凉市',21),(479,'酒泉市',21),(480,'庆阳市',21),(481,'定西市',21),(482,'陇南市',21),(483,'临夏回族自治州',21),(484,'甘南藏族自治州',21),(492,'自贡市',22),(493,'攀枝花市',22),(494,'泸州市',22),(495,'德阳市',22),(496,'绵阳市',22),(497,'广元市',22),(498,'遂宁市',22),(499,'内江市',22),(500,'乐山市',22),(501,'南充市',22),(502,'眉山市',22),(503,'宜宾市',22),(504,'广安市',22),(505,'达州市',22),(506,'雅安市',22),(507,'巴中市',22),(508,'资阳市',22),(509,'阿坝藏族羌族自治州',22),(510,'甘孜藏族自治州',22),(511,'凉山彝族自治州',22),(521,'贵阳市',23),(522,'六盘水市',23),(523,'遵义市',23),(524,'安顺市',23),(525,'铜仁地区',23),(526,'毕节地区',23),(527,'黔西南布依族苗族自治州',23),(528,'黔东南苗族侗族自治州',23),(529,'黔南布依族苗族自治州',23),(541,'海口市',24),(542,'三亚市',24),(543,'五指山市',24),(544,'琼海市',24),(545,'儋州市',24),(546,'文昌市',24),(547,'万宁市',24),(548,'东方市',24),(549,'澄迈县',24),(550,'定安县',24),(551,'屯昌县',24),(552,'临高县',24),(553,'白沙黎族自治县',24),(554,'昌江黎族自治县',24),(555,'乐东黎族自治县',24),(556,'陵水黎族自治县',24),(557,'保亭黎族苗族自治县',24),(558,'琼中黎族苗族自治县',24),(571,'昆明市',25),(572,'曲靖市',25),(573,'玉溪市',25),(574,'保山市',25),(575,'昭通市',25),(576,'丽江市',25),(577,'思茅市',25),(578,'临沧市',25),(579,'文山壮族苗族自治州',25),(580,'红河哈尼族彝族自治州',25),(581,'西双版纳傣族自治州',25),(582,'楚雄彝族自治州',25),(583,'大理白族自治州',25),(584,'德宏傣族景颇族自治州',25),(585,'怒江傈傈族自治州',25),(586,'迪庆藏族自治州',25),(601,'西宁市',26),(602,'海东地区',26),(603,'海北藏族自治州',26),(604,'黄南藏族自治州',26),(605,'海南藏族自治州',26),(606,'果洛藏族自治州',26),(607,'玉树藏族自治州',26),(608,'海西蒙古族藏族自治州',26),(621,'西安市',27),(622,'铜川市',27),(623,'宝鸡市',27),(624,'咸阳市',27),(625,'渭南市',27),(626,'延安市',27),(627,'汉中市',27),(628,'榆林市',27),(629,'安康市',27),(630,'商洛市',27),(641,'南宁市',28),(642,'柳州市',28),(643,'桂林市',28),(644,'梧州市',28),(645,'北海市',28),(646,'防城港市',28),(647,'钦州市',28),(648,'贵港市',28),(649,'玉林市',28),(650,'百色市',28),(651,'贺州市',28),(652,'河池市',28),(653,'来宾市',28),(654,'崇左市',28),(671,'拉萨市',29),(672,'那曲地区',29),(673,'昌都地区',29),(674,'山南地区',29),(675,'日喀则地区',29),(676,'阿里地区',29),(677,'林芝地区',29),(681,'银川市',30),(682,'石嘴山市',30),(683,'吴忠市',30),(684,'固原市',30),(685,'中卫市',30),(691,'乌鲁木齐市',31),(692,'克拉玛依市',31),(693,'石河子市　',31),(694,'阿拉尔市',31),(695,'图木舒克市',31),(696,'五家渠市',31),(697,'吐鲁番市',31),(698,'阿克苏市',31),(699,'喀什市',31),(700,'哈密市',31),(701,'和田市',31),(702,'阿图什市',31),(703,'库尔勒市',31),(704,'昌吉市　',31),(705,'阜康市',31),(706,'米泉市',31),(707,'博乐市',31),(708,'伊宁市',31),(709,'奎屯市',31),(710,'塔城市',31),(711,'乌苏市',31),(712,'阿勒泰市',31),(721,'呼和浩特市',32),(722,'包头市',32),(723,'乌海市',32),(724,'赤峰市',32),(725,'通辽市',32),(726,'鄂尔多斯市',32),(727,'呼伦贝尔市',32),(728,'巴彦淖尔市',32),(729,'乌兰察布市',32),(730,'锡林郭勒盟',32),(731,'兴安盟',32),(732,'阿拉善盟',32),(1,'北京市',0),(2,'天津市',0),(3,'上海市',0),(4,'重庆市',0),(5,'河北省',0),(6,'山西省',0),(7,'台湾省',0),(8,'辽宁省',0),(9,'吉林省',0),(10,'黑龙江省',0),(11,'江苏省',0),(12,'浙江省',0),(13,'安徽省',0),(14,'福建省',0),(15,'江西省',0),(16,'山东省',0),(17,'河南省',0),(18,'湖北省',0),(19,'湖南省',0),(20,'广东省',0),(21,'甘肃省',0),(22,'四川省',0),(23,'贵州省',0),(24,'海南省',0),(25,'云南省',0),(26,'青海省',0),(27,'陕西省',0),(28,'广西壮族自治区',0),(29,'西藏自治区',0),(30,'宁夏回族自治区',0),(31,'新疆维吾尔自治区',0),(32,'内蒙古自治区',0),(33,'澳门特别行政区',0),(34,'香港特别行政区',0);
/*!40000 ALTER TABLE `yql_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_category`
--

DROP TABLE IF EXISTS `yql_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_category` (
  `categoryid` int(20) NOT NULL DEFAULT '0',
  `categoryname` varchar(20) NOT NULL,
  `parentid` int(20) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_category`
--

LOCK TABLES `yql_category` WRITE;
/*!40000 ALTER TABLE `yql_category` DISABLE KEYS */;
INSERT INTO `yql_category` VALUES (1,'足球',0),(2,'篮球',0),(3,'羽毛球',0),(4,'网球',0),(5,'跑步',0),(6,'其它',0);
/*!40000 ALTER TABLE `yql_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_comment`
--

DROP TABLE IF EXISTS `yql_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_comment` (
  `commentid` int(20) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `userid` int(20) NOT NULL,
  `activityid` int(20) NOT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_comment`
--

LOCK TABLES `yql_comment` WRITE;
/*!40000 ALTER TABLE `yql_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `yql_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_config`
--

DROP TABLE IF EXISTS `yql_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `push` tinyint(1) NOT NULL DEFAULT '1',
  `userid` int(20) NOT NULL,
  `starttime` varchar(30) DEFAULT NULL,
  `endtime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_config`
--

LOCK TABLES `yql_config` WRITE;
/*!40000 ALTER TABLE `yql_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `yql_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_feed`
--

DROP TABLE IF EXISTS `yql_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_feed` (
  `feedid` int(20) NOT NULL AUTO_INCREMENT,
  `categoryid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  PRIMARY KEY (`feedid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_feed`
--

LOCK TABLES `yql_feed` WRITE;
/*!40000 ALTER TABLE `yql_feed` DISABLE KEYS */;
INSERT INTO `yql_feed` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `yql_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_feedback`
--

DROP TABLE IF EXISTS `yql_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_feedback` (
  `feedbackid` int(20) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `userid` int(20) NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_feedback`
--

LOCK TABLES `yql_feedback` WRITE;
/*!40000 ALTER TABLE `yql_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `yql_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_grade`
--

DROP TABLE IF EXISTS `yql_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_grade` (
  `gradeid` int(11) NOT NULL AUTO_INCREMENT,
  `grade` float(10,2) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`gradeid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_grade`
--

LOCK TABLES `yql_grade` WRITE;
/*!40000 ALTER TABLE `yql_grade` DISABLE KEYS */;
INSERT INTO `yql_grade` VALUES (1,5.00,1),(2,1.00,2),(3,4.00,2),(4,4.00,1),(5,3.00,1),(6,5.00,2),(7,5.00,1),(8,4.00,1);
/*!40000 ALTER TABLE `yql_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_relation`
--

DROP TABLE IF EXISTS `yql_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_relation` (
  `relationid` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `fllowerid` int(20) NOT NULL,
  PRIMARY KEY (`relationid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_relation`
--

LOCK TABLES `yql_relation` WRITE;
/*!40000 ALTER TABLE `yql_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `yql_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yql_user`
--

DROP TABLE IF EXISTS `yql_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yql_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `signature` varchar(50) DEFAULT NULL,
  `sex` int(10) DEFAULT NULL,
  `platform` int(10) NOT NULL,
  `userPwd` varchar(30) DEFAULT NULL,
  `confirmPwd` varchar(30) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `loginTime` varchar(50) DEFAULT NULL,
  `qq` int(20) DEFAULT NULL,
  `fllowednum` int(20) NOT NULL DEFAULT '0' COMMENT '关注人数量',
  `fllowernum` int(20) NOT NULL DEFAULT '0' COMMENT '粉丝数量',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yql_user`
--

LOCK TABLES `yql_user` WRITE;
/*!40000 ALTER TABLE `yql_user` DISABLE KEYS */;
INSERT INTO `yql_user` VALUES (1,'张三',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(2,'李四',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `yql_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-25 10:22:39
