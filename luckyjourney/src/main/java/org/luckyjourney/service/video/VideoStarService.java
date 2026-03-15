package org.luckyjourney.service.video;

import org.luckyjourney.entity.video.Video;
import org.luckyjourney.entity.video.VideoStar;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xhy
 * @since 2023-10-24
 */
public interface VideoStarService extends IService<VideoStar> {

    /**
     * 视频点赞
     * @param videoStar
     */
    boolean starVideo(VideoStar videoStar);


    /**
     * 视频点赞用户
     * @param videoId
     * @return
     */
    List<Long> getStarUserIds(Long videoId);

    /**
     * 点赞状态
     * @param videoId
     * @param userId
     * @return
     */
    Boolean starState(Long videoId, Long userId);
}
