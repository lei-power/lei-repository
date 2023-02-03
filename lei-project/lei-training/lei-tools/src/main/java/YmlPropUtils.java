import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

/***
 *@author: LeiGe.King
 *@Date: 2022/1/19 20:14
 ***/


public class YmlPropUtils {

    public static void Pro2Yml(String proName) {
        if (proName == null || proName.isEmpty() || !proName.endsWith(".properties")) {
            throw new RuntimeException("请输入properties文件名称！！");
        }
        File porFile = new File(proName);
        if (!porFile.exists()) {
            throw new RuntimeException("工程根目录下不存在 " + proName + "文件！！");
        }
        String fileName = proName.split("\\.properties", 2)[0];
        // 获取文件数据
        String pro = read(porFile);
        String pros = new String(pro.getBytes(), StandardCharsets.UTF_8);
        // 将数据写入到 yml 文件中
        String ymlName = fileName + ".yml";
        File ymlfile = new File(ymlName);
        if (!ymlfile.exists()) {
            try {
                ymlfile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //   String yml = YamlUtil.propertiesToYaml(pro);
        try (FileWriter writer = new FileWriter(ymlfile)) {
            //      writer.write(yml);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void Yml2Pro(String proName) {
        YmlUtils.castProperties(proName);
    }

    private static String read(File file) {
        if (Objects.isNull(file) || !file.exists()) {
            return "";
        }
        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] b = new byte[(int) file.length()];
            fis.read(b);
            return new String(b, StandardCharsets.UTF_8);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

}

