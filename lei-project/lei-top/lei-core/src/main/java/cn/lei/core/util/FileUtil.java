package cn.lei.core.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * @author lujianing01@58.com
 * @Description:
 * @date 2015/12/18
 */
public class FileUtil {

    /**
     * 将字符串写入文件
     */
    public static void writeFile(String filePath, String fileName, String fileContent) {
        File f = new File(filePath);

        if (!f.exists()) {
            f.mkdirs();
        }

        File myFile = new File(f, fileName);

        FileWriter w = null;
        try {
            w = new FileWriter(myFile);

            w.write(fileContent);
        } catch (IOException e) {
            throw new RuntimeException("Error creating file " + fileName, e);
        } finally {
            if (w != null) {
                try {
                    w.close();
                } catch (IOException e) {
                    // ignore
                }
            }
        }
    }

}
