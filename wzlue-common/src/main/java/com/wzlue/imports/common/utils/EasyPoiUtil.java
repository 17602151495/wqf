package com.wzlue.imports.common.utils;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import cn.afterturn.easypoi.excel.entity.result.ExcelImportResult;
import com.wzlue.imports.common.exception.RRException;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

/**
 *
 * Created by Administrator on 2018-06-04.
 */
public class EasyPoiUtil {
    /**
     * 根据实体类导出
     * @param list list数据
     * @param title 标题
     * @param sheetName sheet页名字
     * @param pojoClass 实体类class
     * @param fileName 文件名
     * @param isCreateHeader 是否创建头
     * @param response 响应
     */
    public static void exportExcel(List<?> list, String title, String sheetName, Class<?> pojoClass, String fileName, boolean isCreateHeader, HttpServletResponse response){
        ExportParams exportParams = new ExportParams(title, sheetName);
        exportParams.setCreateHeadRows(isCreateHeader);
        defaultExport(list, pojoClass, fileName, response, exportParams);

    }

    /**
     * 根据实体类导出
     * @param list list数据
     * @param title 标题
     * @param sheetName sheet页名字
     * @param pojoClass 实体类class
     * @param fileName 文件名
     * @param response 响应
     */
    public static void exportExcel(List<?> list, String title, String sheetName, Class<?> pojoClass,String fileName, HttpServletResponse response){
        defaultExport(list, pojoClass, fileName, response, new ExportParams(title, sheetName));
    }
    /**
     * 根据ExcelExportEntity类导出
     * @param list list数据
     * @param title 标题
     * @param sheetName sheet页名字
     * @param pojoClass 实体类class
     * @param fileName 文件名
     * @param response 响应
     */
    public static void exportExcelByExcelExportEntity(List<?> list, String title, String sheetName,  List<ExcelExportEntity> pojoClass,String fileName, HttpServletResponse response){
        defaultExcelByExcelExportEntity(list, pojoClass, fileName, response, new ExportParams(title, sheetName));
    }

    /**
     * 根据map导出
     * @param list list数据
     * @param fileName 文件名
     * @param response 响应
     */
    public static void exportExcel(List<Map<String, Object>> list, String fileName, HttpServletResponse response){
        defaultExport(list, fileName, response);
    }

    private static void defaultExport(List<?> list, Class<?> pojoClass, String fileName, HttpServletResponse response, ExportParams exportParams) {
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams,pojoClass,list);
        if (workbook != null);
        downLoadExcel(fileName, response, workbook);
    }
    private static void defaultExcelByExcelExportEntity(List<?> list, List<ExcelExportEntity> pojoClass, String fileName, HttpServletResponse response, ExportParams exportParams) {
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams,pojoClass,list);
        if (workbook != null);
        downLoadExcel(fileName, response, workbook);
    }

    private static void downLoadExcel(String fileName, HttpServletResponse response, Workbook workbook) {
        try {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Disposition",
                    "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            throw new RRException(e.getMessage());
        }finally {
            try {
                workbook.close();
            }catch (IOException e){
                throw new RRException(e.getMessage());
            }

        }
    }
    private static void defaultExport(List<Map<String, Object>> list, String fileName, HttpServletResponse response) {
        Workbook workbook = ExcelExportUtil.exportExcel(list, ExcelType.HSSF);
        if (workbook != null);
        downLoadExcel(fileName, response, workbook);
    }

    public static <T> List<T> importExcel(String filePath,Integer titleRows,Integer headerRows, Class<T> pojoClass){
        if (StringUtils.isBlank(filePath)){
            return null;
        }
        ImportParams params = new ImportParams();
        params.setTitleRows(titleRows);
        params.setHeadRows(headerRows);
        List<T> list = null;
        try {
            list = ExcelImportUtil.importExcel(new File(filePath), pojoClass, params);
        }catch (NoSuchElementException e){
            throw new RRException("模板不能为空");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RRException(e.getMessage());
        }
        return list;
    }
    /**
     * 根据实体类导入Excel
     * @param file 上传的Excel
     * @param titleRows
     * @param headerRows 响应
     * @param pojoClass 赋值的实体类
     */
    public static <T> List<T> importExcel(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass){
        if (file == null){
            return null;
        }
        ImportParams params = new ImportParams();
        params.setTitleRows(titleRows);
        params.setHeadRows(headerRows);
        List<T> list = null;
        try {
            list = ExcelImportUtil.importExcel(file.getInputStream(), pojoClass, params);
        }catch (NoSuchElementException e){
            throw new RRException("excel文件不能为空");
        } catch (Exception e) {
            throw new RRException(e.getMessage());
        }
        return list;
    }
    /**
     * 根据实体类导入Excel
     * @param file 上传的Excel,进行自定义验证，可以使用jsr3.
     * @param titleRows
     * @param headerRows 响应
     * @param pojoClass 赋值的实体类
     */
    public static <T> ExcelImportResult<T> importExcelMore(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass){
        if (file == null){
            return null;
        }
        ImportParams params = new ImportParams();
        params.setTitleRows(titleRows);
        params.setHeadRows(headerRows);
        params.setNeedVerfiy(true);
        ExcelImportResult<T> result;
        try {
            result = ExcelImportUtil.importExcelMore(file.getInputStream(), pojoClass, params);
        }catch (NoSuchElementException e){
            throw new RRException("excel文件不能为空");
        } catch (Exception e) {
            throw new RRException(e.getMessage());
        }
        return result;
    }
    /**
     * 根据实体类导入Excel
     * @param file 上传的Excel
     * @param titleRows
     * @param headerRows 响应
     * @param pojoClass 赋值的实体类
     * @param savePath 设置图片上传路径
     */
    public static <T> List<T> importExcel(MultipartFile file, Integer titleRows, Integer headerRows, Class<T> pojoClass,String savePath){
        if (file == null){
            return null;
        }
        ImportParams params = new ImportParams();
        params.setTitleRows(titleRows);
        params.setHeadRows(headerRows);
        params.setSaveUrl(savePath);
        List<T> list = null;
        try {
            list = ExcelImportUtil.importExcel(file.getInputStream(), pojoClass, params);
        }catch (NoSuchElementException e){
            throw new RRException("excel文件不能为空");
        } catch (Exception e) {
            throw new RRException(e.getMessage());
        }
        return list;
    }


}
