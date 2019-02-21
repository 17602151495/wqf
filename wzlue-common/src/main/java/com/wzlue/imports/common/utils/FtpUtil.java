package com.wzlue.imports.common.utils;

import io.jsonwebtoken.lang.Assert;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.pool2.ObjectPool;
import org.apache.poi.ss.usermodel.Workbook;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class FtpUtil {

    /**
     * ftpClient连接池初始化标志
     */
    private static volatile boolean hasInit = false;
    /**
     * ftpClient连接池
     */
    private static ObjectPool<FTPClient> ftpClientPool;

    /**
     * 初始化ftpClientPool
     *
     * @param ftpClientPool
     */
    public static void init(ObjectPool<FTPClient> ftpClientPool) {
        if (!hasInit) {
            synchronized (FtpUtil.class) {
                if (!hasInit) {
                    FtpUtil.ftpClientPool = ftpClientPool;
                    hasInit = true;
                }
            }
        }
    }

    /**
     * 读取csv文件
     *
     * @param remoteFilePath 文件路径（path+fileName）
     * @param headers        列头
     * @return
     * @throws IOException
     */
    public static List<CSVRecord> readCsvFile(String remoteFilePath, String... headers) throws IOException {
        FTPClient ftpClient = getFtpClient();
        try (InputStream in = ftpClient.retrieveFileStream(encodingPath(remoteFilePath))) {
            return CSVFormat.EXCEL.withHeader(headers).withSkipHeaderRecord(false)
                    .withIgnoreSurroundingSpaces().withIgnoreEmptyLines()
                    .parse(new InputStreamReader(in, "utf-8")).getRecords();
        } finally {
            ftpClient.completePendingCommand();
            releaseFtpClient(ftpClient);
        }
    }

    /**
     * 按行读取FTP文件
     *
     * @param remoteFilePath 文件路径（path+fileName）
     * @return
     * @throws IOException
     */
    public static List<String> readFileByLine(String remoteFilePath) throws IOException {
        FTPClient ftpClient = getFtpClient();
        try (InputStream in = ftpClient.retrieveFileStream(encodingPath(remoteFilePath));
             BufferedReader br = new BufferedReader(new InputStreamReader(in))) {
            return br.lines().map(line -> StringUtils.trimToEmpty(line))
                    .filter(line -> StringUtils.isNotEmpty(line)).collect(Collectors.toList());
        } finally {
            ftpClient.completePendingCommand();
            releaseFtpClient(ftpClient);
        }
    }

    /**
     * 获取指定路径下FTP文件
     *
     * @param remotePath 路径
     * @return FTPFile数组
     * @throws IOException
     */
    public static FTPFile[] retrieveFTPFiles(String remotePath) throws IOException {
        FTPClient ftpClient = getFtpClient();
        try {
            return ftpClient.listFiles(encodingPath(remotePath + "/"),
                    file -> file != null && file.getSize() > 0);
        } finally {
            releaseFtpClient(ftpClient);
        }
    }

    /**
     * 获取指定路径下FTP文件名称
     *
     * @param remotePath 路径
     * @return ftp文件名称列表
     * @throws IOException
     */
    public static List<String> retrieveFileNames(String remotePath) throws IOException {
        FTPFile[] ftpFiles = retrieveFTPFiles(remotePath);
        if (ArrayUtils.isEmpty(ftpFiles)) {
            return new ArrayList<>();
        }
        return Arrays.stream(ftpFiles).filter(Objects::nonNull)
                .map(FTPFile::getName).collect(Collectors.toList());
    }

    /**
     * Description: 向FTP服务器上传文件
     *
     * @param path     FTP服务器保存目录
     * @param filename 上传到FTP服务器上的文件名
     * @param input    输入流
     * @return 成功返回true，否则返回false
     */
    public static boolean uploadFile(String path, String filename, InputStream input) {
        boolean success = false;
        FTPClient ftpClient = getFtpClient();
        int reply;
        reply = ftpClient.getReplyCode();

        try {
            ftpClient.disconnect();
            ftpClient.changeWorkingDirectory(path);
            ftpClient.storeFile(filename, input);
            ftpClient.logout();
            success = true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return success;
    }

    public static Integer sendFile(String fileName,String fileContent) throws Exception{
        FTPClient ftpClient = null;
        try {
            ftpClient = getFtpClient();
            releaseFtpClient(ftpClient);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(ftpClient == null){
            throw  new Exception("ftp连接失败");
        }
        try {
            //ftpClient.changeWorkingDirectory("E://ss");File file=new File("ssssssssssssssssssssssssss.txt");
            File file = new File(fileName);
            FileOutputStream fo = new FileOutputStream(file, true);
            OutputStreamWriter write = new OutputStreamWriter(fo,"utf-8");
            BufferedWriter writer=new BufferedWriter(write);
            writer.write(fileContent);
            writer.flush();
            writer.close();
            fo.flush();
            fo.close();
            InputStream inputStream = new FileInputStream(file);
            ftpClient.enterLocalPassiveMode();
            ftpClient.setControlEncoding("utf-8");
            ftpClient.storeFile(fileName, inputStream);
            if(inputStream != null){
                inputStream.close();
            }
            if(file.exists()){
                file.delete();
            }
            System.out.println(!file.exists());
        } catch (Exception e) {
            throw e;
        }
        return 1;
    }

    /**
     * 编码文件路径
     */
    private static String encodingPath(String path) throws UnsupportedEncodingException {
        // FTP协议里面，规定文件名编码为iso-8859-1，所以目录名或文件名需要转码
        return new String(path.replaceAll("//", "/").getBytes("GBK"), "iso-8859-1");
    }

    /**
     * 获取ftpClient
     *
     * @return
     */
    private static FTPClient getFtpClient() {
        checkFtpClientPoolAvailable();
        FTPClient ftpClient = null;
        Exception ex = null;
        // 获取连接最多尝试3次
        for (int i = 0; i < 3; i++) {
            try {
                ftpClient = ftpClientPool.borrowObject();
                ftpClient.changeWorkingDirectory("/");
                break;
            } catch (Exception e) {
                ex = e;
            }
        }
        if (ftpClient == null) {
            throw new RuntimeException("Could not get a ftpClient from the pool", ex);
        }
        return ftpClient;
    }

    /**
     * 释放ftpClient
     */
    private static void releaseFtpClient(FTPClient ftpClient) {
        if (ftpClient == null) {
            return;
        }

        try {
            ftpClientPool.returnObject(ftpClient);
        } catch (Exception e) {
            //log.error("Could not return the ftpClient to the pool", e);
            // destoryFtpClient
            if (ftpClient.isAvailable()) {
                try {
                    ftpClient.disconnect();
                } catch (IOException io) {
                }
            }
        }
    }

    /**
     * 检查ftpClientPool是否可用
     */
    private static void checkFtpClientPoolAvailable() {
        Assert.state(hasInit, "FTP未启用或连接失败！");
    }

    /**
     * 上传Excel文件到FTP
     *
     * @param workbook
     * @param remoteFilePath
     * @throws IOException
     */
    public static boolean uploadExcel2Ftp(Workbook workbook, String remoteFilePath)
            throws IOException {
        Assert.notNull(workbook, "workbook cannot be null.");
        Assert.hasText(remoteFilePath, "remoteFilePath cannot be null or blank.");
        FTPClient ftpClient = getFtpClient();
        try (OutputStream out = ftpClient.storeFileStream(encodingPath(remoteFilePath))) {
            workbook.write(out);
            workbook.close();
            return true;
        } finally {
            ftpClient.completePendingCommand();
            releaseFtpClient(ftpClient);
        }
    }

    /**
     * 从ftp下载excel文件
     *
     * @param remoteFilePath
     * @param response
     * @throws IOException
     */
    public static void downloadExcel(String remoteFilePath, HttpServletResponse response)
            throws IOException {
        String fileName = remoteFilePath.substring(remoteFilePath.lastIndexOf("/") + 1);
        fileName = new String(fileName.getBytes("GBK"), "iso-8859-1");
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

        FTPClient ftpClient = getFtpClient();
        try (InputStream in = ftpClient.retrieveFileStream(encodingPath(remoteFilePath));
             OutputStream out = response.getOutputStream()) {
            int size = 0;
            byte[] buf = new byte[10240];
            while ((size = in.read(buf)) > 0) {
                out.write(buf, 0, size);
                out.flush();
            }
        } finally {
            ftpClient.completePendingCommand();
            releaseFtpClient(ftpClient);
        }
    }

    public static void main(String[] args) {
        File f = new File("s");
        OutputStreamWriter write = null;
        try {
            write = new OutputStreamWriter(new FileOutputStream(f),"gbk");
            BufferedWriter writer=new BufferedWriter(write);
            writer.write("ss");
            writer.close();
            List<String> s = FileUtils.readLines(f);
            for (String s1 : s) {
                System.out.println(s1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

