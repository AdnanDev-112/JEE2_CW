<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleAttndceDTOProxyid" scope="session" class="dao.AttndceDTOProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleAttndceDTOProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        dao.StudentDTO[] allStudents2mtemp = sampleAttndceDTOProxyid.allStudents();
if(allStudents2mtemp == null){
%>
<%=allStudents2mtemp %>
<%
}else{
        String tempreturnp3 = null;
        if(allStudents2mtemp != null){
        java.util.List listreturnp3= java.util.Arrays.asList(allStudents2mtemp);
        tempreturnp3 = listreturnp3.toString();
        }
        %>
        <%=tempreturnp3%>
        <%
        }
        break;
        case 5:
                gotMethod = true;
                dao.ModuleDTO[] allModules5mtemp = sampleAttndceDTOProxyid.allModules();
        if(allModules5mtemp == null){
        %>
<%=allModules5mtemp %>
<%
}else{
        String tempreturnp6 = null;
        if(allModules5mtemp != null){
        java.util.List listreturnp6= java.util.Arrays.asList(allModules5mtemp);
        tempreturnp6 = listreturnp6.toString();
        }
        %>
        <%=tempreturnp6%>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>