<%@page import="Mail.Mail"%>
<%@page import="java.sql.*"%>
<%@page import="databaseconnection.databasecon"%>
<%@ page session="true" %>
<%
    String id = request.getParameter("id");
    String fname = request.getParameter("fname");
    String owner = request.getParameter("owner");
    String hkey = request.getParameter("hkey");
    String msg = null;
    String email = owner;
    try {
        Connection con = databasecon.getconnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from verify where owner='" + owner + "' and id='" + id + "' and filename='" + fname + "' and status='Verified'");
        if (rs.next()) {
            response.sendRedirect("verify.jsp?m2=Failed");
        } else {
            ResultSet rs1 = st.executeQuery("select * from upload where hkey ='" + hkey + "' and ownername='" + owner + "' and id='" + id + "' and filename='" + fname + "'");
            String q = "select * from upload where hkey ='" + hkey + "' and ownername='" + owner + "' and id='" + id + "' and filename='" + fname + "'";
            System.out.println(q);
            if (rs1.next()) {
                PreparedStatement ps1 = con.prepareStatement("update verify set status='Verified' where owner = '" + owner + "' and id='" + id + "' and filename='" + fname + "'");
                PreparedStatement ps8 = con.prepareStatement("update upload set status='Verified' where ownername = '" + owner + "' and id='" + id + "' and filename='" + fname + "'");
                ps1.executeUpdate();
                ps8.executeUpdate();
                response.sendRedirect("verify.jsp?m1=Success");
            } else {
                PreparedStatement ps2 = con.prepareStatement("delete from upload where ownername = '" + owner + "' and id='" + id + "' and filename='" + fname + "'");
                ps2.executeUpdate();
                PreparedStatement ps3 = con.prepareStatement("delete from verify where owner = '" + owner + "' and id='" + id + "' and filename='" + fname + "'");
                ps3.executeUpdate();

                msg = "Dear Owner Please Re-Upload Your '" + fname + "' file whose id is'" + id + "'";
                Mail p = new Mail();
                p.secretMail(msg, email, email);
                response.sendRedirect("verify.jsp?m3=Verification_Failed");
            }
%>
<%
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>