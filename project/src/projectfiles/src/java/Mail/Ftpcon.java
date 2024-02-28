package Mail;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author java2
 */
public class Ftpcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    public boolean upload(File file, String fname, String cloud) {
        try {
            client.connect("ftp.drivehq.com");
            client.login("cloud1000p", "cloud1000p");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            if (cloud.equals("CSP1")) {

                status = client.storeFile(" /cloud1/" + fname, fis);

            }

            if (cloud.equals("CSP2")) {

                status = client.storeFile(" /cloud2/" + fname, fis);

            }

            client.logout();
            fis.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }

    void upload(File f, String fileName) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
