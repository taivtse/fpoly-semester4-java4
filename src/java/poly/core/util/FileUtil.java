package poly.core.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig
public class FileUtil {

    public boolean uploadFile(String filename, Part file, String uploadRootPath) {
        try {
            InputStream fis = file.getInputStream();
            byte[] data = new byte[fis.available()];
            fis.read(data);

            File f = new File(uploadRootPath + filename);
            FileOutputStream out = new FileOutputStream(f);
            out.write(data);
            out.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    public boolean deleteFile(String filename, String uploadRootPath) {
        File file = new File(uploadRootPath + filename);
        if (file.delete()) {
            return false;
        }
        return false;
    }
}
