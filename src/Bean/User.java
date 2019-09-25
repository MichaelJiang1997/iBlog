package Bean;

/**
 *  id  int auto_increment primary key ,
 *     u_name   varchar(50),
 *     u_psw   varchar(20),
 *     u_ico    varchar(50),
 *     u_motto  varchar(50),
 *     u_blog_name   varchar(100),
 *     u_last_login    datetime,
 *     u_follow_num     int
 */
public class User {

    private int id;

    public User(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
