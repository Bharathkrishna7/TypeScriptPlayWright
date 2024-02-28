/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import databaseconnection.databasecon;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.http.Part;

/**
 *
 * @author java2
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection con;
            PreparedStatement pstm = null;
            String status = "Not Verified";

            String filename = "";
            String filedata = "";
            int id = 0;
            String name = (String) request.getSession().getAttribute("ownername");
            String ownername = (String) request.getSession().getAttribute("owner");

            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    List<FileItem> fields = upload.parseRequest(request);
                    Iterator<FileItem> it = fields.iterator();
                    if (!it.hasNext()) {
                        return;
                    }
                    while (it.hasNext()) {
                        FileItem fileItem = it.next();
                        if (fileItem.getFieldName().equals("filename")) {
                            filedata = fileItem.getString();
                            System.out.println("File Data" + filedata);
                        } else {

                        }
                        boolean isFormField = fileItem.isFormField();
                        if (isFormField) {
                        } else {
                            try {
                                con = databasecon.getconnection();
                                pstm = con.prepareStatement("insert into upload (id,ownername,owner,filename,filedata,hkey,skey,status)values(?,?,?,?,?,?,?,?)");

                                filename = fileItem.getName();
                                System.out.println("filename " + filename);
                                String str = getStringFromInputStream(fileItem.getInputStream());
                                //secretkey generating
                                KeyGenerator keyGen = KeyGenerator.getInstance("AES");
                                keyGen.init(128);
                                SecretKey secretKey = keyGen.generateKey();
                                System.out.println("secret key:" + secretKey);
                                //converting secretkey to String
                                byte[] be = secretKey.getEncoded();//encoding secretkey
                                String skey = Base64.encode(be);
                                System.out.println("converted secretkey to string:" + skey);
                                String cipher = new encryption().encrypt(str, secretKey);

                                String cipher1 = cipher.trim();
                                //Arrays.toString(splitToNChar(str, len));
                                //System.out.println(Arrays.toString(splitToNChar(str, len)));

                                int hkey = cipher1.hashCode();

                                //pstm.setBinaryStream(1, fileItem.getInputStream());
                                pstm.setInt(1, id);
                                pstm.setString(2, ownername);
                                pstm.setString(3, name);
                                pstm.setString(4, filename);
                                pstm.setString(5, cipher);
                                pstm.setInt(6, hkey);
                                pstm.setString(7, skey);
                                pstm.setString(8, status);

//     ---------------------------------------
//file name
                                /**
                                 * *** Get The Absolute Path Of The Web
                                 * Application ****
                                 */
                                String applicationPath = getServletContext().getRealPath("");
                                String UPLOAD_DIR = "Files";
                                String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                                System.out.println("applicationPath:" + applicationPath);
                                File fileUploadDirectory = new File(uploadPath);
                                if (!fileUploadDirectory.exists()) {
                                    fileUploadDirectory.mkdirs();
                                }
                                String savePath = uploadPath + File.separator + filename;
                                System.out.println("savePath: " + savePath);
                                String sRootPath = new File(savePath).getAbsolutePath();
                                System.out.println("sRootPath: " + sRootPath);
//     ----------------------------------------


                                /*Cloud Start*/
                                File f = new File(savePath);
                                FileWriter fw = new FileWriter(f);
                                fw.write(cipher);
                                fw.close();
                                //Ftpcon ftpcon = new Ftpcon();
                                //ftpcon.upload(f, filename);
                                /*Cloud End*/
                                int i = pstm.executeUpdate();
                                if (i == 1) {
                                    response.sendRedirect("o_uploadfiles.jsp?msg=success");
                                } else {
                                    response.sendRedirect("o_uploadfiles.jsp?msg1=failed");
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        }
                    }
                } catch (FileUploadException e) {
                } catch (Exception ex) {
                    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
            }
        }
    }

    private static String getStringFromInputStream(InputStream is) {
        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();
        String line;
        try {
            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                }
            }
        }
        return sb.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private long[] splitToNChar(String str, int len) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private String extractFileName(Part part) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
