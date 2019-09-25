package Bean;
/*
    id  int not null ,
    user_name   varchar(50),
    user_pswd   varchar(20),
    user_ico    varchar(50),
    user_motto  varchar(50),
    user_blogName   varchar(100),
    user_ctTime     date,
    user_hitNum     int
 */


public class User{
    private int id;
    private String u_name;
    private String u_psw;
    private String u_ico;
    private String u_motto;
    public String u_blog_name;
    private String u_last_login;
    private int u_follow_num;
}