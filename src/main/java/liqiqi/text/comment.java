package liqiqi.text;

import java.io.Serializable;
import java.util.Date;

public class comment implements Serializable {
    public String name;
    public  String  date;
    public  String other;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }
}
