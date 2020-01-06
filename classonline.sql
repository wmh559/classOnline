# 创建数据库
create database classonline;

# 创建用户表
create table tbs_user(
	`id` bigint primary key auto_increment,
	`username` varchar(50) not null,
	`password` varchar(50) not null,
	`nickname` varchar(50),
	`profile_photo` varchar(2000),
	`sex` int(1),
	`role_type` int(1) default(1)
)

# 角色表
create table tbs_role(
	`id` bigint primary key auto_increment,
	`rolename` varchar(50)
)

# 菜单表
create table tbs_menu(
	`id` bigint primary key auto_increment,
	`title` varchar(50),
	`url` varchar(2000) not null
)

# 角色菜单映射表
create table tbs_role_menu(
	`id` bigint primary key auto_increment,
	`rid` bigint,
	`mid` bigint
)

# 签到表
create table tbs_report(
	`id` bigint primary key auto_increment,
	`uid` bigint,
	`report_time` datetime,
	`starting_time` datetime,
	`starting_uid` bigint
)

# 问题表
create table tbs_question(
	`id` bigint primary key auto_increment,
	`uid` bigint,
	`title` varchar(200),
	`description` varchar(2000)
)


# 班级表
create table tbs_classroom(
	`id` bigint primary key auto_increment,
	`create_uid` bigint,
	`name` varchar(50),
	`picture` varchar(2000),
	`create_time` datetime
)

# 学生班级映射表
create table tbs_user_classroom(
	`id` bigint primary key auto_increment,
	`cid` bigint,
	`uid` BIGINT
)

# 聊天记录表
create table tbs_message(
	`id` bigint primary key auto_increment,
	`uid` bigint,
	`nickname` varchar(50),
	`message_type` int(1) default(0),
	`content` varchar(5000),
	`create_time` datetime
)
