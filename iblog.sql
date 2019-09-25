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
    u_follow_num     int
);

# 创建文章表
create  table  tb_article(
    id  int not null,                       //博客文章表
    art_whoId   int,                        //作者id
    art_title   varchar (50),               //文章标题
    art_content text,             //文章内容
    art_pubTime date,                       //发表时间
    art_count   int,                        //博客点击次数
    primary key (id)                        //将博客文章表设为主键
);


# 创建评论表
create  table tb_articleR(
    id  int not null,                       //评论表
    artReview_rootId    int,                //评论记录的主评论id
    artReview_author    varchar (50),       //评论的作者
    artReview_content   varchar (2000),     //评论内容
    artReview_time      date ,              //评论时间
    primary key (id)                        //将评论表设为主键
);


# 创建好友表
create table tb_friend(
    id  int not null,                       //好友表
    friend_whoId    int,                    //好友id
    user_id         int,                    //用户id
    primary key(id)                         //将好友表设为主键
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
create table tb_word(
    id  int not null,
    word_whoId  int,
    word_content    varchar (2000),
    word_author     varchar (50),
    word_time       date ,
    primary key(id)

);


# 创建留言表
create table tb_articleRB(
    id  int not null ,
    artReview_rootId    int,
    artReview_author    int,
    artReview_content   varchar (2000),
    artReview_time      date ,
    primary key (id)
);


