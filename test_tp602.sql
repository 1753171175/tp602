-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2020-06-15 11:05:38
-- 服务器版本： 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_tp602`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员';

-- --------------------------------------------------------

--
-- 表的结构 `banji`
--

DROP TABLE IF EXISTS `banji`;
CREATE TABLE IF NOT EXISTS `banji` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级';

-- --------------------------------------------------------

--
-- 表的结构 `banji_juan`
--

DROP TABLE IF EXISTS `banji_juan`;
CREATE TABLE IF NOT EXISTS `banji_juan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `juan_id` int(11) NOT NULL COMMENT '试卷ID',
  `banji_id` int(11) NOT NULL COMMENT '班级ID',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `score` decimal(4,1) DEFAULT '0.0' COMMENT '考试成绩',
  `remark` varchar(30) DEFAULT NULL COMMENT '自动备注',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷班级';

-- --------------------------------------------------------

--
-- 表的结构 `banji_student`
--

DROP TABLE IF EXISTS `banji_student`;
CREATE TABLE IF NOT EXISTS `banji_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `banji_id` int(11) NOT NULL COMMENT '班级ID',
  `remark` varchar(30) DEFAULT NULL COMMENT '自动备注',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生班级';

-- --------------------------------------------------------

--
-- 表的结构 `banji_teacher`
--

DROP TABLE IF EXISTS `banji_teacher`;
CREATE TABLE IF NOT EXISTS `banji_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `banji_id` int(11) NOT NULL COMMENT '班级ID',
  `remark` varchar(30) DEFAULT NULL COMMENT '自动备注',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='老师班级';

-- --------------------------------------------------------

--
-- 表的结构 `juan`
--

DROP TABLE IF EXISTS `juan`;
CREATE TABLE IF NOT EXISTS `juan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='试卷';

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识列',
  `name` int(30) NOT NULL COMMENT '姓名',
  `ctime` int(11) DEFAULT NULL COMMENT '创建时间',
  `utime` int(11) DEFAULT NULL COMMENT '最后修改',
  `utime_cn` varchar(20) DEFAULT NULL COMMENT '最后修改(中文)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='老师';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
