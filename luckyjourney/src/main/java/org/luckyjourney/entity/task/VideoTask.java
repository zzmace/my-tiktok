package org.luckyjourney.entity.task;

import lombok.Data;
import org.luckyjourney.entity.video.Video;
import org.luckyjourney.entity.vo.VideoVO;

/**
 * @description: 封装发布视频
 * @Author: Xhy
 * @CreateTime: 2023-11-02 13:57
 */
@Data
public class VideoTask {

    // 新视频
    private Video video;

    // 老视频
    private Video oldVideo;

    // 是否是新增
    private Boolean isAdd;

   // 老状态 : 0 公开  1 私密
    private Boolean oldState;

    private Boolean newState;
}
