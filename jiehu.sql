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

insert  into `ACT_GE_BYTEARRAY`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('24985da4-0953-11e7-907f-484d7ea6ec6b',1,'E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','24985da3-0953-11e7-907f-484d7ea6ec6b','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"请假流程\" isExecutable=\"true\">\n    <documentation>请假流程演示</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"部门领导审批\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"调整申请\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${afterModifyApplyContentProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"人事审批\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"销假\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${reportBackEndProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"不同意\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"同意\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"同意\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"不同意\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"重新申请\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"结束流程\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"270.0\" y=\"149.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"463.0\" y=\"219.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"150.0\" y=\"281.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"447.0\" y=\"304.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2540f9b5-0953-11e7-907f-484d7ea6ec6b',1,'E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','24985da3-0953-11e7-907f-484d7ea6ec6b','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0[\0\0\0\0ݒ�\0\06~IDATx���\rtT������˭/-W���^�>>^�z�VtQ�vQE�h�a��@,�bd&B�bA�#E\n���EQ�Ry�\nVf΁�AK����R\nHQ����\'�Ǔ�L�!3ɼ|?k�5o\'	�3���gϙ��(���k�K\0\0\0\0�����[�U�ɲ�|jY��m������!��9�3������������r��>�I�������\0\0\0$d��-Z_�}���Ϋ�k������r��ur�\n��=>s�_-k��Ys�Ʊ?��q/���ce��9�Q\0\0\0�U��P��O��,˺\\��6X�>+�X�+낗o��I�>�6��e�z�eMy�Ck�:u��̚h8�R=6��g̗��^\0\0@N����������l�f�z�m�zD��y�Zn��o��-��<n��r�Mj[���Y����7\0\0���������jWY#�*d�TL�\n�W�ɲ��顋<�����Х�����NXV�<�O�\Z�.o���Ro�y{\0\0\09�������|�3o[����f��V�˟/��zF.=�N��Va|�7`����*|�L��u�r{���x��	\0\0\0(��Z�?-k�\n���L#��r֐׎Z�Q׿&�I���n2S-�B�}�|l=5���7˚,�?0�`&\0\0\0ȓ�\"!O��C�.��f6v��K�YOُ���1^��5�˔K�5S��\n��癿ZK��9^_�	��U\0\0\0�v����K!벽~c�\n�C×?�p��x���F���o��5�V���lY3���U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@g�,��{ｷ`�ڵ_�B!kŊ�4h�`�jhh�D�\"������_���>�a� �}��Y��9-������U�VRz�T�_��/@}R�� 򊗂L���\\���3�4�P��\'2���ē?��*�<SAA��\0�I}\"��z!��i_��T�_��/@}R��¢��{���͵6��\\��(\Z�����>i�\'N�(��em�c���W�6kr�<F�P�i����j���>�OdDQ���r�����K)�2]P�\n_�������>�O��]�[�_�-Jy�¡(�@��6#|9�]BAAMS��\'���.�M+���<F�P�i2t�~�gP�������O���$���ߨ��d���뫪�����/,,��j���ғ���/>���fΜ9����7����(3j0n�~�_�_P��\'�I}&KMM�-\'N�KQQѿT��/^lmܸ��V��\'OZځ��[�Z����5m�4K�W�{����~��u�բ�O�+Jy�¡(�Ȁ6]�8�9�/�/�i���>����|k�����-X��щ8~���z�j롇�WYY��{�wP.��uq�R�p(�.��\Zl���������O��L�����#F�x�駭�G�Z�n�:K���#G�\\���N.�]�M�Ml�֒�O�p(�.z;y@����5M}Ҩ�X|�������7�x�J�Ç[����KJJv����\\)Jiﯟע(�>�����x�)��e��j���>������/d�u�<��s_RA���(��>���yV˷��}��CQ��`������4�I}R�!KDd;�[[�d�g*h����R���Ձ�k��1�%����4�`P�������O��L�|�Q�`oذ��,����]PP�r&�y$nQ�W�{��[��2nA�&�ȶ�\n�(S<\'�maf��/�/�i���>���|K>���***v�\\��l*ʶ^��*��삷��`�Ն�/�s|p�������>�O�-rl9M_2�\"��]�v�,((�����-EٞW���\n��(��N�`��jV��+	Ʊ~��MAAMS��\'��\Z����Z]eʔ)�U�~4[��TR7\n��L�ۿ�Ã������u�mk���_�_P��\'��x�$_�.�̘��$y6{�\nٟd������FQv�x�d����A9��sbl�zN��j���1�G�5k֣�U�]���{G��S�4Bv^����Xm} ���r{�<�fn��������>i98�O�<y�ҥK�<d��֮N�%#%Eٕ�jI����>����\Z�\Z���.�h��x�_�nAMS��ϫ���oܸ��C�ڵk7�\"0)J\Z!��矣-o�E_�o���O;������s\"d�u��/��4�Iˡ񼬬�xg|�L[��ݻG=��P�4Bv��_�E_��ᩮ��5(�Ӂ�����l\n�1��!���>i94�Z\'O��ҁ<�)J\Z!;�����/�KGg�b\r��}�;�Cv�� dS��\'-��sy���L�e�vˌl���>�O�1��N��������T��5M}Ҙ���E)���?�-�V���޽{��_����E߷c�{{�����[K�,�^z�%�\'?��}]{�\"��x��-��bm۶M�en7��o�����|mn3f̘�u�\0�����L��֩w�����+�6�ȗ[0�ݎ�.��߲��vo/���_�쾷�~;#�?f��i��jx�����[�`�u�W��w����1����k��G?��/_n]w�u֛o�iط/��Bv6��޿��4_��Ң\\�z�\n���S���#Oz	��z�����@���رc��駟n�����@|��G�aÚ�\r	��{��u���}��^��t�X?��c���>��U�VٿK��\\^t�EV�޽��:����n�{�̙���sϵ�NȎ;G~GR�~�Te�d�9^�����}\\�i��{��i7]Ͽ��o����G�}��qȦ���հ��B^��p�\rv�If��-����ۯY�ƾ|���#u�\'���,!;�&L����͛���\"��Z�2XIa9r�n��,�2H�!�fxdInK0ׁ���>�l;t�����a]�I^�����7l��	�ݻw�*++��S����}y�Y�΁��3ϴC��-/Əo_����=j������C^y���q��w�㋚�e�wJ�Xg\"HdP�����z��)dKhnm	�W]uU��]__o�/ѿ/]�?\rC65M}v�Im�q\\�h���U2�ܖڔz�~�Iו�\rR_�睏;o��DΓ�lٲ�8O�*��r�(�I^RR)\0�u\0�W�z[y+H��X�+:d˶R������\\D<�O·���L��O�>-~������C��o=���1����2sk@��ɒ�.���L�\\��\r٭�rut���s�~��k�r�<��:^�0����_�z����k��Ʈa	��亼��~k9��?�B65M}&-+H�~�W�w��]g���I�:g�u=I-ʥ�%a�Ν����E/�ER@��VSS��!���|�*�~�X��v��5+k$%H˫P	�R2��A˹>[��}��\n�2s$�uqΛ7�ٌ�\\�\0�7m�d�\'E+���#o˥�� ���w�R�r]�ZF�|�����_��r�ꫯ�k�OM[�N��R�De����yH�A\\��,5�]0�d����%5,�(M�K_��}����t�g[Mf���,�X��SO=�\"�۲v[O��wĥ���?��Գ,M%d��رc�9|��������n��*����E)�_ai2��\'yŪ���&��-M�`�R)Py�~���T�}��=��c�\\�@��~U����,�V�w�ٮ������l��_�c=X^�0	�	�7��跾�wP�������[o�ծC�/h�,Y�5ٲ�Z±̂eB�gIAM�#KK�̴���<y�}}��ё�@�%X����/��E$HȖw�$�����iBv��7�o+W�첐]WW���r�6��R�\'�. �j���{=%\Z���*v��v���$E\'ŧ?Y^^�l=������+[�΁R��oU9ߚ����~燝�?+Ck�l��v�~E��;</�s��\Z��%0ˆ4\Z�u�;�͒[G��H�B�:�����,��Y�����E�5Mȶ���\"]3r60�5i2Y�ハ:SH��w�d���0�mf�S��t�3拮8���pO������\\.J]4R �K9d�Xo�\r�2��O�k %��\'���qD^��:%��m�;z�*��Ss�c��]z&�G����֚L)|9ˊ��ם!��o3�1�&��~.�Nӗ\r��Cy{8zI���ɖz��~fJ�gYAM�#5�ߝ��R��D�lya�O�\'�%p��+++�+o�u�ɓ\'o:th ׋R>8$OvY�)}��u���YD�>�(�������KC&M�dߖ�4��yq�O��R϶˚��t\0z&+�əR� *!_Ϯ�N!ϱF\\�G���������J�^�?7 ���Q��ԓ,ӈulyL޽�/��3�r)3�z�L>�!}R����4!;R3��2�K�t}�:�s\\n�7ξ/��ڄ�$+--���{�=.�lgQ�6�������sه\"���o���>QJ8Va�W����3����\\F��G�f��l���iӦE��t\0z�K�&��9>����1����]���K�Nꠜ�������Ԑ�BO�E(������el��ĉ\n\0�R�Y�_P�9�e��q9:\'� �n�3d��������3���n�S`�ȑ����=��FT8<*�D�ҟ�̾�U�)	�)�s�f�/2��������τN��תw19]��w����y�2`�۷�dII�n���(ie�����,�������O\Z�y�T��Q\\\\|`���j;��(ie�\rʉ�Z�!G��j���Q�%g�(**���O�M�\ZlY\"�\r3�%E��}{����/�/�i�F}&sF[��#;v�����铳�ȇ3}\r6EIQ�XЖ�U��/�/�i�F}&���*Wa��Gy��۷�M���������СCge�YD(J�2\r�Zy|?�1��5M}Ҩ��p�Br�j;KKKߙ:u�\Z�4����w8C��>^�v�����������3��f(J�2�g�y;�������>i�g\'�l_��U{_��Y�G�5�=�Z�����(J\ZE�q�2�1��5M}ҨOP�4�2���c��j���Q��(ie��w��8���5M}ҨOP�4�2y�2�/�/�@~~�WUM���O�%��$d�_��/�����tU�ǩ<��EI�(	��4��$����>F�Q��\'(J\ZEIȦ���_$Iqq�٪�?��O�)\n��O�vL�	���l�Z�����穚>D�Q��\'2RCCÞ}����OӶk׮ߩ���3��MA˵��������Sy�\'���d�+W�����O� �^�JA�����3��MA˵���v�P5��ʣ>�Od,u��WW��mY/����矷��3���&�bIȦ���j�B�����Ru�[�Y2�3�#+�R)�~��uco�d�������w�\'��t!��u�*�R�n��o�C��\n/V5��=A��kC�\")�p[��C��\n\n\n.U5�{�>@��z[7��g�dt�������	�t\0]W�K�[�f�6�@F��W5�.{�>@�`�Yl��n���!:d\0�I��W������\0��\0��\n�ᶆ=D� 3����RA{3{�>@�_�Yl�f�!�l����U}�F�}:��/���l�4B� s\\�B�_���\0(Hp�$/dO��z�}:\0\n\0����j�����\0(Hp�$���A������\0(Hp�$/d_������\0(H���/���k�i ��r�\nګ���\0(H�����o��h�[E�90r=`������F�/T������\'`N���Fu��g��\'���Z�7{HY���\n�{�>\0�4<��}�*TO����� =ʿ���Y�Q���>s��g��C7�ǟ�����s��@JBv�W�\'��P�H���*j�W��*HK���_u���Y�ʺ��~s�ls]��J�q�=í���!�̎�}>c���>�\\��\\�W���\0(H���W���0f�	����� ��z�HE�t���m��͖��?��^R�oS!��}:\0\nit�UH��g�UȖ۲��iֹ��6~�����4��o�������Cy�!��Х���u�^�Q�7/c���v��B���	�t\0$����7���7�[��v�H��ZkY��ͫ%�ˬ��m{��y�s�Z��`o�(k>�m<�RG�;TM/fO0�� �����s��,��ӝ�H�KYg-M�0\"k��>	�����q��f7�32c-�CF���*��r�y3�@JC�`է�Ğ`L@A\"͎�h��:�|x1z��p�Ò�%&�v>c��W�7jt���-�y}�g�a@RCv���~�=A���D�9S��>��>�2�>Y�-����\\B����CS�M�esV �!{�\n�ϳ\'��P���H^�.T!�Y�}:\0\n\0���T�~�=A����@��D���	�t\0$8�\0�W�#T�Þ�O@A�� y�\\��l�}:\0\n\0I�r��S5=�=A����@�Bv���\0{�>\0	�?���\n��]˞�O@A�� y!�R��_�\'��P���H^=�Q�1�}:\0\n\0ɫ�q�MaOЧ� ����z��j5�	�t\0$8�\0�W�U�=̞�O@A�� y�\\��D�}:\0\n\0ɫ�ɪ=Ğ�O@A�� y�\\#����\0(Hp�$����F���\0(Hp�$���se�\'��P���H^=OW�˞�O@A�� y��Sm4{�>\0	�?���s�j��\'��P���c�T�wm{\n��\Z���H�c:\0\n�{��U�Dk!��r\rdO[�U+eO0�� ���{y+!{M�~��������9��`O0�� �����x!��v��2���V`L@A�k�y�����2���V̞`L@A�k�y��٬�����V��`L@A���P��Yl ���ߩ�bO0�� �u!�z�Z�� �Z~Q�v>{�1\0��=���lf�����T�̞`L@A�k��� �jz�\n�w�\'�P�ǲ�n��ނ�k�~\n��+V�Ҡ�A����Պx�\"���|��1��\0P�Ivcc��o�>���?��Qۿ��jժC*p��39ڟ/S!�V�c:\0\n2��6;����+V���39ڟ�Q�����\0(Ȍ#KD���T�>�39ڟ�ҟ=�����8��� ��!��4r���6T��{�1\0��!����[7��|�nr]�#����U*d�Ȟ`L@Afe�>rp���U�__۬�}�A��\r��?��\n�}���\0(Ȭ�;7��\"`����aB6���|�|�+{�1\0��!{����![#���篫�}{�1\0��!{ӊ�![#����o��}\r{�1\0IȦ��$Q�/W�\'�P�Y��l\"�B�<F&d)\n��˞`L@Afe�޶�.nȖ�l �n�����^�	�t\0dV���6Z�^��r���O#����*d�o�c:\0\n2+C�����k��>B0!Ha�M������\0(��ٟ}fm��KE�}�A��\r��?O��o�\'�P�Y���]��&[�[	�@���\n\n\n.eO0�� �\'d���g�a���/�l�dٖYmB6���|gaa���	�t\0dV��f���&d�ԟ�.**�ɞ`L@AfE�n��uk��cB6�����������`L@AfE�>Հ����\r$�?�dذa�\'�P�Y�i�l �\\��%%%�`O0�� 	ٴN��9�\n#�x6#۸��Ã\r:�=����$d�:-dK�Vm�j\'x�#K��O����fO0�� 	ٴ����p��fda~����,�c:\0\n��MKY�v�\\�˲��pM�F���KKKOgO0�� 	ٴ���ފ5sM�F��_TWW�ƞ`L@A�iIo�k\Z-��4c:{� 	�	��q�<h;v�z��7����4�?\'?3u�Tk�޽��555m��E�Y={�����o�mmذ!��{��g�b�Ȑ!C����\Z�\0�t\0$!;n��W�j�����f%h��i�\"!\\o{���AX�[�j��t�RkӦM���_�Z�|�}}�����ٶm[���%K�K/�4r���1f�����+�XÆ\r�F�{��\'��^zɾ��}W~���vP��FB6�J��_c/�1� ��![ڡC�\"w޼y�e�>}t��l\'������=��S�eAA���s�E~��^h����\Z;,WUUYݻw�&L�	��3�:�K���+���.�юw\n���v#!�x�7xf4�ԭ���0y��M�v���*������0\'��ѿ����3���zE�ћ�\r�t��D\Z�l�m^�z�\\e�Xb=S-3�[�nm�uPv�q�u�i}�ȑ#-B���3������@-��������~����2����\Z�͈g�ϼR��I1ø\n��Az��y�sͳ<~��y��}������nV�?-��՛簗��P������VZ_�O�S{��k���,d�رÚ3g�}�u�]�9�}��n��������l��[f����.[��H\0�B�&��r�s�N�V%�7T����U��P]Y��=�-�ܕu��+��8�������>�6{�[l;��C���*|�|��m0�$�0dK�8z&�G��Zl�>��s˱����xYY����Dg���-X� r�w����f�+!�D�ZO��-K<$K�v>����o�e\"�e�0�ͷ5F7[Nb�L�/{��\0�4ٲ4���ߏ���x�j��v��m_J���ki����o���	�G�=��l��7n��o�n_���[���X�$d#�v���g�UȖ۲��iֹ��6~�N�E���� ]�PB�wz�\"�?���=P�T�?¹���3J���e�i0�$�,d�~����,��.˥,�s�d;ƹ�Z_N�>�Ŷ�;�]Df�c��3�<3����G�FF�ofcwo t�^+휑�*�ֲ�)8�WK �Yi	��6�N�,����ހQ�|&�x��\r�t��D\Z�l�M��zO��Z�1^Ȗ�������bm�w�K�u����$�l�3Y�\\-�D*|���.���Z��aD�d�}���㪫�n�gd�Z����{U�C�r��\nf���P�H��-M�^���}��#/�G�)�$(_p���|Rα]^^n�~����ѧ�n�{����E�\'z�\\>�8i�$��,#!d#�H��k�[<�y��hK\0�?,^bbo�3����o���-[���B�8�8��P���k�3���r��}��}Fe�}�>[N�����n	�M���8����\"`L(H�	�\0����$d��\0�P��l\Z!\0�\n��M�&d\0c:\0\n��M�\0�t\0$!�F�\0�t��$d��\0����$d��1\0IȦ��1� 	�4B6\00�$لl\0`L@A�i�l\0`L(HB6��\r\0��\0��B�A6��1�O�L����� \r\r\r{���G�MӶk׮ߩ���g*\0�t\0d1㎕+W���?�\'�6�f�%`�����3\0c:\0\n2è7pŊ�dY�����&�?���&�b\0c:\0\n\0\0}:@A��\0�O@A��\0��\0(Hp�\0��\0	�?\0�>\0	�?\0Ч� ��\0Ч$8�\0\0�t���\0@����\0@�P���\0��\n\0\0}:\0\n\0�O@A��\0�O(Hp�\0��\0(Hp��>\0	�?\0�>� ��\0Ч� ��\0�t\0$8�\0\0�t���\0@�P���\0��P���\0��\n\0\0}:@A\"{��R9�m�u�)\0`L@A����Z�N��].�@�\00�� ���^�J�^ӯ_�n�%\0`L@A\"��}m���v��d@���,�Ȁ�y��\0�Q}9K\0B6ҽc�#����Y��NT�^�,6\0d��@���4��;:��\0��q�%�\0!��1�@F��,�H��y���\0�p,�H/�L�\n_\027d�ȶ�]]]}Z2����~����38r�_����_��\"\0d�x�@ SC��.x��o���3z�faS3f�՛�D�`�ϜP]mڅ��г���]�M�3����+��X�?P���3��*��5�+j�&+��h���Z��~�6\0�?�����r��{�c�������9}���j�{��o�׀4�^��n*�<s�����8²����\r�F�\0���jO��=��7/��Cn	�l��7������U�HؖmT���s�wz�\"�b�v[�\0���!C���^k�7=:�|(r�j%�ri���gU�/��,A��6x�}=|���_v����1Hf�e��\"ʏ�}j�;�~�&�^�3n�fj��u��g����ߗ&���wU��#��mi�8��\0 }�i9{Ⱥ�u��Ef�٫@\Z��\0l�ޞ����i��6�{|Fe$8�0��D����\n���ydƹ�o��v���\\��iYJ�~��Q�`��������Of����>�{�D������M��	�9�	�43�\0�&T ~4��|���֣�>j-X��ڼy��g��رc�8~���o�>��wߵ.\\hoW\\\\+l/W��b�0�!�^0�$��\r{��\n��Y�H�V�Y�JK�\\w,)��ߘ\Z��o�ź�=S.%�KhoZRb�����Yn�+8H��\0�$���?\'��:�KJJ�g�}�щ8z���x�b���XQ��>�.����.�*��!��g�o\n�F�(�z{)��a��\\	ߞ��G���c�g�;��d{�����~g���q�e �/�u�V!}G/��<�~�A\0�$`7:qUU�=c�\'O���-[fτ;~���b�]�%H�6}�0�[�t�����N�X�E��Dj�޲���O>���ΟSaܯ����v�4�^0G�l���<4��������\0$>.7���e!��e׮]�رc�A��	tQ��Ty2;�\\\"�@��B.��cP����������@������r�z�^��7�`�]_�6���.����kU[r���\0hCx\rv$\0�]��JY�-뵝3��o_�\0:1d۳�*�F�s���`�o�YB�R>�(A\\�q�僑���7�}@Q�ykg	�_R#v�K9%�|\0ӹLq�q��z0�\r\0���u~�Qf�SI>$YSS����rn��I!\'�C�_Qmx�2�?Ǉ! �\\.�_�k���D$�Ç[��{��Ð38\0!��@GP~B5+|�ޠ���\0��E3γ�t�C��x�7�?�-�@�F��-�����@�vl݆9g�6\0$,^�������M�6���\0�l�|c�ւv����؞5�\0�$�ZU��^/��`\'���ۛ�?������M�n}	G{�v{vt�f�\0��+T�~kۨP;T\\9�GWq~Y��7���ٹ��A����h�v���y�h@�16ZW�0}}�m�3���^��\0!y�/و�O;ŀ��F\0�َ�<zf���3[�n�-��v�(���lv��\n��t `w��\0��#!V�mu{���3�*��?lv�l������	�?Wퟪ}����|�A]?��>����;��P�}���ڻ�mQ�oV�o��A�7U[����F�?�֠�J�Bҹ��?��L�?���j�����c/��ߩ��jϨ�O�˹��Q�q�f�m��e@=V�.����T��|S�j���V�Z�*u�u�x�~�n�Q�+U�P�G�V���Z�j#��w����V�n���r��?��i�� ��Y�n-((�EN��������j}��>��\r���/P�]���-,,�n~~~/�6-u�r��M�����R���j����P�w��a�Η����S��Q��z�g��ׯ[�[7;:s+hw$`Gm�h@!�9��-���U��i�����$ĩ@w������\r\Zt��=u��K��XTT�SB�����<�UP�w	�\"��+%T������{6e\r��O	�j��$�J8U��,aU�����b���j%ܺ������	���+�X±��\\²��U���n?(�Zµj%l�C�J�uo���%����pX���l	���\'��S�U�/a_B�����K§YZ�n�\Z~�\n���~1�����u��!/:Զ�/B���N���{�}~Ѳ+�\"F^�|~qs(|�Ry��Y�E�Ꭿ�k�$�G�`���#f�c@��h4Z����\0rYG�2����D����l\08���u�ΨLp1�\r\0�C푼Ԭ�>��͚l\0h_Ȏ�k�6���4ډ��;M_���$�9�\0���ȲHg�vl��E\0 M�v[���`\'�͐ڵy�\'i����3��澙������n�Q�B�n1sc�@:�\'[���EA�� ׵5���/�I4h�%+|+�F����N�v�tyf�W��էy}�g��Q�e�՛�4]o���7nҏyf4����	r��7�]����=�И���uހQfo+�oV֯��#�ք�h����8v�XgȾ�#\0�g��&��m���H����Ȧ�lv�Yl�k��0�Ȍ��j���!��g�&?�oK�~ `^	־Pm8D���:u���7�{�����K��Ԧ�/���\rv���92hK�T��$ܪ���Ç�z=�1�{pd\0���hG/����y�c�aQ�5�H;2k���i��Vax��oiz��wz�\"�V²\nǓdZ�W��q�sͳd	�ȥ���W�3��`ߦ�ʏ�M�w���7f��9�����w��}�x��ù.{���g͚��s9\"\0�2h;?�̉|�L���4}HӀʗ�,3��z�2	��%p�LtE����m�A2��y�K�d�I��ƞ������[���h�쵄m�?䑙q�Ξ�����=�嶧.x�^nbz����s�HYYY���o׮]����WsD\0���#���%~Z�����������ʺ���u|��=������M3١�=~��Ȭ�?��f�O�	��e�[�k�:m;X��	2{-���(>��^~�3��K�|�o頻x��N�?�p$`��q4\0��A��b-E�F�Z��	��E	���0fK����@h��^�����eV[��D@Rfƛ�{hJ���P�|��9S=��%KN���C����\\Eϒ��͖��>� �{ٲe�e\"\'䛛9\0�9A�/�A��2��l�P�q$��*�MT4\'�3�2�l�`�/�?(���Cn;����2�-a\\�iM�Z��=����g�vE�9О�V?#�e���D���T����J��ѣ)ثW�n�LD��\0h��.�`�Ҟ>�^�lv����o��lg�����)�d6ZB����C�/�l�O�\'aZ�F�����wۧ��g��n�1X�_[�:���Hh�Cwx]8G������\n��u𭩩���<����;@�v�3�|���Qv�W��?��ё���R·��|rn�f���Q?&gѧ����}��O�Pf����=�0ɇ09BH���^��:\0˚�$u�H��r�yA\0� �%,�.$_��ϝ-Mf��k�;z��\':�5\0:1h�W��M�\0�ņ�_��#�P,��u�ք�hF΃5{m/!`@r��<���\r\0���v_���Ψpl�\Z5�z�����F�,$zݶ\\J��Y�X�ƍ���YD��#\0$_�m��\0@\Z��f����>�&���4}\0�yA��\r\0i����b�\';?��&k���M�\0йA{\02GII�Y��ڏ�c,\'��v�W�ˀ\n�C���5\0�\\����4}\0\0\0@R}�]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����v>����\0\0\0\0IEND�B`�',1),('af0538f3-0953-11e7-821f-f48e38b58b4b',1,'G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','af0538f2-0953-11e7-821f-f48e38b58b4b','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"请假流程\" isExecutable=\"true\">\n    <documentation>请假流程演示</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"部门领导审批\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"调整申请\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${afterModifyApplyContentProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"人事审批\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"销假\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${reportBackEndProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"不同意\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"同意\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"同意\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"不同意\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"重新申请\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"结束流程\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"270.0\" y=\"149.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"463.0\" y=\"219.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"150.0\" y=\"281.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"447.0\" y=\"304.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('af53a714-0953-11e7-821f-f48e38b58b4b',1,'G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','af0538f2-0953-11e7-821f-f48e38b58b4b','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0[\0\0\0\0ݒ�\0\06~IDATx���\rtT������˭/-W���^�>>^�z�VtQ�vQE�h�a��@,�bd&B�bA�#E\n���EQ�Ry�\nVf΁�AK����R\nHQ����\'�Ǔ�L�!3ɼ|?k�5o\'	�3���gϙ��(���k�K\0\0\0\0�����[�U�ɲ�|jY��m������!��9�3������������r��>�I�������\0\0\0$d��-Z_�}���Ϋ�k������r��ur�\n��=>s�_-k��Ys�Ʊ?��q/���ce��9�Q\0\0\0�U��P��O��,˺\\��6X�>+�X�+낗o��I�>�6��e�z�eMy�Ck�:u��̚h8�R=6��g̗��^\0\0@N����������l�f�z�m�zD��y�Zn��o��-��<n��r�Mj[���Y����7\0\0���������jWY#�*d�TL�\n�W�ɲ��顋<�����Х�����NXV�<�O�\Z�.o���Ro�y{\0\0\09�������|�3o[����f��V�˟/��zF.=�N��Va|�7`����*|�L��u�r{���x��	\0\0\0(��Z�?-k�\n���L#��r֐׎Z�Q׿&�I���n2S-�B�}�|l=5���7˚,�?0�`&\0\0\0ȓ�\"!O��C�.��f6v��K�YOُ���1^��5�˔K�5S��\n��癿ZK��9^_�	��U\0\0\0�v����K!벽~c�\n�C×?�p��x���F���o��5�V���lY3���U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@g�,��{ｷ`�ڵ_�B!kŊ�4h�`�jhh�D�\"������_���>�a� �}��Y��9-������U�VRz�T�_��/@}R�� 򊗂L���\\���3�4�P��\'2���ē?��*�<SAA��\0�I}\"��z!��i_��T�_��/@}R��¢��{���͵6��\\��(\Z�����>i�\'N�(��em�c���W�6kr�<F�P�i����j���>�OdDQ���r�����K)�2]P�\n_�������>�O��]�[�_�-Jy�¡(�@��6#|9�]BAAMS��\'���.�M+���<F�P�i2t�~�gP�������O���$���ߨ��d���뫪�����/,,��j���ғ���/>���fΜ9����7����(3j0n�~�_�_P��\'�I}&KMM�-\'N�KQQѿT��/^lmܸ��V��\'OZځ��[�Z����5m�4K�W�{����~��u�բ�O�+Jy�¡(�Ȁ6]�8�9�/�/�i���>����|k�����-X��щ8~���z�j롇�WYY��{�wP.��uq�R�p(�.��\Zl���������O��L�����#F�x�駭�G�Z�n�:K���#G�\\���N.�]�M�Ml�֒�O�p(�.z;y@����5M}Ҩ�X|�������7�x�J�Ç[����KJJv����\\)Jiﯟע(�>�����x�)��e��j���>������/d�u�<��s_RA���(��>���yV˷��}��CQ��`������4�I}R�!KDd;�[[�d�g*h����R���Ձ�k��1�%����4�`P�������O��L�|�Q�`oذ��,����]PP�r&�y$nQ�W�{��[��2nA�&�ȶ�\n�(S<\'�maf��/�/�i���>���|K>���***v�\\��l*ʶ^��*��삷��`�Ն�/�s|p�������>�O�-rl9M_2�\"��]�v�,((�����-EٞW���\n��(��N�`��jV��+	Ʊ~��MAAMS��\'��\Z����Z]eʔ)�U�~4[��TR7\n��L�ۿ�Ã������u�mk���_�_P��\'��x�$_�.�̘��$y6{�\nٟd������FQv�x�d����A9��sbl�zN��j���1�G�5k֣�U�]���{G��S�4Bv^����Xm} ���r{�<�fn��������>i98�O�<y�ҥK�<d��֮N�%#%Eٕ�jI����>����\Z�\Z���.�h��x�_�nAMS��ϫ���oܸ��C�ڵk7�\"0)J\Z!��矣-o�E_�o���O;������s\"d�u��/��4�Iˡ񼬬�xg|�L[��ݻG=��P�4Bv��_�E_��ᩮ��5(�Ӂ�����l\n�1��!���>i94�Z\'O��ҁ<�)J\Z!;�����/�KGg�b\r��}�;�Cv�� dS��\'-��sy���L�e�vˌl���>�O�1��N��������T��5M}Ҙ���E)���?�-�V���޽{��_����E߷c�{{�����[K�,�^z�%�\'?��}]{�\"��x��-��bm۶M�en7��o�����|mn3f̘�u�\0�����L��֩w�����+�6�ȗ[0�ݎ�.��߲��vo/���_�쾷�~;#�?f��i��jx�����[�`�u�W��w����1����k��G?��/_n]w�u֛o�iط/��Bv6��޿��4_��Ң\\�z�\n���S���#Oz	��z�����@���رc��駟n�����@|��G�aÚ�\r	��{��u���}��^��t�X?��c���>��U�VٿK��\\^t�EV�޽��:����n�{�̙���sϵ�NȎ;G~GR�~�Te�d�9^�����}\\�i��{��i7]Ͽ��o����G�}��qȦ���հ��B^��p�\rv�If��-����ۯY�ƾ|���#u�\'���,!;�&L����͛���\"��Z�2XIa9r�n��,�2H�!�fxdInK0ׁ���>�l;t�����a]�I^�����7l��	�ݻw�*++��S����}y�Y�΁��3ϴC��-/Əo_����=j������C^y���q��w�㋚�e�wJ�Xg\"HdP�����z��)dKhnm	�W]uU��]__o�/ѿ/]�?\rC65M}v�Im�q\\�h���U2�ܖڔz�~�Iו�\rR_�睏;o��DΓ�lٲ�8O�*��r�(�I^RR)\0�u\0�W�z[y+H��X�+:d˶R������\\D<�O·���L��O�>-~������C��o=���1����2sk@��ɒ�.���L�\\��\r٭�rut���s�~��k�r�<��:^�0����_�z����k��Ʈa	��亼��~k9��?�B65M}&-+H�~�W�w��]g���I�:g�u=I-ʥ�%a�Ν����E/�ER@��VSS��!���|�*�~�X��v��5+k$%H˫P	�R2��A˹>[��}��\n�2s$�uqΛ7�ٌ�\\�\0�7m�d�\'E+���#o˥�� ���w�R�r]�ZF�|�����_��r�ꫯ�k�OM[�N��R�De����yH�A\\��,5�]0�d����%5,�(M�K_��}����t�g[Mf���,�X��SO=�\"�۲v[O��wĥ���?��Գ,M%d��رc�9|��������n��*����E)�_ai2��\'yŪ���&��-M�`�R)Py�~���T�}��=��c�\\�@��~U����,�V�w�ٮ������l��_�c=X^�0	�	�7��跾�wP�������[o�ծC�/h�,Y�5ٲ�Z±̂eB�gIAM�#KK�̴���<y�}}��ё�@�%X����/��E$HȖw�$�����iBv��7�o+W�첐]WW���r�6��R�\'�. �j���{=%\Z���*v��v���$E\'ŧ?Y^^�l=������+[�΁R��oU9ߚ����~燝�?+Ck�l��v�~E��;</�s��\Z��%0ˆ4\Z�u�;�͒[G��H�B�:�����,��Y�����E�5Mȶ���\"]3r60�5i2Y�ハ:SH��w�d���0�mf�S��t�3拮8���pO������\\.J]4R �K9d�Xo�\r�2��O�k %��\'���qD^��:%��m�;z�*��Ss�c��]z&�G����֚L)|9ˊ��ם!��o3�1�&��~.�Nӗ\r��Cy{8zI���ɖz��~fJ�gYAM�#5�ߝ��R��D�lya�O�\'�%p��+++�+o�u�ɓ\'o:th ׋R>8$OvY�)}��u���YD�>�(�������KC&M�dߖ�4��yq�O��R϶˚��t\0z&+�əR� *!_Ϯ�N!ϱF\\�G���������J�^�?7 ���Q��ԓ,ӈulyL޽�/��3�r)3�z�L>�!}R����4!;R3��2�K�t}�:�s\\n�7ξ/��ڄ�$+--���{�=.�lgQ�6�������sه\"���o���>QJ8Va�W����3����\\F��G�f��l���iӦE��t\0z�K�&��9>����1����]���K�Nꠜ�������Ԑ�BO�E(������el��ĉ\n\0�R�Y�_P�9�e��q9:\'� �n�3d��������3���n�S`�ȑ����=��FT8<*�D�ҟ�̾�U�)	�)�s�f�/2��������τN��תw19]��w����y�2`�۷�dII�n���(ie�����,�������O\Z�y�T��Q\\\\|`���j;��(ie�\rʉ�Z�!G��j���Q�%g�(**���O�M�\ZlY\"�\r3�%E��}{����/�/�i�F}&sF[��#;v�����铳�ȇ3}\r6EIQ�XЖ�U��/�/�i�F}&���*Wa��Gy��۷�M���������СCge�YD(J�2\r�Zy|?�1��5M}Ҩ��p�Br�j;KKKߙ:u�\Z�4����w8C��>^�v�����������3��f(J�2�g�y;�������>i�g\'�l_��U{_��Y�G�5�=�Z�����(J\ZE�q�2�1��5M}ҨOP�4�2���c��j���Q��(ie��w��8���5M}ҨOP�4�2y�2�/�/�@~~�WUM���O�%��$d�_��/�����tU�ǩ<��EI�(	��4��$����>F�Q��\'(J\ZEIȦ���_$Iqq�٪�?��O�)\n��O�vL�	���l�Z�����穚>D�Q��\'2RCCÞ}����OӶk׮ߩ���3��MA˵��������Sy�\'���d�+W�����O� �^�JA�����3��MA˵���v�P5��ʣ>�Od,u��WW��mY/����矷��3���&�bIȦ���j�B�����Ru�[�Y2�3�#+�R)�~��uco�d�������w�\'��t!��u�*�R�n��o�C��\n/V5��=A��kC�\")�p[��C��\n\n\n.U5�{�>@��z[7��g�dt�������	�t\0]W�K�[�f�6�@F��W5�.{�>@�`�Yl��n���!:d\0�I��W������\0��\0��\n�ᶆ=D� 3����RA{3{�>@�_�Yl�f�!�l����U}�F�}:��/���l�4B� s\\�B�_���\0(Hp�$/dO��z�}:\0\n\0����j�����\0(Hp�$���A������\0(Hp�$/d_������\0(H���/���k�i ��r�\nګ���\0(H�����o��h�[E�90r=`������F�/T������\'`N���Fu��g��\'���Z�7{HY���\n�{�>\0�4<��}�*TO����� =ʿ���Y�Q���>s��g��C7�ǟ�����s��@JBv�W�\'��P�H���*j�W��*HK���_u���Y�ʺ��~s�ls]��J�q�=í���!�̎�}>c���>�\\��\\�W���\0(H���W���0f�	����� ��z�HE�t���m��͖��?��^R�oS!��}:\0\nit�UH��g�UȖ۲��iֹ��6~�����4��o�������Cy�!��Х���u�^�Q�7/c���v��B���	�t\0$����7���7�[��v�H��ZkY��ͫ%�ˬ��m{��y�s�Z��`o�(k>�m<�RG�;TM/fO0�� �����s��,��ӝ�H�KYg-M�0\"k��>	�����q��f7�32c-�CF���*��r�y3�@JC�`է�Ğ`L@A\"͎�h��:�|x1z��p�Ò�%&�v>c��W�7jt���-�y}�g�a@RCv���~�=A���D�9S��>��>�2�>Y�-����\\B����CS�M�esV �!{�\n�ϳ\'��P���H^�.T!�Y�}:\0\n\0���T�~�=A����@��D���	�t\0$8�\0�W�#T�Þ�O@A�� y�\\��l�}:\0\n\0I�r��S5=�=A����@�Bv���\0{�>\0	�?���\n��]˞�O@A�� y!�R��_�\'��P���H^=�Q�1�}:\0\n\0ɫ�q�MaOЧ� ����z��j5�	�t\0$8�\0�W�U�=̞�O@A�� y�\\��D�}:\0\n\0ɫ�ɪ=Ğ�O@A�� y�\\#����\0(Hp�$����F���\0(Hp�$���se�\'��P���H^=OW�˞�O@A�� y��Sm4{�>\0	�?���s�j��\'��P���c�T�wm{\n��\Z���H�c:\0\n�{��U�Dk!��r\rdO[�U+eO0�� ���{y+!{M�~��������9��`O0�� �����x!��v��2���V`L@A�k�y�����2���V̞`L@A�k�y��٬�����V��`L@A���P��Yl ���ߩ�bO0�� �u!�z�Z�� �Z~Q�v>{�1\0��=���lf�����T�̞`L@A�k��� �jz�\n�w�\'�P�ǲ�n��ނ�k�~\n��+V�Ҡ�A����Պx�\"���|��1��\0P�Ivcc��o�>���?��Qۿ��jժC*p��39ڟ/S!�V�c:\0\n2��6;����+V���39ڟ�Q�����\0(Ȍ#KD���T�>�39ڟ�ҟ=�����8��� ��!��4r���6T��{�1\0��!����[7��|�nr]�#����U*d�Ȟ`L@Afe�>rp���U�__۬�}�A��\r��?��\n�}���\0(Ȭ�;7��\"`����aB6���|�|�+{�1\0��!{����![#���篫�}{�1\0��!{ӊ�![#����o��}\r{�1\0IȦ��$Q�/W�\'�P�Y��l\"�B�<F&d)\n��˞`L@Afe�޶�.nȖ�l �n�����^�	�t\0dV���6Z�^��r���O#����*d�o�c:\0\n2+C�����k��>B0!Ha�M������\0(��ٟ}fm��KE�}�A��\r��?O��o�\'�P�Y���]��&[�[	�@���\n\n\n.eO0�� �\'d���g�a���/�l�dٖYmB6���|gaa���	�t\0dV��f���&d�ԟ�.**�ɞ`L@AfE�n��uk��cB6�����������`L@AfE�>Հ����\r$�?�dذa�\'�P�Y�i�l �\\��%%%�`O0�� 	ٴN��9�\n#�x6#۸��Ã\r:�=����$d�:-dK�Vm�j\'x�#K��O����fO0�� 	ٴ����p��fda~����,�c:\0\n��MKY�v�\\�˲��pM�F���KKKOgO0�� 	ٴ���ފ5sM�F��_TWW�ƞ`L@A�iIo�k\Z-��4c:{� 	�	��q�<h;v�z��7����4�?\'?3u�Tk�޽��555m��E�Y={�����o�mmذ!��{��g�b�Ȑ!C����\Z�\0�t\0$!;n��W�j�����f%h��i�\"!\\o{���AX�[�j��t�RkӦM���_�Z�|�}}�����ٶm[���%K�K/�4r���1f�����+�XÆ\r�F�{��\'��^zɾ��}W~���vP��FB6�J��_c/�1� ��![ڡC�\"w޼y�e�>}t��l\'������=��S�eAA���s�E~��^h����\Z;,WUUYݻw�&L�	��3�:�K���+���.�юw\n���v#!�x�7xf4�ԭ���0y��M�v���*������0\'��ѿ����3���zE�ћ�\r�t��D\Z�l�m^�z�\\e�Xb=S-3�[�nm�uPv�q�u�i}�ȑ#-B���3������@-��������~����2����\Z�͈g�ϼR��I1ø\n��Az��y�sͳ<~��y��}������nV�?-��՛簗��P������VZ_�O�S{��k���,d�رÚ3g�}�u�]�9�}��n��������l��[f����.[��H\0�B�&��r�s�N�V%�7T����U��P]Y��=�-�ܕu��+��8�������>�6{�[l;��C���*|�|��m0�$�0dK�8z&�G��Zl�>��s˱����xYY����Dg���-X� r�w����f�+!�D�ZO��-K<$K�v>����o�e\"�e�0�ͷ5F7[Nb�L�/{��\0�4ٲ4���ߏ���x�j��v��m_J���ki����o���	�G�=��l��7n��o�n_���[���X�$d#�v���g�UȖ۲��iֹ��6~�N�E���� ]�PB�wz�\"�?���=P�T�?¹���3J���e�i0�$�,d�~����,��.˥,�s�d;ƹ�Z_N�>�Ŷ�;�]Df�c��3�<3����G�FF�ofcwo t�^+휑�*�ֲ�)8�WK �Yi	��6�N�,����ހQ�|&�x��\r�t��D\Z�l�M��zO��Z�1^Ȗ�������bm�w�K�u����$�l�3Y�\\-�D*|���.���Z��aD�d�}���㪫�n�gd�Z����{U�C�r��\nf���P�H��-M�^���}��#/�G�)�$(_p���|Rα]^^n�~����ѧ�n�{����E�\'z�\\>�8i�$��,#!d#�H��k�[<�y��hK\0�?,^bbo�3����o���-[���B�8�8��P���k�3���r��}��}Fe�}�>[N�����n	�M���8����\"`L(H�	�\0����$d��\0�P��l\Z!\0�\n��M�&d\0c:\0\n��M�\0�t\0$!�F�\0�t��$d��\0����$d��1\0IȦ��1� 	�4B6\00�$لl\0`L@A�i�l\0`L(HB6��\r\0��\0��B�A6��1�O�L����� \r\r\r{���G�MӶk׮ߩ���g*\0�t\0d1㎕+W���?�\'�6�f�%`�����3\0c:\0\n2è7pŊ�dY�����&�?���&�b\0c:\0\n\0\0}:@A��\0�O@A��\0��\0(Hp�\0��\0	�?\0�>\0	�?\0Ч� ��\0Ч$8�\0\0�t���\0@����\0@�P���\0��\n\0\0}:\0\n\0�O@A��\0�O(Hp�\0��\0(Hp��>\0	�?\0�>� ��\0Ч� ��\0�t\0$8�\0\0�t���\0@�P���\0��P���\0��\n\0\0}:@A\"{��R9�m�u�)\0`L@A����Z�N��].�@�\00�� ���^�J�^ӯ_�n�%\0`L@A\"��}m���v��d@���,�Ȁ�y��\0�Q}9K\0B6ҽc�#����Y��NT�^�,6\0d��@���4��;:��\0��q�%�\0!��1�@F��,�H��y���\0�p,�H/�L�\n_\027d�ȶ�]]]}Z2����~����38r�_����_��\"\0d�x�@ SC��.x��o���3z�faS3f�՛�D�`�ϜP]mڅ��г���]�M�3����+��X�?P���3��*��5�+j�&+��h���Z��~�6\0�?�����r��{�c�������9}���j�{��o�׀4�^��n*�<s�����8²����\r�F�\0���jO��=��7/��Cn	�l��7������U�HؖmT���s�wz�\"�b�v[�\0���!C���^k�7=:�|(r�j%�ri���gU�/��,A��6x�}=|���_v����1Hf�e��\"ʏ�}j�;�~�&�^�3n�fj��u��g����ߗ&���wU��#��mi�8��\0 }�i9{Ⱥ�u��Ef�٫@\Z��\0l�ޞ����i��6�{|Fe$8�0��D����\n���ydƹ�o��v���\\��iYJ�~��Q�`��������Of����>�{�D������M��	�9�	�43�\0�&T ~4��|���֣�>j-X��ڼy��g��رc�8~���o�>��wߵ.\\hoW\\\\+l/W��b�0�!�^0�$��\r{��\n��Y�H�V�Y�JK�\\w,)��ߘ\Z��o�ź�=S.%�KhoZRb�����Yn�+8H��\0�$���?\'��:�KJJ�g�}�щ8z���x�b���XQ��>�.����.�*��!��g�o\n�F�(�z{)��a��\\	ߞ��G���c�g�;��d{�����~g���q�e �/�u�V!}G/��<�~�A\0�$`7:qUU�=c�\'O���-[fτ;~���b�]�%H�6}�0�[�t�����N�X�E��Dj�޲���O>���ΟSaܯ����v�4�^0G�l���<4��������\0$>.7���e!��e׮]�رc�A��	tQ��Ty2;�\\\"�@��B.��cP����������@������r�z�^��7�`�]_�6���.����kU[r���\0hCx\rv$\0�]��JY�-뵝3��o_�\0:1d۳�*�F�s���`�o�YB�R>�(A\\�q�僑���7�}@Q�ykg	�_R#v�K9%�|\0ӹLq�q��z0�\r\0���u~�Qf�SI>$YSS����rn��I!\'�C�_Qmx�2�?Ǉ! �\\.�_�k���D$�Ç[��{��Ð38\0!��@GP~B5+|�ޠ���\0��E3γ�t�C��x�7�?�-�@�F��-�����@�vl݆9g�6\0$,^�������M�6���\0�l�|c�ւv����؞5�\0�$�ZU��^/��`\'���ۛ�?������M�n}	G{�v{vt�f�\0��+T�~kۨP;T\\9�GWq~Y��7���ٹ��A����h�v���y�h@�16ZW�0}}�m�3���^��\0!y�/و�O;ŀ��F\0�َ�<zf���3[�n�-��v�(���lv��\n��t `w��\0��#!V�mu{���3�*��?lv�l������	�?Wퟪ}����|�A]?��>����;��P�}���ڻ�mQ�oV�o��A�7U[����F�?�֠�J�Bҹ��?��L�?���j�����c/��ߩ��jϨ�O�˹��Q�q�f�m��e@=V�.����T��|S�j���V�Z�*u�u�x�~�n�Q�+U�P�G�V���Z�j#��w����V�n���r��?��i�� ��Y�n-((�EN��������j}��>��\r���/P�]���-,,�n~~~/�6-u�r��M�����R���j����P�w��a�Η����S��Q��z�g��ׯ[�[7;:s+hw$`Gm�h@!�9��-���U��i�����$ĩ@w������\r\Zt��=u��K��XTT�SB�����<�UP�w	�\"��+%T������{6e\r��O	�j��$�J8U��,aU�����b���j%ܺ������	���+�X±��\\²��U���n?(�Zµj%l�C�J�uo���%����pX���l	���\'��S�U�/a_B�����K§YZ�n�\Z~�\n���~1�����u��!/:Զ�/B���N���{�}~Ѳ+�\"F^�|~qs(|�Ry��Y�E�Ꭿ�k�$�G�`���#f�c@��h4Z����\0rYG�2����D����l\08���u�ΨLp1�\r\0�C푼Ԭ�>��͚l\0h_Ȏ�k�6���4ډ��;M_���$�9�\0���ȲHg�vl��E\0 M�v[���`\'�͐ڵy�\'i����3��澙������n�Q�B�n1sc�@:�\'[���EA�� ׵5���/�I4h�%+|+�F����N�v�tyf�W��էy}�g��Q�e�՛�4]o���7nҏyf4����	r��7�]����=�И���uހQfo+�oV֯��#�ք�h����8v�XgȾ�#\0�g��&��m���H����Ȧ�lv�Yl�k��0�Ȍ��j���!��g�&?�oK�~ `^	־Pm8D���:u���7�{�����K��Ԧ�/���\rv���92hK�T��$ܪ���Ç�z=�1�{pd\0���hG/����y�c�aQ�5�H;2k���i��Vax��oiz��wz�\"�V²\nǓdZ�W��q�sͳd	�ȥ���W�3��`ߦ�ʏ�M�w���7f��9�����w��}�x��ù.{���g͚��s9\"\0�2h;?�̉|�L���4}HӀʗ�,3��z�2	��%p�LtE����m�A2��y�K�d�I��ƞ������[���h�쵄m�?䑙q�Ξ�����=�嶧.x�^nbz����s�HYYY���o׮]����WsD\0���#���%~Z�����������ʺ���u|��=������M3١�=~��Ȭ�?��f�O�	��e�[�k�:m;X��	2{-���(>��^~�3��K�|�o頻x��N�?�p$`��q4\0��A��b-E�F�Z��	��E	���0fK����@h��^�����eV[��D@Rfƛ�{hJ���P�|��9S=��%KN���C����\\Eϒ��͖��>� �{ٲe�e\"\'䛛9\0�9A�/�A��2��l�P�q$��*�MT4\'�3�2�l�`�/�?(���Cn;����2�-a\\�iM�Z��=����g�vE�9О�V?#�e���D���T����J��ѣ)ثW�n�LD��\0h��.�`�Ҟ>�^�lv����o��lg�����)�d6ZB����C�/�l�O�\'aZ�F�����wۧ��g��n�1X�_[�:���Hh�Cwx]8G������\n��u𭩩���<����;@�v�3�|���Qv�W��?��ё���R·��|rn�f���Q?&gѧ����}��O�Pf����=�0ɇ09BH���^��:\0˚�$u�H��r�yA\0� �%,�.$_��ϝ-Mf��k�;z��\':�5\0:1h�W��M�\0�ņ�_��#�P,��u�ք�hF΃5{m/!`@r��<���\r\0���v_���Ψpl�\Z5�z�����F�,$zݶ\\J��Y�X�ƍ���YD��#\0$_�m��\0@\Z��f����>�&���4}\0�yA��\r\0i����b�\';?��&k���M�\0йA{\02GII�Y��ڏ�c,\'��v�W�ˀ\n�C���5\0�\\����4}\0\0\0@R}�]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����v>����\0\0\0\0IEND�B`�',1);

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

insert  into `ACT_RE_PROCDEF`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('leave:1:254391c6-0953-11e7-907f-484d7ea6ec6b',1,'http://www.kafeitu.me/demo/activiti/leave','请假流程','leave',1,'24985da3-0953-11e7-907f-484d7ea6ec6b','E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','E:\\dev\\apache-tomcat-7.0.57\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','请假流程演示',0,1,1,''),('leave:2:af566635-0953-11e7-821f-f48e38b58b4b',1,'http://www.kafeitu.me/demo/activiti/leave','请假流程','leave',2,'af0538f2-0953-11e7-821f-f48e38b58b4b','G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.bpmn','G:\\Tool\\apache-tomcat-7.0.57-hz\\webapps\\credit_risk_control_web\\WEB-INF\\classes\\diagrams\\leave\\leave.leave.png','请假流程演示',0,1,1,'');

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
  `name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_dept` */

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` varchar(32) NOT NULL,
  `ref_id` varchar(32) DEFAULT NULL COMMENT '顶级id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父级id',
  `level` int(1) DEFAULT NULL COMMENT '按钮级别【0：菜单一级；1：菜单二级；2：页面级】',
  `permission_name` varchar(100) DEFAULT NULL,
  `permission_url` varchar(200) DEFAULT NULL,
  `permission_desc` varchar(50) DEFAULT NULL COMMENT '格式：project:create',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `is_valid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`ref_id`,`parent_id`,`level`,`permission_name`,`permission_url`,`permission_desc`,`sort`,`is_valid`) values ('1',NULL,NULL,0,'系统管理',NULL,'system',0,1),('10','1','3',2,'用户重置密码按钮','user/resetPassword','user:resetPassword',0,1),('2','1','1',1,'权限管理','permission/list','permission:list',0,1),('3','1','1',1,'用户管理','user/toList','user:toList',1,1),('4','1','1',1,'角色管理','role/toRoleList','role:list',2,1),('5','1','3',2,'用户列表','user/list','user:list',0,1),('6','1','3',2,'用户添加按钮','user/toAdd','user:toAdd',0,1),('7','1','3',2,'用户添加保存按钮','user/addUser','user:addUser',0,1),('8','1','3',2,'用户编辑按钮','user/toModify','user:toModify',0,1),('9','1','3',2,'用户编辑保存按钮','user/modifyUser','user:modifyUser',0,1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

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
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
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
