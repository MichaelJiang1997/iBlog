package Bean;

/**
 * 用户Bean
 */

public class User{
    private int id;
    private String u_name;
    private String u_psw;
    private String u_ico;
    private String u_motto;
    private String u_blog_name;
    private String u_last_login;
    private int u_follow_num;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_psw() {
        return u_psw;
    }

    public void setU_psw(String u_psw) {
        this.u_psw = u_psw;
    }

    public String getU_ico() {
        return u_ico;
    }

    public void setU_ico(String u_ico) {
        this.u_ico = u_ico;
    }

    public String getU_motto() {
        return u_motto;
    }

    public void setU_motto(String u_motto) {
        this.u_motto = u_motto;
    }

    public String getU_blog_name() {
        return u_blog_name;
    }

    public void setU_blog_name(String u_blog_name) {
        this.u_blog_name = u_blog_name;
    }

    public String getU_last_login() {
        return u_last_login;
    }

    public void setU_last_login(String u_last_login) {
        this.u_last_login = u_last_login;
    }

    public int getU_follow_num() {
        return u_follow_num;
    }

    public void setU_follow_num(int u_follow_num) {
        this.u_follow_num = u_follow_num;
    }
}