<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String id = request.getParameter("id");  
String fname = request.getParameter("fname");
String fdata = request.getParameter("fdata");
int hkey = 0;
String owner = session.getAttribute("username").toString();
String status="Waiting For TPA";
try{
    Connection con=databasecon.getconnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from upload where ownername='"+owner+"' and id='"+id+"' and filename='"+fname+"' and status='Waiting For TPA'");
    if(rs.next()){
    response.sendRedirect("o_verifyfiles.jsp?m2=Failed");
}
else{
PreparedStatement ps=con.prepareStatement("insert into verify values(?,?,?,?,?,?)");

ps.setString(1,id);
ps.setString(2,owner);
ps.setString(3,fname);
ps.setString(4,fdata);
ps.setInt(5,hkey);
ps.setString(6,status);
    
PreparedStatement ps1=con.prepareStatement("update upload set status='Waiting For TPA' where ownername = '"+owner+"' and id='"+id+"' and filename='"+fname+"'");
int j=ps1.executeUpdate();
int i=ps.executeUpdate();
if(i>0 && j>0)
{
response.sendRedirect("o_verifyfiles.jsp?msg1=Request_Sent");
}
else{
    response.sendRedirect("o_verifyfiles.jsp?m1=Failed");
}
%>
<%
    }}

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
%>