<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String id = request.getParameter("id");  
String fname = request.getParameter("fname");
String fdata = request.getParameter("fdata");
String owner = request.getParameter("owner");
String fdata1=fdata.trim();
int hkey=fdata1.hashCode();
try{
    Connection con=databasecon.getconnection();
PreparedStatement ps=con.prepareStatement("update verify set status='Cloud Done',hkey='"+hkey+"' where owner = '"+owner+"' and id='"+id+"' and filename='"+fname+"'");
int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("c_viewrequest.jsp?msg1=Key_Sent");
}
else{
    response.sendRedirect("c_viewrequest.jsp?m1=Failed");
}
%>
<%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
%>