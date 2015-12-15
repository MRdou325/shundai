-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2015-12-15 21:16:23
-- 服务器版本: 5.6.11
-- PHP 版本: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `wus`
--
CREATE DATABASE IF NOT EXISTS `wus` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wus`;

-- --------------------------------------------------------

--
-- 表的结构 `wu_action`
--

CREATE TABLE IF NOT EXISTS `wu_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `wu_action`
--

INSERT INTO `wu_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `wu_action_log`
--

CREATE TABLE IF NOT EXISTS `wu_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=198 ;

--
-- 转存表中的数据 `wu_action_log`
--

INSERT INTO `wu_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(41, 1, 1, 2130706433, 'member', 1, 'admin在2015-08-07 15:58登录了后台', 1, 1438934309),
(42, 10, 1, 2130706433, 'Menu', 139, '操作url：/ke1/index.php?s=/Admin/Menu/add.html', 1, 1438934379),
(43, 10, 1, 2130706433, 'Menu', 140, '操作url：/ke1/index.php?s=/Admin/Menu/add.html', 1, 1438934407),
(44, 6, 1, 2130706433, 'config', 48, '操作url：/ke1/index.php?s=/Admin/Config/edit.html', 1, 1438935079),
(45, 10, 1, 2130706433, 'Menu', 135, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935238),
(46, 10, 1, 2130706433, 'Menu', 76, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935585),
(47, 10, 1, 2130706433, 'Menu', 77, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935772),
(48, 10, 1, 2130706433, 'Menu', 78, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935784),
(49, 10, 1, 2130706433, 'Menu', 79, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935793),
(50, 10, 1, 2130706433, 'Menu', 121, '操作url：/ke1/index.php?s=/Admin/Menu/edit.html', 1, 1438935802),
(51, 1, 1, 0, 'member', 1, 'Admin在2015-08-10 09:14登录了后台', 1, 1439169268),
(52, 11, 1, 0, 'category', 39, '操作url：/ke361/index.php?s=/Admin/Category/add.html', 1, 1439170241),
(53, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183147),
(54, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183360),
(55, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183605),
(56, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183727),
(57, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439183865),
(58, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184333),
(59, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184405),
(60, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184441),
(61, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184463),
(62, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184483),
(63, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184526),
(64, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184589),
(65, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184616),
(66, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439184908),
(67, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185317),
(68, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185375),
(69, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185393),
(70, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185628),
(71, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185676),
(72, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185723),
(73, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439185734),
(74, 6, 1, 0, 'config', 20, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261081),
(75, 6, 1, 0, 'config', 20, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261218),
(76, 6, 1, 0, 'config', 0, '操作url：/ke361/index.php?s=/Admin/Config/del/id/49.html', 1, 1439261230),
(77, 6, 1, 0, 'config', 0, '操作url：/ke361/index.php?s=/Admin/Config/del/id/50.html', 1, 1439261234),
(78, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439261990),
(79, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439262031),
(80, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439276485),
(81, 6, 1, 0, 'config', 56, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439276876),
(82, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439278647),
(83, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439293768),
(84, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439294227),
(85, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342618),
(86, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342635),
(87, 10, 1, 0, 'Menu', 63, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439342649),
(88, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439342768),
(89, 10, 1, 0, 'Menu', 142, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439346606),
(90, 10, 1, 0, 'Menu', 142, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439346733),
(91, 10, 1, 0, 'Menu', 143, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439346763),
(92, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439348103),
(93, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349593),
(94, 6, 1, 0, 'config', 52, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349657),
(95, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439349726),
(96, 6, 1, 0, 'config', 62, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439371229),
(97, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439372982),
(98, 6, 1, 0, 'config', 61, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439375941),
(99, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376161),
(100, 6, 1, 0, 'config', 57, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376167),
(101, 6, 1, 0, 'config', 59, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376190),
(102, 6, 1, 0, 'config', 56, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376201),
(103, 6, 1, 0, 'config', 58, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376206),
(104, 6, 1, 0, 'config', 60, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376214),
(105, 6, 1, 0, 'config', 62, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376224),
(106, 6, 1, 0, 'config', 61, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376234),
(107, 6, 1, 0, 'config', 55, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376250),
(108, 6, 1, 0, 'config', 63, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376257),
(109, 6, 1, 0, 'config', 60, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1439376266),
(110, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439518669),
(111, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439518700),
(112, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439518763),
(113, 10, 1, 0, 'Menu', 145, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439520458),
(114, 10, 1, 0, 'Menu', 145, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439520724),
(115, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:34登录了后台', 1, 1439541277),
(116, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:39登录了后台', 1, 1439541574),
(117, 1, 1, 0, 'member', 1, 'Admin在2015-08-14 16:46登录了后台', 1, 1439541964),
(118, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:46登录了后台', 1, 1439542001),
(119, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:51登录了后台', 1, 1439542286),
(120, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:57登录了后台', 1, 1439542628),
(121, 1, 4, 0, 'member', 4, '还可以在2015-08-14 16:59登录了后台', 1, 1439542740),
(122, 1, 4, 0, 'member', 4, '还可以在2015-08-14 17:03登录了后台', 1, 1439543003),
(123, 1, 1, 0, 'member', 1, 'Admin在2015-08-14 17:06登录了后台', 1, 1439543200),
(124, 10, 1, 0, 'Menu', 146, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439629315),
(125, 10, 1, 0, 'Menu', 147, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439629337),
(126, 10, 1, 0, 'Menu', 148, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439792162),
(127, 10, 1, 0, 'Menu', 148, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1439792195),
(128, 10, 1, 0, 'Menu', 149, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439792258),
(129, 10, 1, 0, 'Menu', 150, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439810849),
(130, 10, 1, 0, 'Menu', 151, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1439811530),
(131, 1, 4, 0, 'member', 4, '还可以在2015-08-19 13:42登录了后台', 1, 1439962950),
(132, 1, 4, 0, 'member', 4, '还可以在2015-08-19 13:45登录了后台', 1, 1439963112),
(133, 1, 1, 0, 'member', 1, 'Admin在2015-08-19 17:51登录了后台', 1, 1439977876),
(134, 1, 1, 0, 'member', 1, 'Admin在2015-08-19 17:57登录了后台', 1, 1439978241),
(135, 1, 4, 0, 'member', 4, '还可以在2015-08-19 18:37登录了后台', 1, 1439980622),
(136, 1, 5, 0, 'member', 5, '阿晖在2015-08-20 14:04登录了后台', 1, 1440050649),
(137, 1, 1, 0, 'member', 1, 'Admin在2015-08-20 18:06登录了后台', 1, 1440065183),
(138, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440065214),
(139, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440122140),
(140, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440134917),
(141, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440134958),
(142, 10, 1, 0, 'Menu', 152, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440134997),
(143, 10, 1, 0, 'Menu', 141, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135024),
(144, 10, 1, 0, 'Menu', 144, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135036),
(145, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135074),
(146, 10, 1, 0, 'Menu', 153, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440135318),
(147, 10, 1, 0, 'Menu', 76, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440135881),
(148, 1, 1, 0, 'member', 1, 'Admin在2015-08-21 13:58登录了后台', 1, 1440136715),
(149, 1, 4, 0, 'member', 4, '还可以在2015-08-21 14:02登录了后台', 1, 1440136969),
(150, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:28登录了后台', 1, 1440412104),
(151, 1, 1, 0, 'member', 1, 'Admin在2015-08-24 18:43登录了后台', 1, 1440413035),
(152, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:47登录了后台', 1, 1440413229),
(153, 1, 4, 0, 'member', 4, '还可以在2015-08-24 18:47登录了后台', 1, 1440413248),
(154, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440413626),
(155, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440413652),
(156, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440413673),
(157, 10, 1, 0, 'Menu', 154, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440414219),
(158, 10, 1, 0, 'Menu', 155, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440414270),
(159, 10, 1, 0, 'Menu', 156, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440415335),
(160, 10, 1, 0, 'Menu', 157, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440466931),
(161, 10, 1, 0, 'Menu', 157, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440466996),
(162, 10, 1, 0, 'Menu', 158, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440468850),
(163, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440469161),
(164, 10, 1, 0, 'Menu', 93, '操作url：/ke361/index.php?s=/Admin/Menu/edit.html', 1, 1440469180),
(165, 1, 4, 0, 'member', 4, '还可以在2015-08-25 11:23登录了后台', 1, 1440473015),
(166, 1, 1, 0, 'member', 1, 'Admin在2015-08-25 11:25登录了后台', 1, 1440473137),
(167, 1, 4, 0, 'member', 4, '还可以在2015-08-25 13:01登录了后台', 1, 1440478881),
(168, 1, 1, 0, 'member', 1, 'Admin在2015-08-25 13:03登录了后台', 1, 1440479035),
(169, 10, 1, 0, 'Menu', 159, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440482453),
(170, 10, 1, 0, 'Menu', 160, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440484132),
(171, 6, 1, 0, 'config', 64, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1440486025),
(172, 10, 1, 0, 'Menu', 161, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440487219),
(173, 10, 1, 0, 'Menu', 162, '操作url：/ke361/index.php?s=/Admin/Menu/add.html', 1, 1440487240),
(174, 6, 1, 0, 'config', 64, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1440488806),
(175, 1, 4, 0, 'member', 4, '还可以在2015-08-25 16:28登录了后台', 1, 1440491300),
(176, 6, 1, 0, 'config', 5, '操作url：/ke361/index.php?s=/Admin/Config/edit.html', 1, 1441077126),
(177, 11, 1, 0, 'category', 39, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441517801),
(178, 11, 1, 0, 'category', 2, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441517810),
(179, 11, 1, 0, 'category', 39, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441521979),
(180, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/add.html', 1, 1441522017),
(181, 11, 1, 0, 'category', 41, '操作url：/ke361/index.php?s=/Admin/Category/add.html', 1, 1441522055),
(182, 11, 1, 0, 'category', 42, '操作url：/ke361/index.php?s=/Admin/Category/add.html', 1, 1441522089),
(183, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441522128),
(184, 11, 1, 0, 'category', 41, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441522134),
(185, 11, 1, 0, 'category', 42, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441522140),
(186, 11, 1, 0, 'category', 42, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441539868),
(187, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441602739),
(188, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441602811),
(189, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441602950),
(190, 11, 1, 0, 'category', 42, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441603036),
(191, 11, 1, 0, 'category', 40, '操作url：/ke361/index.php?s=/Admin/Category/edit.html', 1, 1441609924),
(192, 1, 1, 0, 'member', 1, 'Admin在2015-09-18 13:32登录了后台', 1, 1442554346),
(193, 1, 1, 0, 'member', 1, 'Admin在2015-09-18 13:32登录了后台', 1, 1442554372),
(194, 1, 1, 0, 'member', 1, 'Admin在2015-09-22 17:55登录了后台', 1, 1442915732),
(195, 1, 1, 0, 'member', 1, 'Admin在2015-09-22 19:14登录了后台', 1, 1442920486),
(196, 1, 1, 0, 'member', 1, 'Admin在2015-09-22 19:31登录了后台', 1, 1442921470),
(197, 1, 1, 0, 'member', 1, 'Admin在2015-09-23 15:08登录了后台', 1, 1442992098);

-- --------------------------------------------------------

--
-- 表的结构 `wu_addons`
--

CREATE TABLE IF NOT EXISTS `wu_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `wu_addons`
--

INSERT INTO `wu_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_article`
--

CREATE TABLE IF NOT EXISTS `wu_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cate_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `status` tinyint(1) NOT NULL DEFAULT '-1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `sort` mediumint(5) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_attachment`
--

CREATE TABLE IF NOT EXISTS `wu_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_attribute`
--

CREATE TABLE IF NOT EXISTS `wu_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `wu_attribute`
--

INSERT INTO `wu_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `wu_auth_extend`
--

CREATE TABLE IF NOT EXISTS `wu_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `wu_auth_extend`
--

INSERT INTO `wu_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_auth_group`
--

CREATE TABLE IF NOT EXISTS `wu_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wu_auth_group`
--

INSERT INTO `wu_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `wu_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `wu_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wu_auth_rule`
--

CREATE TABLE IF NOT EXISTS `wu_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- 转存表中的数据 `wu_auth_rule`
--

INSERT INTO `wu_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', -1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', -1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', -1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', -1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', -1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', -1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'Admin/Nav/add', '新增', 1, ''),
(218, 'admin', 1, 'Admin/Nav/edit', '编辑', 1, ''),
(219, 'admin', 1, 'Admin/Navl/del', '删除', 1, ''),
(220, 'admin', 1, 'Admin/Nav/sort', '排序', 1, ''),
(221, 'admin', 1, 'Admin/Goods/index', '商品列表', 1, ''),
(222, 'admin', 1, 'Admin/Collect/index', '商品采集', 1, ''),
(223, 'admin', 1, 'Admin/CategoryGoods/add', '添加分类', 1, ''),
(224, 'admin', 1, 'Admin/Collect/collectList', '采集到的商品', 1, ''),
(225, 'admin', 1, 'Admin/Banner/add', '新增', 1, ''),
(226, 'admin', 1, 'Admin/Banner/del', '删除', 1, ''),
(227, 'admin', 1, 'Admin/FriendLink/add', '添加', 1, ''),
(228, 'admin', 2, 'Admin/Goods/index', '商品', 1, ''),
(229, 'admin', 1, 'Admin/Goods/edit', '添加商品', 1, ''),
(230, 'admin', 1, 'Admin/Banner/index', '幻灯片', 1, ''),
(231, 'admin', 1, 'Admin/Nav/index', '导航管理', 1, ''),
(232, 'admin', 1, 'Admin/FriendLink/index', '友情链接', 1, ''),
(233, 'admin', 1, 'Admin/CategoryGoods/index', '分类列表', 1, ''),
(234, 'admin', 1, 'Admin/Page/index', '说明页面', 1, ''),
(235, 'admin', 1, 'Admin/Topic/index', '专题列表', 1, ''),
(236, 'admin', 1, 'Admin/Topic/add', '增加专题', 1, ''),
(237, 'admin', 1, 'Admin/Goods/extra', '附加信息', 1, ''),
(238, 'admin', 1, 'Admin/Goods/extraedit', '新增附加信息', 1, ''),
(239, 'admin', 1, 'Admin/Page/add', '添加', 1, ''),
(240, 'admin', 1, 'Admin/Orders/index', '全部订单', 1, ''),
(241, 'admin', 1, 'Admin/Orders/edit', '查看订单', 1, ''),
(242, 'admin', 1, 'Admin/Orders/orderStatus', '订单状态', 1, ''),
(243, 'admin', 1, 'Admin/Orders/addstatus', '增加订单状态', 1, ''),
(244, 'admin', 2, 'Admin/Orders/index', '订单', 1, ''),
(245, 'admin', 1, 'Admin/Tag/add', '添加标签', 1, ''),
(246, 'admin', 1, 'Admin/Tag/index', '标签列表', 1, ''),
(247, 'admin', 2, 'Admin/Page/index', '工具', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `wu_banner`
--

CREATE TABLE IF NOT EXISTS `wu_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(512) NOT NULL,
  `link` varchar(512) DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `click` int(11) NOT NULL DEFAULT '0',
  `sort` tinyint(3) NOT NULL DEFAULT '0',
  `content` text,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wu_banner`
--

INSERT INTO `wu_banner` (`id`, `image`, `link`, `title`, `type`, `click`, `sort`, `content`, `status`) VALUES
(1, '/ke361/Uploads/site_logo/55cafb3fe40e4.jpg', 'www.baidu.com', '这是测试', 1, 0, 0, '文灶 单间出租,1200元一个月,可以煮饭,有空调，有热水器:1000|文灶 60m²绝版好房便宜出租:2000', 1),
(2, '/ke361/Uploads/site_logo/55cafb3943525.jpg', 'google.com', 'Euro', 1, 0, 0, '', 1),
(3, '/ke361/Uploads/site_logo/55cafb2d12d10.jpg', '', 'hhhh', 1, 0, 0, 'werwer:1000|weasdfw:2000|gahasd:4000', 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_category`
--

CREATE TABLE IF NOT EXISTS `wu_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `ishome` tinyint(3) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `wu_category`
--

INSERT INTO `wu_category` (`id`, `name`, `title`, `pid`, `ishome`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'blog', '博客', 0, 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1382701539, 1, 0),
(2, 'default_blog', '默认分类', 1, 0, 1, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 0, 0, '1', '', 1379475028, 1441517810, 1, 31),
(39, 'ugg', '旅游资讯', 1, 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2,1,3', 0, 2, 1, 1, 0, '', '', 1439170241, 1441521979, 1, 10),
(40, 'gl', '旅游攻略', 0, 1, 0, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 2, 1, 1, 0, '', '', 1441522017, 1441609924, 1, 49),
(41, 'help', '帮助中心', 0, 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 1, 0, '', '', 1441522055, 1441522134, 1, 0),
(42, 'zx', '旅游资讯', 0, 1, 0, 10, '', '', '', '', '', '', '', '2,3', '2,1,3', 0, 2, 1, 1, 0, '', '', 1441522089, 1441603036, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_category_goods`
--

CREATE TABLE IF NOT EXISTS `wu_category_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '宝贝分类id',
  `category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '宝贝分类名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `istravel` tinyint(4) NOT NULL DEFAULT '0',
  `catepic_url` varchar(250) DEFAULT NULL,
  `ad_url` varchar(250) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `p_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属店铺',
  `goods_num` int(3) NOT NULL DEFAULT '0' COMMENT '包含宝贝数量',
  `home_num` int(11) NOT NULL,
  `is_home` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分类状态，与宝贝状态对应：0=关闭，1开启',
  `sort` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '宝贝排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `wu_category_goods`
--

INSERT INTO `wu_category_goods` (`id`, `category_name`, `type`, `istravel`, `catepic_url`, `ad_url`, `color`, `p_id`, `goods_num`, `home_num`, `is_home`, `status`, `sort`) VALUES
(1, '品质男装', 1, 0, '', '', '', 0, 0, 0, 0, 1, 0),
(2, '精品女装', 1, 0, '', '', '', 0, 0, 4, 1, 1, 2),
(3, '生活电器', 1, 0, '', '', '', 0, 0, 0, 0, 1, 0),
(4, '手机数码', 1, 1, '', '', 'green', 0, 0, 0, 0, 1, 0),
(9, '手机配件', 1, 0, '', '', '', 4, 0, 0, 0, 1, 0),
(10, '国内游', 1, 1, '/ke361/Uploads/category/55e512b787383.png', '/ke361/Uploads/category/55e512bb63578.jpg', 'green_b', 0, 0, 8, 1, 1, 0),
(11, '北京', 1, 0, '', '', '', 10, 0, 0, 1, 1, 0),
(12, '福建', 1, 0, '', '', '', 10, 0, 0, 1, 1, 0),
(13, '厦门', 1, 0, '', '', '', 12, 0, 0, 0, 1, 0),
(14, 'tawerasdf', 1, 0, '', '', 'green', 3, 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_collect_goods`
--

CREATE TABLE IF NOT EXISTS `wu_collect_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num_iid` varchar(20) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '宝贝名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` varchar(255) NOT NULL COMMENT '商品类型',
  `discount_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '折扣价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `pic_url` varchar(255) NOT NULL COMMENT '图片地址',
  `item_url` varchar(255) NOT NULL DEFAULT '' COMMENT '宝贝地址',
  `click_url` text COMMENT '推广地址',
  PRIMARY KEY (`id`),
  KEY `num_iid` (`num_iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_config`
--

CREATE TABLE IF NOT EXISTS `wu_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `wu_config`
--

INSERT INTO `wu_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '这是网站标题', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '这是网站描述', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '网站关键词,网站', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '闽ICP备11025956号', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1439261218, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:显示\r\n6:幻灯片', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(45, 'TONGJI', 2, '统计代码', 1, '', '网站统计代码', 1437700726, 1437700726, 1, '', 0),
(47, 'URL_MODEL', 4, 'URL模式', 5, '0:普通模式\r\n1:PATHINFO模式\r\n2:REWRITE模式\r\n3:兼容模式', '', 1437701819, 1437701819, 1, '3', 0),
(48, 'HOME_DEFAULT_THEME', 4, '前台主题', 5, 'black:black', '', 1437702225, 1438935079, 1, 'black', 1),
(56, 'BANNER_PREVIOUS', 4, '显示上一张按钮', 6, '0:关闭,1:显示', '是否在幻灯片上显示上一张按钮', 1439276804, 1439376201, 1, '1', 2),
(55, 'BANNER_OVERPAUSE', 4, '鼠标经过停止', 6, '0:关闭,1:开启', '鼠标经过是否停止', 1439261906, 1439376250, 1, '1', 1),
(5, 'WEB_SITE_LOGO', 1, '网站logo', 1, '', '网站标题前台显示LOGO', 1439171677, 1441077126, 1, '/ke361/Uploads/site_logo/55e51782b39ea.png', 0),
(52, 'WEB_SITE_ICO', 1, '网站图标', 1, '', '显示在浏览器上方的图标', 1439185020, 1439349657, 1, '/ke361/Uploads/site_logo/55cabb91db451.ico', 0),
(53, 'WEB_SITE_NAME', 1, '网站名称', 1, '', '网站名称', 1439186697, 1439186697, 1, '厦门旅行社', 0),
(54, 'WEB_SITE_TEL', 1, '联系电话', 1, '', '公司或者网站联系电话', 1439188783, 1439188783, 1, '0592-8888888', 0),
(57, 'BANNER_NEXT', 4, '显示下一张按钮', 6, '0:关闭,1:显示', '是否在幻灯片显示下一张按钮', 1439276861, 1439376167, 1, '1', 2),
(58, 'BANNER_BARTIMER', 4, '显示底部时间进度条', 6, '0:关闭,1:显示', '是否在幻灯片显示底部时间进度条', 1439276970, 1439376206, 1, '1', 2),
(59, 'BANNER_CIRCLETIMER', 4, '显示圆形时间进度条', 6, '0:关闭,1:显示', '是否在幻灯片显示圆形时间进度条', 1439277045, 1439376190, 1, '1', 2),
(60, 'BANNER_THUMBLIST', 4, '显示底部略缩图', 6, '0:关闭,1:显示', '是否在幻灯片显示底部显示略缩图', 1439277176, 1439376266, 1, '1', 2),
(61, 'BANNER_OPEN', 4, '首页显示幻灯片', 6, '0:关闭,1:开启', '首页是否显示幻灯片', 1439277361, 1439376234, 1, '1', 0),
(62, 'BANNER_WIDTH', 0, '幻灯片的宽度', 6, '', '幻灯片的宽度', 1439371173, 1439376224, 1, '1150', 1),
(63, 'BANNER_HEIGHT', 0, '幻灯片的高度', 6, '', '幻灯片的高度', 1439371208, 1439376257, 1, '525', 1),
(64, 'WEB_SUPPORT_OPEN', 4, '客服漂浮框', 1, '0:关闭,1:开启', '是否在前台显示', 1440482112, 1440488806, 1, '0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_document`
--

CREATE TABLE IF NOT EXISTS `wu_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `wu_document`
--

INSERT INTO `wu_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(2, 1, 'test', '这是测试', 41, '这个只是一个测试的', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1439515440, 1441521516, 1),
(3, 1, 'sdfasd', 'gsdfasd', 42, 'asdfasdf', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1441516500, 1441539171, 1),
(4, 1, 'asdfwefa', 'fwefasd', 41, '1111111111111', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1441516979, 1441516979, 1),
(7, 0, 'ejalksdjf', '阿拉山口的房间阿劳科省的', 42, '巍峨高耸觉得卡拉sdfjalksj\r\n巍峨记录卡手机丢了泪水宽带计费\r\n挖过流口水的', 0, 0, 2, 2, 0, 0, 48, 1, 0, 0, 0, 0, 0, 0, 1441539900, 1441604461, 1),
(8, 0, 'hhhhhhh', 'asdf哈哈哈哈123', 42, '', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1441596632, 1441596632, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_document_article`
--

CREATE TABLE IF NOT EXISTS `wu_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `wu_document_article`
--

INSERT INTO `wu_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(2, 0, '', '', 0),
(3, 0, '', '', 0),
(4, 0, '', '', 0),
(5, 0, '', '', 0),
(6, 0, '', '', 0),
(7, 0, '<p>\r\n	sdfasdfaadf\r\n</p>\r\n<p>\r\n	&nbsp;啊多发生大幅啊是的\r\n</p>', '', 0),
(8, 0, '<p>\r\n	那个什么哈哈哈\r\n</p>\r\n<p>\r\n	哈哈哈哈\r\n</p>\r\n<p>\r\n	哈哈哈哈哈哈哈哈哈\r\n</p>', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_document_download`
--

CREATE TABLE IF NOT EXISTS `wu_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `wu_favor`
--

CREATE TABLE IF NOT EXISTS `wu_favor` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人id',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `wu_favor`
--

INSERT INTO `wu_favor` (`fid`, `goods_id`, `uid`) VALUES
(1, 400, 3),
(2, 468, 4),
(3, 468, 1),
(4, 469, 1),
(5, 469, 5),
(6, 468, 5),
(7, 436, 4),
(8, 470, 4);

-- --------------------------------------------------------

--
-- 表的结构 `wu_file`
--

CREATE TABLE IF NOT EXISTS `wu_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_friendlink`
--

CREATE TABLE IF NOT EXISTS `wu_friendlink` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `blank` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(150) NOT NULL DEFAULT '',
  `pic_url` varchar(250) NOT NULL DEFAULT '',
  `sort` smallint(30) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wu_friendlink`
--

INSERT INTO `wu_friendlink` (`aid`, `title`, `type`, `blank`, `url`, `pic_url`, `sort`, `state`) VALUES
(1, '厦门小鱼', 1, 1, 'www.xmfish.com', 'http://www.xmfish.com/images/chanel/www/index2/xiaoyulogo-145-30.png', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_goods`
--

CREATE TABLE IF NOT EXISTS `wu_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '线路或者签证',
  `num_iid` varchar(20) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '宝贝名称',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `add_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加人',
  `add_uname` varchar(30) NOT NULL DEFAULT 'admin',
  `city` varchar(255) NOT NULL DEFAULT '0' COMMENT '出发城市，签证所属领区',
  `days` int(11) NOT NULL DEFAULT '0' COMMENT '行程天数，签证办理时间',
  `aheaddays` varchar(50) NOT NULL DEFAULT '0' COMMENT '提前预定，签证有效期',
  `traffic` varchar(255) NOT NULL DEFAULT '0' COMMENT '交通方式，签证受理范围',
  `invite` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否需要邀请函',
  `audition` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否需要面试',
  `maxdays` int(11) NOT NULL DEFAULT '0' COMMENT '最大逗留天数',
  `discount_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '折扣价',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '现价',
  `child_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '儿童票',
  `pic_url` varchar(255) NOT NULL COMMENT '图片地址',
  `item_body` longtext NOT NULL COMMENT '宝贝内容',
  `item_price_body` text,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1审核通过，0未审核',
  `seo_title` varchar(255) DEFAULT '' COMMENT 'seo标题',
  `seo_keywords` varchar(255) DEFAULT '' COMMENT 'seo关键字',
  `seo_description` varchar(255) DEFAULT '',
  `ctime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间（时间戳）',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '商品点击数',
  `favor` int(11) NOT NULL DEFAULT '0' COMMENT '商品赞数',
  `goods_sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `tags` text,
  `date_price` text,
  `body_type` tinyint(3) NOT NULL DEFAULT '1',
  `days_body` text,
  PRIMARY KEY (`goods_id`),
  KEY `goods_id` (`goods_id`),
  KEY `num_iid` (`num_iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=472 ;

--
-- 转存表中的数据 `wu_goods`
--

INSERT INTO `wu_goods` (`goods_id`, `goods_type`, `num_iid`, `title`, `cate_id`, `tid`, `add_id`, `add_uname`, `city`, `days`, `aheaddays`, `traffic`, `invite`, `audition`, `maxdays`, `discount_price`, `price`, `child_price`, `pic_url`, `item_body`, `item_price_body`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `ctime`, `hits`, `favor`, `goods_sort`, `tags`, `date_price`, `body_type`, `days_body`) VALUES
(408, 1, '520204184520', '2015新款刺绣印花连衣裙夏季女装韩版针织淑女两件套装裙子大摆裙', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '198.00', '899.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i4/TB1wOpyIFXXXXbKXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 2, 0, 0, '', NULL, 1, NULL),
(409, 1, '38624398489', '斯黛欧2015夏季新款韩版潮宽松大码女装显瘦雪纺连衣裙胖MM1590', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '128.00', '198.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i1/T1ocpNFJlbXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(410, 1, '44694416919', '千羽斐无袖蕾丝雪纺连衣裙夏女装2015新款韩版修身显瘦白色裙子潮', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '139.00', '239.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1u83LHpXXXXa5XXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(411, 1, '45681133007', '2015新款夏季女装宽松显瘦背带裙连衣裙两件套装中长款吊带裙子潮', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '138.00', '399.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1GGFPHVXXXXbNXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(412, 1, '44953146908', '真丝连衣裙夏季2015新款女装短袖拼接圆点高档桑蚕丝真丝绸缎裙子', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '378.00', '718.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1Z_yxHFXXXXX1XFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(413, 1, '520271059295', '欧洲站2015夏装新款韩版女装 名媛时尚百褶 修身显瘦雪纺连衣裙女', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '148.00', '298.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1Dyg4IpXXXXbqXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(414, 1, '45742522599', '2015夏装新款针织红色棉麻连衣裙女装大码宽松休闲亚麻薄款中裙子', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '118.00', '298.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i2/TB1mYaWIXXXXXX5XXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(415, 1, '520401288290', '欧洲站2015夏装新品韩版女装雪纺短袖中长款显瘦大码两件套连衣裙', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '158.00', '399.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i2/TB1oKDvIVXXXXXXXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(416, 1, '45386572729', '欧洲站名媛气质 棉麻连衣裙夏中裙2015女装新款韩版修身显瘦裙子', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '118.00', '230.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i2/TB1uTYDHVXXXXcFXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(417, 1, '520515723432', '欧洲站2015夏季女装新款短袖中长款雪纺连衣裙显瘦大码印花女裙子', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '138.00', '888.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1N64OIFXXXXbkXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935383, 0, 0, 0, '', NULL, 1, NULL),
(418, 1, '21589959991', '烟花烫ZG2015夏新款女装甜美绣花蕾丝短袖雪纺印花连衣裙 柔夏', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '268.00', '656.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i1/TB1bKQsHpXXXXaCXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(419, 1, '520069660739', '欧洲站2015夏季新款女装中长款气质连衣裙欧根纱蓬蓬A字裙两件套', 11, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '148.00', '299.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB129MvIXXXXXcbXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 3, 0, 0, '', NULL, 1, NULL),
(420, 1, '520593467479', '2015夏韩版新款女装欧根纱蓬蓬裙无袖连衣裙修身荷叶边短裙背心裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '138.00', '528.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1vT9eHpXXXXcWapXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(421, 1, '44462859192', '夏季女装蕾丝拼接雪纺连衣裙收腰显瘦礼服裙OL职业工作服包臀裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '111.00', '259.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1DBOqIVXXXXa1aFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(422, 1, '520305545531', '布伊格夏装2015韩版女装高端刺绣欧根纱蓬蓬裙套装裙两件套连衣裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '199.00', '549.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB19v96IpXXXXctXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(423, 1, '520712743447', '钻姿2015夏装新款女装潮长裙韩版复古文艺刺绣无袖棉麻连衣裙女夏', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '198.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i2/TB1JEHyIFXXXXaAXFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(424, 1, '520520082885', '2015新款针织印花连衣裙夏季韩版女装修身两件套装裙子淑女A字裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '799.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/TB1ZRguIFXXXXciXFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(425, 1, '37805958933', '琳丹乐夏装新品大码女装韩版蕾丝拼接雪纺碎花显瘦 修身连衣裙子', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '159.00', '288.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i2/T1F9WIFrleXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(426, 1, '520293865473', '卡洛莱时尚连衣裙夏 2015夏季新款女装修身显瘦气质雪纺连衣裙女', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '308.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1Sv6IIpXXXXczXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(427, 1, '520326664411', '2015夏装新款韩版大码女装气质淑女修身长裙夏季真丝皱雪纺连衣裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '138.00', '276.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/TB1e6ntIpXXXXc8XVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935391, 0, 0, 0, '', NULL, 1, NULL),
(428, 1, '45077492685', '欧根纱连衣裙女夏季2015夏装女装新款韩版潮欧洲站蕾丝刺绣裙子', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '228.00', '449.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i2/TB1xNwHHpXXXXXQapXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(429, 1, '520298630806', '欧洲站2015夏季新款镶钻腰带雪纺褶皱修身显瘦中长款连衣裙女装潮', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '169.00', '338.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB1IgguIpXXXXa0XFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(430, 1, '520707961074', '2015夏新款名媛女装短袖v领真丝雪纺连衣裙中裙修身韩版印花裙女', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '488.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB1RFARIFXXXXXdXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(431, 1, '520610922412', '欧洲站2015夏装新款女装韩版修身雪纺裙显瘦收腰中裙短袖连衣裙夏', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '336.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i4/TB10DeJIFXXXXbfXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(432, 1, '43567408687', '小黑裙2015夏季新款韩版修身显瘦无袖背心短裙雪纺A字连衣裙女装', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '119.00', '399.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i1/TB1Gh7kHpXXXXc3XFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(433, 1, '520460332917', '韩国2015夏季女装新款气质修身显瘦棉麻连衣裙长款不规则一步裙夏', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '368.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/TB14bBdIFXXXXbnXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(434, 1, '520214039677', '欧洲站2015夏季女装新款真丝印花短袖套装裙两件套短裙连衣裙女潮', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '168.00', '238.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i1/TB1lQ0GIVXXXXcGXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(435, 1, '520211095871', '2015夏装新款女装显瘦长裙夏季淑女气质长款韩版雪纺连衣裙女 夏', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '158.00', '680.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB1sw8fIFXXXXXlaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 0, 0, 0, '', NULL, 1, NULL),
(436, 1, '520635131814', '2015夏季新款韩版通勤女装圆领短袖气质修身ol连衣裙女中裙淑女裙', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '158.00', '468.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i1/TB1ogHdIFXXXXX3aXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935402, 1, 0, 0, '', NULL, 1, NULL),
(437, 1, '520543428983', '欧洲站2015新款夏季印花连衣裙欧根纱高腰短裙韩版背心裙女装包邮', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '178.00', '336.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i4/TB1nSdOIVXXXXbXXpXXXXXXXXXX_!!0-item_pic.jpg', '<p><a name="_fans_tuan_a1166847ecc74205fd1d526117735_begin"></a> <span title="_fans_tuan_a1166847ecc74205fd1d526117735_begin"></span></p><table background="https://img.alicdn.com/imgextra/i3/1038382815/TB2ToSAaXXXXXbzXXXXXXXXXXXX-1038382815.jpg" width="750" height="130"><tr><td style="text-align: right;"><img width="115" height="115" style="margin: 3.0px 40.0px 0 0;" src="https://img.alicdn.com/tfscom/TB1JPxLIVXXXXcmXpXXwu0bFXXX.png"></td></tr></table><p><a name="_fans_tuan_a1166847ecc74205fd1d526117735_end"></a> <span title="_fans_tuan_a1166847ecc74205fd1d526117735_end"></span> <a name="_fans_tuan_c1166827ecc74205fddd52615c735_begin"></a> <span title="_fans_tuan_c1166827ecc74205fddd52615c735_begin"></span></p><table background="https://img.alicdn.com/imgextra/i2/1038382815/TB2G5b.bXXXXXb.XXXXXXXXXXXX-1038382815.png" style="background-repeat: no-repeat;" height="130" width="750"><tr><td align="right"><img style="width: 112.0px;margin-right: 42.0px;" src="https://img.alicdn.com/tfscom/TB1X7XMIVXXXXbTXpXXwu0bFXXX.png"></td></tr></table><p><a name="_fans_tuan_c1166827ecc74205fddd52615c735_end"></a> <span title="_fans_tuan_c1166827ecc74205fddd52615c735_end"></span></p><div title="zhangguiactiveuni_229728" class="zhangguiactiveuni_229728" style="width: 750.0px;height: 191.0px;overflow: hidden;margin: 0 auto;"><a target="_blank" href="http://iqiang.uz.taobao.com/market.php?id=229728"> <img src="https://img.alicdn.com/imgextra/T2phSMXzhXXXXXXXXX-729596062.gif?v=1"> </a></div><div title="qmfq_dp18868" class="qmfq_dp18868" style="width: 750.0px;height: 370.0px;overflow: hidden;margin: 0 auto;font-family: microsoft yahei;"><table width="100%" height="100%" cellpadding="0" cellspacing="0" background="https://img.alicdn.com/imgextra/TB2AkvlcpXXXXXWXXXXXXXXXXXX-729596062.png"><tr><td valign="top"><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="height: 64.0px;"></td></tr><tr><td><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="width: 25.0px;"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=520543428983"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i1/TB1QqJ2IFXXXXbVXXXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">欧洲站2015新款夏季印花连衣裙欧根纱高腰短裙韩版背心裙女装包邮</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #ff5500;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：336.00元</td><td style="width: 100.0px;height: 28.0px;color: #ff5500;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2xBjgcpXXXXczXXXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=45777743415"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i4/TB1q.PXIXXXXXaPXpXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">欧洲站2015新款女装时尚真丝印花上衣+气质哈伦短裤套装女夏名媛</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #ff5500;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：390.00元</td><td style="width: 100.0px;height: 28.0px;color: #ff5500;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2CojgcpXXXXcwXXXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 185.0px;"><tr><td style="height: 47.0px;width: 185.0px;"><img width="185" height="47" src="https://img.alicdn.com/imgextra/TB2gEPccpXXXXX3XpXXXXXXXXXX-729596062.png"></td></tr><tr><td style="height: 152.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #696767;"><table cellpadding="0" cellspacing="0" width="100%"><tr style="height: 30.0px;"><td rowspan="3" style="width: 12.0px;"></td><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">原价：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;text-decoration: line-through;">726元</td><td rowspan="3" style="width: 8.0px;"></td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">立省：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#ff5500" style="font-weight: bold;font-size: 22.0px;">396</font>元</td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">搭配价：</td><td style="width: 18.0px;padding-top: 5.0px;"><img src="https://img.alicdn.com/imgextra/TB2qR_fcpXXXXcGXXXXXXXXXXXX-729596062.png"></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#ff5500" style="font-weight: bold;font-size: 22.0px;">330</font>元</td></tr></table></td></tr><tr><td style="background-color: #ff5500;height: 80.0px;font-size: 16.0px;font-family: microsoft yahei;text-align: center;"><a target="_blank" style="color: #ffffff;text-decoration: none;" href="http://iqiang.uz.taobao.com/meal.php?id=18868">购买套餐</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div><div title="qmfq_dp18867" class="qmfq_dp18867" style="width: 750.0px;height: 370.0px;overflow: hidden;margin: 0 auto;font-family: microsoft yahei;"><table width="100%" height="100%" cellpadding="0" cellspacing="0" background="https://img.alicdn.com/imgextra/TB2AkvlcpXXXXXWXXXXXXXXXXXX-729596062.png"><tr><td valign="top"><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="height: 64.0px;"></td></tr><tr><td><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="width: 25.0px;"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=520543428983"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i1/TB1QqJ2IFXXXXbVXXXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">欧洲站2015新款夏季印花连衣裙欧根纱高腰短裙韩版背心裙女装包邮</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #ff5500;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：336.00元</td><td style="width: 100.0px;height: 28.0px;color: #ff5500;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2xBjgcpXXXXczXXXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=45809962673"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i4/TB1XhtTHpXXXXbXapXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">2015夏季女装韩版新款猫咪上衣印花百褶裙修身套装雪纺连衣裙夏潮</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #ff5500;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：390.00元</td><td style="width: 100.0px;height: 28.0px;color: #ff5500;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2CojgcpXXXXcwXXXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 185.0px;"><tr><td style="height: 47.0px;width: 185.0px;"><img width="185" height="47" src="https://img.alicdn.com/imgextra/TB2gEPccpXXXXX3XpXXXXXXXXXX-729596062.png"></td></tr><tr><td style="height: 152.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #696767;"><table cellpadding="0" cellspacing="0" width="100%"><tr style="height: 30.0px;"><td rowspan="3" style="width: 12.0px;"></td><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">原价：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;text-decoration: line-through;">726元</td><td rowspan="3" style="width: 8.0px;"></td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">立省：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#ff5500" style="font-weight: bold;font-size: 22.0px;">396</font>元</td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">搭配价：</td><td style="width: 18.0px;padding-top: 5.0px;"><img src="https://img.alicdn.com/imgextra/TB2qR_fcpXXXXcGXXXXXXXXXXXX-729596062.png"></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#ff5500" style="font-weight: bold;font-size: 22.0px;">330</font>元</td></tr></table></td></tr><tr><td style="background-color: #ff5500;height: 80.0px;font-size: 16.0px;font-family: microsoft yahei;text-align: center;"><a target="_blank" style="color: #ffffff;text-decoration: none;" href="http://iqiang.uz.taobao.com/meal.php?id=18867">购买套餐</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div><div title="qmfq_dp18863" class="qmfq_dp18863" style="width: 750.0px;height: 370.0px;overflow: hidden;margin: 0 auto;font-family: microsoft yahei;"><table width="100%" height="100%" cellpadding="0" cellspacing="0" background="https://img.alicdn.com/imgextra/TB2QRzjcpXXXXbKXXXXXXXXXXXX-729596062.png"><tr><td valign="top"><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="height: 64.0px;"></td></tr><tr><td><table width="100%" height="100%" cellpadding="0" cellspacing="0"><tr><td style="width: 25.0px;"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=520543428983"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i1/TB1QqJ2IFXXXXbVXXXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">欧洲站2015新款夏季印花连衣裙欧根纱高腰短裙韩版背心裙女装包邮</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #e87f00;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：336.00元</td><td style="width: 100.0px;height: 28.0px;color: #e87f00;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2wXTjcpXXXXccXXXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="height: 200.0px;width: 200.0px;"><a target="_blank" href="http://item.taobao.com/item.htm?id=520380119658"> <img width="200" height="200" border="0" src="https://img.alicdn.com/bao/uploaded/i3/TB11CtgIpXXXXa4XXXXXXXXXXXX_!!0-item_pic.jpg_200x200.jpg"></a></td></tr><tr><td style="height: 55.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #333333;">2015夏季韩系印花连衣裙韩版蕾丝欧根纱修身女装两件套大码裙子</td></tr><tr><td><table cellpadding="0" cellspacing="1" bgcolor="#eaeaea" style="width: 200.0px;"><tr><td style="width: 100.0px;height: 28.0px;background-color: #e87f00;color: #ffffff;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">原价：336.00元</td><td style="width: 100.0px;height: 28.0px;color: #e87f00;font-size: 12.0px;text-align: center;border-spacing: 0.0px;">已售：99件</td></tr></table></td></tr></table></td><td style="width: 57.0px;text-align: center;"><img src="https://img.alicdn.com/imgextra/TB2PcHecpXXXXakXpXXXXXXXXXX-729596062.png"></td><td valign="top" style="width: 200.0px;"><table cellpadding="0" cellspacing="0" bgcolor="#eaeaea" style="width: 185.0px;"><tr><td style="height: 47.0px;width: 185.0px;"><img width="185" height="47" src="https://img.alicdn.com/imgextra/TB2OEThcpXXXXcQXXXXXXXXXXXX-729596062.png"></td></tr><tr><td style="height: 152.0px;background-color: #ffffff;font-size: 12.0px;font-family: microsoft yahei;text-align: center;color: #696767;"><table cellpadding="0" cellspacing="0" width="100%"><tr style="height: 30.0px;"><td rowspan="3" style="width: 12.0px;"></td><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">原价：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;text-decoration: line-through;">672元</td><td rowspan="3" style="width: 8.0px;"></td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">立省：</td><td></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#e87f00" style="font-weight: bold;font-size: 22.0px;">342</font>元</td></tr><tr style="height: 30.0px;"><td style="font-size: 12.0px;font-family: microsoft yahei;color: #696767;">搭配价：</td><td style="width: 18.0px;padding-top: 5.0px;"><img src="https://img.alicdn.com/imgextra/TB2dofXcpXXXXcXXpXXXXXXXXXX-729596062.png"></td><td style="font-size: 14.0px;font-family: microsoft yahei;text-align: right;color: #696767;"><font color="#e87f00" style="font-weight: bold;font-size: 22.0px;">330</font>元</td></tr></table></td></tr><tr><td style="background-color: #e87f00;height: 80.0px;font-size: 16.0px;font-family: microsoft yahei;text-align: center;"><a target="_blank" style="color: #ffffff;text-decoration: none;" href="http://iqiang.uz.taobao.com/meal.php?id=18863">购买套餐</a></td></tr></table></td></tr></table></td></tr></table></td></tr></table></div><div><div style="margin: 0.0px auto;width: 748.0px;overflow: hidden;background-color: #ffffff;"><div style="width: 748.0px;height: 39.0px;">&nbsp;</div><div style="width: 748.0px;height: 10.0px;line-height: 10.0px;"><span style="color: #000000;text-align: center;line-height: 1.5;">&nbsp;</span> <u style="color: #0000ff;text-align: center;line-height: 1.5;"><span style="font-size: 36.0px;"><strong><span style="font-family: kaiti_gb2312;">原版欧美大牌重磅上市，亲们，不怕货比货，就怕不识货！</span></strong></span></u></div></div></div><p style="color: #000000;text-align: center;"><span style="color: #0000ff;"><u><span style="font-size: 36.0px;"><strong><span style="font-family: kaiti_gb2312;">精细工艺独家打造您的女神范</span></strong></span></u></span></p><p style="color: #000000;text-align: center;"><span style="font-size: 36.0px;"><span style="font-family: kaiti_gb2312;"><u><span style="color: #ff0000;"><strong>预收<span style="line-height: 1.5;">款下单后7-10发货！不接急单，着急的亲慎拍</span></strong></span></u></span></span><img alt="" style="line-height: 1.5;" src="https://assets.alicdn.com/sys/wangwang/smiley/48x48/46.gif"></p><p style="color: #000000;text-align: center;"><strong style="line-height: 1.5;"><span style="font-size: 36.0px;line-height: 54.0px;"><span style="background-color: #ffff00;"></span></span></strong><strong style="font-size: 36.0px;font-family: simhei;color: #ffff00;"><span style="background-color: #ff0000;">2015夏装热销水墨3D印花套装裙！</span></strong></p><p style="color: #000000;text-align: center;"><strong style="font-size: 36.0px;font-family: simhei;color: #ffff00;"><span style="background-color: #ff0000;"></span></strong><font color="#ff0000" size="5" face="microsoft yahei" style="line-height: 16.0px;"><b>今年国际流行最新3D立体印花套装裙</b></font><span style="line-height: 16.0px;">&nbsp;</span></p><p style="color: #000000;text-align: center;"><b style="font-size: x-large;font-family: microsoft yahei;color: #ff0000;line-height: 28.0px;">抢购价拍下半小时内付款，超时关闭交易</b></p><p style="color: #000000;text-align: center;"><b style="font-size: x-large;font-family: microsoft yahei;color: #ff0000;line-height: 36.0px;"></b><strong style="font-family: microsoft yahei;"><span style="font-size: 18.0px;"><span style="color: #ff0000;"><span style="font-size: 24.0px;">本店图片是自己实拍图片已经被保护盗图者都会被投诉删除</span></span></span></strong></p><div style="margin: 0.0px;padding: 0.0px;color: #000000;text-align: center;">&nbsp; <strong style="line-height: 16.0px;"><span><span style="font-size: 18.0px;">【<span style="font-family: microsoft yahei;">高性价比，真正的淘宝精品】</span></span></span></strong></div><p style="color: #000000;text-align: center;"><strong style="font-family: microsoft yahei;"><span style="font-size: 18.0px;">数量有限卖完为止</span></strong></p><div style="margin: 0.0px;padding: 0.0px;color: #000000;text-align: center;"><strong style="font-family: microsoft yahei;"><span style="font-size: 18.0px;">多重工艺，不扎皮肤，更加高端上档次！</span></strong></div><div style="margin: 0.0px;padding: 0.0px;color: #000000;text-align: center;"><strong style="font-family: microsoft yahei;"><span style="font-size: 18.0px;">透气性好，绝不会闷热，版型效果俱佳！！！拍下15天内发货</span></strong></div><div style="margin: 0.0px;padding: 0.0px;color: #000000;text-align: center;"><strong style="font-family: microsoft yahei;"><span style="font-size: 18.0px;"></span></strong><p><span style="color: #4c1130;"><span style="color: #999999;background-color: #990000;">&nbsp;</span><strong style="font-size: 24.0px;font-family: microsoft yahei;color: #ffffff;"><span style="background-color: #ff00ff;"><span style="background-color: #660000;"><span style="background-color: #990000;">如果您喜欢，请一定抢先下手！不要等着涨价了而后悔！</span></span></span></strong></span></p><p>&nbsp;</p></div><p style="color: #000000;"><strong style="text-align: center;line-height: 16.0px;"><span><span style="font-size: 18.0px;"><span style="font-family: microsoft yahei;"></span></span></span></strong></p><div style="margin: 0.0px;padding: 0.0px;color: #000000;text-align: center;">&nbsp; <span style="font-size: 36.0px;font-family: microsoft yahei;color: #ff0000;line-height: 16.0px;">预定满额后提价!!!早买更优惠</span> <span style="font-size: 36.0px;font-family: microsoft yahei;color: #ff0000;line-height: 54.0px;">!</span> <span style="font-size: 36.0px;font-family: microsoft yahei;color: #ff0000;line-height: 54.0px;">!</span></div><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"><span style="color: #000000;">抢到就是赚到！<span style="color: #ffff00;">7天无理由退换！</span></span>速度</span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"></span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;">&nbsp;</p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"></span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"></span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;">抢拍去吧！</span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"><font size="3"></font></span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;"><span style="font-size: 36.0px;"><span style="color: #ffffff;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><strong><span style="background-color: #ffffff;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;"><span style="background-color: #fe0086;"><span style="background-color: #ffffff;"><span style="background-color: #ff0000;"><font size="3"></font></span></span></span></span></span></span></span></strong></span></span></span></span></span></strong></span></span></span></span></strong></span></span></p><p align="center" style="color: #000000;text-align: center;"><span style="color: #ff0000;"><span style="font-size: 13.5pt;font-family: 黑体;"><span style="background-color: #ffff00;"></span></span></span></p><p style="color: #000000;text-align: center;"><span style="font-size: 24.0px;color: #ffff00;line-height: 36.0px;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;">买的越早优惠越多！新品上架</span></span></span></span><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;">大促！</span></span></span></span></strong></span><span style="font-size: 24.0px;color: #ffff00;line-height: 36.0px;"><strong><span style="font-family: microsoft yahei;"><span style="background-color: #e06666;"><span style="background-color: #ffffff;"><span style="background-color: #000000;">不定时涨价中......<img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB20V.XdFXXXXXXXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i2/2251899123/TB2WwsJdFXXXXcIXXXXXXXXXXXX-2251899123.jpg"> <img align="absmiddle" src="https://img.alicdn.com/imgextra/i1/2251899123/TB28.7kdFXXXXanXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2AKgFdFXXXXXTXXXXXXXXXXXX_!!2251899123.jpg"> <img align="absmiddle" src="https://img.alicdn.com/imgextra/i2/2251899123/TB2mxnWdFXXXXcuXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i2/2251899123/TB2WBobdFXXXXcIXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2IuAedFXXXXbtXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2XHb0dFXXXXb6XpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2gNfUdFXXXXcTXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i2/2251899123/TB2A4ZndFXXXXXFXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i3/2251899123/TB2.En0dFXXXXbqXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i3/2251899123/TB2oOchdFXXXXa9XXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i3/2251899123/TB2AhgadFXXXXcMXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i3/2251899123/TB2oXn_dFXXXXXpXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i1/2251899123/TB2oqgddFXXXXb.XXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2IL3edFXXXXbVXXXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i4/2251899123/TB2g5rZdFXXXXbVXpXXXXXXXXXX-2251899123.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i1/2251899123/TB2sVAfdFXXXXbTXXXXXXXXXXXX-2251899123.jpg"> </span></span></span></span></strong></span></p>', NULL, 1, '', '', '', 1438935402, 31, 0, 0, '', NULL, 1, NULL),
(438, 1, '45557292713', '2015夏季男士短袖T恤纯棉骷髅头印花圆领修身体恤韩版男装半袖潮', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '29.90', '99.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i2/TB1qxdvIpXXXXcUXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(439, 1, '44304679973', '2015夏季男装体恤衫韩版修身型夏装潮男士大码休闲V领印花短袖T恤', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '39.00', '168.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i4/TB1qhiIHpXXXXX6XFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 4, 0, 0, '', NULL, 1, NULL),
(440, 1, '37496714009', '男士短袖T恤韩版夏季纯棉印花圆领修身体恤 青春男装半袖潮上衣服', 12, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.90', '98.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i1/TB1JNSyFFXXXXX4apXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 3, 0, 0, '', NULL, 1, NULL),
(441, 1, '45197266302', '2015夏季t恤男士短袖韩版修身V领纯棉半袖衣服潮男装学生印花t恤', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '39.00', '199.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB1WxNQHFXXXXcTapXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(442, 1, '37740461472', '夏装中年男士短袖t恤衫 翻领polo中老年大码男装上衣服夏季爸爸装', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '65.00', '168.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB14W6uGVXXXXauapXXXXXXXXXX_!!1-item_pic.gif', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(443, 1, '44000862263', '2015夏季个性卡通短袖T恤男士日系潮男印花半袖韩版修身潮男装', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '25.00', '99.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i4/TB1_ouEHFXXXXcYaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(444, 1, '45594870813', '夏季T恤男士短袖潮男装青春日系修身圆领泼墨印花t恤半袖休闲体恤', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '34.00', '98.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i1/TB161nZIXXXXXcZXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(445, 1, '44189230799', '新款夏季男装加肥短袖男加大码胖子t恤宽松男装纯棉运动大号体恤', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '18.00', '78.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i1/TB157RPHpXXXXXhXFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(446, 1, '44808393678', '男士短袖t恤夏季韩版修身半袖体恤衫潮印花圆领t桖男装夏天上衣服', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '31.00', '79.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/TB1vwLjHVXXXXaKXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(447, 1, '520184615372', 'JVR 2015韩版男装夏季新款青春男士短袖T恤圆领体恤打底衫修身潮', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '15.80', '19.70', '0.00', 'http://img2.tbcdn.cn/tfscom/i4/TB1xgHEHFXXXXbXaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935497, 0, 0, 0, '', NULL, 1, NULL),
(448, 1, '43447640699', '2015夏季短袖t恤男韩版修身衣服男士短袖t恤夏季男装印花半袖T恤', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '8.90', '49.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/TB1syhrIpXXXXc1XXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 17, 0, 0, '', NULL, 1, NULL);
INSERT INTO `wu_goods` (`goods_id`, `goods_type`, `num_iid`, `title`, `cate_id`, `tid`, `add_id`, `add_uname`, `city`, `days`, `aheaddays`, `traffic`, `invite`, `audition`, `maxdays`, `discount_price`, `price`, `child_price`, `pic_url`, `item_body`, `item_price_body`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `ctime`, `hits`, `favor`, `goods_sort`, `tags`, `date_price`, `body_type`, `days_body`) VALUES
(449, 1, '37242727611', '夏季圆领印花T恤 男 男士短袖T恤纯棉青少年学生青春男装潮上衣服', 2, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.99', '98.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i3/TB1pbtoIXXXXXagXFXXXXXXXXXX_!!0-item_pic.jpg', '<img class="desc_anchor" id="desc-module-1" src="https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif"><p><span style="color: #0b5394;"><span style="font-size: 24.0px;"><span style="line-height: 18.0px;"><span style="text-align: center;color: #0000ff;line-height: 25.0px;font-family: impact;font-size: 24.0px;">★今日秒杀包邮</span><br> ★高端精梳棉品质，穿着舒适，修身版合体裁剪，精密走线，高品质从细节做起。 ★快递中通，需要EMS和顺丰需要联系客服补差价。祝您购物愉快！！</span></span></span></p> <p style="color: #404040;line-height: 1.4;font-size: 12.0px;margin-top: 0.0px;margin-bottom: 0.0px;"><span style="color: #ff0000;line-height: 27.0px;font-family: microsoft yahei;font-size: 18.0px;">最后再亏1000件，请果断下手，你明天再来就涨价了！！（不可能一直亏钱的哦~亲~）,这个价格不够100%精梳全棉的面料钱哦，更别说还包邮哦~大型外贸出口工厂保障了我们全国最高的出厂性价比，雄厚的资金实力支撑了我们现在的销售方式！</span></p> <p style="color: #404040;line-height: 1.4;font-size: 12.0px;margin-top: 0.0px;margin-bottom: 0.0px;">&nbsp;</p> <p style="color: #404040;line-height: 1.4;font-size: 12.0px;margin-top: 0.0px;margin-bottom: 0.0px;"><span style="color: #ff0000;line-height: 27.0px;font-family: microsoft yahei;font-size: 18.0px;">房子你等到涨价了再买，T恤你也要等到涨价了再买吗？</span><span style="color: #ff0000;line-height: 1.5;"><span style="font-size: 18.0px;"><span style="font-weight: 700;">注意：此款商品T恤面料为：180克100%精梳纯棉,请不要拿含涤纶的面料跟我们比，也请不要拿非180克非精梳的面料跟我们比，我们只用最好的！看到有感觉不像全棉的，亲~请您拿去质检，</span></span></span><span style="color: #ff0000;line-height: 27.0px;font-size: 18.0px;font-weight: 700;">不是全棉质检费我出，并且赔您1万元</span><span style="color: #ff0000;line-height: 1.5;"><span style="font-size: 18.0px;"><span style="font-weight: 700;">！！！</span></span></span></p> <p style="color: #404040;line-height: 1.4;font-size: 12.0px;margin-top: 0.0px;margin-bottom: 0.0px;">&nbsp;</p> <p><span style="text-align: center;color: #20124d;line-height: 27.0px;font-family: microsoft yahei;font-size: 18.0px;font-weight: 700;">现在还不下手就等着后悔吧！3天狂销2000件，4.8分超高打分（卖这么多还这么高的分，也只有我们这款宝贝能做到），多个色花可选，总有几款您喜欢，相信这么多淘友的选择不会错！</span><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/T2N7a9XvJXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/T2l9ZhXttaXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/T2gjQeXvJaXXXXXXXX_!!1970949645.jpg"></p> <p><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/TB2yD76aXXXXXa8XpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2POfTcXXXXXcsXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2Vdv2cXXXXXXgXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2su2ZcXXXXXaSXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2P8f0cXXXXXX.XXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2BtzPcXXXXXbrXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i3/1970949645/TB2yH21cXXXXXXUXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2ZJ_ScXXXXXXcXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/T23f99XDdXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i3/1970949645/T2AuO_XuNXXXXXXXXX_!!1970949645.jpg"></p> <p><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/TB2574fapXXXXXlXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/TB2Arg.aXXXXXaMXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i3/1970949645/TB2kd._aXXXXXbXXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2dTA_aXXXXXa1XpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/TB2wPFeapXXXXceXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2KNJbapXXXXXyXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/TB2kvE.aXXXXXaQXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/TB2wcRdapXXXXcbXXXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/TB2uExaapXXXXXTXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i3/1970949645/TB2h5lbapXXXXXKXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/TB2rX0capXXXXXhXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/TB2U8c_aXXXXXbnXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/TB2vypbapXXXXXwXpXXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" src="https://img.alicdn.com/imgextra/i3/1970949645/TB2ZMzncVXXXXabXXXXXXXXXXXX_!!1970949645.jpg"></p> <p><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i2/1970949645/T2E8D1XuxXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i1/1970949645/T2KEfZXAhXXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;" src="https://img.alicdn.com/imgextra/i4/1970949645/T2pnq8XttaXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;line-height: 1.5;" src="https://img.alicdn.com/imgextra/i2/1970949645/T27fG.Xx0XXXXXXXXX_!!1970949645.jpg"><img align="absmiddle" style="width: 1.0px;height: 1.0px;line-height: 1.5;" src="https://img.alicdn.com/imgextra/i4/1970949645/T2pnq8XttaXXXXXXXX_!!1970949645.jpg"></p>', NULL, 1, '', '', '', 1438935504, 13, 0, 0, '', NULL, 1, NULL),
(450, 1, '37301356780', '男士短袖T恤韩版潮2015夏季纯棉印花圆领修身青春男装男人夏装', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.80', '98.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1mOJ5HFXXXXcVXVXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(451, 1, '44367734237', '夏季新款男士短袖T恤 潮男装V领大码体恤韩版修身印花半袖男衣服', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '29.90', '178.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i4/TB1OXjbHpXXXXXpXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(452, 1, '44050311953', 'gusskater夏装新款男装T恤 男上衣潮 韩版印花男士短袖t恤 男半袖', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '39.00', '139.00', '0.00', 'http://img4.tbcdn.cn/tfscom/i4/TB1JAvzHFXXXXXfXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(453, 1, '45630509713', '2015夏季男士短袖T恤日系修身V领半袖青少年休闲上衣打底衫潮男装', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '26.56', '64.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1M9boHVXXXXahaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(454, 1, '37421933185', '特贝凡西短袖t恤男韩版修身半袖T恤男士纯色短袖男装夏季潮打底衫', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.80', '99.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i4/TB1y0_OHpXXXXX4XpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(455, 1, '44380105787', '慈客隆2015新款夏季潮男装印花半袖男士圆领短袖t恤衫韩版修身T恤', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '9.98', '88.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i2/TB1xqA1HpXXXXcyaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(456, 1, '520887543216', '2015男装春秋新款男士卫衣韩版修身外套青年情侣学生运动服套装潮', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '118.00', '398.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i1/TB1uuK.FVXXXXcCXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(457, 1, '45803782317', '2015新款夏季日系复古男士短袖T恤半袖男装韩版夏天潮流圆领体恤', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.80', '39.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i1/TB1xSpPIpXXXXXLXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935504, 0, 0, 0, '', NULL, 1, NULL),
(458, 1, '23232608559', '特贝凡西短袖t恤男韩版修身衣服男士短袖t恤夏季男装印花半袖T恤', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '19.80', '79.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i2/12867024482435985/T1tbSsXvXfXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(459, 1, '44739041098', '男装短袖t恤套装大码T恤衫休闲夏季短裤韩版潮男式运动服2015夏新', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '73.00', '158.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i4/TB1iJx1IVXXXXXaXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(460, 1, '44208320792', '2015新款夏季春款男士短袖T恤半袖男装韩版夏天男式日系潮流圆领', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '9.90', '98.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i4/TB1HeZ4GVXXXXb6aXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(461, 1, '520652735334', '秋冬男士大码卫衣加绒套装韩版棒球服休闲运动新款外套开衫男装潮', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '138.00', '263.00', '0.00', 'http://img1.tbcdn.cn/tfscom/i2/TB1ElyWIFXXXXcCXFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(462, 1, '45813208327', '男式立领卫衣外套潮休闲运动套装修身春秋薄款大码棒球服特价包邮', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '85.00', '85.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i3/TB1mAF1IVXXXXaQXXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(463, 1, '520817150535', '秋冬季男装棉涤连帽卫衣套装韩版修身青少年大码长袖棒球服套装男', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '99.00', '330.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i1/TB1MrZGIFXXXXbZXpXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(464, 1, '45186525755', '男士短袖t恤夏季休闲运动套装学生男装修身薄款短裤5五分裤沙滩裤', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '69.00', '299.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1KbLWHFXXXXbEXFXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(465, 1, '520614205225', '2015秋季男装兰博基尼运动卫衣套装青少年开衫大码长袖套装棒球服', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '99.00', '419.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i1/TB1D1WaIpXXXXcEaXXXXXXXXXXX_!!0-item_pic.jpg', '', NULL, 1, '', '', '', 1438935510, 0, 0, 0, '', NULL, 1, NULL),
(466, 1, '520869737681', '秋装原创连帽卫衣男套装休闲运动套头连帽卫衣潮韩版学生运动男装', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '119.00', '398.00', '0.00', 'http://img2.tbcdn.cn/tfscom/i1/TB1US31IXXXXXaOapXXXXXXXXXX_!!0-item_pic.jpg', '<p><img src="https://img.alicdn.com/imgextra/i3/1057961078/TB2KEmKepXXXXcUXpXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2b7iVepXXXXahXpXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i4/1057961078/TB29xCQepXXXXbBXpXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i3/1057961078/TB2wwe3epXXXXcDXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2ugq6epXXXXclXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i4/1057961078/TB2a36gepXXXXXcXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i3/1057961078/TB2vou2epXXXXc1XXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i3/1057961078/TB2ICW4epXXXXctXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2gii2epXXXXcNXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2LjiTepXXXXaRXpXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i1/1057961078/TB2fbTaepXXXXaeXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2yUy2epXXXXcUXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i2/1057961078/TB2F599epXXXXbpXXXXXXXXXXXX-1057961078.jpg" align="absmiddle"><img src="https://img.alicdn.com/imgextra/i3/1057961078/TB2mSiPepXXXXbOXpXXXXXXXXXX-1057961078.jpg" align="absmiddle"></p>', NULL, 1, '', '', '', 1438935510, 1, 0, 0, '', NULL, 1, NULL),
(467, 1, '520866975786', '2015秋季男士外套长袖情侣套装男韩版修身纯棉多色运动大码男装潮', 1, 0, 1, 'admin', '', 0, '0', '', 0, 0, 0, '139.80', '699.00', '0.00', 'http://img3.tbcdn.cn/tfscom/i3/TB1e7utIFXXXXXiXVXXXXXXXXXX_!!0-item_pic.jpg', '<p><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2NpwLdVXXXXczXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2IHZPdVXXXXaSXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2JisRdVXXXXahXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2ceA3dVXXXXbcXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2SqQMdVXXXXbCXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB26G33dVXXXXbgXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2zw7MdVXXXXb0XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2T1E1dVXXXXbKXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2fFUUdVXXXXXQXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2XfUQdVXXXXaMXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2gqQYdVXXXXcBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2Kj32dVXXXXa_XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2u6cOdVXXXXboXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2jFAPdVXXXXbbXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2LM7RdVXXXXavXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2ntgTdVXXXXX.XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2krAKdVXXXXcuXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2BBwOdVXXXXaqXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2smZ6dVXXXXasXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2ydM6dVXXXXXHXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2u3kZdVXXXXbBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2xWgQdVXXXXa3XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB27dwKdVXXXXcKXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB20S33dVXXXXbbXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2BjAWdVXXXXcFXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB20NZEdVXXXXbmXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB234MZdVXXXXbUXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2NyoWdVXXXXcBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2wioWdVXXXXcLXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2DfgCdVXXXXbaXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2Yy3RdVXXXXX7XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2TkIWdVXXXXcJXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2tQUWdVXXXXcsXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2EjA0dVXXXXbVXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB299U1dVXXXXbEXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2yNQ8dVXXXXXUXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2JJ.PdVXXXXa8XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2CQsRdVXXXXayXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2UDI4dVXXXXa2XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2j1A5dVXXXXanXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2WJsNdVXXXXbKXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB21mA8dVXXXXXSXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2jHkOdVXXXXbAXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2RO7PdVXXXXaZXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2JE.7dVXXXXXSXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2dCo2dVXXXXa_XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2uv30dVXXXXbTXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2d97OdVXXXXbgXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2pVkSdVXXXXauXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB23.75dVXXXXaBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2whc_dVXXXXXkXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2WZI2dVXXXXbyXXXXXXXXXXXX_!!67275578.jpg"></p>', NULL, 1, '', '', '', 1438935510, 4, 0, 0, '', NULL, 1, NULL),
(468, 1, '0', '2015秋季男士外套长袖情侣套装男韩版修身纯棉多色运动大码男装潮', 13, 1, 1, 'Admin', '厦门', 6, '0', '飞机去飞机回', 0, 0, 0, '139.80', '699.00', '101.00', '/Uploads/goods_img/2015-08-17/55d166c009c9c.jpg', '<p><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2NpwLdVXXXXczXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2IHZPdVXXXXaSXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2JisRdVXXXXahXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2ceA3dVXXXXbcXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2SqQMdVXXXXbCXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB26G33dVXXXXbgXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2zw7MdVXXXXb0XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2T1E1dVXXXXbKXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2fFUUdVXXXXXQXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2XfUQdVXXXXaMXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2gqQYdVXXXXcBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2Kj32dVXXXXa_XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2u6cOdVXXXXboXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2jFAPdVXXXXbbXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2LM7RdVXXXXavXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2ntgTdVXXXXX.XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2krAKdVXXXXcuXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2BBwOdVXXXXaqXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2smZ6dVXXXXasXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2ydM6dVXXXXXHXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2u3kZdVXXXXbBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2xWgQdVXXXXa3XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB27dwKdVXXXXcKXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB20S33dVXXXXbbXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2BjAWdVXXXXcFXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB20NZEdVXXXXbmXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB234MZdVXXXXbUXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2NyoWdVXXXXcBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2wioWdVXXXXcLXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2DfgCdVXXXXbaXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2Yy3RdVXXXXX7XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2TkIWdVXXXXcJXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2tQUWdVXXXXcsXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2EjA0dVXXXXbVXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB299U1dVXXXXbEXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2yNQ8dVXXXXXUXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2JJ.PdVXXXXa8XpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2CQsRdVXXXXayXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2UDI4dVXXXXa2XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2j1A5dVXXXXanXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2WJsNdVXXXXbKXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB21mA8dVXXXXXSXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2jHkOdVXXXXbAXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB2RO7PdVXXXXaZXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2JE.7dVXXXXXSXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2dCo2dVXXXXa_XXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2uv30dVXXXXbTXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2d97OdVXXXXbgXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i1/67275578/TB2pVkSdVXXXXauXpXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i3/67275578/TB23.75dVXXXXaBXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i2/67275578/TB2whc_dVXXXXXkXXXXXXXXXXXX_!!67275578.jpg"><img align="middle" src="https://img.alicdn.com/imgextra/i4/67275578/TB2WZI2dVXXXXbyXXXXXXXXXXXX_!!67275578.jpg"></p>', NULL, 1, '', '', '', 0, 158, 0, 0, '1,2', NULL, 1, NULL),
(469, 1, '0', '厦门到北京_天津_梦回天津卫、品味津京文化', 13, 1, 1, 'Admin', '厦门', 6, '3', '2,2', 1, 1, 0, '2888.80', '3680.00', '2880.00', '/ke361/ke361/ke361/ke361/ke361/ke361/ke361/ke361/ke361/ke361/Uploads/goods_img/2015-08-17/55d16e2b11a74.jpg', '<p>\r\n	<strong><img src="/ke361/uploads/goods_img/image/20150818/20150818050252_46194.jpg" alt="" /><br />\r\n</strong> \r\n</p>\r\n<p>\r\n	<strong><span style="font-size:14px;background-color:#00D5FF;">跟团游（非门店价限网络）</span></strong> \r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b><span style="line-height:2;">标准说明</span></b> \r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '<p>\r\n	阿莱克斯第三季发\r\n</p>\r\n<p>\r\n	啊是第几法拉\r\n</p>\r\n<p>\r\n	发生开裂的肌肤\r\n</p>\r\n<p>\r\n	啊大奖励开发建设\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 1, '', '', '', 0, 326, 0, 1, '1,2,3', '2015-11-18|2880-2280', 2, '[{"name":"\\u6606\\u660e-\\u4e5d\\u4e61","content":"<span style=\\"font-family:monospace;font-size:medium;line-height:normal;\\">[p]07\\uff1a00  \\u9152\\u5e97\\u7edf\\u4e00\\u53eb\\u65e9  [br] [\\/p] [span][\\/span] [span][\\/span] [p]07\\uff1a30  \\u9152\\u5e97\\u4e00\\u697c\\u4eab\\u7528\\u54c1\\u79cd\\u3001\\u4e30\\u5bcc\\u7684\\u4e2d\\u897f\\u81ea\\u52a9\\u65e9\\u9910\\uff0c\\u9910\\u540e\\u9152\\u5e97\\u5927\\u5802\\u96c6\\u5408  [br] [\\/p] [span][\\/span] [span][\\/span] [p]08\\uff1a00  \\u65e9\\u9910\\u540e\\u6e38\\u5580\\u65af\\u7279\\u4e16\\u754c\\u9057\\u4ea7\\u7684\\u91cd\\u8981\\u5143\\u7d20\\uff1a\\u201c\\u4e2d\\u56fd\\u66a8\\u4e91\\u5357\\u6700\\u5178\\u578b\\u6027\\u5580\\u65af\\u7279\\u7efc\\u5408\\u5730\\u8c8c\\u201d\\u98ce\\u5149\\u80dc\\u77f3\\u6797\\u7684\\u3010\\u4e5d\\u4e61\\u56fd\\u5bb6\\u98ce\\u666f\\u533a\\u3011\\uff0c\\u6e38\\u501a\\u7ea2\\u504e\\u7fe0\\u7684\\u5730\\u4e0a\\u5c0f\\u77f3\\u6797\\uff0c\\u5165\\u6d1e\\u89c2\\u201c\\u5730\\u4e0b\\u5012\\u77f3\\u6797\\u201d\\uff0c\\uff08\\u542b\\u5355\\u7a0b\\u89c2\\u5149\\u7d22\\u9053\\u3001\\u4e5d\\u4e61\\u836b\\u7fe0\\u5ce1\\u6e38\\u8239(\\u6e38\\u8239\\u5982\\u9047\\u96e8\\u5b63\\u6da8\\u6c34\\u4f1a\\u56e0\\u5b89\\u5168\\u56e0\\u7d20\\u53d6\\u6d88\\u6e38\\u89c8)\\uff09\\u4e0e\\u5927\\u6d77\\u6012\\u6d9b\\u822c\\u6c79\\u6e67\\u6f8e\\u6e43\\u7684\\u5929\\u7136\\u77f3\\u6797\\u96f6\\u8ddd\\u79bb\\u5408\\u5f71\\uff0c\\u89c2\\u8d4f\\u591a\\u59ff\\u591a\\u5f69\\u7684\\u5580\\u65af\\u7279\\u5730\\u8c8c\\uff0c\\u4f53\\u5473\\u5f5d\\u65cf\\u6492\\u5c3c\\u4eba\\u72ec\\u7279\\u98ce\\u60c5\\uff0c\\u662f\\u81ea\\u7136\\u666f\\u89c2\\u4e0e\\u4eba\\u6587\\u666f\\u89c2\\u4ea4\\u76f8\\u8f89\\u6620\\uff0c\\u4ee4\\u4eba\\u9676\\u9189\\u5176\\u95f4\\uff0c\\u96be\\u4ee5\\u5fd8\\u6000\\u3002  [br] [\\/p] [span][\\/span] [span][\\/span] [p]12\\uff1a00  \\u5348\\u9910\\u4eab\\u7528\\u4e03\\u5f69\\u4e91\\u5357\\u81ea\\u52a9\\u9910\\u2014\\u6021\\u5fc3\\u56ed\\u6ec7\\u5473\\u83dc\\u54c1\\uff08\\u670930\\u591a\\u4e2a\\u83dc\\u54c1\\u5c0f\\u5403\\u6c34\\u679c\\u4f9b\\u5927\\u5bb6\\u54c1\\u5c1d\\uff09  [br] [\\/p] [span][\\/span] [span][\\/span] [p]13\\uff1a00  \\u4e58\\u8f66\\u524d\\u5f80AAA\\u666f\\u533a\\u4e03\\u5f69\\u4e91\\u5357\\uff0c\\u6e38\\u89c8\\u5b54\\u96c0\\u56ed\\u540e\\u53ef\\u81ea\\u7531\\u6d3b\\u52a8\\uff0c\\u81ea\\u884c\\u53c2\\u89c2\\u4e03\\u5927\\u7279\\u8272\\u571f\\u7279\\u5c55\\u89c8  [br] [\\/p] [span][\\/span] [span][\\/span] [p]17\\uff1a00  \\u4e03\\u5f69\\u4e91\\u5357\\u524d\\u5f80\\u629a\\u4ed9\\u6e56\\u7554\\uff08\\u7ea63\\u5c0f\\u65f6\\uff09  [br] [\\/p] [span][\\/span] [span][\\/span] [p]20\\uff1a00  \\u665a\\u9910\\u540e\\u5165\\u4f4f\\u3002  [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u53c2\\u4e0e\\u6211\\u516c\\u53f8\\u4e3b\\u9898\\u6d3b\\u52a8\\u2014\\u2014  [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u4e3b\\u9898\\u4e00\\u201c\\u60a6\\u693f\\u6cf3\\u6c60\\u3001\\u6c99\\u6ee9\\u72c2\\u91ce\\u6d3e\\u5bf9\\u2014\\u2014\\u6253\\u9020\\u4e13\\u5c5e\\u6d77\\u5929\\u76db\\u591c\\u201d  [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u6d3b\\u52a8\\u5185\\u5bb9\\uff1a\\u6e38\\u5ba2\\u53ef\\u5728\\u6c99\\u6ee9\\u9886\\u53d6\\u514d\\u8d39\\u7684\\u6c7d\\u6c34\\u996e\\u6599\\uff0c\\u6f2b\\u6b65\\u6e7f\\u5730\\u516c\\u56ed\\u6c99\\u6ee9\\uff0c\\u4f53\\u9a8c\\u201c\\u95f2\\u6687\\u65f6\\u5149\\u201d\\uff0c\\u611f\\u53d7\\u629a\\u4ed9\\u6e56\\u7554\\u201c\\u6d77\\u5929\\u76db\\u591c\\u201d\\uff0c\\u6c99\\u6ee9\\u89c2\\u770b\\u65e5\\u51fa\\uff0c\\u611f\\u53d7\\u6e05\\u6668\\u7684\\u65b0\\u9c9c\\u7a7a\\u6c14\\uff1b\\u53ef\\u81ea\\u613f\\u53c2\\u4e0e\\u6c99\\u6ee9\\u6392\\u7403\\u6216\\u6cf3\\u6c60\\u72c2\\u6b22\\u6d3b\\u52a8\\uff0c\\u91ca\\u653e\\u60a8\\u7684\\u70ed\\u8840\\u6fc0\\u60c5\\uff01\\uff08\\u81ea\\u5907\\u6cf3\\u8863\\uff09  [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u4e3b\\u9898\\u4e8c\\u201c\\u6c99\\u6ee9\\u56e2\\u53cb\\u4eb2\\u60c5\\u3001\\u53cb\\u60c5\\u3001\\u7231\\u60c5\\u4e92\\u52a8\\u62d3\\u5c55\\u2014\\u2014\\u7701\\u5185\\u72ec\\u5bb6\\u4eb2\\u60c5\\u62d3\\u5c55\\u65c5\\u6e38\\u4e92\\u52a8\\u6e38\\u620f\\u201d\\u6d3b\\u52a8\\u5185\\u5bb9\\uff1a\\u201c\\u4e8c\\u4eba\\u4e09\\u8db3\\u201d\\u7ed1\\u817f\\u8d5b\\u8dd1\\u6d3b\\u52a8\\uff0c\\u7236\\u6bcd\\u4e0e\\u5b69\\u5b50\\u3001\\u604b\\u4eba\\u3001\\u592b\\u59bb\\u3001\\u670b\\u53cb\\u3001\\u540c\\u4e8b\\u4e4b\\u95f4\\uff0c\\u5728\\u641e\\u7b11\\u5f00\\u5fc3\\u7684\\u65e9\\u6668\\u4e92\\u52a8\\u62d3\\u5c55\\u5c0f\\u6e38\\u620f\\u80fd\\u591f\\u6709\\u6548\\u7684\\u63d0\\u9ad8\\u53c2\\u4e0e\\u8005\\u7684\\u5174\\u8da3\\u548c\\u589e\\u8fdb\\u76f8\\u4e92\\u95f4\\u7684\\u611f\\u60c5\\uff0c\\u80fd\\u5c06\\u4e50\\u8da3\\u548c\\u5f00\\u5fc3\\u5e26\\u5165\\u5230\\u63a5\\u4e0b\\u6765\\u7684\\u65c5\\u9014\\u4e2d\\uff0c\\u540c\\u65f6\\u4e5f\\u80fd\\u5728\\u6e38\\u620f\\u5f53\\u4e2d\\u9886\\u609f\\u4eba\\u751f\\u54f2\\u7406\\uff0c\\u6362\\u4f4d\\u601d\\u8003\\uff01 [br] [\\/p]<\\/span>","eat":["1","1","1"],"sleep":"\\u629a\\u4ed9\\u6e56"},{"name":"\\u53a6\\u95e8-\\u6606\\u660e","content":"<span style=\\"font-family:monospace;font-size:medium;line-height:normal;\\">12\\uff1a00 \\u5348\\u9910\\u4eab\\u7528\\u4e03\\u5f69\\u4e91\\u5357\\u81ea\\u52a9\\u9910\\u2014\\u6021\\u5fc3\\u56ed\\u6ec7\\u5473\\u83dc\\u54c1\\uff08\\u670930\\u591a\\u4e2a\\u83dc\\u54c1\\u5c0f\\u5403\\u6c34\\u679c\\u4f9b\\u5927\\u5bb6\\u54c1\\u5c1d\\uff09 [br] [\\/p] [span][\\/span] [span][\\/span] [p]13\\uff1a00 \\u4e58\\u8f66\\u524d\\u5f80AAA\\u666f\\u533a\\u4e03\\u5f69\\u4e91\\u5357\\uff0c\\u6e38\\u89c8\\u5b54\\u96c0\\u56ed\\u540e\\u53ef\\u81ea\\u7531\\u6d3b\\u52a8\\uff0c\\u81ea\\u884c\\u53c2\\u89c2\\u4e03\\u5927\\u7279\\u8272\\u571f\\u7279\\u5c55\\u89c8 [br] [\\/p] [span][\\/span] [span][\\/span] [p]17\\uff1a00 \\u4e03\\u5f69\\u4e91\\u5357\\u524d\\u5f80\\u629a\\u4ed9\\u6e56\\u7554\\uff08\\u7ea63\\u5c0f\\u65f6\\uff09 [br] [\\/p] [span][\\/span] [span][\\/span] [p]20\\uff1a00 \\u665a\\u9910\\u540e\\u5165\\u4f4f\\u3002 [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u53c2\\u4e0e\\u6211\\u516c\\u53f8\\u4e3b\\u9898\\u6d3b\\u52a8\\u2014\\u2014 [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u4e3b\\u9898\\u4e00\\u201c\\u60a6\\u693f\\u6cf3\\u6c60\\u3001\\u6c99\\u6ee9\\u72c2\\u91ce\\u6d3e\\u5bf9\\u2014\\u2014\\u6253\\u9020\\u4e13\\u5c5e\\u6d77\\u5929\\u76db\\u591c\\u201d [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u6d3b\\u52a8\\u5185\\u5bb9\\uff1a\\u6e38\\u5ba2\\u53ef\\u5728\\u6c99\\u6ee9\\u9886\\u53d6\\u514d\\u8d39\\u7684\\u6c7d\\u6c34\\u996e\\u6599\\uff0c\\u6f2b\\u6b65\\u6e7f\\u5730\\u516c\\u56ed\\u6c99\\u6ee9\\uff0c\\u4f53\\u9a8c\\u201c\\u95f2\\u6687\\u65f6\\u5149\\u201d\\uff0c\\u611f\\u53d7\\u629a\\u4ed9\\u6e56\\u7554\\u201c\\u6d77\\u5929\\u76db\\u591c\\u201d\\uff0c\\u6c99\\u6ee9\\u89c2\\u770b\\u65e5\\u51fa\\uff0c\\u611f\\u53d7\\u6e05\\u6668\\u7684\\u65b0\\u9c9c\\u7a7a\\u6c14\\uff1b\\u53ef\\u81ea\\u613f\\u53c2\\u4e0e\\u6c99\\u6ee9\\u6392\\u7403\\u6216\\u6cf3\\u6c60\\u72c2\\u6b22\\u6d3b\\u52a8\\uff0c\\u91ca\\u653e\\u60a8\\u7684\\u70ed\\u8840\\u6fc0\\u60c5\\uff01\\uff08\\u81ea\\u5907\\u6cf3\\u8863\\uff09 [br] [\\/p] [span][\\/span] [span][\\/span] [p]\\u4e3b\\u9898\\u4e8c\\u201c\\u6c99\\u6ee9\\u56e2\\u53cb\\u4eb2\\u60c5\\u3001\\u53cb\\u60c5\\u3001\\u7231\\u60c5\\u4e92\\u52a8\\u62d3\\u5c55\\u2014\\u2014\\u7701\\u5185\\u72ec\\u5bb6\\u4eb2\\u60c5\\u62d3<\\/span>","eat":{"2":"1"},"sleep":"\\u6606\\u660e"},{"name":"nagesha","content":"<p>\\r\\n\\tegas\\r\\n<\\/p>\\r\\n<p>\\r\\n\\tdfasdg\\r\\n<\\/p>\\r\\n<p>\\r\\n\\tsdfgwasdf\\r\\n<\\/p>\\r\\n<p>\\r\\n\\t<br \\/>\\r\\n<\\/p>","eat":["1","1"],"sleep":"sdlkfja"}]'),
(470, 2, '0', '菲律宾签证', 3, 1, 1, 'Admin', '福建领区', 5, '90', '全国', 2, 2, 59, '249.00', '400.00', '0.00', '/Uploads/goods_img/2015-08-29/55e10d7c90823.jpg', '<table style="width:100%;" cellpadding="2" cellspacing="0" border="1" bordercolor="#00D5FF" align="center">\r\n	<tbody>\r\n		<tr>\r\n			<td style="text-align:center;background-color:#337FE5;">\r\n				<span style="color:#FFFFFF;">签证类型</span><span style="color:#FFFFFF;"></span><br />\r\n			</td>\r\n			<td style="text-align:center;background-color:#337FE5;">\r\n				<span style="color:#FFFFFF;">门市价</span><span style="color:#FFFFFF;"></span><br />\r\n			</td>\r\n			<td style="text-align:center;background-color:#337FE5;">\r\n				<span style="color:#FFFFFF;">优惠价</span><span style="color:#FFFFFF;"></span><br />\r\n			</td>\r\n			<td style="text-align:center;background-color:#337FE5;">\r\n				<span style="color:#FFFFFF;">备注</span><span style="color:#FFFFFF;"></span><br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="text-align:center;">\r\n				<span style="color:#888888;font-family:Verdana;line-height:24px;background-color:#FFFFFF;">菲律宾签证</span><br />\r\n			</td>\r\n			<td style="text-align:center;">\r\n				<s><span style="font-size:14px;">400</span></s>\r\n			</td>\r\n			<td style="text-align:center;">\r\n				<span style="color:#FF9900;font-size:14px;"><strong>249</strong></span>\r\n			</td>\r\n			<td>\r\n				<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n<br />', NULL, 1, '', '', '', 0, 38, 0, 0, '1', NULL, 1, NULL),
(471, 2, '0', '123123', 1, 0, 1, 'Admin', 'xiamen', 9, '90', 'quanguo', 2, 2, 20, '1.00', '499.00', '0.00', '/ke361/Uploads/goods_img/2015-08-29/55e1176122c2e.png', '', NULL, 1, '', '', '', 0, 7, 0, 0, NULL, '', 1, '""');

-- --------------------------------------------------------

--
-- 表的结构 `wu_goods_extra`
--

CREATE TABLE IF NOT EXISTS `wu_goods_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wu_goods_extra`
--

INSERT INTO `wu_goods_extra` (`id`, `goods_id`, `name`, `sort`, `status`, `content`) VALUES
(1, 469, '费用说明', 0, 1, '<strong>跟团游（非门店价限网络）</strong>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b>标准说明</b>\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。&nbsp;\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>'),
(2, 466, '费用说明', 0, 1, '<strong>跟团游（非门店价限网络）</strong>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b>标准说明</b>\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。&nbsp;\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>'),
(3, 467, '费用说明', 0, 1, '<strong>跟团游（非门店价限网络）</strong>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b>标准说明</b>\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。&nbsp;\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>'),
(4, 468, '费用说明', 0, 1, '<strong>跟团游（非门店价限网络）</strong>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b>标准说明</b>\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。&nbsp;\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>'),
(5, 0, '费用说明', 1, 1, '<strong>跟团游（非门店价限网络）</strong>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	<b>标准说明</b>\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	1、机票：厦门北京/天津厦门往返经济舱机票，含往返机场建设税及燃油费，准确航班以确认为准，准确起飞时间以航空公司电脑为准.机票开出，不得签转、更改、退票，因身份证过期、未带户口本造成损失由客人自负。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	2、住宿：全程入住挂牌三星酒店或同等级档次的酒店（如产生单男单女，安排同性拼房，如不愿拼房则需补单房差500元/人/5晚，成人不占床不退费用）（参考酒店：北京章丘海泰饭店、北京彰德酒店、北京碧水云天宾馆等）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	3、用餐：5早10正，正餐餐标25元/人正，十人一桌，八菜两汤（如若人数不足，菜数适当减少）；早餐为酒店含早。自由活动期间用餐请自理；如因自身原因放弃用餐，则餐费不退。 \r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	4、门票：以上行程所含景点首道门票。个别景点政策性关闭，只参观外景，未产生门票的原价退还。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	5、服务：当地中文导游服务、全程旅游车（保证一人一正座）\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	6、儿童（2-12周岁）价格标准：价格行程包括儿童机票、当地正餐及酒店早餐、旅游车费、导游服务费。\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	7、全程无自费，无购物……\r\n</p>\r\n<p style="color:#555555;font-family:微软雅黑, arial;font-size:14px;background-color:#FFFFFF;">\r\n	备注：北京大学或清华大学如遇到学校活动或政策性关闭！只参观外景！谢谢合作！\r\n</p>'),
(6, 0, 'ceshi', 0, 1, '123456789s24df');

-- --------------------------------------------------------

--
-- 表的结构 `wu_goods_to_tags`
--

CREATE TABLE IF NOT EXISTS `wu_goods_to_tags` (
  `goods_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wu_goods_to_tags`
--

INSERT INTO `wu_goods_to_tags` (`goods_id`, `tag_id`) VALUES
(0, 1),
(468, 1),
(468, 2),
(469, 1),
(469, 2),
(469, 3),
(470, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_hooks`
--

CREATE TABLE IF NOT EXISTS `wu_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `wu_hooks`
--

INSERT INTO `wu_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `wu_link`
--

CREATE TABLE IF NOT EXISTS `wu_link` (
  `lid` mediumint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `href` varchar(255) NOT NULL DEFAULT '' COMMENT '连接',
  `img` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `order` mediumint(2) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '连接',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_member`
--

CREATE TABLE IF NOT EXISTS `wu_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `wu_member`
--

INSERT INTO `wu_member` (`uid`, `nickname`, `avatar`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'Admin', '', 0, '0000-00-00', '', 70, 17, 0, 1439169229, 0, 1442992098, 1),
(4, '还可以', './Uploads/avatar_img/4.jpg', 0, '0000-00-00', '', 40, 17, 0, 1439541277, 0, 1440491300, 1),
(5, '阿晖', '', 0, '0000-00-00', '', 10, 1, 0, 1440050649, 0, 1440050649, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_menu`
--

CREATE TABLE IF NOT EXISTS `wu_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

--
-- 转存表中的数据 `wu_menu`
--

INSERT INTO `wu_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0),
(2, '内容', 0, 2, 'Article/mydocument', 0, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(76, '导航管理', 93, 6, 'Nav/index', 0, '', '系统设置', 0),
(77, '新增', 76, 0, 'Nav/add', 0, '', '', 0),
(78, '编辑', 76, 0, 'Nav/edit', 0, '', '', 0),
(79, '删除', 76, 0, 'Navl/del', 0, '', '', 0),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '工具', 0, 5, 'Page/index', 0, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(121, '排序', 76, 0, 'Nav/sort', 1, '', '', 0),
(131, '商品', 0, 1, 'Goods/index', 0, '', '商品', 0),
(132, '商品列表', 131, 0, 'Goods/index', 0, '', '商品', 0),
(137, '商品采集', 131, 0, 'Collect/index', 1, '', '采集', 0),
(134, '添加商品', 131, 1, 'Goods/edit', 0, '', '商品', 0),
(135, '分类列表', 131, 10, 'CategoryGoods/index', 0, '', '分类', 0),
(139, '添加分类', 131, 0, 'CategoryGoods/add', 0, '', '分类', 0),
(140, '采集到的商品', 131, 0, 'Collect/collectList', 1, '', '采集', 0),
(141, '幻灯片', 93, 5, 'Banner/index', 0, '设置首页幻灯片', '', 0),
(142, '新增', 141, 0, 'Banner/add', 0, '', '幻灯片', 0),
(143, '删除', 141, 0, 'Banner/del', 0, '', '幻灯片', 0),
(144, '友情链接', 93, 6, 'FriendLink/index', 0, '', '', 0),
(152, '说明页面', 93, 0, 'Page/index', 0, '', '', 0),
(145, '添加', 144, 0, 'FriendLink/add', 0, '', '友情链接', 0),
(146, '专题列表', 131, 0, 'Topic/index', 0, '', '专题', 0),
(147, '增加专题', 131, 0, 'Topic/add', 0, '', '专题', 0),
(148, '添加标签', 131, 2, 'Tag/add', 0, '', '商品', 0),
(149, '标签列表', 131, 2, 'Tag/index', 0, '', '商品', 0),
(150, '附加信息', 132, 0, 'Goods/extra', 1, '', '', 0),
(151, '新增附加信息', 132, 0, 'Goods/extraedit', 1, '', '', 0),
(153, '添加', 152, 0, 'Page/add', 0, '', '', 0),
(154, '订单', 0, 1, 'Orders/index', 0, '', '', 0),
(155, '全部订单', 154, 0, 'Orders/index', 0, '', '', 0),
(156, '查看订单', 154, 0, 'Orders/edit', 1, '', '', 0),
(157, '订单状态', 154, 0, 'Orders/orderStatus', 0, '', '', 0),
(158, '增加订单状态', 154, 0, 'Orders/addstatus', 0, '', '', 0),
(159, '搜索关键词', 93, 0, 'Search/index', 0, '', '', 0),
(160, '添加', 159, 0, 'Search/add', 0, '', '', 0),
(161, '在线客服', 93, 0, 'Support/index', 0, '', '', 0),
(162, '添加', 161, 0, 'Support/add', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_model`
--

CREATE TABLE IF NOT EXISTS `wu_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wu_model`
--

INSERT INTO `wu_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","2","5"],"2":["9","13","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1387260622, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `wu_nav`
--

CREATE TABLE IF NOT EXISTS `wu_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  `head` tinyint(3) NOT NULL DEFAULT '1',
  `side` tinyint(3) NOT NULL DEFAULT '1',
  `foot` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `wu_nav`
--

INSERT INTO `wu_nav` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`, `head`, `side`, `foot`) VALUES
(1, 0, '首页', 'Index/index', 0, 1379475111, 1439466839, 1, 0, 1, 1, 1),
(2, 0, '精品女装', 'Goods/cate?id=2', 2, 1379475131, 1438935627, 1, 0, 1, 1, 1),
(4, 0, '时尚男装', 'Goods/cate?id=1', 1, 1438935702, 1439431000, 1, 0, 1, 0, 0),
(5, 0, '国内游', 'Goods/cate?id=10', 0, 1439193403, 1439448032, 1, 0, 1, 1, 0),
(6, 0, '还是首页', 'Index/index', 0, 1439380227, 1439466848, 1, 0, 0, 0, 1),
(7, 0, '联系我们', 'Page/index?id=2', 0, 1440136072, 1440136072, 1, 0, 1, 0, 1),
(8, 0, '线路定制', 'Goods/diy', 0, 1445824424, 1445824740, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_orders`
--

CREATE TABLE IF NOT EXISTS `wu_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `child_price` decimal(10,2) NOT NULL,
  `num` int(11) NOT NULL,
  `child` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(120) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(250) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wu_orders`
--

INSERT INTO `wu_orders` (`id`, `goods_id`, `goods_name`, `price`, `discount_price`, `child_price`, `num`, `child`, `date`, `name`, `userid`, `tel`, `email`, `address`, `content`, `status`, `createtime`) VALUES
(1, 469, '厦门到北京_天津_梦回天津卫、品味津京文化', '3680.00', '2888.80', '2880.00', 1, 0, '2015-08-24', '123', 4, '123', '123', '123', '请填写您的留言', 3, '2015-08-24 18:31:41'),
(2, 469, '厦门到北京_天津_梦回天津卫、品味津京文化', '3680.00', '2888.80', '2880.00', 2, 1, '2015-08-24', '123', 4, '123', '123', '123', '请填写您的留言', 1, '2015-08-24 18:38:47'),
(3, 468, '2015秋季男士外套长袖情侣套装男韩版修身纯棉多色运动大码男装潮', '699.00', '139.80', '101.00', 1, 0, '2015-08-25', '123', 4, '123', '123', '123', '请填写您的留言', 1, '2015-08-24 18:50:17'),
(6, 470, '菲律宾签证', '400.00', '249.00', '0.00', 1, 0, '2015-09-01', '还可以', 4, '123', '456', '789', '213请填写您的留言2123', 1, '2015-08-29 14:28:44');

-- --------------------------------------------------------

--
-- 表的结构 `wu_orders_status`
--

CREATE TABLE IF NOT EXISTS `wu_orders_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wu_orders_status`
--

INSERT INTO `wu_orders_status` (`id`, `name`, `sort`, `status`) VALUES
(1, '已报名', 0, 1),
(2, '已安排', 1, 1),
(3, '已出发', 2, 1),
(4, '已结束', 3, 1),
(6, '意外停止', 5, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_page`
--

CREATE TABLE IF NOT EXISTS `wu_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `seo_title` varchar(120) NOT NULL,
  `seo_keyword` varchar(200) NOT NULL,
  `seo_description` text NOT NULL,
  `content` text NOT NULL,
  `ishome` tinyint(3) NOT NULL DEFAULT '0',
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wu_page`
--

INSERT INTO `wu_page` (`id`, `name`, `seo_title`, `seo_keyword`, `seo_description`, `content`, `ishome`, `sort`, `status`) VALUES
(1, '公司介绍', '', '', '', '<span>        中国国旅（厦门）国际旅行社有限公司公司由中国国际旅行社总社有限公司、厦门港务集团和平旅游客运有限公司、厦门旅游集团有限公司联合控股。其中，中国国际旅行社总社有限公司，是目前国内规模最大、实力最强的旅行社企业集团，荣列国家统计局公布的“中国企业500 强” ，是500 强中唯一的旅游企业，现为中国国旅股份有限公司旗下两大企业之一。如今，“ 中国国旅、 cits” 已成为品牌价值高、主营业务突出、在国内外享有盛誉的中国旅游企业，品牌价值 115.27 亿元，居旅游业第一。 经营业务包括：入境旅游、国内旅游业务、出境旅游业务；国际航线或者香港、澳门、台湾地区航线的航空客运销售代理业务；兼业代理人身意外伤害保险。 </span>', 1, 0, 1),
(2, '联系我们', '', '', '', '<span><span><span><strong><span><span style="background-color:#ffffff;color:#ff0000;font-size:10.5pt;">在线咨询</span>：<br />\r\n</span></strong></span><span><span><strong>云南旅游：</strong></span><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=66573424"><span><strong><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></strong></span></a><br />\r\n<span><strong>国内旅游：</strong></span></span><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=522703167"><span><strong><img border="0" src="/uploadfile/201209/20120923142256684.gif" /></strong></span></a><br />\r\n<span><span><strong><span>出境旅游：</span></strong><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=370149205"><strong><span><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></span></strong></a><br />\r\n<strong><span>厦门地接：</span></strong><a href="http://wpa.qq.com/msgrd?Menu=no&Exe=QQ&Uin=66573424"><strong><span><img border="0" src="/uploadfile/201209/20120923142249273.gif" /></span></strong></a><br />\r\n</span><span style="background-color:#ffffff;font-size:10.5pt;"><span style="background-color:#ffffff;font-size:10.5pt;"><br />\r\n<span><strong>旅游热线</strong></span></span></span></span></span><span style="background-color:#ffffff;"><span style="background-color:#ffffff;color:#ff0000;font-size:10.5pt;">：<br />\r\n</span></span><span style="background-color:#ffffff;"><span style="background-color:#ffffff;font-size:10.5pt;">电话：0592-8265454<br />\r\n</span></span><span style="background-color:#ffffff;font-size:10.5pt;">手机：15160003414<br />\r\n联系人：吴帅<br />\r\n<span><strong><span><span>旅游支持：</span><span><span>中</span>国</span></span><span>国旅（厦门）国际旅行社</span></strong></span></span></span>', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_picture`
--

CREATE TABLE IF NOT EXISTS `wu_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `wu_picture`
--

INSERT INTO `wu_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(38, '/Uploads/avatar_img/55de6e22cf44a.jpg', '', '84efa71c62e8ab0d0a6350e60ff10710', 'bd90b9f2b12ce54943ad431b5fa6a65f8029d74c', 1, 1440640546),
(39, '/Uploads/avatar_img/55de6f1a46d4b.gif', '', 'c9e9def2c13e81a3fa71f8ddd2e4489e', '2616c2020c484a701abc44c347be3f467838ed30', 1, 1440640794),
(12, '/Uploads/goods_img/2015-08-10/55c80c005bb23.gif', '', '4dc27f9ced8488fb7d97298061d04642', 'b403a29541093538c4272213a97830fb0b1c6f84', 1, 1439173632),
(24, '/Uploads/site_logo/55cabbd7249a5.gif', '', 'd7dd02af10f817ce2e7e501eb03e8ccb', '9f6a855025735f9f584f754c7eafa1ff54e55af1', 1, 1439349719),
(14, '/Uploads/goods_img/2015-08-10/55c80e24182bd.gif', '', '20aba5a19cb8bb12ec8defcc32b88e20', '2d8f8662d4880e078c0ebd277a22b2960ddbba61', 1, 1439174180),
(15, '/Uploads/goods_img/2015-08-10/55c88294b81ff.jpg', '', '6557d32eb72493242182fbd0ed4f0c03', '3a1b6903ce6e501122d67db72298f5c3d78020d8', 1, 1439203988),
(37, '/Uploads/avatar_img/55de6e15e7808.jpg', '', '56a0c235a3d0e6d40f6ee0d86e8605a4', '92a246ded03fb2198cb4cfae70897e5fe69a3c2e', 1, 1440640533),
(18, '/Uploads/site_logo/2015-08-11/55c9a574d6384.jpg', '', '720cc2c4b3366e872b0184e1193e8797', '74f2de48fdb5740bc83b199b67b1f860d5325a46', 1, 1439278452),
(26, '/Uploads/site_logo/55cac5a3b1de8.jpg', '', 'e7633e674e94be66f7d190e73b503532', 'd5659a42272f445f9f8165949110e5da811849bb', 1, 1439352227),
(25, '/Uploads/site_logo/55cabd36b3bfa.jpg', '', 'ab970166c1a8a53a073db3607159d18b', 'b3f12dd1bd2c84cc9c5c47570e83d81df39aa679', 1, 1439350070),
(23, '/Uploads/site_logo/55cabb91db451.ico', '', 'fb44dc89394b9c62bf847ee420eaf4b3', 'af32d2a4d2213d734cca7ddf0ad309ba0fd2a3b8', 1, 1439349649),
(35, '/Uploads/avatar_img/55dc5c6b92926.jpg', '', '4c4d0e8eab071c880491f37151b6160b', '7e2b7a8f692d76d3685f8bb9e1ca612182181f67', 1, 1440504939),
(27, '/Uploads/site_logo/55cac5b0bf791.jpg', '', 'd5bb4de5dd7fcbb7d0d7c251cf318255', 'c50b9f6d713512e10b01d77a2b5b546abe4e4076', 1, 1439352240),
(28, '/Uploads/site_logo/55caf8b1adea6.jpg', '', '9e70874df5f1af96fbb2a243c0ad32cc', '64e4d0d5132a0c3dd60c9eae1230c9bb288b1169', 1, 1439365297),
(29, '/Uploads/site_logo/55cafb2d12d10.jpg', '', '678e9f8f48486c7bf3a5d000222c25a3', 'b8b701f9e8159ea102982f3d17db4ab00319abc2', 1, 1439365933),
(30, '/Uploads/site_logo/55cafb3943525.jpg', '', 'df9f41cccd8d52b6e353a077b7ddec31', '98c7a77d848c91fe6fc048dda54c081049414399', 1, 1439365945),
(31, '/Uploads/site_logo/55cafb3fe40e4.jpg', '', '4a3278495ba7ccb28477a0d4a10966b0', 'c8d2543521f7c2f8ae875321cd31059eed9904f1', 1, 1439365951),
(32, '/Uploads/goods_img/2015-08-17/55d166c009c9c.jpg', '', '18cb575c1ff1d6e72ac3c10ca0fb9848', 'd5389fe23307a6f2d08a9e7ac26497ce53c6b969', 1, 1439786687),
(33, '/Uploads/goods_img/2015-08-17/55d16e2b11a74.jpg', '', 'e903414bf1628ab27055d7698c672d5f', '5a9c29c15e5146da102ad891c85ea974e7e12eed', 1, 1439788586),
(34, '/Uploads/avatar_img/55dc569b49f4f.jpg', '', 'b0bdcdc1b0a531ebfab20289f37d8e47', 'f03264688408c466bdf84b8343d1a8871e090ae7', 1, 1440503451),
(36, '/Uploads/avatar_img/55de6e0f4d1cd.jpg', '', '750399a425c669a0dd9d98d15ce669ff', '2697d4d6f23b0e2db8cb3faaee9ada1b43795471', 1, 1440640527),
(40, '/Uploads/avatar_img/55de6fb5395e9.jpg', '', '2694bd81721b66c68f69dce9ae5fcddd', '8d43fe72ceaf70fff81c234b71e762f3501b95a7', 1, 1440640949),
(41, '/Uploads/goods_img/2015-08-29/55e10d7c90823.jpg', '', 'ef688f1326b09d84c056adbdbc7c0251', '846ec0af73a6f658f522e945a23bab4c45300ee2', 1, 1440812412),
(42, '/Uploads/goods_img/2015-08-29/55e1176122c2e.png', '', '8fc0e41a4230af583065b7c0cd95e060', '2e5a6e9a8800b06966537ba30523ba8909d546e8', 1, 1440814945),
(43, '/Uploads/category/55e512b787383.png', '', '74c966fb8f0ae54a27d24bfaa05a2809', '9d9dc46a874a8db5fe5684b7b96671af3fb32be8', 1, 1441075895),
(44, '/Uploads/category/55e512bb63578.jpg', '', '4db8c07b13aa5bfd898ad25c2eb9714e', '0366462a9b0e5d592be8ab1ca31d09441bbc31d6', 1, 1441075899),
(45, '/Uploads/site_logo/55e51782b39ea.png', '', 'a9c4351f9c90cd0c0bfd5f85da93d934', '69fe7c8a9baabc20ca61afda2824f9cefc80f63e', 1, 1441077122),
(46, '/Uploads/category/55e51bd0c7a5d.png', '', '0a7cedf7dd1345bb9959ac7b767247ce', 'ec87566a6a95bf6ce6264e2ecd822bb7504df140', 1, 1441078224),
(47, '/Uploads/goods_img/2015-09-06/55ec01bd9dbd8.jpg', '', '4136fcd39680148b98f33f25fde843bb', '3a291812fa99055e48d210aac70ae355a30438fe', 1, 1441530301),
(48, '/Uploads/goods_img/2015-09-06/55ec274f73cca.jpg', '', 'a0a9b89eb1ff341d7ce2ff2e59782a3a', '15ed9d4acd1766a68979433b42fa209678027e23', 1, 1441539919),
(49, '/Uploads/goods_img/2015-09-07/55ed38c23b7ba.jpg', '', '49b860276ef07ecb09bc0f7cf976ce45', '89e0a141337bd13572a40af95ee7a7667445f831', 1, 1441609922);

-- --------------------------------------------------------

--
-- 表的结构 `wu_scheme_keyword`
--

CREATE TABLE IF NOT EXISTS `wu_scheme_keyword` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `oncenum` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `sourcefrom` varchar(50) NOT NULL,
  `downimg` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ctime` int(10) NOT NULL,
  `totalnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_search_keyword`
--

CREATE TABLE IF NOT EXISTS `wu_search_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索关键词',
  `times` int(11) NOT NULL COMMENT '次数',
  `isshow` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `wu_search_keyword`
--

INSERT INTO `wu_search_keyword` (`id`, `name`, `times`, `isshow`) VALUES
(3, '5', 4, 1),
(2, '厦门', 8, 1),
(4, '丽江', 0, 1),
(5, '北京', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_support`
--

CREATE TABLE IF NOT EXISTS `wu_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `number` int(20) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wu_support`
--

INSERT INTO `wu_support` (`id`, `name`, `number`, `status`, `sort`) VALUES
(1, '云南专线', 66573424, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_tag`
--

CREATE TABLE IF NOT EXISTS `wu_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `pic_url` varchar(250) DEFAULT NULL,
  `sort` tinyint(3) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wu_tag`
--

INSERT INTO `wu_tag` (`id`, `name`, `pic_url`, `sort`, `status`) VALUES
(1, '绝不进店', '', 0, 1),
(2, '绝无自费', '/Uploads/category/55e51bd0c7a5d.png', 0, 1),
(3, '含保险', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_topic`
--

CREATE TABLE IF NOT EXISTS `wu_topic` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wu_topic`
--

INSERT INTO `wu_topic` (`tid`, `name`, `pic_url`, `state`, `sort`) VALUES
(1, '跟团游', '', 1, 0),
(2, '主题游', '', 1, 0),
(3, '自驾游', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wu_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `wu_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `wu_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `wu_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `wu_ucenter_member`
--

INSERT INTO `wu_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'Admin', 'b0dc16ebbc14dd2320ad782102d66f6a', '415770123@qq.com', '', 1439169229, 0, 1442992098, 0, 1439169229, 1),
(4, '还可以', 'b0dc16ebbc14dd2320ad782102d66f6a', '2064911916@qq.com', '18259404549', 1439541265, 0, 1440491300, 0, 1439541265, 1),
(5, '阿晖', '96098cbdf613639979aa3cdf84e0a52e', '123@qq.com', '15980837022', 1440050636, 0, 1440050649, 0, 1440050636, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wu_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `wu_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_url`
--

CREATE TABLE IF NOT EXISTS `wu_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wu_userdata`
--

CREATE TABLE IF NOT EXISTS `wu_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
