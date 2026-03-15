package org.luckyjourney;

import org.junit.jupiter.api.Test;
import org.luckyjourney.config.QiNiuConfig;
import org.luckyjourney.constant.AuditStatus;
import org.luckyjourney.entity.video.Video;
import org.luckyjourney.schedul.HotRank;
import org.luckyjourney.service.FeedService;
import org.luckyjourney.service.QiNiuFileService;
import org.luckyjourney.service.InterestPushService;
import org.luckyjourney.service.audit.VideoAuditService;
import org.luckyjourney.service.video.VideoService;
import org.luckyjourney.util.FileUtil;
import org.luckyjourney.util.RedisCacheUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.File;
import java.util.*;

@SpringBootTest
class LuckyJourneyApplicationTests {

    @Autowired
    private RedisCacheUtil redisCacheUtil;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private HotRank hotRank;

    @Autowired
    private VideoAuditService videoAuditService;

    @Autowired
    private QiNiuFileService fileService;

    @Test
    void contextLoads() throws InterruptedException {
//        hotRank.hotVideo();
        final File mk = new File("D:\\桌面\\宠物萌宠系列-525\\");

        final File[] files = mk.listFiles();
        Arrays.stream(files).parallel().forEach(file->{
            upload(file,new Video());
        });
    }

    public void upload(File file,Video video){

        Long userId = 10L;
        Long typeId = 5l;
        String labelNames = "小狗,小猫,宠物,动物";

        // 上传文件 http://oss.luckjourney.liuscraft.top/ljMETHJxFkifiWDvNfm1byldMjdw?vframe/jpg/offset/1
        String key = fileService.uploadFile(file);
        video.setTitle("宠物"+ UUID.randomUUID().toString().substring(6));
        video.setDescription("");
        video.setUserId(userId);
        video.setAuditStatus(AuditStatus.SUCCESS);
        video.setOpen(false);
        video.setMsg("正常");
        video.setLabelNames(labelNames);
        video.setTypeId(typeId);
        final Random random = new Random();
        video.setFavoritesCount((long)random.nextInt(1000));
        video.setStartCount((long)random.nextInt(1000));
        video.setHistoryCount((long)random.nextInt(1000) + 1000);
        video.setShareCount((long)random.nextInt(1000));
        video.setYv("YV"+UUID.randomUUID().toString().replace("-","").substring(8));
//        video.setUrl(key);
        // 解析封面
        String url = QiNiuConfig.CNAME+"/"+key;
//        video.setCover(url+"?vframe/jpg/offset/1");
        // 解析时长 生成UUID
        video.setDuration(FileUtil.getVideoDuration(url));
        // 解析类型
        video.setVideoType(fileService.getFileInfo(key).mimeType);
        videoService.save(video);
        interestPushService.pushSystemStockIn(video);
        interestPushService.pushSystemTypeStockIn(video);
        feedService.pusOutBoxFeed(userId,video.getId(),video.getGmtCreated().getTime());

    }

    @Autowired
    VideoService videoService;

    @Autowired
    FeedService feedService;

    @Autowired
    private InterestPushService interestPushService;
}
