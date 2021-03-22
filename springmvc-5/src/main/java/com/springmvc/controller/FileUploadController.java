package com.springmvc.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.UUID;

@Controller
public class FileUploadController {

    @RequestMapping(value = "/fileUpload")
    public String fileUpload(@RequestParam(value = "file", required=false) MultipartFile file, HttpServletRequest request, ModelMap model) {
        // 服务端upload文件夹物理路径
        String path = request.getSession().getServletContext().getRealPath("upload");
        // 获取文件名
        String fileName = file.getOriginalFilename();
        // 实例化一个File对象，表示目标文件(含物理路径)
        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        try {
            //将上传文件保存到服务器上指定位置
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.put("fileUrl", request.getContextPath() + "/upload/" + fileName);
        model.put("fileName", fileName);
        return "success";
    }

    @RequestMapping(value = "/upload")
    public String upload(@RequestParam("description") String description,
                         @RequestParam(value = "files", required = false)List<MultipartFile> files,
                         HttpServletRequest request) {
        // 判断上传文件是否存在
        if (!files.isEmpty() && files.size() > 0) {
            // 循环输出上传的文件
            for (MultipartFile file : files
                 ) {
                // 获取上传文件的原始名称
                String originalFilename = file.getOriginalFilename();
                // 设置上传文件的保存地址目录
                String dirPath = request.getSession().getServletContext().getRealPath("/upload/");
                File filePath = new File(dirPath);
                // 如果保存文件的地址不存在，就先创建目录
                if (!filePath.exists()) {
                    filePath.mkdirs();
                }
                // 使用UUID重新命名上传的文件名称(文件描述_uuid_原始文件名称)
                String newFileName = description + "_" + UUID.randomUUID() + "_" + originalFilename;
                try {
                    // 使用MultipartFile接口的方法将文件上传到指定位置
                    file.transferTo(new File(dirPath + newFileName));
                } catch (Exception e) {
                    e.printStackTrace();
                    return "error";
                }
            }
            // 跳转到成功页面
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "/fileDownload")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
                                               @RequestParam("fileName") String fileName, Model model) throws Exception {
        // 下载文件路径
        String path = request.getSession().getServletContext().getRealPath("/upload/");
        // 创建文件对象
        File file = new File(path + File.separator + fileName);
        // 设置响应头
        HttpHeaders headers = new HttpHeaders();
        // 下载显示的文件名，解决中文名称乱码问题
        String downloadFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
        // 通知浏览器以下载方式(attachment)打开文件
        headers.setContentDispositionFormData("attachment", downloadFileName);
        // 定义以二进制流数据(最常见的文件下载)的形式下载返回文件数据
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 使用Spring MVC框架的ResponseEntity对象封装返回下载数据
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
}
