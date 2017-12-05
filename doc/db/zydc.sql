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

-- 导出  表 zydc.cms_article 结构
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE IF NOT EXISTS `cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `topic_id` int(11) DEFAULT NULL COMMENT '所属专题',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `author` varchar(50) DEFAULT NULL COMMENT '文章原作者',
  `fromurl` varchar(300) DEFAULT NULL COMMENT '转载来源网址',
  `image` varchar(300) DEFAULT NULL COMMENT '封面图',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `allowcomments` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许评论(0:不允许,1:允许)',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0未审核,1:通过)',
  `content` mediumtext COMMENT '内容',
  `user_id` int(10) unsigned NOT NULL COMMENT '发布人id',
  `readnumber` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `top` int(11) NOT NULL DEFAULT '0' COMMENT '置顶等级',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`article_id`),
  KEY `cms_article_orders` (`orders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_article_category 结构
DROP TABLE IF EXISTS `cms_article_category`;
CREATE TABLE IF NOT EXISTS `cms_article_category` (
  `article_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  PRIMARY KEY (`article_category_id`),
  KEY `cms_article_category_article_id` (`article_id`),
  KEY `cms_article_category_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章类目关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_article_tag 结构
DROP TABLE IF EXISTS `cms_article_tag`;
CREATE TABLE IF NOT EXISTS `cms_article_tag` (
  `article_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`article_tag_id`),
  KEY `cms_article_tag_article_id` (`article_id`),
  KEY `cms_article_tag_tag_id` (`tag_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`article_id`) REFERENCES `cms_article` (`article_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章标签关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_category 结构
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE IF NOT EXISTS `cms_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '上级编号',
  `level` tinyint(4) NOT NULL COMMENT '层级',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(255) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`category_id`),
  KEY `cms_category_orders` (`orders`),
  KEY `cms_category_pid` (`pid`),
  KEY `cms_category_alias` (`alias`),
  KEY `cms_category_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_category_tag 结构
DROP TABLE IF EXISTS `cms_category_tag`;
CREATE TABLE IF NOT EXISTS `cms_category_tag` (
  `category_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目编号',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  PRIMARY KEY (`category_tag_id`),
  KEY `cms_category_tag_tag_id` (`tag_id`),
  KEY `cms_category_tag_category_id` (`category_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`tag_id`) REFERENCES `cms_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='类目标签关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_comment 结构
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE IF NOT EXISTS `cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) unsigned DEFAULT NULL COMMENT '回复楼中楼编号回复楼中楼编号',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `content` text NOT NULL COMMENT '评论内容',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(-1:不通过,0:未审核,1:通过)',
  `ip` varchar(30) DEFAULT NULL COMMENT '评论人ip地址',
  `agent` varchar(200) DEFAULT NULL COMMENT '评论人终端信息',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`comment_id`),
  KEY `cms_comment_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_menu 结构
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE IF NOT EXISTS `cms_menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) DEFAULT NULL COMMENT '父菜单',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `target` varchar(10) DEFAULT NULL COMMENT '打开方式',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_page 结构
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `pid` int(10) DEFAULT NULL COMMENT '父页面',
  `title` varchar(20) DEFAULT NULL COMMENT '标题',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `content` mediumtext COMMENT '页面内容',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='页面';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_setting 结构
DROP TABLE IF EXISTS `cms_setting`;
CREATE TABLE IF NOT EXISTS `cms_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(10) DEFAULT NULL,
  `setting_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='网站配置';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_system 结构
DROP TABLE IF EXISTS `cms_system`;
CREATE TABLE IF NOT EXISTS `cms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '系统名称',
  `code` varchar(20) DEFAULT NULL COMMENT '别名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统管理';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_tag 结构
DROP TABLE IF EXISTS `cms_tag`;
CREATE TABLE IF NOT EXISTS `cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型(1:普通,2:热门...)',
  `alias` varchar(20) DEFAULT NULL COMMENT '别名',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `ctime` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `orders` bigint(20) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`tag_id`),
  KEY `cms_tag_orders` (`orders`),
  KEY `cms_tag_alias` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- 数据导出被取消选择。


-- 导出  表 zydc.cms_topic 结构
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE IF NOT EXISTS `cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专题';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_in_order 结构
DROP TABLE IF EXISTS `pay_in_order`;
CREATE TABLE IF NOT EXISTS `pay_in_order` (
  `pay_in_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_in_order_id`),
  KEY `FK_Reference_32` (`pay_vendor_id`),
  KEY `FK_Reference_38` (`pay_mch_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`pay_vendor_id`) REFERENCES `pay_vendor` (`pay_vendor_id`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`pay_mch_id`) REFERENCES `pay_mch` (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_in_order_detail 结构
DROP TABLE IF EXISTS `pay_in_order_detail`;
CREATE TABLE IF NOT EXISTS `pay_in_order_detail` (
  `pay_in_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_in_order_id` int(10) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_count` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_in_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收入订单明细表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_mch 结构
DROP TABLE IF EXISTS `pay_mch`;
CREATE TABLE IF NOT EXISTS `pay_mch` (
  `pay_mch_id` int(10) NOT NULL AUTO_INCREMENT,
  `mch_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `reqKey` varchar(50) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pay_mch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付中心商户管理表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_out_order 结构
DROP TABLE IF EXISTS `pay_out_order`;
CREATE TABLE IF NOT EXISTS `pay_out_order` (
  `pay_out_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_mch_id` int(10) DEFAULT NULL,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `amount` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ctime` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`pay_out_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_out_order_detail 结构
DROP TABLE IF EXISTS `pay_out_order_detail`;
CREATE TABLE IF NOT EXISTS `pay_out_order_detail` (
  `pay_out_order_detail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_out_order_id` int(10) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pay_out_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支出订单明细表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_pay 结构
DROP TABLE IF EXISTS `pay_pay`;
CREATE TABLE IF NOT EXISTS `pay_pay` (
  `pay_pay_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付参数配置表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_type 结构
DROP TABLE IF EXISTS `pay_type`;
CREATE TABLE IF NOT EXISTS `pay_type` (
  `pay_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_vendor_id` int(10) DEFAULT NULL,
  `pay_mch_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商户支持支付类型表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_vendor 结构
DROP TABLE IF EXISTS `pay_vendor`;
CREATE TABLE IF NOT EXISTS `pay_vendor` (
  `pay_vendor_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `appsecret` varchar(150) DEFAULT NULL,
  `config` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方支付标识表';

-- 数据导出被取消选择。


-- 导出  表 zydc.pay_vest 结构
DROP TABLE IF EXISTS `pay_vest`;
CREATE TABLE IF NOT EXISTS `pay_vest` (
  `pay_vest_id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_type_id` int(10) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`pay_vest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='马甲支付参数配置表';

-- 数据导出被取消选择。


-- 导出  表 zydc.ucenter_oauth 结构
DROP TABLE IF EXISTS `ucenter_oauth`;
CREATE TABLE IF NOT EXISTS `ucenter_oauth` (
  `oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '认证方式名称',
  PRIMARY KEY (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='认证方式表';

-- 数据导出被取消选择。


-- 导出  表 zydc.ucenter_user 结构
DROP TABLE IF EXISTS `ucenter_user`;
CREATE TABLE IF NOT EXISTS `ucenter_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码(MD5(密码+盐))',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别(0:未知,1:男,2:女)',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `create_ip` varchar(50) DEFAULT NULL COMMENT '注册IP地址',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP地址',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 数据导出被取消选择。


-- 导出  表 zydc.ucenter_user_details 结构
DROP TABLE IF EXISTS `ucenter_user_details`;
CREATE TABLE IF NOT EXISTS `ucenter_user_details` (
  `user_id` int(10) unsigned NOT NULL COMMENT '编号',
  `signature` varchar(300) DEFAULT NULL COMMENT '个性签名',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出生日期',
  `question` varchar(100) DEFAULT NULL COMMENT '帐号安全问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '帐号安全答案',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户详情表';

-- 数据导出被取消选择。


-- 导出  表 zydc.ucenter_user_log 结构
DROP TABLE IF EXISTS `ucenter_user_log`;
CREATE TABLE IF NOT EXISTS `ucenter_user_log` (
  `user_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户编号',
  `content` varbinary(100) DEFAULT NULL COMMENT '内容',
  `ip` varchar(20) DEFAULT NULL COMMENT '操作IP地址',
  `agent` varbinary(200) DEFAULT NULL COMMENT '操作环境',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`user_log_id`),
  KEY `FK_Reference_44` (`user_id`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志表';

-- 数据导出被取消选择。


-- 导出  表 zydc.ucenter_user_oauth 结构
DROP TABLE IF EXISTS `ucenter_user_oauth`;
CREATE TABLE IF NOT EXISTS `ucenter_user_oauth` (
  `user_oauth_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '帐号编号',
  `oauth_id` int(10) unsigned NOT NULL COMMENT '认证方式编号',
  `open_id` varbinary(50) NOT NULL COMMENT '第三方ID',
  `status` tinyint(4) unsigned DEFAULT NULL COMMENT '绑定状态(0:解绑,1:绑定)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_oauth_id`),
  KEY `FK_Reference_42` (`user_id`),
  KEY `FK_Reference_43` (`oauth_id`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`user_id`) REFERENCES `ucenter_user` (`user_id`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`oauth_id`) REFERENCES `ucenter_oauth` (`oauth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户认证方式表';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_log 结构
DROP TABLE IF EXISTS `upms_log`;
CREATE TABLE IF NOT EXISTS `upms_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `description` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `start_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `spend_time` int(11) DEFAULT NULL COMMENT '消耗时间',
  `base_path` varchar(500) DEFAULT NULL COMMENT '根路径',
  `uri` varchar(500) DEFAULT NULL COMMENT 'URI',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL',
  `method` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `parameter` mediumtext,
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户标识',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `result` mediumtext,
  `permissions` varchar(100) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`log_id`),
  KEY `log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_organization 结构
DROP TABLE IF EXISTS `upms_organization`;
CREATE TABLE IF NOT EXISTS `upms_organization` (
  `organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '组织名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '组织描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_permission 结构
DROP TABLE IF EXISTS `upms_permission`;
CREATE TABLE IF NOT EXISTS `upms_permission` (
  `permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `system_id` int(10) unsigned NOT NULL COMMENT '所属系统',
  `pid` int(10) DEFAULT NULL COMMENT '所属上级',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型(1:目录,2:菜单,3:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `uri` varchar(100) DEFAULT NULL COMMENT '路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_role 结构
DROP TABLE IF EXISTS `upms_role`;
CREATE TABLE IF NOT EXISTS `upms_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `title` varchar(20) DEFAULT NULL COMMENT '角色标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '角色描述',
  `ctime` bigint(20) NOT NULL COMMENT '创建时间',
  `orders` bigint(20) NOT NULL COMMENT '排序',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_role_permission 结构
DROP TABLE IF EXISTS `upms_role_permission`;
CREATE TABLE IF NOT EXISTS `upms_role_permission` (
  `role_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  PRIMARY KEY (`role_permission_id`),
  KEY `FK_Reference_23` (`role_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`role_id`) REFERENCES `upms_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_system 结构
DROP TABLE IF EXISTS `upms_system`;
CREATE TABLE IF NOT EXISTS `upms_system` (
  `system_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `banner` varchar(150) DEFAULT NULL COMMENT '背景',
  `theme` varchar(50) DEFAULT NULL COMMENT '主题',
  `basepath` varchar(100) DEFAULT NULL COMMENT '根目录',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(-1:黑名单,1:正常)',
  `name` varchar(20) DEFAULT NULL COMMENT '系统名称',
  `title` varchar(20) DEFAULT NULL COMMENT '系统标题',
  `description` varchar(300) DEFAULT NULL COMMENT '系统描述',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_user 结构
DROP TABLE IF EXISTS `upms_user`;
CREATE TABLE IF NOT EXISTS `upms_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) NOT NULL COMMENT '帐号',
  `password` varchar(32) NOT NULL COMMENT '密码MD5(密码+盐)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `realname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(150) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `locked` tinyint(4) DEFAULT NULL COMMENT '状态(0:正常,1:锁定)',
  `ctime` bigint(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_user_organization 结构
DROP TABLE IF EXISTS `upms_user_organization`;
CREATE TABLE IF NOT EXISTS `upms_user_organization` (
  `user_organization_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `organization_id` int(10) unsigned NOT NULL COMMENT '组织编号',
  PRIMARY KEY (`user_organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组织关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_user_permission 结构
DROP TABLE IF EXISTS `upms_user_permission`;
CREATE TABLE IF NOT EXISTS `upms_user_permission` (
  `user_permission_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限编号',
  `type` tinyint(4) NOT NULL COMMENT '权限类型(-1:减权限,1:增权限)',
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户权限关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.upms_user_role 结构
DROP TABLE IF EXISTS `upms_user_role`;
CREATE TABLE IF NOT EXISTS `upms_user_role` (
  `user_role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `role_id` int(10) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_data_dictionary 结构
DROP TABLE IF EXISTS `z_data_dictionary`;
CREATE TABLE IF NOT EXISTS `z_data_dictionary` (
  `Dictionary_Name` varchar(50) NOT NULL COMMENT '数据字典名称',
  `Dictionary_Content` varchar(50) NOT NULL COMMENT '数据字典内容',
  `Dictionary_Remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Content_Order` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`Dictionary_Name`,`Dictionary_Content`),
  CONSTRAINT `FK_z_data_dictionary_z_dictionary_name` FOREIGN KEY (`Dictionary_Name`) REFERENCES `z_dictionary_name` (`Dictionary_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_detailed_account 结构
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


-- 导出  表 zydc.z_dictionary_name 结构
DROP TABLE IF EXISTS `z_dictionary_name`;
CREATE TABLE IF NOT EXISTS `z_dictionary_name` (
  `Dictionary_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Dictionary_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典名称';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_evaluate_template 结构
DROP TABLE IF EXISTS `z_evaluate_template`;
CREATE TABLE IF NOT EXISTS `z_evaluate_template` (
  `Template_Name` varchar(50) NOT NULL COMMENT '模板名称',
  `Template_Cotent` varchar(50) NOT NULL COMMENT '模板内容',
  `Template_Score` int(11) DEFAULT NULL COMMENT '内容得分',
  `Template_Class` varchar(10) DEFAULT NULL COMMENT '模板类型（材料/工程）',
  PRIMARY KEY (`Template_Name`,`Template_Cotent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商评价模板';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_material_order 结构
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


-- 导出  表 zydc.z_material_requirement 结构
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
  PRIMARY KEY (`Material_Requirement_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料需求计划';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_materiel_code 结构
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


-- 导出  表 zydc.z_organization 结构
DROP TABLE IF EXISTS `z_organization`;
CREATE TABLE IF NOT EXISTS `z_organization` (
  `Organization_Code` varchar(50) NOT NULL COMMENT '部门编码',
  `Organezation_Hierarchy` int(11) NOT NULL COMMENT '节点层级',
  `Organezation_Order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `Organization_Name` varchar(50) DEFAULT NULL COMMENT '部门名',
  `Stop_Sign` varchar(10) DEFAULT '在用' COMMENT '状态（在用/停用）',
  `Parent_Organization_Code` varchar(10) DEFAULT NULL COMMENT '父部门编码',
  PRIMARY KEY (`Organization_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_product_class 结构
DROP TABLE IF EXISTS `z_product_class`;
CREATE TABLE IF NOT EXISTS `z_product_class` (
  `Product_Class_Code` varchar(50) NOT NULL COMMENT '分类编码',
  `Product_Class_Name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Parent_Product_Class_Code` varchar(10) DEFAULT NULL COMMENT '父编码',
  PRIMARY KEY (`Product_Class_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商产品分类';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_project_class 结构
DROP TABLE IF EXISTS `z_project_class`;
CREATE TABLE IF NOT EXISTS `z_project_class` (
  `Project_Class_Code` varchar(50) NOT NULL COMMENT '项目分类编码',
  `Project_Class_Name` varchar(50) DEFAULT NULL COMMENT '项目分类名称',
  `Stop_Sign` varchar(10) DEFAULT NULL COMMENT '状态（在用/停用）',
  `Parent_Project_Class_Code` varchar(10) DEFAULT NULL COMMENT '父编码',
  PRIMARY KEY (`Project_Class_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目分类编码';

-- 数据导出被取消选择。


-- 导出  表 zydc.z_supplier_attachment 结构
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


-- 导出  表 zydc.z_supplier_evaluate 结构
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


-- 导出  表 zydc.z_supplier_information 结构
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


-- 导出  表 zydc.z_supplier_product 结构
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
