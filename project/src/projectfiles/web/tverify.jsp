<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String id = request.getParameter("id");  
String fname = request.getParameter("fname");
String owner = request.getParameter("owner");
try{
    Connection con=databasecon.getconnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from verify where owner='"+owner+"' and id='"+id+"' and filename='"+fname+"' and status='Waiting For Cloud'");
if(rs.next()){
    response.sendRedirect("verifyrequests.jsp?m2=Failed");
}
else{
PreparedStatement ps1=con.prepareStatement("update verify set status='Waiting For Cloud' where owner = '"+owner+"' and id='"+id+"' and filename='"+fname+"'");
int j=ps1.executeUpdate();
if(j>0)
{
response.sendRedirect("verifyrequests.jsp?msg1=Request_Sent");
}
else{
    response.sendRedirect("verifyrequests.jsp?m1=Failed");
}
%>
<%
    }}

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
%>