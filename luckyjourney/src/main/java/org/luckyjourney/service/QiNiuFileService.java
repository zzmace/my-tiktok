package org.luckyjourney.service;

import com.qiniu.storage.model.FileInfo;
import org.luckyjourney.util.R;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.InputStream;
import java.util.Map;

/**
 * @author xhy
 */
public interface QiNiuFileService extends FileCloudService{


    /**
     * 获取签名
     * @return
     */
    String getToken();

    /**
     * 上传文件
     * @param file
     */
    String uploadFile(File file);

    /**
     * 删除文件
     * @param url
     */
    void deleteFile(String url);

    /**
     * 获取文件信息
     * @param url
     * @return
     */
    FileInfo getFileInfo(String url);
}
