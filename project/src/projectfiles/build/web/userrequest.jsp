<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String owner = request.getParameter("owner");  
// String id = request.getParameter("id");
String fname = request.getParameter("fname");
String skey = request.getParameter("skey");
String user = session.getAttribute("username").toString();
String status="Requested";
try{
    Connection con=databasecon.getconnection();
            Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from userrequests where filename='"+fname+"' and requestby='"+user+"' and status='Pending'");
if(rs.next()){
    response.sendRedirect("u_viewfiles.jsp?m2=Failed");
}
else{
PreparedStatement ps=con.prepareStatement("insert into userrequests values(?,?,?,?,?,?)");

ps.setString(1,"0");
ps.setString(2,owner);
ps.setString(3,fname);
ps.setString(4,user);
ps.setString(5,skey);
ps.setString(6,status);
int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("u_viewfiles.jsp?msg1=Requested");
}
else{
    response.sendRedirect("u_viewfiles.jsp?m1=Failed");
}
%>
<%
    }}

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
%>