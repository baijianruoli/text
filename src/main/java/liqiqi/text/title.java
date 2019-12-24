package liqiqi.text;

public class title {
   String name;
   String some;
   String place;
   String date;
   String other;
   String picture;
   String id;
    public String getName() {
        return name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSome() {
        return some;
    }

    public void setSome(String some) {
        this.some = some;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public title() {

    }

    public title(String name, String some, String place, String date, String other, String picture,String id) {
        this.name = name;
        this.some = some;
        this.place = place;
        this.date = date;
        this.other = other;
        this.picture = picture;
        this.id=id;

    }




}
