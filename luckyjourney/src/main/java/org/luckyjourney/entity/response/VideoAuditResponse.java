package org.luckyjourney.entity.response;

import lombok.Data;
import lombok.ToString;
import org.luckyjourney.entity.task.VideoTask;
import org.luckyjourney.entity.video.Video;

/**
 * @description: 封装视频审核返回结果
 * @Author: Xhy
 * @CreateTime: 2023-10-29 14:40
 */
@Data
@ToString
public class VideoAuditResponse {

    private AuditResponse videoAuditResponse;

    private AuditResponse imageAuditResponse;

    private AuditResponse textAuditResponse;

    private VideoTask videoTask;
}
