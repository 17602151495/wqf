package com.wzlue.imports.common.utils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtils {

    private ZipUtils() {
    }

    public static void doCompress(String srcFile, String zipFile) throws IOException {
        doCompress(new File(srcFile), new File(zipFile));
    }

    /**
     * 文件压缩
     *
     * @param srcFile 目录或者单个文件
     * @param zipFile 压缩后的ZIP文件
     */
    public static void doCompress(File srcFile, File zipFile) throws IOException {
        ZipOutputStream out = null;
        try {
            out = new ZipOutputStream(new FileOutputStream(zipFile));
            doCompress(srcFile, out);
        } catch (Exception e) {
            throw e;
        } finally {
            out.close();//记得关闭资源
        }
    }

    public static void doCompress(String filelName, ZipOutputStream out) throws IOException {
        doCompress(new File(filelName), out);
    }

    public static void doCompress(File file, ZipOutputStream out) throws IOException {
        doCompress(file, out, "");
    }

    public static void doCompress(File inFile, ZipOutputStream out, String dir) throws IOException {
        if (inFile.isDirectory()) {
            File[] files = inFile.listFiles();
            if (files != null && files.length > 0) {
                for (File file : files) {
                    String name = inFile.getName();
                    if (!"".equals(dir)) {
                        name = dir + "/" + name;
                    }
                    ZipUtils.doCompress(file, out, name);
                }
            }
        } else {
            ZipUtils.doZip(inFile, out, dir);
        }
    }

    public static void doZip(File inFile, ZipOutputStream out, String dir) throws IOException {
        String entryName = null;
        if (!"".equals(dir)) {
            entryName = dir + "/" + inFile.getName();
        } else {
            entryName = inFile.getName();
        }
        ZipEntry entry = new ZipEntry(entryName);
        out.putNextEntry(entry);

        int len = 0;
        byte[] buffer = new byte[1024];
        FileInputStream fis = new FileInputStream(inFile);
        while ((len = fis.read(buffer)) > 0) {
            out.write(buffer, 0, len);
            out.flush();
        }
        out.closeEntry();
        fis.close();
    }

    public static void exportZip(List<File> files, File zip) throws FileNotFoundException {
        byte[] byt = new byte[1024];
        ZipOutputStream out = null;
        FileInputStream in = null;
        try {
            out = new ZipOutputStream(new FileOutputStream(zip), Charset.defaultCharset());
            for (int i = 0; i < files.size(); i++) {
                try {
                    if(files.get(i) == null){
                        continue;
                    }
                    in = new FileInputStream(files.get(i));
                    out.putNextEntry(new ZipEntry(files.get(i).getName()));
                    int length;
                    while ((length = in.read(byt)) > 0) {
                        out.write(byt, 0, length);
                    }
                    out.closeEntry();
                    in.close();
                } catch (Exception e) {
//LOGGER.info("文件打包失败:{}", e);
                } finally {
                    try {
                        in.close();
                    } catch (Exception e1) {
//LOGGER.info("文件流关闭失败：{}", e1);
                    }
                }

            }
            out.close();
        } catch (Exception e) {
            throw new FileNotFoundException();
        } finally {
            try {
                if(out != null){
                    out.close();
                }
                if(in != null){
                    in.close();
                }
            } catch (IOException e) {
//LOGGER.info("文件流关闭失败:{}", e);
            }
        }
        //2.删除服务器上的临时文件(excel)
        for (int i = 0; i < files.size(); i++) {
            File temFile = files.get(i);
            if (temFile.exists() && temFile.isFile()) {
                try {
                    boolean result=temFile.delete();
                    if (!result) {
                        System.gc();    //回收资源
                        temFile.delete();
                    }
                } catch (Exception e) {
//LOGGER.info("文件删除出错：{}", e);
                }

            }
        }
    }

    public static void main(String[] args) throws IOException {
        doCompress("D:/java/", "D:/java.zip");
    }

}