package at.dallermassl.ap.security.taint.webapp.sql;

public class User {
	private int id;
    private String name;
    private int age;
    private int sex;
    private String mobile;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }
    
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
