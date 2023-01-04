package cn.lei.core.demo;

import cn.hutool.core.io.FileUtil;
import cn.lei.core.entity.DirTree;
import java.io.File;
import java.io.IOException;

/**
 * 主要复习文件创建以及文件价
 *
 * @author heack
 */


public class GenDir {

    //目录根路径
    static String courseFile;

    {
        try {
            courseFile = new File("").getCanonicalPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static String level = "#";


    public static void iterator(DirTree dirTree, String dir, int lenth) {
        if (dirTree.getLevel().length() > lenth) {
            return;
        }
        File[] files = new File(dir).listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    FileUtil.appendUtf8String("* [" + file.getName() + "](" + FileUtil.subPath(courseFile, file.getPath()) + ")\n", courseFile + "/仓库目录.md");
                } else if (file.isDirectory()) {
                    FileUtil.appendUtf8String(dirTree.getLevel() + "#" + " [" + file.getName() + "](" + FileUtil.subPath(courseFile, file.getPath()) + ")\n", courseFile + "/仓库目录.md");
                    DirTree dirTree2 = new DirTree();
                    dirTree2.setName(file.getName());
                    dirTree2.setPath(FileUtil.subPath(courseFile, file.getPath()));
                    dirTree2.setLevel(dirTree.getLevel() + "#");
                    iterator(dirTree2, file.getPath(), lenth);
                }
            }
        }
    }

    public static void main(String[] args) throws IOException {
        FileUtil.writeUtf8String("\n", courseFile + "/仓库目录.md");
        FileUtil.appendUtf8String("# [仓库目录](仓库目录.md)\n", courseFile + "/仓库目录.md");
        GenDir genDir = new GenDir();
        genDir.iteratorPath(courseFile + "/lei-notes", 2);
        genDir.iteratorPath(courseFile + "/lei-works", 4);
        genDir.iteratorPath(courseFile + "/lei-items", 4);

    }

    private void iteratorPath(String dir, int deep) {
        File or = new File(dir);
        DirTree dirTree = new DirTree();
        dirTree.setName(or.getName());
        dirTree.setPath(FileUtil.subPath(courseFile, or.getPath()));
        dirTree.setLevel("#");
        iterator(dirTree, dir, deep);
    }
}
