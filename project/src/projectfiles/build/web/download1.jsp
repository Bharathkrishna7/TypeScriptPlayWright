<%@page import="Mail.decryption"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@ page session="true" %>
<%
     String fname = request.getParameter("fname");
     String skey = request.getParameter("skey");
     String data=null;
  
    
        Connection con = databasecon.getconnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from upload where  filename='"+fname+"' and skey='"+skey+"'");
       if(rs.next())
        {
            fname=fname.concat(".txt");
          String file=rs.getString("filedata");
          String dkey = rs.getString("skey");
          data=new decryption().decrypt(file, dkey);
          System.out.println(data);
          
          response.setHeader("Content-Disposition", "attachment;filename=\"" +fname+ "\"");
                out.write(data); 
   
        }
       else{
             response.sendRedirect("download.jsp?fmsg=Failed");
           }
%>
