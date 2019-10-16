package Bean;

/**
 * 文章豆
 */
public class Article {

    private String art_id;
    private String art_title;
    private String art_class;
    private String art_tag;
    private String art_content;
    private String art_time;
    private String art_count;
    private String art_visible;

    public Article() {

    }

    public Article(String art_id, String art_title, String art_class, String art_tag,
                   String art_content, String art_time, String art_count, String art_visible) {
        this.art_id = art_id;
        this.art_title = art_title;
        this.art_class = art_class;
        this.art_tag = art_tag;
        this.art_content = art_content;
        this.art_time = art_time;
        this.art_count = art_count;
        this.art_visible = art_visible;
    }


    public String getArt_id() {
        return art_id;
    }

    public void setArt_id(String art_id) {
        this.art_id = art_id;
    }

    public String getArt_title() {
        return art_title;
    }

    public void setArt_title(String art_title) {
        this.art_title = art_title;
    }

    public String getArt_class() {
        return art_class;
    }

    public void setArt_class(String art_class) {
        this.art_class = art_class;
    }

    public String getArt_tag() {
        return art_tag;
    }

    public void setArt_tag(String art_tag) {
        this.art_tag = art_tag;
    }

    public String getArt_content() {
        return art_content;
    }

    public void setArt_content(String art_content) {
        this.art_content = art_content;
    }

    public String getArt_time() {
        return art_time;
    }

    public void setArt_time(String art_time) {
        this.art_time = art_time;
    }

    public String getArt_count() {
        return art_count;
    }

    public void setArt_count(String art_count) {
        this.art_count = art_count;
    }

    public String getArt_visible() {
        return art_visible;
    }

    public void setArt_visible(String art_visible) {
        this.art_visible = art_visible;
    }
}
