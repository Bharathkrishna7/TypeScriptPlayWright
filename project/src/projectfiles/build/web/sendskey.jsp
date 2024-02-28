
<%@page import="Mail.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
String id = request.getParameter("id");  
String fname = request.getParameter("fname");
String user = request.getParameter("user");
String skey = request.getParameter("skey");
String ownername = request.getParameter("ownername");
String status="Key_Sent";
String msg=null;
String email=user ;
try{
    Connection con=databasecon.getconnection();
 Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from userrequests where id ='"+id+"' and owner='"+ownername+"' and filename='"+fname+"' and requestby='"+user+"'");
if(rs.next())
{
     msg  ="Dear User SecretKey For Your Requested FileName:'"+fname+"' is '"+skey+"'";     
        Mail p = new Mail();
        p.secretMail(msg,email,email);
PreparedStatement ps=con.prepareStatement("update userrequests set status='"+status+"' where id ='"+id+"' and owner='"+ownername+"' and filename='"+fname+"' and requestby='"+user+"'");
        ps.executeUpdate();
response.sendRedirect("o_viewrequest.jsp?msg1=Key_Sent");
}
else{
    response.sendRedirect("o_viewrequest.jsp?m1=Failed");
}
%>
<%
    }

    catch(Exception e)
    {
            out.println(e.getMessage());
    }
%>