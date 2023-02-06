package cn.lei.other;

import cn.hutool.core.io.FileUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.symmetric.DES;
import cn.hutool.crypto.symmetric.SymmetricAlgorithm;
import java.io.File;
import java.io.IOException;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/***
 *@author wanglei
 *@Date 2022/12/9 20:13
 ***/

@Slf4j
public class CheatEncrypt {

    //生成密钥，并转为字符串，可以储存起来，解密时可直接使用
    byte[] key = SecureUtil.generateKey(SymmetricAlgorithm.DES.getValue()).getEncoded();
    String secretKey = new BASE64Encoder().encodeBuffer(key);

    //info:需要加密的明文
    public String encrypt(String info) {
        byte[] key = new byte[0];
        try {
            key = new BASE64Decoder().decodeBuffer(secretKey);
        } catch (IOException e) {
            e.printStackTrace();
        }
        DES des = SecureUtil.des(key);
        String encrypt = des.encryptHex(info);
        return encrypt;
    }

    //encrypt:需要解密的密文
    public String decode(String encrypt) {
        byte[] key = new byte[0];
        try {
            key = new BASE64Decoder().decodeBuffer(secretKey);
        } catch (IOException e) {
            e.printStackTrace();
        }
        DES des = SecureUtil.des(key);
        return des.decryptStr(encrypt);
    }

    /**
     * 相对项目路径 courseFile（项目根路径） + "\\lei-items\\chatnotes\\刘玉婷 和 莫失莫忘 的聊天记录.md"
     *
     * @param target
     */
    @SneakyThrows
    void encoding(String target) {
        //加密工具实体化
        CheatEncrypt cheatEncrypt = new CheatEncrypt();
        //目录根路径
        String courseFile = new File("").getCanonicalPath();
        //获取内容
        String path = courseFile + "/" + target;
        String context = StringUtils.join(FileUtil.readLines(path, "utf-8"));
        String encrypt = cheatEncrypt.encrypt(StringUtils.join(context));
        FileUtil.writeString(encrypt, path, "utf-8");
    }

    public static void main(String[] args) throws IOException {
        CheatEncrypt cheatEncrypt = new CheatEncrypt();
        //        cheatEncrypt.encoding("lei-items/chatnotes/刘玉婷 和 莫失莫忘 的聊天记录.md");
        //        cheatEncrypt.encoding("lei-items/chatnotes/吃嗯陈 和 莫失莫忘 的聊天记录.md");
        cheatEncrypt.encoding("lei-items/chatnotes/笔记/聊天踩坑实录.md");

    }
}
