-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        5.7.15-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 test.z_date_dictionary 结构
DROP TABLE IF EXISTS `z_date_dictionary`;
CREATE TABLE IF NOT EXISTS `z_date_dictionary` (
  `Dictionary_Name` varchar(50) NOT NULL COMMENT '数据字典名称',
  `Dictionary_Content` varchar(50) NOT NULL COMMENT '数据字典内容',
  `Dictionary_Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Dictionary_Name`,`Dictionary_Content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- 数据导出被取消选择。


-- 导出  表 test.z_detailed_account 结构
DROP TABLE IF EXISTS `z_detailed_account`;
CREATE TABLE IF NOT EXISTS `z_detailed_account` (
  `Detailed_Account_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Detailed_Account_Class` varchar(10) DEFAULT NULL COMMENT '类型（入库、出库），标识本条记录是入库信息还是出库信息',
  `Account_Time` date DEFAULT NULL COMMENT '入库/出库  时间',
  `Materiel_Code` varchar(20) DEFAULT NULL COMMENT '物料编码',
  `Account_Quantity` decimal(12,2) DEFAULT NULL COMMENT '入库/出库  数量',
  `Account_Address` varchar(100) DEFAULT NULL COMMENT '物料入库存放地点',
  `Organization_Code` varchar(50) DEFAULT NULL COMMENT '入库部门编码',
  `Unit_Price` decimal(12,2) DEFAULT NULL COMMENT '入库单价',
  `Order_Requirement_Code` varchar(50) DEFAULT NULL COMMENT '订单/需求计划  编码',
  `Supplier_User_Name` varchar(20) DEFAULT NULL COMMENT '供应商登录名',
  `Account_Name` varchar(10) DEFAULT NULL COMMENT '送货人/领料人  姓名',
  `Create_Name` varchar(10) DEFAULT NULL COMMENT '录入人用户名',
  `Create_Time` date DEFAULT NULL COMMENT '本条记录创建时间',
  PRIMARY KEY (`Detailed_Account_ID`),
  KEY `FK_Reference_10` (`Organization_Code`),
  KEY `FK_Reference_11` (`Supplier_User_Name`),
  KEY `FK_Reference_9` (`Materiel_Code`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`Organization_Code`) REFERENCES `z_organization` (`Organization_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`Supplier_User_Name`) REFERENCES `z_supplier_information` (`Supplier_User_Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`Materiel_Code`) REFERENCES `z_materiel_code` (`Materiel_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出入库明细';

-- 数据导出被取消选择。


-- 导出  表 test.z_evaluate_template 结构
DROP TABLE IF EXISTS `z_evaluate_template`;
CREATE TABLE IF NOT EXISTS `z_evaluate_template` (
  `Template_Name` varchar(50) NOT NULL COMMENT '模板名称',
  `Template_Cotent` varchar(50) NOT NULL COMMENT '模板内容',
  `Template_Score` int(11) DEFAULT NULL COMMENT '内容得分',
  `Template_Class` varchar(10) DEFAULT NULL COMMENT '模板类型（材料/工程）',
  PRIMARY KEY (`Template_Name`,`Template_Cotent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商评价模板';

-- 数据导出被取消选择。


-- 导出  表 test.z_material_order 结构
DROP TABLE IF EXISTS `z_material_order`;
CREATE TABLE IF NOT EXISTS `z_material_order` (
  `Material_Order_ID` int(11) NOT NULL COMMENT '自增ID',
  `Material_Order_Code` varchar(20) NOT NULL COMMENT '物料订单编号',
  `Materiel_Code` varchar(20) DEFAULT NULL COMMENT '物料编码',
  `Order_Quantity` decimal(12,2) DEFAULT NULL COMMENT '订单数量',
  `Supplier_User_Name` varchar(20) DEFAULT NULL COMMENT '供应商登录名',
  `Order_Year_Month` varchar(7) DEFAULT NULL COMMENT '订单年月',
  PRIMARY KEY (`Material_Order_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料订单';

-- 数据导出被取消选择。


-- 导出  表 test.z_material_requirement 结构
DROP TABLE IF EXISTS `z_material_requirement`;
CREATE TABLE IF NOT EXISTS `z_material_requirement` (
  `Material_Requirement_ID` int(11) NOT NULL COMMENT '自增ID',
  `Material_Requirement_Code` varchar(20) NOT NULL COMMENT '物料需求编号',
  `requirement_Year_Month` varchar(7) DEFAULT NULL COMMENT '需求年月',
  `Materiel_Code` varchar(20) DEFAULT NULL COMMENT '物料编码',
  `Requirement_Quantity` decimal(12,2) DEFAULT NULL COMMENT '需求数量',
  `Project_Class_Code` varchar(50) DEFAULT NULL COMMENT '项目分类编码（物料用在哪个施工项目上）',
  `Organization_Code` varchar(50) DEFAULT NULL COMMENT '物料需求部门编码',
  `Plan_Class` varchar(10) DEFAULT NULL COMMENT '计划类型（月度计划/临时计划）',
  `Plan_State` varchar(10) DEFAULT NULL COMMENT '计划状态（有效/无效)）',
  `Create_Name` varchar(10) DEFAULT NULL COMMENT '创建人用户名',
  `Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `Modify_Time` datetime DEFAULT NULL COMMENT '修改时间',
  `Approval_State` varchar(10) DEFAULT NULL COMMENT '审批状态（编辑、提交、审核通过）',
  PRIMARY KEY (`Material_Requirement_Code`),
  KEY `FK_Reference_5` (`Materiel_Code`),
  KEY `FK_Reference_6` (`Project_Class_Code`),
  KEY `FK_Reference_7` (`Organization_Code`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`Materiel_Code`) REFERENCES `z_materiel_code` (`Materiel_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`Project_Class_Code`) REFERENCES `z_project_class` (`Project_Class_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`Organization_Code`) REFERENCES `z_organization` (`Organization_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料需求计划';

-- 数据导出被取消选择。


-- 导出  表 test.z_materiel_code 结构
DROP TABLE IF EXISTS `z_materiel_code`;
CREATE TABLE IF NOT EXISTS `z_materiel_code` (
  `Materiel_Code` varchar(20) NOT NULL COMMENT '物料编码',
  `Materiel_Name` varchar(200) DEFAULT NULL COMMENT '物料名称',
  `Specification` varchar(50) DEFAULT NULL COMMENT '规格',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Unit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `Unit_Price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Materierl_Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Create_Name` varchar(10) DEFAULT NULL COMMENT '创建人用户名',
  `Modify_Name` varchar(10) DEFAULT NULL COMMENT '修改人用户名',
  `Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `Modify_Time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Materiel_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料编码';

-- 数据导出被取消选择。


-- 导出  表 test.z_organization 结构
DROP TABLE IF EXISTS `z_organization`;
CREATE TABLE IF NOT EXISTS `z_organization` (
  `Organization_Code` varchar(50) NOT NULL COMMENT '部门编码',
  `Organization_Name` varchar(50) DEFAULT NULL COMMENT '部门名',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Parent_Organization_Code` varchar(10) DEFAULT NULL COMMENT '父部门编码',
  PRIMARY KEY (`Organization_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- 数据导出被取消选择。


-- 导出  表 test.z_product_class 结构
DROP TABLE IF EXISTS `z_product_class`;
CREATE TABLE IF NOT EXISTS `z_product_class` (
  `Product_Class_Code` varchar(50) NOT NULL COMMENT '分类编码',
  `Product_Class_Name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Parent_Product_Class_Code` varchar(10) DEFAULT NULL COMMENT '父编码',
  PRIMARY KEY (`Product_Class_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商产品分类';

-- 数据导出被取消选择。


-- 导出  表 test.z_project_class 结构
DROP TABLE IF EXISTS `z_project_class`;
CREATE TABLE IF NOT EXISTS `z_project_class` (
  `Project_Class_Code` varchar(50) NOT NULL COMMENT '项目分类编码',
  `Project_Class_Name` varchar(50) DEFAULT NULL COMMENT '项目分类名称',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Parent_Project_Class_Code` varchar(10) DEFAULT NULL COMMENT '父编码',
  PRIMARY KEY (`Project_Class_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目分类编码';

-- 数据导出被取消选择。


-- 导出  表 test.z_supplier_attachment 结构
DROP TABLE IF EXISTS `z_supplier_attachment`;
CREATE TABLE IF NOT EXISTS `z_supplier_attachment` (
  `Supplier_Attachment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Supplier_User_Name` int(11) NOT NULL COMMENT '供应商登录名（从Supplier_Information表中读取）',
  `Attachment_Name` varchar(40) NOT NULL COMMENT '附件名称（从Date_Dictionary读取）',
  `Attachment_Address` varchar(200) DEFAULT NULL COMMENT '附件链接地址',
  `Attachment_Type` varchar(20) DEFAULT NULL COMMENT '附件类型（附件1/附件2）从Date_Dictionary读取',
  `Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `Modify_Time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Supplier_Attachment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商附件';

-- 数据导出被取消选择。


-- 导出  表 test.z_supplier_evaluate 结构
DROP TABLE IF EXISTS `z_supplier_evaluate`;
CREATE TABLE IF NOT EXISTS `z_supplier_evaluate` (
  `Evaluate_Name` varchar(50) NOT NULL COMMENT '评价名称',
  `Supplier_User_Name` varchar(20) NOT NULL COMMENT '供应商登录名（从Supplier_Information表中读取）',
  `Evaluate_Cotent` varchar(50) NOT NULL COMMENT '评价内容（从Evaluate_Template表读取）',
  `Evaluate_Score` int(11) DEFAULT NULL COMMENT '内容得分',
  `Evaluate_Class` varchar(10) DEFAULT NULL COMMENT '评价类型（材料/工程）从Evaluate_Template表读取',
  PRIMARY KEY (`Evaluate_Name`,`Supplier_User_Name`,`Evaluate_Cotent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商评价';

-- 数据导出被取消选择。


-- 导出  表 test.z_supplier_information 结构
DROP TABLE IF EXISTS `z_supplier_information`;
CREATE TABLE IF NOT EXISTS `z_supplier_information` (
  `Supplier_Code` varchar(20) DEFAULT NULL COMMENT '供应商编码（采购企业编制）',
  `Supplier_User_Name` varchar(20) NOT NULL COMMENT '供应商登录名',
  `Pass_Word` varchar(20) DEFAULT NULL COMMENT '登录密码',
  `Register_Mobil` varchar(11) DEFAULT NULL COMMENT '注册手机',
  `Company_Name` varchar(40) DEFAULT NULL COMMENT '公司名称',
  `Company_Code` varchar(40) DEFAULT NULL COMMENT '统一社会信用代码/营业执照编号。三证合一的企业填写统一社会信用代码，其他企业填写营业执照编号',
  `Organize_Code` varchar(40) DEFAULT NULL COMMENT '组织机构代码。三证合一企业不用填写',
  `Tax_Code` varchar(40) DEFAULT NULL COMMENT '税务登记证。三证合一企业不用填写',
  `Company_Nature` varchar(40) DEFAULT NULL COMMENT '公司性质（有限责任/股份制/集体.....）从Date_Dictionary表中选取',
  `Province` varchar(40) DEFAULT NULL COMMENT '省',
  `City` varchar(40) DEFAULT NULL COMMENT '市',
  `County` varchar(40) DEFAULT NULL COMMENT '区/县',
  `Street` varchar(40) DEFAULT NULL COMMENT '街道门牌号',
  `Corporate_Representative` varchar(10) DEFAULT NULL COMMENT '法人代表',
  `Registered_Capital` int(11) DEFAULT NULL COMMENT '注册资金',
  `Establish_Date` date DEFAULT NULL COMMENT '登记日期',
  `Expiry_Date` date DEFAULT NULL COMMENT '营业终止日期',
  `Business_Scope` varchar(400) DEFAULT NULL COMMENT '经营范围',
  `Bank` varchar(40) DEFAULT NULL COMMENT '开户银行',
  `Account` varchar(40) DEFAULT NULL COMMENT '银行账号',
  `Service_Type` varchar(10) DEFAULT NULL COMMENT '服务类型（材料/工程）从Date_Dictionary中选取',
  `Contact_Name` varchar(10) DEFAULT NULL COMMENT '联系人',
  `Email` varchar(40) DEFAULT NULL COMMENT '电子邮箱',
  `Common_Mobile` varchar(11) DEFAULT NULL COMMENT '联系手机',
  `Supplier_State` varchar(10) DEFAULT NULL COMMENT '状态（注册、提交、审核中、通过审核、未通过审核）',
  `Supplier_Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Modify_Time` datetime DEFAULT NULL COMMENT '修改时间',
  `Create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Supplier_User_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商信息';

-- 数据导出被取消选择。


-- 导出  表 test.z_supplier_product 结构
DROP TABLE IF EXISTS `z_supplier_product`;
CREATE TABLE IF NOT EXISTS `z_supplier_product` (
  `Supplier_Product_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `Supplier_User_Name` varchar(20) DEFAULT NULL COMMENT '供应商登录名',
  `Meteriel_Cdode` varchar(20) DEFAULT NULL COMMENT '物料编码。由采购企业编制， 采购企业在审核供应商供货产品时填写。',
  `Product_Name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `Specification` varchar(50) DEFAULT NULL COMMENT '规格',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Unit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `Unit_Price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `Supply_Quantity` varchar(20) DEFAULT NULL COMMENT '可供数量',
  `Product_Class_Code` varchar(50) DEFAULT NULL COMMENT '产品分类编码（从Product_Class表中读取）',
  `Detail_Address` varchar(100) DEFAULT NULL COMMENT '详情地址（产品详情网页的链接地址）',
  `verify_Sign` varchar(10) DEFAULT NULL COMMENT '审核状态（未审核、通过、未通过），供应商新建或修改产品信息后，值为未审核状态',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '产品状态（在用/停用）',
  `verify_Name` varchar(20) DEFAULT NULL COMMENT '采购企业审核人的用户名',
  `verify_Time` datetime DEFAULT NULL COMMENT '审核时间',
  `Create_Time` datetime DEFAULT NULL COMMENT '本条记录创建时间',
  `Modify_Time` datetime DEFAULT NULL COMMENT '本条记录修改时间',
  PRIMARY KEY (`Supplier_Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商产品信息';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
