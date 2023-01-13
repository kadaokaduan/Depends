package at.dallermassl.ap.security.taint.webapp.xxe;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

@XmlRootElement(name = "student")
@XmlAccessorType(XmlAccessType.FIELD)
public class XmlStudent implements Serializable {
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "age")
    private String age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
