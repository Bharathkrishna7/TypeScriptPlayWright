<%@page import="java.sql.*"%>
<%@page import="databaseconnection.*"%>
<%@ page session="true" %>
<%
    String usertype = request.getParameter("utype");
    String username = request.getParameter("uname");
    System.out.println(username);
    session.setAttribute("username",username);
    String name = null;
           
    
    String password = request.getParameter("pswd");
    System.out.println(password);
    
    try
    {	
        Connection con = databasecon.getconnection();
        Statement st = con.createStatement();
        if(usertype.equals("User"))
        {
                    ResultSet rs = st.executeQuery("select * from user where username ='"+username+"' and password='"+password+"'");
                    if(rs.next())
        {
//            String  dtype = rs.getString(4);
//		   session.setAttribute("dtype",dtype);
//		   System.out.println("dtype:"+dtype);
                   response.sendRedirect("userhome.jsp?umsg=Success");
        }
       else 
        {
                    response.sendRedirect("index.jsp?fmsg=LoginFail");
        }
        }
        
        
        
        else if(usertype.equals("Owner")){
                    ResultSet rs = st.executeQuery("select * from owner where username ='"+username+"' and password='"+password+"'");
                    if(rs.next())
        {
             name = rs.getString("name");
        
          session.setAttribute("ownername",name);
          session.setAttribute("owner",username);
                   response.sendRedirect("ownerhome.jsp?omsg=Success");
        }
       else 
        {
                    response.sendRedirect("index.jsp?fmsg=LoginFail");
        }
        }
        
        
        
        
        else if(usertype.equals("Cloud")){
                    ResultSet rs = st.executeQuery("select * from cloud where username ='"+username+"' and password='"+password+"'");
                    if(rs.next())
        {
                   response.sendRedirect("cloudhome.jsp?umsg=Success");
        }
       else 
        {
            response.sendRedirect("index.jsp?fmsg=LoginFail");
        }
        }
        
        
        
        else{
                ResultSet rs = st.executeQuery("select * from tpa where username ='"+username+"' and password='"+password+"'");
       if(rs.next())
        {
                   response.sendRedirect("tpahome.jsp?tmsg=Success");
        }
       else 
        {
            response.sendRedirect("index.jsp?fmsg=LoginFail");
        }
        }
        
        
    }
    
    catch(Exception e)
    {
        System.out.println("Error in index.jsp"+e.getMessage());
    }
%>


