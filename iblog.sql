# mysql -uanyone -p123456 -hsencom.top

# 创建数据库
create database iblog default charset utf8;

# 创建用户表
create table tb_user(
    id  int auto_increment primary key ,
    u_name   varchar(50),
    u_psw   varchar(20),
    u_ico    varchar(50),
    u_motto  varchar(50),
    u_blog_name   varchar(100),
    u_last_login    datetime,
    u_last_ip     varchar(32)
);

# 用户登录日志
create table tb_user_log(
    id  int auto_increment primary key ,
    u_login_id int,
    u_login_ip  varchar(32),
    u_login_time datetime,
    U_login_flag tinyint(1)
);


# 创建文章表
create  table  tb_article(
    art_id      int  primary key auto_increment,
    art_title   varchar (50) not null ,
    art_class   int not null ,
    art_tag     int not null ,
    art_content text not null ,
    art_time    datetime not null ,
    art_count   int not null ,
    art_visible tinyint not null default 1
);

# 文章类型表
create table tb_art_class(
  class_id int primary key auto_increment,
  class_name varchar(50)
);

# 文章标签表
create table tb_art_tag(
  tag_id int primary key auto_increment,
  tag_name varchar(50)
);

# 创建图片表
create table tb_photo(
    id  int not null ,
    photo_whoId int ,
    photo_src   varchar (200),
    photo_info  varchar (1000),
    photo_uptime    date ,
    primary key (id)
);


# 创建留言表
create table tb_contact(
    id  int primary key auto_increment,
    contact_name        varchar (32) not null,
    contact_title       varchar (32) not null,
    contact_email       varchar (64) not null,
    contact_content     varchar (1024) not null,
    contact_time        datetime
);


# 友情链接表
create table tb_flink(
    id  int primary key auto_increment,
    flink_name varchar (32) not null,
    flink_addr varchar (64) not null,
    flink_desc varchar (1024) not null
);


# 站点信息表
create table tb_siteinfo(
    site_title varchar (32) not null,
    site_subtitle varchar (32) not null,
    site_keyword varchar (64) not null,
    site_desc varchar (1024) not null,
    site_email varchar (32) not null,
    site_icp varchar (32) not null
)