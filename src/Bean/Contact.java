package Bean;


/**
 * 联系页面留言Bean
 */
public class Contact {
    private String contact_name;
    private String contact_title;
    private String contact_email;
    private String contact_content;
    private String contact_time;

    public Contact(){

    }

    public Contact(String contact_name,String contact_title,String contact_email,
                   String contact_content,String contact_time){
        this.contact_name = contact_name;
        this.contact_title = contact_title;
        this.contact_email = contact_email;
        this.contact_content = contact_content;
        this.contact_time = contact_time;
    }

    public String getContact_name() {
        return contact_name;
    }

    public void setContact_name(String contact_name) {
        this.contact_name = contact_name;
    }

    public String getContact_title() {
        return contact_title;
    }

    public void setContact_title(String contact_title) {
        this.contact_title = contact_title;
    }

    public String getContact_email() {
        return contact_email;
    }

    public void setContact_email(String contact_email) {
        this.contact_email = contact_email;
    }

    public String getContact_content() {
        return contact_content;
    }

    public void setContact_content(String contact_content) {
        this.contact_content = contact_content;
    }

    public String getContact_time() {
        return contact_time;
    }

    public void setContact_time(String contact_time) {
        this.contact_time = contact_time;
    }
}
