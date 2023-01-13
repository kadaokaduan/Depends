<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.AllFilter" %>
<%@ page import="at.dallermassl.ap.security.taint.webapp.CodeFile" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta charset="UTF-8" />
	<title>008 - 任意文件上传漏洞 - commons.io 方式</title>
</head>
<body>
	<h1>008 - 任意文件上传漏洞 - commons.io 方式</h1>
	<p>使用java最常用的文件上传处理库，struts、spring都用这个</p>
<%
String method = request.getMethod();
if ("POST".equals(method)) {
	try {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			String root = request.getServletContext().getRealPath("/upload");
			if(root == null){
				root = this.getClass().getClassLoader().getResource("/").getPath() + "../..\\upload";
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item: items) {
				if(!item.isFormField()){
					String filename = item.getName();
					filename = AllFilter.DireTrFilter(filename);
					filename = CodeFile.RandName(filename);
					item.write(new File(root + "/" + filename));
	                response.getWriter().write("success");
	            }
			}
		}
	} catch (Exception e) {
	    out.print(e);
	}
} else {
%>
	<p>请求方式:</p>
	<pre>curl '<%= request.getRequestURL()%>' -F 'file=@/path/to/a.jsp'</pre>

	<form method="post" enctype="multipart/form-data" action="<%=request.getRequestURL() %>">
		<input type="file" name="file">
		<input type="submit">
	</form>
<%}
%>
</body>
</html>
