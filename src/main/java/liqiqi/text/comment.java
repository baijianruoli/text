package liqiqi.text;

import java.io.Serializable;
import java.util.Date;

public class comment implements Serializable {
    public String name;
    public Date  date;
    public  String comments;

    public String getName() {
        return name;
    }

    public comment(String name, Date date, String comments) {
        this.name = name;
        this.date = date;
        this.comments = comments;
    }
  public comment()
  {

  }
    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }
}
