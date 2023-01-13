package at.dallermassl.ap.security.taint.webapp.xxe;

import org.apache.commons.io.input.XmlStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import java.io.IOException;
import java.io.StringReader;

public class JAXBXml extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public JAXBXml() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result="";
        String entities = request.getParameter("entities");
        String dtd = request.getParameter("dtd");

        try {
            JAXBContext context = JAXBContext.newInstance(XmlStudent.class);
            XMLInputFactory xif = XMLInputFactory.newInstance();
            if(entities.equals("false")){
                xif.setProperty(XMLInputFactory.IS_SUPPORTING_EXTERNAL_ENTITIES,false);

            }
            if(dtd.equals("false")){
                xif.setProperty(XMLInputFactory.SUPPORT_DTD,false);
            }

            XMLStreamReader xsr = xif.createXMLStreamReader(request.getInputStream());
            Unmarshaller unmarshaller = context.createUnmarshaller();
            XmlStudent student = (XmlStudent) unmarshaller.unmarshal(xsr);
            result = student.getName();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/xml;charset=UTF-8");
        response.getWriter().append(org.owasp.esapi.ESAPI.encoder().encodeForHTML(result));
    }
}
