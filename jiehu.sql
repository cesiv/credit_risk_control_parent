/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.17 : Database - jiehu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiehu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiehu`;

/*Table structure for table `ACT_EVT_LOG` */

DROP TABLE IF EXISTS `ACT_EVT_LOG`;

CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_EVT_LOG` */

/*Table structure for table `ACT_GE_BYTEARRAY` */

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;

CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_BYTEARRAY` */

insert  into `ACT_GE_BYTEARRAY`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('24985da4-0953-11e7-907f-484d7ea6ec6b',1,'E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','24985da3-0953-11e7-907f-484d7ea6ec6b','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"è¯·å‡æµç¨‹\" isExecutable=\"true\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${afterModifyApplyContentProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${reportBackEndProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"270.0\" y=\"149.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"463.0\" y=\"219.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"150.0\" y=\"281.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"447.0\" y=\"304.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2540f9b5-0953-11e7-907f-484d7ea6ec6b',1,'E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','24985da3-0953-11e7-907f-484d7ea6ec6b','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ù\0\0[\0\0\0\0İ’Ğ\0\06~IDATxÚíİ\rtTÕİïñÔâË­/-W¼–«^Û>>^×z½VtQ”vQE¥h©a˜¼@,šbd&B‘bAÌ#E\n™™ŠEQ­Ry‘\nVfÎ¤AK¥¨ˆ¼R\nHQÀ»ÿ\'³Ç“ÉL’!3É¼|?kí5o\'	œ3ÿ½³gÏ™¼¼(½ôkÎK\0\0\0\0€ÑÇã[–U±É²¦|jY¿ĞmÉÇÖÓêş!€9Ñ3£¡§ş™êêÏğúÍÉrùÊ>ëI¹¯¢ÖèÍŞ\0\0\0$d«€-Z_Ê}£üËÎ«kõÇÃÖãréñur¿\nÖı=>sÂ_-kêöYsıÆ±?¶¬q/î´æËceõæ9ìQ\0\0\0²U€–Pı‡O¬§,Ëº\\µï©6Xµ>+X³+ë‚—o±¬I•>ã6¹½eız£eMyéCkş:uİøÌšh8¹R=6¨ÂgÌ—ßÅ^\0\0@N«ğ›ãäòÅ÷¬ßÉlôfËzômËzD®ÏyÃZnñ€áoÚÖ-÷¯<nÕËr’Mj[®½¿Yèõû²7\0\0€¼¦™ìêêêÓjWY#—*d×TL—\nÏWÿÉ²üŞé¡‹<şûºĞ¥êşêşëNXV¥<şOË\Z«.oğúŒRo½y{\0\0\09ïşºàùáà|Ó3o[‹ÔåÏf¯±V¨ËŸ/úÈzF.=óN™¥Va|°7`”í°¬êÕ*|ËLöœuÖr{¶ßx‚½	\0\0\0(²ÎZÚ?-kŒ\nÔÃåL#êò§rÖ×Z¿Q×¿&ËIª«Ín2S-ËBÔ}–|l=5Êìõ7Ëš,÷?0¯`&\0\0\0È“¥\"!OÓÙCš.å¾ûf6v—ëK÷YOÙŒÙŸ1^®×5şË”Kã¸5S‚µ\nÜÿç™¿ZKÔå9^_è	ãìU\0\0\0ävÈö•ÎK!ë²½~c’\nÎCÃ—?ÏpŸ¿x§õìFËú•oÅá5ÒV·êşlY3äÔœU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@g±,«Û{ï½·`íÚµ_„B!kÅŠ´4hÁ`ĞjhhøDµ\"¥ ¿ Ñ_€ú¤>‘a¤ ­}ûöYŸş9-Úşıû­U«VRzÏTĞ_Ğè/@}RŸÈ òŠ—‚LëÂü\\½ŞÂ3ô4úPŸÔ\'2ˆ¼¥Ä“?½›*Ê<SAA£¿\0õI}\"ƒÈz!øi_”ÏTĞ_Ğè/@}RŸÈÂ¢üô{¬÷ÖÍµ6¶›\\—û(\ZŠôôô >iÔ\'N¡(Üemúc•õ×WÆ6krŸ<FáP”iäìúújšú¤>©OdDQîÜür‹‚Ôí£ÍK)Š2]PÍ\n_‚ş‚ş‚š¦>©Oêé]”[Ì_Å-JyŒÂ¡(Ó@Õª6#|9]BAAMSŸÔ\'õ‰´.ÊM+ªã¥<FáP”i2tÌ~ígP¦¿ ¿ ¦©Oê“úì$ÕÕÕß¨¯¯dòäÉë«ªªö—••/,,´†j·ÒÒÒ“¿øÅ/>üğÃfÎœ9û¡‡ú7Š’¢¤(3j0në~Ğ_Ğ_PÓÔ\'õI}&KMMÍ-\'NüKQQÑ¿T¸¶/^lmÜ¸ÑşV¤“\'OZÚ¬­[·Z¯¾úª5mÚ4K¶W¡{§ú™Ò~ıúuËÕ¢”OÇ+JyŒÂ¡(»È€6]ı8ë9é/è/¨iê“ú¤>“Éãñ|küøñî¹ç-X°ÀÑ‰8~ü¸µzõjë¡‡úWYYÙŞ{ï½wP.å¶Õuq‹R£p(Ê.ŒÛ\Zl™ı¢¿ ¿ ¦©Oê“úL¦ªªªò#Fœxúé§­£GZµnİ:K…ìã#G\\œŸŸN.å]­M¯MlùÖ’ºO£p(Ê.z;y@Š¶ıı5M}Ò¨ÏX|ğÁÙ÷ßÿÉ7ŞxÃJ¦Ã‡[õõõÇKJJv« ıÍ\\)Jiï¯Ÿ×¢(å>Š†¢ì¢Áxà)üÜeúújšú¤>©Ïìòòò/d½uª<÷Üs_RAû²œ(ÊÏ>³¶ıyVË·–Ô}ò…CQ¦ù`ÌÛÌôôÔ4õI}RŸ!KDd;•[[²dÉg*hïÊôí¶ŠR¾êİÕ¸k¸ä1¾%Š¢ì’4˜`P¦¿ ¿ ¦©Oê“úL€|ÈQÖ`oØ°Áê,óçÏß]PPğr&Ÿy$nQªW´{¶Ö[¯ş2nAê&ÛÈ¶¼\n¦(S<\'ëmaf¿è/è/¨iê“ú¤>ÛëÁ|K>äØÙ***v»\\®òl*Ê¶^íò*˜¢ì‚·“õ`üÕ†‡/ıs|pŠş‚ş‚š¦>©Oê³-rl9M_2Î\"’¨]»v,((ø»Ûíî‘-EÙW»­½\n¦(ÊÍNÉ`ú„jVøò+	Æ±~ MAAMSŸÔ\'õÙ\Zù¢™…Z]eÊ”)›UÈ~4[ŠòTR7\n‰¢LÑÛ¿ÃÃƒª•À ìŒuãmk–Ğ_Ğ_PÓÔ\'õÉxî$_•.ßÌ˜èÍ$y6{Ÿ\nÙŸdâÚìöò‡FQv¢xƒd¬ÁµµA9ÖösblÏzNúújšú¤1G›5kÖ£òUé]í¾ûî{GíïS”4Bv^ª…§Xm} ª½ƒr{ã<Şfnÿñ¢¿Èİş‚š¦>i98O<yıÒ¥K»<d×ÖÖ®N§%#%EÙ•†jI“ç¡Ëåº>Á·“Û\ZÛ\Z”Œ.Îh·÷xÑ_änAMSŸ´Ï«ªªöoÜ¸±ËCöÚµk7¨\"0)J\Z!ûËçŸ£-oãE_¢oïÆ”O;ÅÁ¸­·µs\"d·u¼è/ÙÔ4õIË¡ñ¼¬¬ìxg|ùL[öîİ»G=ñ÷P”4BvÌç_äE_Œçá©®ŸŒ5(¿ÓÁ¸£ÿl\nÙ1ı!›š¦>i94Z\'O´Ò<é)J\Z!;şóÏù¢/üKGg™b\rÊŒ}›;«Cvôñ¢¿ dSÓÔ\'-‡Æsy‚¥‹LÙeæµvËŒlƒÖçŒ>İO‹1ÛõNøş˜‘­ûşTıı5M}Ò˜Éî²ëE)áã?¹-§VŒ·íŞ½{íí_ıõÉEß·cÇ{{ù¹õë×[K–,±^zé%ë\'?ù‰}]{á…\"ÛßxãÖ-·ÜbmÛ¶MÎen7¹ıoŒ÷ÿğù|mn3fÌ˜Èuù\0®¾ëÿÄL¶İÖ©w§»ìè×+·6ë•È—[0“İã•.ƒ¸ß²²²vo/ıÄå—_Şì¾·ß~;#ê?f²©iêó”jxúôéÍî[°`uÅWØ×wïŞİì1óûöíkıèG?²–/_n]wİuÖ›o¾iØ·/¹äBv6¯ÉŞ¿ÿî4_“Ò¢\\½zµ\n…¬©S§ÚÅ#Oz	¼½zõ²­·@ÀŞşØ±cöåé§ŸnËöíÛí@|ûí·Gó°aÃšı\r	Éç{®µuëÖÈ}²í…^óßtÁX?üác÷³Ï>Ûì¾U«VÙ¿Kş¦\\^tÑEVïŞ½íë:ÌûÛßnñ{æÌ™¹şÜsÏµ¸NÈ;G~GR´~óTeÖdÇ9^é²üãÇ}\\úiº{öìi7]Ï¿ùÍoìßñÑG¥}ı§qÈ¦¦©ÏÕ°œ´B^ŞpÃ\rvIf -÷ÉãÑÛ¯Y³Æ¾|ÿı÷#u¦\'òä¶ü,!;É&L˜ğÉæÍ›Óåì\"¹Z”2XIa9rÄnò„—à,—2H©!ÍfxdInK0×ÛÙÎ>ûl;tëÛ´·×a]ŠI^¹Ù÷éû7lØù	Òİ»w·*++íÁS ²ü}yÌYÀÎñÌ3Ï´C½¾-/Æo_—ÿ—ş=jÚƒşÎÎC^y²‡®q»İw¶ã‹šeŠwJ¯Xg\"HdPÎõ³‹´z¼Ò)dKhnm	ÎW]uU‹]__o÷/Ñ¿/]ë?\rC65M}v¨ImÈq\\´h‘ıâU2€Ü–Ú”zŠ~×I×•Î\rR_úç;o²“DÎ“½lÙ²´8O¶*€Çr¹(åI^RR)\0¶u\0–W¡z[y+H‡ìX¿+:dË¶R˜¯½öš½\\D<¹OÂ·¦±ŠLŠ·OŸ>-~·´şûò»ä¾C‡Ùo=Éıú1™¥’ë2sk@É’Ğ.¯ÆõL¾\\Êí\rÙ­Írut¶©­sæ~ååkór÷<Ùí:^é0ˆëùë_ÿz«ÛÉñk®¹Æ®a	ÛÒäº¼ø~k9ë?B65M}&-+H˜~å•Wìwºå]g©¯¥Ií:g²u=I-Ê¥¼%açÎö»ÕúE/ËER@½ò™VSSÓå!»¼¼|“*„~¹X”òv¼5+k$%HË«P	ÖR2ğèAË¹>[®Ë}šÛ\nÙ2s$ë±uqÎ›7¯ÙŒ‘\\Ê\0²7mÚdß\'E+ë¸äß#oË¥šò‚ ºğåwëRèr]ÖZFÏ|éíåÿª_•ërıê«¯ækÕOM[³NíıRŠDeıööyHëA\\¿•,5ë]0İdı¦¼‹%5,õ(M®K_ëÅ}ºÖôÔtÕg[Mf£õØ,áX×ÛSO=Õ\"èÛ²v[OªéwÄ¥ıüç?·›Ô³,M%d§ÀØ±c¿9|øğÉåºğÙûÜn÷§*´•«E)û_ai2àè\'yÅªƒ¶Ş&‘-MÖ`ÉR)PyÕ~¢ÚËTâ½}ïô=÷Ücÿ\\ô@«¹~Uü³Ÿı,òVówÜÙ®±±Ñş°…l£÷_c=X^Ô0	Ù	‹7û•è·¾µwPÖ€ƒ¸Ç[o½Õ®C¹/hË,Y¬5Ù²ŞZÂ±Ì‚eBıgIAM²#KKõÌ´¼¨<y²}}ôèÑ‘Ï@è%X²½Œí’/òËE$HÈ–wª$¤›¦ÙìiBv’7îo+W®ì²]WW·Şårı6—‹R¿Â”\'¿. ıjÕù©{=%\Z²£ß*v®ÁvŸ¼å$E\'Å§?Y^^Şl=¶Ğòï¸òÊ+[²ÎR¶×oU9ßš–‚×ÿ~ç‡œ?+Ck³l„ìvÍ~E¿Í;</ñsæÆ\Z”‡%0Ë†4\ZÄuı;ßÍ’[GŸ…HŞB–:²«ªª,ÇY‚–îõŸEı5MÈ¶›óİ\"]3r60©5i2Y–ãƒ:SHÀ–w‹dùˆş0¤mf²SäÁt3æ‹®8•ŸêpOü½°°ğâ\\.J]4R ÑK9dÆXoª\rÙ2şä“OÚk %Ğë\'«©œqD^ÁÆ:%—ümù;zÖ*¯•SsÉcÎõ]z&«Gö ÜÖšL)|9ËŠ±×!»Ão3ˆ1¸&ò¥ñ~.§NÓ—\rƒ¸Cy{8zI˜İí™É–z–Ó~fJıgYAM²#5£ß–ëR¯ñ–‹D‡lya­Oñ\'·%pì+++Û+oãu¶É“\'o:th ×‹R>8$OvY©)}š™u–ÁÈYDñ>ø(ƒ“äÑçÁÕKC&Mšdß–à¬4ùıyqÎO«‹RÏ¶Ëšìöt\0z&+ºÉ™Rô *!_Ï®éN!Ï±F\\ŸG—´·™¿µJô^Ñ?7 €Qƒ¸Ô“,ÓˆulyLŞ½Ò/À3ßr)3ÎzÖL>ã!}R¦ÔöÔ4!;R3úû2œK¬t}Å:åŸs\\n7Î¾/ú¼Ú„ì$+--½ùŞ{ï=.lgQé6·Ûı·üüüsÙ‡\"ŸşÕo±¶¶>QJ8VaèW¶Ñç²Ö3Óòö\\FŸæGşfô¹lÿ¾iÓ¦EÀöt\0z™K¬&å9>ìäå1ù ¥¼]­ÏÃKÈNê œŠ·­‘¦ƒ¸ÔœBOŸE(ŞéúôûèelúøÄ‰\n\0éRÿYÚ_PÓ9²e¼–q9:\'è ın“3dËÒùœ„ˆÓ3ÜÎÓn²S`äÈ‘¿¯­­=ÑËFT8<*ËD†ÒŸ¢Ì¾ÖUë)	Ù)”sî‹fè/2»ş³¸¿ ¦©Ï„N®À×ªw19]İİwßış¼yó§2`ïÛ·ïdIIÉn·Ûí¡(ie§éèÛÁ,¡¿ ¿ ¦©O\ZõyªTğíQ\\\\|`áÂ…Ÿ§j;°¥(ie—\rÊ‰ÎZñ!Gúújšú¤QŸ%gú(**Úõä“OîMö\ZlY\"’\r3Ø%E™Á}{˜·“é/è/¨iê“F}&sF[â—å¬#;vìø¬£§é“³ˆÈ‡3}\r6EIQæXĞ–¯Uæ›é/è/¨iê“F}&›Ëå*WaûãGyä­íÛ·ïMô›ëëë×ÉìõĞ¡CgeòYD(JŠ2\r¶Zy|?ƒ1ıı5M}Ò¨Ï‘p¬Brµj;KKKß™:uê\ZÓ4ßüğÃw8Cõ>^»ví†ÚÚÚÕååå›ä«Òå›3õ‹f(JŠ2‡g´y;™ş‚ş‚š¦>iÔg\'Ïl_ÜËU{_µªYá¶Gµ5ª=¦Z¿’’’³(J\ZE™qƒ2ƒ1ıı5M}Ò¨OP”4Š2‰ƒòcúújšú¤QŸ (ieòw¤ò8¥ıı5M}Ò¨OP”4Š2yÂ2è/è/²@~~şWUMŸ¤ò¨Oê%¢$dÓ_Ğè/’¤´´ôtUÓÇ©<ê“úEI£(	Ùô4ú‹$‘“¨š>FåQŸÔ\'(J\ZEIÈ¦¿ Ñ_$IqqñÙª¦?¥ò¨Oê)\nñÄOïvLå	©„lúZ®õ………ç©š>DåQŸÔ\'2RCCÃ}ûöñäOÓ¶k×®ß©¢ÜÂ3•MAËµş¢   »ªé¿SyÔ\'õ‰ŒdÆ+W®üÇÇüOŠ ½^ñJAƒÁªİÅ3•MAËµşÂív÷P5½ŸÊ£>©Od,uĞªWWëämY/”©íùçŸ·¿¹3“ÿ&ÇbIÈ¦¿ åj¡Bö…ª¦÷Ru¹[ŸY2¦3#+ÖR)È~ıúuco²d¶¢¢¢ª¦w³\'èÓt!—Ëu½*ÆRn·›o£Cá\n/V5½“=AŸ kCö\")Æp[Ç¡CÙ\n\n\n.U5ı{‚>@×áµz[7º²gèdtÈşªéíì	út\0]W„K[Ïf³6›@F‡ìW5ı.{‚>@×`‹YlİÜn÷ì!:d\0™IõáW¨šæ¼Âôé\0º¨\0—Ç\nØá¶†=D‡ 3åçç÷RA{3{‚>@ç_ÜYlÖfÓ!Èl………ßU}øFö}:€Î/¾¥­lÎ4B‡ s\\­Bö_Øôé\0(Hpü$/dOÕôzö}:\0\n\0ÉÙÿ¡jú¿Øôé\0(Hpü$‰Ûí¾AÕôŸÙôé\0(Hpü$/d_ÕôŸØôé\0(HäÀñ/½ôkìi õ†r£\nÚ«Øôé\0(H¤Éñ÷ÔoğÌhè©[E90r=`òú›ìíF/Tìõ›ı£›\'`N”í£ÿFuõ‹g¨Ç\'ËõŠZ£7{HYÈş\nÙ{‚>\0‰4<ş£}æ•*TOŠµ½ìè =Ê¿ì¼ê¹æY¿Qç¼ßŞ>s‚×g÷úC7«ÇŸ–ûÊêÍsØó@JBv²W°\'èÓPH³ãË*jƒWÅÙ*HK¨®¬_u‰é–YîÊºàå~sœls]ğüJŸq›=Ã­¶Ìı!ÌË}>c¾üö>\\·¸\\®WÙôé\0(H¤ÙñW¸Ö0fË	Çºë íñ›…z™HEÀtÙ÷ómÑÍ–“Ø?ìË^R²oS!ûö}:\0\nitüUH®²g§UÈ–Û²¬£iÖ¹á‚È6~£®ººú4ÏoéÚà…²½ÓCyü!·ŞîºĞ¥êşÎuŞ^ŸQê­7/c¯©áv»¬BöËì	út\0$Òàøß7³±»7º[¯•vÎHËõZkYÒœÍ«%Ë¬´„m{›€y§s–ZıÌ`oÀ(k>“m<ÁRGì;TM/fO0¦  ÑÅÜ…–sıµ,©ğÓÛH—KYg-MÎ0\"k²å>	ÖöÏøÍqÕÕf7ı32c-ËCFùƒ½*ü¡r¹ï€y3Ù@JCö`Õ§¿Ä`L@A\"Í¿h½Æ:š|x1z¶pûÃ’á%&öv>c¼ÜWá7jtà–€-÷y}¡gœa@RCv¾Ûí~‘=AŸ€‚Dš9SˆÌ>ÇÙ>£2ú>YŸ-§ûÓÁ\\B·õ¦ûCSœMÖesV ¥!{¨\nÙÏ³\'èÓPàøH^È.T!ûYö}:\0\n\0ÉÙÃTÈ~š=AŸ€‚Ç@òê¹Dµ¹ì	út\0$8ş\0’WÏ#T›Ã O@A‚ã yõ\\ªÚlö}:\0\n\0Iâr¹îS5=“=AŸ€‚Ç@òBv¹ªé\0{‚>\0	?€ä…ì\n·Û]Ë O@A‚ã y!»R…ì_³\'èÓPàøH^=Qí1ö}:\0\n\0É«çqªMaOĞ§  Áñ¼zş¥j5ì	út\0$8ş\0’WÏUª=Ì O@A‚ã yõ\\­ÚDö}:\0\n\0É«çÉª=Ä O@A‚ã yõ\\#ë²Ùôé\0(Hpü$¯§ÈFØôé\0(Hpü$¯“se³\'èÓPàøH^=OWÍË O@A‚ã yõìSm4{‚>\0	?€äÕsj÷³\'èÓPèÜc½Twm{\nÈØ\ZŸ¥ÚHöc:\0\n{¬¯UíDk!Ûår\rdO[ã³U+eO0¦  ÑùÇ{y+!{M¿~ıº±—€Œ­ï9ª`O0¦  ÑùÇûÚx!ÛívßÉ2º¾çªVÂ`L@A¢ky¬µÙë˜Å2¾¶ç©VÌ`L@A¢ky‹µÙ¬Å²¢¶ç«VÀ`L@A¢‹¨P½ˆYl ëúóß©æbO0¦  Ñu!ûzÇZìì ó©Z~QÕv>{‚1\0‰®=ööÚlf±¬©é—TÈÌ`L@A¢kıµ «jz±\nÙw°\'ÓPÇ²¬nï½÷Ş‚µk×~\n…¬+VĞÒ ƒA«¡¡áÕŠx–\"‡ûó¥|ˆ™1½\0PIvcc£µoß>ëóÏ?§¥QÛ¿¿µjÕªC*pßÅ39ÚŸ/S!ûVöc:\0\n2ãÈ6;­ƒöç+V¬ØÂ39ÚŸÿQ…ì›ÙŒé\0(ÈŒ#KD³éİTÈ>Á39ÚŸ‡ÒŸ=Á˜€‚Ì8²ş— ›ö!›ç4r’Ûí6TÈş{‚1\0™µ!ûÓì±Ş[7×Ú|Ønr]î#²†ìU*dßÈ`L@AfeÈ>rp—µéUÖ__Û¬É}òA˜\r¤¨?ÿ“\nÙ}ØŒé\0(È¬Ù;7¿Ü\"`ëöÑæ¥aB6ªş||›+{‚1\0™•!{‹ù«¸![#²õç¯«}{‚1\0™•!{ÓŠê¸![#²õço¨}\r{‚1\0IÈ¦²$Qû/W³\'ÓPY²ål\"ñB¶<F&d)\nÙ¿Ë`L@AfeÈŞ¶º.nÈ–ÇÂ„l Ün÷æüüü^ì	Æt\0dV†ì»6Z›^›Ør©ˆºO#²…ì­*dÿoöc:\0\n2+C¶´÷×Ïk²å>B0!Ha¾M…ìËØŒé\0(ÈìÙŸ}fmûó¬–KEÔ}òA˜\r¤¨?O…ìo³\'ÓPY²åß]ˆ»&[ã[	Ù@Šúó\n\n\n.eO0¦  ³\'dö™µg›a½õê/ãlİdÙ–YmB6äş|gaaáÅì	Æt\0dV„ì¶f¯™Õ&dÔŸï.**êÉ`L@AfEÈnÏìuk³ÚcB6¤şüãâââÿÁ`L@AfEÈ>Õ€­Á˜\r$©?ÿdØ°aç³\'ÓPY²i„l ¸\\®ƒ%%%ß`O0¦  	Ù´NÙê9­\n#‹x6#Û¸İîÃƒ\r:—=Á˜€‚$dÓ:-dK¸Vm©j\'xŞ#KûóO‹‹‹ÏfO0¦  	Ù´”‡ìèp­Ïfda~¬¤¤ä,öc:\0\n’MKYÈv¹\\×Ë²èpMÈF÷çÇKKKOgO0¦  	Ù´¤·çŸŞŠ5sMÈFôç_TWWŸÆ`L@A²iIo­k\Z-Û½4c:{  	Ù	´Èq²<h;vÌzóÍ7íûœÍ4Í?\'?3uêTkïŞ½‘Û555mş½E‹Y={öŒûøÛo¿mmØ°!æß{öÙgÓb¹È!Cú«ç÷\ZÂ\0Æt\0$!;nûêW¿jõíÛ×Ùf%hËå´iÓ\"!\\o{î¹çÚAXî[µj•µtéRkÓ¦Möí×_İZ¾|¹}}ÿşı‘ŸÙ¶m[äú’%K¬K/½4r»±±1f –ßõÊ+¯XÃ†\r³Fî{òÉ\'­—^zÉ¾®Ã}W~ğÑívPÏóFB6ºJéì¥_c/€1  ‘¦![Ú¡C‡\"wŞ¼yöeŸ>}t°Œl\'¡ÚçóÙ÷=õÔSöeAAõÜsÏE~ş…^hš¯¹æ\Z;,WUUYİ»w·&L˜	ÏÑ3Ô:”Kè¿òÊ+›…ì¼.œÑw\n¿ğÌv#!±xê‚7xf4ôÔ­¢Î¹0yıÆMöv£Ç*öúÍşÑÍ0\'ÊöÑ¿»ºúÅ3Ôã“åzE­Ñ›½\rÆt€‚D\Z„l™m^½zµ\\e†Xb=S-3Ô[·nm²uPv†q™u–i}ûÈ‘#-B¶ŞÑ3ÙÎÇäïê@-×å÷è¦ÿ¾¾~ıú´û2šğÌö\ZÍˆg´Ï¼R…êI1Ã¸\nØÑAz”ÙyÕsÍ³<~£Îy¿¼}æ¯Ïîõ‡nV?-÷•Õ›ç°—Á˜Pèâíº²VZ_ÖOúS{©Æk¯½Ö,dïØ±Ãš3g}ßu×]ù9™}–ûn¿ıö˜¿¿µ™l½æ[f®õö².[–‹H\0…B‘&³Ùr¹sçN¾V%–7TÔ¯Š²U–P]Y¿ê=Ó-³Ü•uÁË+üæ8Ùæşºàù•>ã6{†[l;˜ûC™—û*|Æ|ùìm0¦$Ò0dKÓ8z&»GöZl¹ï£>²×sË±–µØòxYY™ı˜áDg²÷-X° r½wïŞÍÖfë+!™DâZOÀ˜-K<$Kèv>®ƒ´Çoêe\"Óeß0üÍ·5F7[NbÿL°/{Œé\0‰4Ù²4äı÷ß¬·ÖxÔj”ívïŞm_J€–™ki²ÌäÆo´¯Ë	İG=¥™lçö7n´¶oßn_¿õÖ[›…ìX–$d#­vÀ¨²g§UÈ–Û²¬£iÖ¹á‚È6~£NÎEíñãí ]¼PB¶wzè\"?äÖÛ=PºTİ?Â¹ÎÛë3J½õæeìi0¦$Ò,dŸ~úéöõ,µÌ.Ë¥,ÉsÌd;Æ¹†Z_NŸ>½Å¶ò;ã]DfÃcıî3Ï<3ôûõëGÈFFºofcwo t·^+íœ‘–*êµÖ²¤)8›WK —Yi	Ûö6óNç,µú™ÁŞ€QÖ|&Ûx‚½\rÆt€‚D\Z†l™MÎŸzOŸ§Z€1^È–ÙæèĞìœñÕbmëwËKôuı¡Ìè¥$„l¤3Yâ\\-ËD*|Æôè.—²ÎZšœaDÖdË}¬íŸñ›ãª«ÍnúgdÆZ–‡Œò{UøCårßó\nf²Á˜PH³-MÖ^ËÒç}²ü#/üGç)ü$(_pÁö¥|RÎ±]^^nß~üñÇíŸÑ§Œn˜{õêÕê¿E¾\'zÆ\\>è8iÒ$û¶,#!d#ÓH€Ök¬[<æy¢×hK\0·?,^bboç3ÆÛáİoÔèÀ-[îóúBÏ8Ã8À˜PÈãkÕ3¡²Ñr¦™}²}Feô}²>[N÷§ƒ¹„n	êM÷‡¦8›¬Ëæ¬\"`L(H²	Ù\0À˜€‚$dÓÙ\0ÓP„l\Z!\0Ó\n’MÈ&d\0c:\0\n’MÈ\0Æt\0$!›FÈ\0Æt€‚$dÓÙ\0À˜€‚$d²€1\0IÈ¦²€1  	Ù4B6\00¦$Ù„l\0`L@A²i„l\0`L(HB6\r\0Œé\0‰æB¡A6½Û1²OğLÀ˜€‚Ì \r\r\r{öíÛG˜MÓ¶k×®ß©½…g*\0Æt\0d1ã•+Wşãã?ş\'¡6½f°%`ƒÁªİÅ3\0c:\0\n2Ã¨7pÅŠëdY‚¬ÿÍä&Ç?Óÿá&Çb\0c:\0\n\0\0}:@A‚ã\0 O@A‚ã\0ôé\0(Hpü\0ôé\0	?\0€>\0	?\0Ğ§  Áñ\0Ğ§$8ş\0\0út€‚Ç\0@Ÿ€‚Ç\0@ŸPàø\0èÓ\n\0\0}:\0\n\0 O@A‚ã\0 O(Hpü\0ôé\0(Hpü€>\0	?\0€>  Áñ\0Ğ§  Áñ\0út\0$8ş\0\0út€‚Ç\0@ŸPàø\0èÓPàø\0èÓ\n\0\0}:@A\"{õR9Şm´uì)\0`L@A¢ıÇúZÕN´²].×@ö\00¦  ‘Øñ^ŞJÈ^Ó¯_¿nì%\0`L@A\"±ã}m¼ív»ïd@Æôç,ÙÈ€y³Ø\0Q}9K\0B6Ò½c¦#€ŒìÏY²‘NT¨^Ä,6\0düÎ@€4Ù×;:âì\0ÈØqœ%€\0!éØ1Ó@F÷å,ÙH·yğàÁ\0Èp,ÙH/²LÄ\n_\027d³È¶]]]}Z2ş¥³—~­ıóÅ38rÖ_µƒªÍ_òÖ\"\0döxÎ@ SC¶§.xƒ×oö¯¨3züfaS3f–Õ›çD‡`ÏœP]mÚ…î™ÑĞ³¢Öè]áMí3¯Œõ»+æÂX÷?PºÔë3›½*¯ğ5ò»+jƒ&+äçhÀÖÁZöï~‚6\0¤?·ÛİÃår©á{ècª™ªíŒúĞã9}ŸÚæ·jÛ{Ôõo±×€4Ù^°¯n*»<s¢¾íñ…Æ8Â²Ëëİì\r„Fª\0ş„„jOÀ˜=ûì­7/óøCn	í²½l¹î7ÿÛæäÊúU—HØ–mT¸Ùûs„wzè\"b‡v[÷\0ÒÀ!Cú‡×^kÇ7=:›|(rj%Ìri²«çšgUÖ/—°,Aº¢6x•}=|©·å_vğŠ€1Hf¡e¶¹\"Êş}j›;½~ã&¹^é3n“fj¤õuûï†gÃííÔß—&³äòwU»#˜miı8ëù\0 }Æi9{Èºƒu¼¶Ef·Ù«@\Z…ì¦\0lüŞ½ö…išÅ6û{|Fe$8Ï0¯ÏD‘Ùè\n¨ÜãydÆ¹Âo“vßÌÆî²­\\—ÙiYJ¢~ÇøQş`¯ğõÊûë‚çÛOf»ÕíÑ>ã{²D¥éï…Š½ĞİM×Í	ê9Š	ì¶43Ú\0&T ~4úô|………Ö£>j-X°ÀÚ¼y³µgÏëØ±c–8~ü¸µoß>ëİwßµ.\\hoW\\\\+l/W¿çbö0!Û^0Ê$Ëò\r{µ\n¾ÎYçHØV¡YÖJKè\\w,)±´ß˜\ZÙŞoÔÅº¾=S.%œKhoZRbö—õİÎYn´+8HÑö\0€$ÊÏÏ?\'¼Ş:ŒKJJ¬gŸ}ÖÑ‰8zô¨µxñbËãñXQçÒ>¨.û±·.Ù*ìÖ!·ÂgÌo\nºFÍ(Ãz{)‡ıaÈĞ\\	ß€ÑG–Ècêg¦;Ÿ„d{æÚÚíà®~góíÌqöe ”/×uÈV!}G/¡À<ğ~îA\0º$`7:qUU•=cİ\'O´–-[fÏ„;~÷Õîb¯]²%Hë6}ğ0ô[½t£ÒüŞNÖXëEÚËDjŞ²œO>éüÎŸSaÜ¯¯ËÒçv²4Å^0GÈlú—Á<4…£—²€¬Ÿ\0$>.7›Á–e!“e×®]ÖØ±cAûß	tQÈúTy2;í\\\"ò@À¼B.íåcPÓéûŒñö‡ı¡ò¦@ıå£ÙÁÙrÇzÌ^³í7ş`ÿ]_¨6¼§‡.’àÍÑkU[rììß\0hCx\rv$\0¯]»ÖJYÃ-ëµ3Úêo_Á\0:1dÛ³Æ*ÔF–sÔ¯’`­oËYBäR>¬(A\\–qÈåƒ‘‘ßá7ã}@Q‚ykg	Ñ_R#v”K9% |\0Ó¹Lqƒq²–z0£\r\0©¯u~ÈQf°SI>$YSSÓìüÚrnĞI!\'úC‹_Qmxø2Ñ?Ç‡! …\\.×_œk°“¹D$Ã‡[÷Ş{¯óÃ38\0!ñö@GP~B5+|ÙŞ ïçÚ\0òE3Î³ˆtôC‰xã7¢?ù-@ÈFü€-†‡ƒ²•@Ğvlİ†9g6\0$,^ªƒ®œ¦¯³M›6Í´ãˆ\0„l´|cæÖ‚v¬íçÄØ5Ú\0$²ZUºœ^/Ñó`\'ÃöíÛ›?»¤¤ä€MÀn}	G{ƒv{vtĞfé\0ÄĞ+Tû~kÛ¨P;T\\9ãGWq~Yú7ßÉÑÙ¹¬½A·­ hÀvşııyÌh@Ü16ZW¨0}}œmë¬3Š´æ…^à\0!y‰/Ùˆ´O;Å€­±F\0ÚÙ¶<zfÛùå3[·ní²-çäv¾(àè„lvûÅ\nÚït `wôß\0¹²#!V‡mu{§¾¿3Ï*íÃ?lvÎlœà‹ğ	ğ?WíŸª}ªŠÿ°|øA]? Ú>Õöª¶;ÜìPí}Õş¦Ú»ªmQÛoV—o©¶Aµ7U[¯Ú©¶Fµ?©Ö ÚJÕBÒ¹¨Ë?ª¶Lµ?¨¿ó²j‹Ôõ—Ôc/ªËß©öœjÏ¨ÛO«Ë¹ªÍQíqÕf©mëÕe@=V«.§«ÛÓTû•|S–j¨ûV­Zµ*uÿußxÕ~¡nQ·+U«P·G©V¦î©Z©j#Ôıw«û†«V¤n¨¦îrå«Û?•õiêö ùêYÕn-((¸EN¹¤îÿ¡º¿Ÿj}Õí>êö\rê±ÿ/PÛ]£Úÿ-,,ün~~~/ù6-uûrÕşMİş¶ÚîRõØÅjÛÿ©»PİwÁ°aÃÎ—œ¨ûÏS·ÏQí¿İzë­göë×¯[ø[7;:s+hw$`GmÖh@!Û9³í¼-ßÄØUäËiœÿŞ$Ä©@w†„ºâââ³\r\Zt®„=uû¿Kø“XTTÔSB¡ºı¿ä<šUPüw	\"Õí+%TªÇşŸºÿ{6e\rš„O	¡j»›$”J8U÷ß,aUİ»ºïÇbÕíÁj%Üº›©ÛÃÔí	Áªİ+¡XÂ±º¿\\Â²ºíU·­n?(¡ZÂµj%l‡C÷J—uoêö¯%œ«ÛşpXŸ¥Úl	ñêş\'ÕåSîU›/a_B¿Úî÷áKÂ§YZ¦n¿\Z~±\n¿Õ×~1ñçğ‹‹uª½!/:Ô¶Ã/B¶¨öNøÅÉ{ª}~Ñ²+ü\"F^Ì|~qs(|¾RyÑóYøEĞá¯£kå$¬GÏ`¿¾¿#f´c@¡Ñh4ZœÖÕÙ\0rYG¿2½µ™ìD¾°†™l\08õ™ìuòÎ¨Lp1“\r\0éCí‘¼Ô¬É>• Íšl\0h_È„kÇ6¬É€4Ú‰ÌÇ;M_¬³‹$´9»\0´²×È²Hg¸vlÃÙE\0 Mƒv[·­ó`\'úÍÚµyœ\'i¬ºúÅ3ÚÚæ¾™İÛ÷»ÌnìQœBÈn1sc›@:œ\'[ş¶ãEA€£ ×µ5“ÜŞ/šI4hë%+|+ÒF…ßíüNävÀtyf˜WÇÎÕ§y}¡gôíQşeç•Õ›ç4]o¸Àë7nÒyf4ôôøÌ	rİù7¨]êõ™Ã=¾Ğ˜ŠÚàuŞ€Qfo+ÍoVÖ¯º„#ƒÖ„ÏhÕåßø8vìXgÈ¾‹#\0ñg´ı&Çömı÷ØH½ĞÈ¦ğlv“YlºkäÒ0úÈŒµ„j„¯Ò!¸ÒgÜ&?£oK¨~ `^	Ö¾Pm8Dğø:u»Øë7û{æ÷×Ï×KıÜÔ¦ë/¡ÿ\rvÈ÷Ó92hKøT®Ç$ÜªëÖáÃ‡»z=ö1ü{pd\0 ‰ÌhG/İ—øy°cíaQ‡5ØH;2k­ƒ­i™•Vax¢„oiz¹‡wzè\"ÙVÂ²\nÇ“dZ®WøÍqÕsÍ³d	ÚÈ¥ö™WÚ3Ôş`ß¦¿ÊüMõwìĞí7fªß9Âã£ªéw«û}ÆxÚÃ¹.{áÂ…²gÍšåÙs9\"\0Ğ2h;?éÌ‰|ÑL¼Ÿã4}HÓ€Ê—,3ÊŞzó2	Ë¬%pËLtE­ÑûËmA2ƒ­yøKd©IŞÆ½ö‡¦Øá[ı¬ÌhËìµ„m?ä‘™qÙÎ¹üú=óå¶§.xƒ^nbzõó´‡sÉHYYY§Êo×®]öºşûWsD\0 ¥è¥#‡å%~Z¾èŸëèù¹”’™æÊºàåöu|õ¶=‹¡‡éÑM3Ù¡›=~óåÈ¬³?ôÛf¿Oı	Íàeö[‡kç:m;XûÌ	2{-—‘¥(>£Ò^~â3©´Kø|Ùoé »xñâNÙ?üp$`Ë¯q4\0 ıA»£b-EÒFÓZéĞ	µòE	¼‘ğ0fKà„ç@h¤Ì^Û÷û§eV[–’D@RfÆ›Â{hJÓúîP¹|Ñ9S=Êì%KNäïêCÚÛÌ²\\EÏ’íáœÍ–™å>ø å{Ù²eÎe\"\'ä››9\0Ğ9A›/šAÚû2àÚl¼P‚q$€Œ*ç¶MT4\'Û3Õ2ûlâ`¯/·?(é÷øCn;ŒûŒñ2ƒ-a\\íiMáZ´ú=®¡»ågävE9ĞÙV?#×eœ£ƒD¨ »T‡ŞÊÊJëèÑ£)Ø«W¯n¶LDµ‘\0hŸ.ñ`‰Ò>µ^Ólv°¯½ÛoÔè™lgà–ÓéÉ)öd6ZB³¬³¶Cº/ôŒl§O·\'aZÎFâõ¥ÚåwÛ§ô³gÁÍn¿1XŸ_[Î:âü÷Hh·Cwx]8G‰ÈÏÏÿ¦\n»ûuğ­©©±¿î<»¤¤„;@‚v¢3Ñ|ÈÁQvÌWú‚?µÑ‘î¹åRÂ·óô|rnëf§ë˜Q?&gÑ§é“Ûö¥}ÆæOŸPf®íà®¸=ë0É‡09BH”Ëåº^µƒ:\0Ëšé$u‰HÔörîyA\0§ Ñ%,€.$_Á®Ï-MfåkÏ;z‘‰\':Ã5\0:1hËW¥óM\0ĞÅ†Ò_…à#ÎP,ß¹uëÖ„¿hFÎƒ5{m/!`@rè­<¾Ÿ€\r\0éÁív_¡ÂğÎ¨pl\Z5Êzşùç­ÆÆFû,$zİ¶\\J¨–YïXãÆ‹ÖöYDø#\0$_¼m–ˆ\0@\Z’Ùf¶Õ>•&çÁæ4}\0ĞyA›€\r\0i®°°ğb”\';?ÙÎ&k»çòM\0Ğ¹A{\02GIIÉYáõÚÉc,\'Ùãv»W¨Ë€\näCÕõì5\0è\\²ÛÊã4}\0\0\0@R}ƒ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˜ÿÑv>…£\0\0\0\0IEND®B`‚',1),('af0538f3-0953-11e7-821f-f48e38b58b4b',1,'G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','af0538f2-0953-11e7-821f-f48e38b58b4b','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"è¯·å‡æµç¨‹\" isExecutable=\"true\">\n    <documentation>è¯·å‡æµç¨‹æ¼”ç¤º</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"éƒ¨é—¨é¢†å¯¼å®¡æ‰¹\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"è°ƒæ•´ç”³è¯·\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${afterModifyApplyContentProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"äººäº‹å®¡æ‰¹\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"é”€å‡\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${reportBackEndProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"åŒæ„\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"ä¸åŒæ„\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"ç»“æŸæµç¨‹\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"270.0\" y=\"149.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"463.0\" y=\"219.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"150.0\" y=\"281.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"447.0\" y=\"304.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('af53a714-0953-11e7-821f-f48e38b58b4b',1,'G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','af0538f2-0953-11e7-821f-f48e38b58b4b','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ù\0\0[\0\0\0\0İ’Ğ\0\06~IDATxÚíİ\rtTÕİïñÔâË­/-W¼–«^Û>>^×z½VtQ”vQE¥h©a˜¼@,šbd&B‘bAÌ#E\n™™ŠEQ­Ry‘\nVfÎ¤AK¥¨ˆ¼R\nHQÀ»ÿ\'³Ç“ÉL’!3É¼|?kí5o\'	œ3ÿ½³gÏ™¼¼(½ôkÎK\0\0\0\0€ÑÇã[–U±É²¦|jY¿ĞmÉÇÖÓêş!€9Ñ3£¡§ş™êêÏğúÍÉrùÊ>ëI¹¯¢ÖèÍŞ\0\0\0$d«€-Z_Ê}£üËÎ«kõÇÃÖãréñur¿\nÖı=>sÂ_-kêöYsıÆ±?¶¬q/î´æËceõæ9ìQ\0\0\0²U€–Pı‡O¬§,Ëº\\µï©6Xµ>+X³+ë‚—o±¬I•>ã6¹½eız£eMyéCkş:uİøÌšh8¹R=6¨ÂgÌ—ßÅ^\0\0@N«ğ›ãäòÅ÷¬ßÉlôfËzômËzD®ÏyÃZnñ€áoÚÖ-÷¯<nÕËr’Mj[®½¿Yèõû²7\0\0€¼¦™ìêêêÓjWY#—*d×TL—\nÏWÿÉ²üŞé¡‹<şûºĞ¥êşêşëNXV¥<şOË\Z«.oğúŒRo½y{\0\0\09ïşºàùáà|Ó3o[‹ÔåÏf¯±V¨ËŸ/úÈzF.=óN™¥Va|°7`”í°¬êÕ*|ËLöœuÖr{¶ßx‚½	\0\0\0(²ÎZÚ?-kŒ\nÔÃåL#êò§rÖ×Z¿Q×¿&ËIª«Ín2S-ËBÔ}–|l=5Êìõ7Ëš,÷?0¯`&\0\0\0È“¥\"!OÓÙCš.å¾ûf6v—ëK÷YOÙŒÙŸ1^®×5şË”Kã¸5S‚µ\nÜÿç™¿ZKÔå9^_è	ãìU\0\0\0ävÈö•ÎK!ë²½~c’\nÎCÃ—?ÏpŸ¿x§õìFËú•oÅá5ÒV·êşlY3äÔœU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@g±,«Û{ï½·`íÚµ_„B!kÅŠ´4hÁ`ĞjhhøDµ\"¥ ¿ Ñ_€ú¤>‘a¤ ­}ûöYŸş9-Úşıû­U«VRzÏTĞ_Ğè/@}RŸÈ òŠ—‚LëÂü\\½ŞÂ3ô4úPŸÔ\'2ˆ¼¥Ä“?½›*Ê<SAA£¿\0õI}\"ƒÈz!øi_”ÏTĞ_Ğè/@}RŸÈÂ¢üô{¬÷ÖÍµ6¶›\\—û(\ZŠôôô >iÔ\'N¡(Üemúc•õ×WÆ6krŸ<FáP”iäìúújšú¤>©OdDQîÜür‹‚Ôí£ÍK)Š2]PÍ\n_‚ş‚ş‚š¦>©Oêé]”[Ì_Å-JyŒÂ¡(Ó@Õª6#|9]BAAMSŸÔ\'õ‰´.ÊM+ªã¥<FáP”i2tÌ~ígP¦¿ ¿ ¦©Oê“úì$ÕÕÕß¨¯¯dòäÉë«ªªö—••/,,´†j·ÒÒÒ“¿øÅ/>üğÃfÎœ9û¡‡ú7Š’¢¤(3j0në~Ğ_Ğ_PÓÔ\'õI}&KMMÍ-\'NüKQQÑ¿T¸¶/^lmÜ¸ÑşV¤“\'OZÚ¬­[·Z¯¾úª5mÚ4K¶W¡{§ú™Ò~ıúuËÕ¢”OÇ+JyŒÂ¡(»È€6]ı8ë9é/è/¨iê“ú¤>“Éãñ|küøñî¹ç-X°ÀÑ‰8~ü¸µzõjë¡‡úWYYÙŞ{ï½wP.å¶Õuq‹R£p(Ê.ŒÛ\Zl™ı¢¿ ¿ ¦©Oê“úL¦ªªªò#Fœxúé§­£GZµnİ:K…ìã#G\\œŸŸN.å]­M¯MlùÖ’ºO£p(Ê.z;y@Š¶ıı5M}Ò¨ÏX|ğÁÙ÷ßÿÉ7ŞxÃJ¦Ã‡[õõõÇKJJv« ıÍ\\)Jiï¯Ÿ×¢(å>Š†¢ì¢Áxà)üÜeúújšú¤>©Ïìòòò/d½uª<÷Üs_RAû²œ(ÊÏ>³¶ıyVË·–Ô}ò…CQ¦ù`ÌÛÌôôÔ4õI}RŸ!KDd;•[[²dÉg*hïÊôí¶ŠR¾êİÕ¸k¸ä1¾%Š¢ì’4˜`P¦¿ ¿ ¦©Oê“úL€|ÈQÖ`oØ°Áê,óçÏß]PPğr&Ÿy$nQªW´{¶Ö[¯ş2nAê&ÛÈ¶¼\n¦(S<\'ëmaf¿è/è/¨iê“ú¤>ÛëÁ|K>äØÙ***v»\\®òl*Ê¶^íò*˜¢ì‚·“õ`üÕ†‡/ıs|pŠş‚ş‚š¦>©Oê³-rl9M_2Î\"’¨]»v,((ø»Ûíî‘-EÙW»­½\n¦(ÊÍNÉ`ú„jVøò+	Æ±~ MAAMSŸÔ\'õÙ\Zù¢™…Z]eÊ”)›UÈ~4[ŠòTR7\n‰¢LÑÛ¿ÃÃƒª•À ìŒuãmk–Ğ_Ğ_PÓÔ\'õÉxî$_•.ßÌ˜èÍ$y6{Ÿ\nÙŸdâÚìöò‡FQv¢xƒd¬ÁµµA9ÖösblÏzNúújšú¤1G›5kÖ£òUé]í¾ûî{GíïS”4Bv^ª…§Xm} ª½ƒr{ã<Şfnÿñ¢¿Èİş‚š¦>i98O<yıÒ¥K»<d×ÖÖ®N§%#%EÙ•†jI“ç¡Ëåº>Á·“Û\ZÛ\Z”Œ.Îh·÷xÑ_änAMSŸ´Ï«ªªöoÜ¸±ËCöÚµk7¨\"0)J\Z!ûËçŸ£-oãE_¢oïÆ”O;ÅÁ¸­·µs\"d·u¼è/ÙÔ4õIË¡ñ¼¬¬ìxg|ùL[öîİ»G=ñ÷P”4BvÌç_äE_Œçá©®ŸŒ5(¿ÓÁ¸£ÿl\nÙ1ı!›š¦>i94Z\'O´Ò<é)J\Z!;şóÏù¢/üKGg™b\rÊŒ}›;«Cvôñ¢¿ dSÓÔ\'-‡Æsy‚¥‹LÙeæµvËŒlƒÖçŒ>İO‹1ÛõNøş˜‘­ûşTıı5M}Ò˜Éî²ëE)áã?¹-§VŒ·íŞ½{íí_ıõÉEß·cÇ{{ù¹õë×[K–,±^zé%ë\'?ù‰}]{á…\"ÛßxãÖ-·ÜbmÛ¶MÎen7¹ıoŒ÷ÿğù|mn3fÌ˜Èuù\0®¾ëÿÄL¶İÖ©w§»ìè×+·6ë•È—[0“İã•.ƒ¸ß²²²vo/ıÄå—_Şì¾·ß~;#ê?f²©iêó”jxúôéÍî[°`uÅWØ×wïŞİì1óûöíkıèG?²–/_n]wİuÖ›o¾iØ·/¹äBv6¯ÉŞ¿ÿî4_“Ò¢\\½zµ\n…¬©S§ÚÅ#Oz	¼½zõ²­·@ÀŞşØ±cöåé§ŸnËöíÛí@|ûí·Gó°aÃšı\r	Éç{®µuëÖÈ}²í…^óßtÁX?üác÷³Ï>Ûì¾U«VÙ¿Kş¦\\^tÑEVïŞ½íë:ÌûÛßnñ{æÌ™¹şÜsÏµ¸NÈ;G~GR´~óTeÖdÇ9^é²üãÇ}\\úiº{öìi7]Ï¿ùÍoìßñÑG¥}ı§qÈ¦¦©ÏÕ°œ´B^ŞpÃ\rvIf -÷ÉãÑÛ¯Y³Æ¾|ÿı÷#u¦\'òä¶ü,!;É&L˜ğÉæÍ›Óåì\"¹Z”2XIa9rÄnò„—à,—2H©!ÍfxdInK0×ÛÙÎ>ûl;tëÛ´·×a]ŠI^¹Ù÷éû7lØù	Òİ»w·*++íÁS ²ü}yÌYÀÎñÌ3Ï´C½¾-/Æo_—ÿ—ş=jÚƒşÎÎC^y²‡®q»İw¶ã‹šeŠwJ¯Xg\"HdPÎõ³‹´z¼Ò)dKhnm	ÎW]uU‹]__o÷/Ñ¿/]ë?\rC65M}v¨ImÈq\\´h‘ıâU2€Ü–Ú”zŠ~×I×•Î\rR_úç;o²“DÎ“½lÙ²´8O¶*€Çr¹(åI^RR)\0¶u\0–W¡z[y+H‡ìX¿+:dË¶R˜¯½öš½\\D<¹OÂ·¦±ŠLŠ·OŸ>-~·´şûò»ä¾C‡Ùo=Éıú1™¥’ë2sk@É’Ğ.¯ÆõL¾\\Êí\rÙ­Írut¶©­sæ~ååkór÷<Ùí:^é0ˆëùë_ÿz«ÛÉñk®¹Æ®a	ÛÒäº¼ø~k9ë?B65M}&-+H˜~å•Wìwºå]g©¯¥Ií:g²u=I-Ê¥¼%açÎö»ÕúE/ËER@½ò™VSSÓå!»¼¼|“*„~¹X”òv¼5+k$%HË«P	ÖR2ğèAË¹>[®Ë}šÛ\nÙ2s$ë±uqÎ›7¯ÙŒ‘\\Ê\0²7mÚdß\'E+ë¸äß#oË¥šò‚ ºğåwëRèr]ÖZFÏ|éíåÿª_•ërıê«¯ækÕOM[³NíıRŠDeıööyHëA\\¿•,5ë]0İdı¦¼‹%5,õ(M®K_ëÅ}ºÖôÔtÕg[Mf£õØ,áX×ÛSO=Õ\"èÛ²v[OªéwÄ¥ıüç?·›Ô³,M%d§ÀØ±c¿9|øğÉåºğÙûÜn÷§*´•«E)û_ai2àè\'yÅªƒ¶Ş&‘-MÖ`ÉR)PyÕ~¢ÚËTâ½}ïô=÷Ücÿ\\ô@«¹~Uü³Ÿı,òVówÜÙ®±±Ñş°…l£÷_c=X^Ô0	Ù	‹7û•è·¾µwPÖ€ƒ¸Ç[o½Õ®C¹/hË,Y¬5Ù²ŞZÂ±Ì‚eBıgIAM²#KKõÌ´¼¨<y²}}ôèÑ‘Ï@è%X²½Œí’/òËE$HÈ–wª$¤›¦ÙìiBv’7îo+W®ì²]WW·Şårı6—‹R¿Â”\'¿. ıjÕù©{=%\Z²£ß*v®ÁvŸ¼å$E\'Å§?Y^^Şl=¶Ğòï¸òÊ+[²ÎR¶×oU9ßš–‚×ÿ~ç‡œ?+Ck³l„ìvÍ~E¿Í;</ñsæÆ\Z”‡%0Ë†4\ZÄuı;ßÍ’[GŸ…HŞB–:²«ªª,ÇY‚–îõŸEı5MÈ¶›óİ\"]3r60©5i2Y–ãƒ:SHÀ–w‹dùˆş0¤mf²SäÁt3æ‹®8•ŸêpOü½°°ğâ\\.J]4R ÑK9dÆXoª\rÙ2şä“OÚk %Ğë\'«©œqD^ÁÆ:%—ümù;zÖ*¯•SsÉcÎõ]z&«Gö ÜÖšL)|9ËŠ±×!»Ão3ˆ1¸&ò¥ñ~.§NÓ—\rƒ¸Cy{8zI˜İí™É–z–Ó~fJıgYAM²#5£ß–ëR¯ñ–‹D‡lya­Oñ\'·%pì+++Û+oãu¶É“\'o:th ×‹R>8$OvY©)}š™u–ÁÈYDñ>ø(ƒ“äÑçÁÕKC&Mšdß–à¬4ùıyqÎO«‹RÏ¶Ëšìöt\0z&+ºÉ™Rô *!_Ï®éN!Ï±F\\ŸG—´·™¿µJô^Ñ?7 €Qƒ¸Ô“,ÓˆulyLŞ½Ò/À3ßr)3ÎzÖL>ã!}R¦ÔöÔ4!;R3úû2œK¬t}Å:åŸs\\n7Î¾/ú¼Ú„ì$+--½ùŞ{ï=.lgQé6·Ûı·üüüsÙ‡\"ŸşÕo±¶¶>QJ8VaèW¶Ñç²Ö3Óòö\\FŸæGşfô¹lÿ¾iÓ¦EÀöt\0z™K¬&å9>ìäå1ù ¥¼]­ÏÃKÈNê œŠ·­‘¦ƒ¸ÔœBOŸE(ŞéúôûèelúøÄ‰\n\0éRÿYÚ_PÓ9²e¼–q9:\'è ın“3dËÒùœ„ˆÓ3ÜÎÓn²S`äÈ‘¿¯­­=ÑËFT8<*ËD†ÒŸ¢Ì¾ÖUë)	Ù)”sî‹fè/2»ş³¸¿ ¦©Ï„N®À×ªw19]İİwßış¼yó§2`ïÛ·ïdIIÉn·Ûí¡(ie§éèÛÁ,¡¿ ¿ ¦©O\ZõyªTğíQ\\\\|`áÂ…Ÿ§j;°¥(ie—\rÊ‰ÎZñ!Gúújšú¤QŸ%gú(**Úõä“OîMö\ZlY\"’\r3Ø%E™Á}{˜·“é/è/¨iê“F}&sF[â—å¬#;vìø¬£§é“³ˆÈ‡3}\r6EIQæXĞ–¯Uæ›é/è/¨iê“F}&›Ëå*WaûãGyä­íÛ·ïMô›ëëë×ÉìõĞ¡CgeòYD(JŠ2\r¶Zy|?ƒ1ıı5M}Ò¨Ï‘p¬Brµj;KKKß™:uê\ZÓ4ßüğÃw8Cõ>^»ví†ÚÚÚÕååå›ä«Òå›3õ‹f(JŠ2‡g´y;™ş‚ş‚š¦>iÔg\'Ïl_ÜËU{_µªYá¶Gµ5ª=¦Z¿’’’³(J\ZE™qƒ2ƒ1ıı5M}Ò¨OP”4Š2‰ƒòcúújšú¤QŸ (ieòw¤ò8¥ıı5M}Ò¨OP”4Š2yÂ2è/è/²@~~şWUMŸ¤ò¨Oê%¢$dÓ_Ğè/’¤´´ôtUÓÇ©<ê“úEI£(	Ùô4ú‹$‘“¨š>FåQŸÔ\'(J\ZEIÈ¦¿ Ñ_$IqqñÙª¦?¥ò¨Oê)\nñÄOïvLå	©„lúZ®õ………ç©š>DåQŸÔ\'2RCCÃ}ûöñäOÓ¶k×®ß©¢ÜÂ3•MAËµş¢   »ªé¿SyÔ\'õ‰ŒdÆ+W®üÇÇüOŠ ½^ñJAƒÁªİÅ3•MAËµşÂív÷P5½ŸÊ£>©Od,uĞªWWëämY/”©íùçŸ·¿¹3“ÿ&ÇbIÈ¦¿ åj¡Bö…ª¦÷Ru¹[ŸY2¦3#+ÖR)È~ıúuco²d¶¢¢¢ª¦w³\'èÓt!—Ëu½*ÆRn·›o£Cá\n/V5½“=AŸ kCö\")Æp[Ç¡CÙ\n\n\n.U5ı{‚>@×áµz[7º²gèdtÈşªéíì	út\0]W„K[Ïf³6›@F‡ìW5ı.{‚>@×`‹YlİÜn÷ì!:d\0™IõáW¨šæ¼Âôé\0º¨\0—Ç\nØá¶†=D‡ 3åçç÷RA{3{‚>@ç_ÜYlÖfÓ!Èl………ßU}øFö}:€Î/¾¥­lÎ4B‡ s\\­Bö_Øôé\0(Hpü$/dOÕôzö}:\0\n\0ÉÙÿ¡jú¿Øôé\0(Hpü$‰Ûí¾AÕôŸÙôé\0(Hpü$/d_ÕôŸØôé\0(HäÀñ/½ôkìi õ†r£\nÚ«Øôé\0(H¤Éñ÷ÔoğÌhè©[E90r=`òú›ìíF/Tìõ›ı£›\'`N”í£ÿFuõ‹g¨Ç\'ËõŠZ£7{HYÈş\nÙ{‚>\0‰4<ş£}æ•*TOŠµ½ìè =Ê¿ì¼ê¹æY¿Qç¼ßŞ>s‚×g÷úC7«ÇŸ–ûÊêÍsØó@JBv²W°\'èÓPH³ãË*jƒWÅÙ*HK¨®¬_u‰é–YîÊºàå~sœls]ğüJŸq›=Ã­¶Ìı!ÌË}>c¾üö>\\·¸\\®WÙôé\0(H¤ÙñW¸Ö0fË	Çºë íñ›…z™HEÀtÙ÷ómÑÍ–“Ø?ìË^R²oS!ûö}:\0\nitüUH®²g§UÈ–Û²¬£iÖ¹á‚È6~£®ººú4ÏoéÚà…²½ÓCyü!·ŞîºĞ¥êşÎuŞ^ŸQê­7/c¯©áv»¬BöËì	út\0$Òàøß7³±»7º[¯•vÎHËõZkYÒœÍ«%Ë¬´„m{›€y§s–ZıÌ`oÀ(k>“m<ÁRGì;TM/fO0¦  ÑÅÜ…–sıµ,©ğÓÛH—KYg-MÎ0\"k²å>	ÖöÏøÍqÕÕf7ı32c-ËCFùƒ½*ü¡r¹ï€y3Ù@JCö`Õ§¿Ä`L@A\"Í¿h½Æ:š|x1z¶pûÃ’á%&öv>c¼ÜWá7jtà–€-÷y}¡gœa@RCv¾Ûí~‘=AŸ€‚Dš9SˆÌ>ÇÙ>£2ú>YŸ-§ûÓÁ\\B·õ¦ûCSœMÖesV ¥!{¨\nÙÏ³\'èÓPàøH^È.T!ûYö}:\0\n\0ÉÙÃTÈ~š=AŸ€‚Ç@òê¹Dµ¹ì	út\0$8ş\0’WÏ#T›Ã O@A‚ã yõ\\ªÚlö}:\0\n\0Iâr¹îS5=“=AŸ€‚Ç@òBv¹ªé\0{‚>\0	?€ä…ì\n·Û]Ë O@A‚ã y!»R…ì_³\'èÓPàøH^=Qí1ö}:\0\n\0É«çqªMaOĞ§  Áñ¼zş¥j5ì	út\0$8ş\0’WÏUª=Ì O@A‚ã yõ\\­ÚDö}:\0\n\0É«çÉª=Ä O@A‚ã yõ\\#ë²Ùôé\0(Hpü$¯§ÈFØôé\0(Hpü$¯“se³\'èÓPàøH^=OWÍË O@A‚ã yõìSm4{‚>\0	?€äÕsj÷³\'èÓPèÜc½Twm{\nÈØ\ZŸ¥ÚHöc:\0\n{¬¯UíDk!Ûår\rdO[ã³U+eO0¦  ÑùÇ{y+!{M¿~ıº±—€Œ­ï9ª`O0¦  ÑùÇûÚx!ÛívßÉ2º¾çªVÂ`L@A¢ky¬µÙë˜Å2¾¶ç©VÌ`L@A¢ky‹µÙ¬Å²¢¶ç«VÀ`L@A¢‹¨P½ˆYl ëúóß©æbO0¦  Ñu!ûzÇZìì ó©Z~QÕv>{‚1\0‰®=ööÚlf±¬©é—TÈÌ`L@A¢kıµ «jz±\nÙw°\'ÓPÇ²¬nï½÷Ş‚µk×~\n…¬+VĞÒ ƒA«¡¡áÕŠx–\"‡ûó¥|ˆ™1½\0PIvcc£µoß>ëóÏ?§¥QÛ¿¿µjÕªC*pßÅ39ÚŸ/S!ûVöc:\0\n2ãÈ6;­ƒöç+V¬ØÂ39ÚŸÿQ…ì›ÙŒé\0(ÈŒ#KD³éİTÈ>Á39ÚŸ‡ÒŸ=Á˜€‚Ì8²ş— ›ö!›ç4r’Ûí6TÈş{‚1\0™µ!ûÓì±Ş[7×Ú|Ønr]î#²†ìU*dßÈ`L@AfeÈ>rp—µéUÖ__Û¬É}òA˜\r¤¨?ÿ“\nÙ}ØŒé\0(È¬Ù;7¿Ü\"`ëöÑæ¥aB6ªş||›+{‚1\0™•!{‹ù«¸![#²õç¯«}{‚1\0™•!{ÓŠê¸![#²õço¨}\r{‚1\0IÈ¦²$Qû/W³\'ÓPY²ål\"ñB¶<F&d)\nÙ¿Ë`L@AfeÈŞ¶º.nÈ–ÇÂ„l Ün÷æüüü^ì	Æt\0dV†ì»6Z›^›Ør©ˆºO#²…ì­*dÿoöc:\0\n2+C¶´÷×Ïk²å>B0!Ha¾M…ìËØŒé\0(ÈìÙŸ}fmûó¬–KEÔ}òA˜\r¤¨?O…ìo³\'ÓPY²åß]ˆ»&[ã[	Ù@Šúó\n\n\n.eO0¦  ³\'dö™µg›a½õê/ãlİdÙ–YmB6äş|gaaáÅì	Æt\0dV„ì¶f¯™Õ&dÔŸï.**êÉ`L@AfEÈnÏìuk³ÚcB6¤şüãâââÿÁ`L@AfEÈ>Õ€­Á˜\r$©?ÿdØ°aç³\'ÓPY²i„l ¸\\®ƒ%%%ß`O0¦  	Ù´NÙê9­\n#‹x6#Û¸İîÃƒ\r:—=Á˜€‚$dÓ:-dK¸Vm©j\'xŞ#KûóO‹‹‹ÏfO0¦  	Ù´”‡ìèp­Ïfda~¬¤¤ä,öc:\0\n’MKYÈv¹\\×Ë²èpMÈF÷çÇKKKOgO0¦  	Ù´¤·çŸŞŠ5sMÈFôç_TWWŸÆ`L@A²iIo­k\Z-Û½4c:{  	Ù	´Èq²<h;vÌzóÍ7íûœÍ4Í?\'?3uêTkïŞ½‘Û555mş½E‹Y={öŒûøÛo¿mmØ°!æß{öÙgÓb¹È!Cú«ç÷\ZÂ\0Æt\0$!;nûêW¿jõíÛ×Ùf%hËå´iÓ\"!\\o{î¹çÚAXî[µj•µtéRkÓ¦Möí×_İZ¾|¹}}ÿşı‘ŸÙ¶m[äú’%K¬K/½4r»±±1f –ßõÊ+¯XÃ†\r³Fî{òÉ\'­—^zÉ¾®Ã}W~ğÑívPÏóFB6ºJéì¥_c/€1  ‘¦![Ú¡C‡\"wŞ¼yöeŸ>}t°Œl\'¡ÚçóÙ÷=õÔSöeAAõÜsÏE~ş…^hš¯¹æ\Z;,WUUYİ»w·&L˜	ÏÑ3Ô:”Kè¿òÊ+›…ì¼.œÑw\n¿ğÌv#!±xê‚7xf4ôÔ­¢Î¹0yıÆMöv£Ç*öúÍşÑÍ0\'ÊöÑ¿»ºúÅ3Ôã“åzE­Ñ›½\rÆt€‚D\Z„l™m^½zµ\\e†Xb=S-3Ô[·nm²uPv†q™u–i}ûÈ‘#-B¶ŞÑ3ÙÎÇäïê@-×å÷è¦ÿ¾¾~ıú´û2šğÌö\ZÍˆg´Ï¼R…êI1Ã¸\nØÑAz”ÙyÕsÍ³<~£Îy¿¼}æ¯Ïîõ‡nV?-÷•Õ›ç°—Á˜Pèâíº²VZ_ÖOúS{©Æk¯½Ö,dïØ±Ãš3g}ßu×]ù9™}–ûn¿ıö˜¿¿µ™l½æ[f®õö².[–‹H\0…B‘&³Ùr¹sçN¾V%–7TÔ¯Š²U–P]Y¿ê=Ó-³Ü•uÁË+üæ8Ùæşºàù•>ã6{†[l;˜ûC™—û*|Æ|ùìm0¦$Ò0dKÓ8z&»GöZl¹ï£>²×sË±–µØòxYY™ı˜áDg²÷-X° r½wïŞÍÖfë+!™DâZOÀ˜-K<$Kèv>®ƒ´Çoêe\"Óeß0üÍ·5F7[NbÿL°/{Œé\0‰4Ù²4äı÷ß¬·ÖxÔj”ívïŞm_J€–™ki²ÌäÆo´¯Ë	İG=¥™lçö7n´¶oßn_¿õÖ[›…ìX–$d#­vÀ¨²g§UÈ–Û²¬£iÖ¹á‚È6~£NÎEíñãí ]¼PB¶wzè\"?äÖÛ=PºTİ?Â¹ÎÛë3J½õæeìi0¦$Ò,dŸ~úéöõ,µÌ.Ë¥,ÉsÌd;Æ¹†Z_NŸ>½Å¶ò;ã]DfÃcıî3Ï<3ôûõëGÈFFºofcwo t·^+íœ‘–*êµÖ²¤)8›WK —Yi	Ûö6óNç,µú™ÁŞ€QÖ|&Ûx‚½\rÆt€‚D\Z†l™MÎŸzOŸ§Z€1^È–ÙæèĞìœñÕbmëwËKôuı¡Ìè¥$„l¤3Yâ\\-ËD*|Æôè.—²ÎZšœaDÖdË}¬íŸñ›ãª«ÍnúgdÆZ–‡Œò{UøCårßó\nf²Á˜PH³-MÖ^ËÒç}²ü#/üGç)ü$(_pÁö¥|RÎ±]^^nß~üñÇíŸÑ§Œn˜{õêÕê¿E¾\'zÆ\\>è8iÒ$û¶,#!d#ÓH€Ök¬[<æy¢×hK\0·?,^bboç3ÆÛáİoÔèÀ-[îóúBÏ8Ã8À˜PÈãkÕ3¡²Ñr¦™}²}Feô}²>[N÷§ƒ¹„n	êM÷‡¦8›¬Ëæ¬\"`L(H²	Ù\0À˜€‚$dÓÙ\0ÓP„l\Z!\0Ó\n’MÈ&d\0c:\0\n’MÈ\0Æt\0$!›FÈ\0Æt€‚$dÓÙ\0À˜€‚$d²€1\0IÈ¦²€1  	Ù4B6\00¦$Ù„l\0`L@A²i„l\0`L(HB6\r\0Œé\0‰æB¡A6½Û1²OğLÀ˜€‚Ì \r\r\r{öíÛG˜MÓ¶k×®ß©½…g*\0Æt\0d1ã•+Wşãã?ş\'¡6½f°%`ƒÁªİÅ3\0c:\0\n2Ã¨7pÅŠëdY‚¬ÿÍä&Ç?Óÿá&Çb\0c:\0\n\0\0}:@A‚ã\0 O@A‚ã\0ôé\0(Hpü\0ôé\0	?\0€>\0	?\0Ğ§  Áñ\0Ğ§$8ş\0\0út€‚Ç\0@Ÿ€‚Ç\0@ŸPàø\0èÓ\n\0\0}:\0\n\0 O@A‚ã\0 O(Hpü\0ôé\0(Hpü€>\0	?\0€>  Áñ\0Ğ§  Áñ\0út\0$8ş\0\0út€‚Ç\0@ŸPàø\0èÓPàø\0èÓ\n\0\0}:@A\"{õR9Şm´uì)\0`L@A¢ıÇúZÕN´²].×@ö\00¦  ‘Øñ^ŞJÈ^Ó¯_¿nì%\0`L@A\"±ã}m¼ív»ïd@Æôç,ÙÈ€y³Ø\0Q}9K\0B6Ò½c¦#€ŒìÏY²‘NT¨^Ä,6\0düÎ@€4Ù×;:âì\0ÈØqœ%€\0!éØ1Ó@F÷å,ÙH·yğàÁ\0Èp,ÙH/²LÄ\n_\027d³È¶]]]}Z2ş¥³—~­ıóÅ38rÖ_µƒªÍ_òÖ\"\0döxÎ@ SC¶§.xƒ×oö¯¨3züfaS3f–Õ›çD‡`ÏœP]mÚ…î™ÑĞ³¢Öè]áMí3¯Œõ»+æÂX÷?PºÔë3›½*¯ğ5ò»+jƒ&+äçhÀÖÁZöï~‚6\0¤?·ÛİÃår©á{ècª™ªíŒúĞã9}ŸÚæ·jÛ{Ôõo±×€4Ù^°¯n*»<s¢¾íñ…Æ8Â²Ëëİì\r„Fª\0ş„„jOÀ˜=ûì­7/óøCn	í²½l¹î7ÿÛæäÊúU—HØ–mT¸Ùûs„wzè\"b‡v[÷\0ÒÀ!Cú‡×^kÇ7=:›|(rj%Ìri²«çšgUÖ/—°,Aº¢6x•}=|©·å_vğŠ€1Hf¡e¶¹\"Êş}j›;½~ã&¹^é3n“fj¤õuûï†gÃííÔß—&³äòwU»#˜miı8ëù\0 }Æi9{Èºƒu¼¶Ef·Ù«@\Z…ì¦\0lüŞ½ö…išÅ6û{|Fe$8Ï0¯ÏD‘Ùè\n¨ÜãydÆ¹Âo“vßÌÆî²­\\—ÙiYJ¢~ÇøQş`¯ğõÊûë‚çÛOf»ÕíÑ>ã{²D¥éï…Š½ĞİM×Í	ê9Š	ì¶43Ú\0&T ~4úô|………Ö£>j-X°ÀÚ¼y³µgÏëØ±c–8~ü¸µoß>ëİwßµ.\\hoW\\\\+l/W¿çbö0!Û^0Ê$Ëò\r{µ\n¾ÎYçHØV¡YÖJKè\\w,)±´ß˜\ZÙŞoÔÅº¾=S.%œKhoZRbö—õİÎYn´+8HÑö\0€$ÊÏÏ?\'¼Ş:ŒKJJ¬gŸ}ÖÑ‰8zô¨µxñbËãñXQçÒ>¨.û±·.Ù*ìÖ!·ÂgÌo\nºFÍ(Ãz{)‡ıaÈĞ\\	ß€ÑG–Ècêg¦;Ÿ„d{æÚÚíà®~góíÌqöe ”/×uÈV!}G/¡À<ğ~îA\0º$`7:qUU•=cİ\'O´–-[fÏ„;~÷Õîb¯]²%Hë6}ğ0ô[½t£ÒüŞNÖXëEÚËDjŞ²œO>éüÎŸSaÜ¯¯ËÒçv²4Å^0GÈlú—Á<4…£—²€¬Ÿ\0$>.7›Á–e!“e×®]ÖØ±cAûß	tQÈúTy2;í\\\"ò@À¼B.íåcPÓéûŒñö‡ı¡ò¦@ıå£ÙÁÙrÇzÌ^³í7ş`ÿ]_¨6¼§‡.’àÍÑkU[rììß\0hCx\rv$\0¯]»ÖJYÃ-ëµ3Úêo_Á\0:1dÛ³Æ*ÔF–sÔ¯’`­oËYBäR>¬(A\\–qÈåƒ‘‘ßá7ã}@Q‚ykg	Ñ_R#v”K9% |\0Ó¹Lqƒq²–z0£\r\0©¯u~ÈQf°SI>$YSSÓìüÚrnĞI!\'úC‹_Qmxø2Ñ?Ç‡! …\\.×_œk°“¹D$Ã‡[÷Ş{¯óÃ38\0!ñö@GP~B5+|ÙŞ ïçÚ\0òE3Î³ˆtôC‰xã7¢?ù-@ÈFü€-†‡ƒ²•@Ğvlİ†9g6\0$,^ªƒ®œ¦¯³M›6Í´ãˆ\0„l´|cæÖ‚v¬íçÄØ5Ú\0$²ZUºœ^/Ñó`\'ÃöíÛ›?»¤¤ä€MÀn}	G{ƒv{vtĞfé\0ÄĞ+Tû~kÛ¨P;T\\9ãGWq~Yú7ßÉÑÙ¹¬½A·­ hÀvşııyÌh@Ü16ZW¨0}}œmë¬3Š´æ…^à\0!y‰/Ùˆ´O;Å€­±F\0ÚÙ¶<zfÛùå3[·ní²-çäv¾(àè„lvûÅ\nÚït `wôß\0¹²#!V‡mu{§¾¿3Ï*íÃ?lvÎlœà‹ğ	ğ?WíŸª}ªŠÿ°|øA]? Ú>Õöª¶;ÜìPí}Õş¦Ú»ªmQÛoV—o©¶Aµ7U[¯Ú©¶Fµ?©Ö ÚJÕBÒ¹¨Ë?ª¶Lµ?¨¿ó²j‹Ôõ—Ôc/ªËß©öœjÏ¨ÛO«Ë¹ªÍQíqÕf©mëÕe@=V«.§«ÛÓTû•|S–j¨ûV­Zµ*uÿußxÕ~¡nQ·+U«P·G©V¦î©Z©j#Ôıw«û†«V¤n¨¦îrå«Û?•õiêö ùêYÕn-((¸EN¹¤îÿ¡º¿Ÿj}Õí>êö\rê±ÿ/PÛ]£Úÿ-,,ün~~~/ù6-uûrÕşMİş¶ÚîRõØÅjÛÿ©»PİwÁ°aÃÎ—œ¨ûÏS·ÏQí¿İzë­göë×¯[ø[7;:s+hw$`GmÖh@!Û9³í¼-ßÄØUäËiœÿŞ$Ä©@w†„ºâââ³\r\Zt®„=uû¿Kø“XTTÔSB¡ºı¿ä<šUPüw	\"Õí+%TªÇşŸºÿ{6e\rš„O	¡j»›$”J8U÷ß,aUİ»ºïÇbÕíÁj%Üº›©ÛÃÔí	Áªİ+¡XÂ±º¿\\Â²ºíU·­n?(¡ZÂµj%l‡C÷J—uoêö¯%œ«ÛşpXŸ¥Úl	ñêş\'ÕåSîU›/a_B¿Úî÷áKÂ§YZ¦n¿\Z~±\n¿Õ×~1ñçğ‹‹uª½!/:Ô¶Ã/B¶¨öNøÅÉ{ª}~Ñ²+ü\"F^Ì|~qs(|¾RyÑóYøEĞá¯£kå$¬GÏ`¿¾¿#f´c@¡Ñh4ZœÖÕÙ\0rYG¿2½µ™ìD¾°†™l\08õ™ìuòÎ¨Lp1“\r\0éCí‘¼Ô¬É>• Íšl\0h_È„kÇ6¬É€4Ú‰ÌÇ;M_¬³‹$´9»\0´²×È²Hg¸vlÃÙE\0 Mƒv[·­ó`\'úÍÚµyœ\'i¬ºúÅ3ÚÚæ¾™İÛ÷»ÌnìQœBÈn1sc›@:œ\'[ş¶ãEA€£ ×µ5“ÜŞ/šI4hë%+|+ÒF…ßíüNävÀtyf˜WÇÎÕ§y}¡gôíQşeç•Õ›ç4]o¸Àë7nÒyf4ôôøÌ	rİù7¨]êõ™Ã=¾Ğ˜ŠÚàuŞ€Qfo+ÍoVÖ¯º„#ƒÖ„ÏhÕåßø8vìXgÈ¾‹#\0ñg´ı&Çömı÷ØH½ĞÈ¦ğlv“YlºkäÒ0úÈŒµ„j„¯Ò!¸ÒgÜ&?£oK¨~ `^	Ö¾Pm8Dğø:u»Øë7û{æ÷×Ï×KıÜÔ¦ë/¡ÿ\rvÈ÷Ó92hKøT®Ç$ÜªëÖáÃ‡»z=ö1ü{pd\0 ‰ÌhG/İ—øy°cíaQ‡5ØH;2k­ƒ­i™•Vax¢„oiz¹‡wzè\"ÙVÂ²\nÇ“dZ®WøÍqÕsÍ³d	ÚÈ¥ö™WÚ3Ôş`ß¦¿ÊüMõwìĞí7fªß9Âã£ªéw«û}ÆxÚÃ¹.{áÂ…²gÍšåÙs9\"\0Ğ2h;?éÌ‰|ÑL¼Ÿã4}HÓ€Ê—,3ÊŞzó2	Ë¬%pËLtE­ÑûËmA2ƒ­yøKd©IŞÆ½ö‡¦Øá[ı¬ÌhËìµ„m?ä‘™qÙÎ¹üú=óå¶§.xƒ^nbzõó´‡sÉHYYY§Êo×®]öºşûWsD\0 ¥è¥#‡å%~Z¾èŸëèù¹”’™æÊºàåöu|õ¶=‹¡‡éÑM3Ù¡›=~óåÈ¬³?ôÛf¿Oı	Íàeö[‡kç:m;XûÌ	2{-—‘¥(>£Ò^~â3©´Kø|Ùoé »xñâNÙ?üp$`Ë¯q4\0 ıA»£b-EÒFÓZéĞ	µòE	¼‘ğ0fKà„ç@h¤Ì^Û÷û§eV[–’D@RfÆ›Â{hJÓúîP¹|Ñ9S=Êì%KNäïêCÚÛÌ²\\EÏ’íáœÍ–™å>ø å{Ù²eÎe\"\'ä››9\0Ğ9A›/šAÚû2àÚl¼P‚q$€Œ*ç¶MT4\'Û3Õ2ûlâ`¯/·?(é÷øCn;ŒûŒñ2ƒ-a\\íiMáZ´ú=®¡»ågävE9ĞÙV?#×eœ£ƒD¨ »T‡ŞÊÊJëèÑ£)Ø«W¯n¶LDµ‘\0hŸ.ñ`‰Ò>µ^Ólv°¯½ÛoÔè™lgà–ÓéÉ)öd6ZB³¬³¶Cº/ôŒl§O·\'aZÎFâõ¥ÚåwÛ§ô³gÁÍn¿1XŸ_[Î:âü÷Hh·Cwx]8G‰ÈÏÏÿ¦\n»ûuğ­©©±¿î<»¤¤„;@‚v¢3Ñ|ÈÁQvÌWú‚?µÑ‘î¹åRÂ·óô|rnëf§ë˜Q?&gÑ§é“Ûö¥}ÆæOŸPf®íà®¸=ë0É‡09BH”Ëåº^µƒ:\0Ëšé$u‰HÔörîyA\0§ Ñ%,€.$_Á®Ï-MfåkÏ;z‘‰\':Ã5\0:1hËW¥óM\0ĞÅ†Ò_…à#ÎP,ß¹uëÖ„¿hFÎƒ5{m/!`@rè­<¾Ÿ€\r\0éÁív_¡ÂğÎ¨pl\Z5Êzşùç­ÆÆFû,$zİ¶\\J¨–YïXãÆ‹ÖöYDø#\0$_¼m–ˆ\0@\Z’Ùf¶Õ>•&çÁæ4}\0ĞyA›€\r\0i®°°ğb”\';?ÙÎ&k»çòM\0Ğ¹A{\02GIIÉYáõÚÉc,\'Ùãv»W¨Ë€\näCÕõì5\0è\\²ÛÊã4}\0\0\0@R}ƒ]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˜ÿÑv>…£\0\0\0\0IEND®B`‚',1);

/*Table structure for table `ACT_GE_PROPERTY` */

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;

CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_GE_PROPERTY` */

insert  into `ACT_GE_PROPERTY`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1',1),('schema.history','create(5.22.0.0)',1),('schema.version','5.22.0.0',1);

/*Table structure for table `ACT_HI_ACTINST` */

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;

CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ACTINST` */

/*Table structure for table `ACT_HI_ATTACHMENT` */

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;

CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_ATTACHMENT` */

/*Table structure for table `ACT_HI_COMMENT` */

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;

CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_COMMENT` */

/*Table structure for table `ACT_HI_DETAIL` */

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;

CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_DETAIL` */

/*Table structure for table `ACT_HI_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;

CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_IDENTITYLINK` */

/*Table structure for table `ACT_HI_PROCINST` */

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;

CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_PROCINST` */

/*Table structure for table `ACT_HI_TASKINST` */

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;

CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_TASKINST` */

/*Table structure for table `ACT_HI_VARINST` */

DROP TABLE IF EXISTS `ACT_HI_VARINST`;

CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_HI_VARINST` */

/*Table structure for table `ACT_PROCDEF_INFO` */

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;

CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_PROCDEF_INFO` */

/*Table structure for table `ACT_RE_DEPLOYMENT` */

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;

CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_DEPLOYMENT` */

insert  into `ACT_RE_DEPLOYMENT`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('24985da3-0953-11e7-907f-484d7ea6ec6b','E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn',NULL,'','2017-03-15 15:43:55.000'),('af0538f2-0953-11e7-821f-f48e38b58b4b','G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn',NULL,'','2017-03-15 15:47:48.000');

/*Table structure for table `ACT_RE_MODEL` */

DROP TABLE IF EXISTS `ACT_RE_MODEL`;

CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_MODEL` */

/*Table structure for table `ACT_RE_PROCDEF` */

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;

CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RE_PROCDEF` */

insert  into `ACT_RE_PROCDEF`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('leave:1:254391c6-0953-11e7-907f-484d7ea6ec6b',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹','leave',1,'24985da3-0953-11e7-907f-484d7ea6ec6b','E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','è¯·å‡æµç¨‹æ¼”ç¤º',0,1,1,''),('leave:2:af566635-0953-11e7-821f-f48e38b58b4b',1,'http://www.kafeitu.me/demo/activiti/leave','è¯·å‡æµç¨‹','leave',2,'af0538f2-0953-11e7-821f-f48e38b58b4b','G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','è¯·å‡æµç¨‹æ¼”ç¤º',0,1,1,'');

/*Table structure for table `ACT_RU_EVENT_SUBSCR` */

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;

CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EVENT_SUBSCR` */

/*Table structure for table `ACT_RU_EXECUTION` */

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;

CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_EXECUTION` */

/*Table structure for table `ACT_RU_IDENTITYLINK` */

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;

CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_IDENTITYLINK` */

/*Table structure for table `ACT_RU_JOB` */

DROP TABLE IF EXISTS `ACT_RU_JOB`;

CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_JOB` */

/*Table structure for table `ACT_RU_TASK` */

DROP TABLE IF EXISTS `ACT_RU_TASK`;

CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_TASK` */

/*Table structure for table `ACT_RU_VARIABLE` */

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;

CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ACT_RU_VARIABLE` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `process_instance_id` varchar(255) DEFAULT NULL,
  `reality_end_time` datetime DEFAULT NULL,
  `reality_start_time` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `oa_leave` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'éƒ¨é—¨åç§°',
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dept` */

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` varchar(32) NOT NULL,
  `ref_id` varchar(32) DEFAULT NULL COMMENT 'é¡¶çº§id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT 'çˆ¶çº§id',
  `level` int(1) DEFAULT NULL COMMENT 'æŒ‰é’®çº§åˆ«ã€0ï¼šèœå•ä¸€çº§ï¼›1ï¼šèœå•äºŒçº§ï¼›2ï¼šé¡µé¢çº§ã€‘',
  `permission_name` varchar(100) DEFAULT NULL,
  `permission_url` varchar(200) DEFAULT NULL,
  `permission_desc` varchar(50) DEFAULT NULL COMMENT 'æ ¼å¼ï¼šproject:create',
  `sort` int(10) DEFAULT NULL COMMENT 'æ’åº',
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`ref_id`,`parent_id`,`level`,`permission_name`,`permission_url`,`permission_desc`,`sort`,`is_valid`) values ('1',NULL,NULL,0,'ç³»ç»Ÿç®¡ç†',NULL,'system',0,1),('10','1','3',2,'ç”¨æˆ·é‡ç½®å¯†ç æŒ‰é’®','user/resetPassword','user:resetPassword',0,1),('2','1','1',1,'æƒé™ç®¡ç†','permission/list','permission:list',0,1),('3','1','1',1,'ç”¨æˆ·ç®¡ç†','user/toList','user:toList',1,1),('4','1','1',1,'è§’è‰²ç®¡ç†','role/toRoleList','role:list',2,1),('5','1','3',2,'ç”¨æˆ·åˆ—è¡¨','user/list','user:list',0,1),('6','1','3',2,'ç”¨æˆ·æ·»åŠ æŒ‰é’®','user/toAdd','user:toAdd',0,1),('7','1','3',2,'ç”¨æˆ·æ·»åŠ ä¿å­˜æŒ‰é’®','user/addUser','user:addUser',0,1),('8','1','3',2,'ç”¨æˆ·ç¼–è¾‘æŒ‰é’®','user/toModify','user:toModify',0,1),('9','1','3',2,'ç”¨æˆ·ç¼–è¾‘ä¿å­˜æŒ‰é’®','user/modifyUser','user:modifyUser',0,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `roleKy` varchar(32) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `role_Code` varchar(45) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`roleKy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`roleKy`,`role_name`,`role_desc`,`create_time`,`role_Code`,`status`) values ('10000','deptLeader','deptLeader','2017-03-14 09:43:05','10','1'),('10001','hr','hr','2017-03-14 09:43:20','11','1'),('10002','user','user','2017-03-14 09:43:31','12','1');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `grant_id` bigint(19) NOT NULL,
  `role_ky` varchar(19) DEFAULT NULL,
  `menu_ky` bigint(19) DEFAULT NULL,
  `status` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²èœå•å…³ç³»è¡¨';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `permission_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`id`,`role_id`,`permission_id`) values ('1','10000','1'),('2','10000','2'),('3','10000','3'),('4','10000','4');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL,
  `dep_id` varchar(32) DEFAULT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'å§“å',
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `del_flag` tinyint(1) DEFAULT NULL,
  `del_time` datetime DEFAULT NULL,
  `del_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`dep_id`,`nick_name`,`name`,`password`,`salt`,`sex`,`email`,`phone`,`mobile`,`address`,`locked`,`create_time`,`create_by`,`update_time`,`update_by`,`del_flag`,`del_time`,`del_by`) values ('10000',NULL,'admin','admin','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,'1','2','3','4',0,'2017-03-14 09:41:34',NULL,NULL,NULL,0,NULL,NULL),('10001',NULL,'hr','hr','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-03-14 09:42:04',NULL,NULL,NULL,0,NULL,NULL),('10002',NULL,'test','test','e10adc3949ba59abbe56e057f20f883e',NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-03-14 09:42:13',NULL,NULL,NULL,0,NULL,NULL),('384a617f05154508b8c895a63e600a1d',NULL,'11','22',NULL,NULL,NULL,'1072411603@qq.com','44','33','55',0,'2017-03-14 21:26:21',NULL,NULL,NULL,0,NULL,NULL),('b22c9fb3040f4c17b1b0eddf05264d56',NULL,'qq','ww',NULL,NULL,NULL,'1072411603@qq.com','445','12','22',0,'2017-03-15 10:46:29',NULL,NULL,NULL,NULL,NULL,NULL),('c49b261204294ee9ac18b568e0e986d1',NULL,'a','bc',NULL,NULL,NULL,'1072411603@qq.com','d','c','ee',0,'2017-03-14 21:23:42',NULL,NULL,NULL,0,NULL,NULL);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values ('10000','10000','10000'),('10001','10001','10001');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

/*!50001 DROP VIEW IF EXISTS `act_id_group` */;
/*!50001 DROP TABLE IF EXISTS `act_id_group` */;

/*!50001 CREATE TABLE  `act_id_group`(
 `ID_` varchar(45) ,
 `REV_` int(1) ,
 `NAME_` varchar(45) ,
 `TYPE_` varchar(10) 
)*/;

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

/*!50001 DROP VIEW IF EXISTS `act_id_info` */;
/*!50001 DROP TABLE IF EXISTS `act_id_info` */;

/*!50001 CREATE TABLE  `act_id_info`(
 `ID_` binary(0) ,
 `REV_` binary(0) ,
 `USER_ID_` binary(0) ,
 `TYPE_` binary(0) ,
 `KEY_` binary(0) ,
 `VALUE_` binary(0) ,
 `PASSWORD_` binary(0) ,
 `PARENT_ID_` binary(0) 
)*/;

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

/*!50001 DROP VIEW IF EXISTS `act_id_membership` */;
/*!50001 DROP TABLE IF EXISTS `act_id_membership` */;

/*!50001 CREATE TABLE  `act_id_membership`(
 `USER_ID_` varchar(32) ,
 `GROUP_ID_` varchar(32) 
)*/;

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

/*!50001 DROP VIEW IF EXISTS `act_id_user` */;
/*!50001 DROP TABLE IF EXISTS `act_id_user` */;

/*!50001 CREATE TABLE  `act_id_user`(
 `ID_` varchar(32) ,
 `REV_` int(1) ,
 `FIRST_` varchar(100) ,
 `LAST_` varchar(100) ,
 `EMAIL_` binary(0) ,
 `PWD_` varchar(100) ,
 `PICTURE_ID_` binary(0) 
)*/;

/*View structure for view act_id_group */

/*!50001 DROP TABLE IF EXISTS `act_id_group` */;
/*!50001 DROP VIEW IF EXISTS `act_id_group` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_group` AS select `sys_role`.`role_name` AS `ID_`,1 AS `REV_`,`sys_role`.`role_name` AS `NAME_`,'assignment' AS `TYPE_` from `sys_role` */;

/*View structure for view act_id_info */

/*!50001 DROP TABLE IF EXISTS `act_id_info` */;
/*!50001 DROP VIEW IF EXISTS `act_id_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_info` AS select NULL AS `ID_`,NULL AS `REV_`,NULL AS `USER_ID_`,NULL AS `TYPE_`,NULL AS `KEY_`,NULL AS `VALUE_`,NULL AS `PASSWORD_`,NULL AS `PARENT_ID_` */;

/*View structure for view act_id_membership */

/*!50001 DROP TABLE IF EXISTS `act_id_membership` */;
/*!50001 DROP VIEW IF EXISTS `act_id_membership` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_membership` AS select `sys_user_role`.`user_id` AS `USER_ID_`,`sys_user_role`.`role_id` AS `GROUP_ID_` from `sys_user_role` */;

/*View structure for view act_id_user */

/*!50001 DROP TABLE IF EXISTS `act_id_user` */;
/*!50001 DROP VIEW IF EXISTS `act_id_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `act_id_user` AS select `sys_user`.`id` AS `ID_`,1 AS `REV_`,`sys_user`.`name` AS `FIRST_`,`sys_user`.`name` AS `LAST_`,NULL AS `EMAIL_`,`sys_user`.`password` AS `PWD_`,NULL AS `PICTURE_ID_` from `sys_user` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
