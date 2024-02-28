<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String username = request.getParameter("email");
String password = request.getParameter("pswd");  
String mob = request.getParameter("mob");
String name = request.getParameter("name");
String usertype = request.getParameter("utype");
try{
    Connection con=databasecon.getconnection();
if(usertype.equals("User"))
{
PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?)");

ps.setString(1,name);
ps.setString(2,username);
ps.setString(3,password);
ps.setString(4,mob);
int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("index.jsp?msg1=Registered");
}
else{
    response.sendRedirect("index.jsp?m1=Failed");
}
}
else
{
PreparedStatement ps=con.prepareStatement("insert into owner values(?,?,?,?)");

ps.setString(1,name);
ps.setString(2,username);
ps.setString(3,password);
ps.setString(4,mob);
    
int i=ps.executeUpdate();
if(i>0)
{
response.sendRedirect("index.jsp?msg=Registered");
}
else{
    response.sendRedirect("index.jsp?m1=Failed");
}
}
%>
<%
}

catch(Exception e)
{
        out.println(e.getMessage());
}
%>