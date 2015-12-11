CREATE DATABASE  IF NOT EXISTS liangma;/*判断并创建数据库*/
USE liangma;/*使用数据库*/

set FOREIGN_KEY_CHECKS = 0; 
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS vip;
/*
 * vip表
 * 主要记录所有注册的vip会员信息
 * 包括：‘√’ 表示必须填写，△表示非必填
 *   会员卡号：card   		√    	说明：卡号，字符类型，非空
 *   会员姓名：name   		√    	说明：姓名，字符型，非空
 *   会员生日：birth   		△    	说明：生日，日期时间类型，可为空 
 *   会员邮箱：email   		△    	说明：邮件，字符型，可为空
 *　 会员电话：phone   		△    	说明：电话，字符型，可为空
 *   注册日期：registerTime △ 	    说明：注册时间，日期时间类型，非空
 *   备注信息：memo			△		说明：备注，字符型，默认为空
 */
CREATE TABLE vip (
  id int(11) NOT NULL AUTO_INCREMENT, /*主键，数值类型，自增*/
  card varchar(11) NOT NULL,/*卡号，字符型，非空*/
  name varchar(255) NOT NULL,/*姓名，字符型，非空*/
  birth varchar(10) DEFAULT NULL,/*生日，日期时间类型，可为空*/
  email varchar(255) DEFAULT NULL,/*邮件，字符型，可为空*/
  phone varchar(11) DEFAULT NULL,/*电话，字符型，可为空*/
  registerTime datetime DEFAULT NULL,/*注册时间，日期时间类型，非空*/
  createTime varchar(30) DEFAULT NULL,
  updateTime varchar(30) DEFAULT NULL,
  memo varchar(1000) DEFAULT NULL,/*备注，字符型，默认为空*/
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*
 * vip用餐账目表
 * 主要记录各vip会员所有的用餐记录
 * 包括：‘√’ 表示必须填写，△表示非必填
 *   会员id：vipId   		 √    说明：主键，与vip表中的会员id对应，数值类型，自增
 *   消费日期：consumeTime   √    说明：来店消费日期，日期时间类型，非空
 *   用餐人数：consumerNum   √    说明：消费人数，数值类型，非空
 *   用餐类型：dinnerType    √    说明：用餐类型，数值类型：1为早餐；2为午餐；3为晚餐， 非空 
 *   备注信息：memo          △   说明：备注，字符型，默认为空
 */
CREATE TABLE account (
  id int(11) NOT NULL AUTO_INCREMENT,/*主键，数值类型，自增*/
  consumeTime varchar(10) NOT NULL, /*来店消费日期，日期时间类型，非空*/
  consumerNum int(11) NOT NULL, /*消费人数，数值类型，非空*/
  dinnerType int(1) NOT NULL,/*用餐类型，数值类型：1为早餐；2为午餐；3为晚餐， 非空*/
  createTime varchar(30) DEFAULT NULL,
  updateTime varchar(30) DEFAULT NULL,
  memo varchar(1000) DEFAULT NULL,/*备注，字符型，默认为空*/
  PRIMARY KEY (id),
  vipId int(11) DEFAULT NULL,/*外键，数值类型，与vip表的主键id一一对应*/
  KEY FK_account_vip (vipId),
  CONSTRAINT FK_account_role FOREIGN KEY (vipId) REFERENCES vip (id)/*设置为外键及对应外键表*/
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
set FOREIGN_KEY_CHECKS = 1;