package org.luckyjourney.entity.response;

import lombok.Data;
import lombok.ToString;
import org.luckyjourney.entity.task.VideoTask;
import org.luckyjourney.entity.video.Video;

@Data
@ToString
public class VideoAuditResponse {

    private AuditResponse videoAuditResponse;

    private AuditResponse imageAuditResponse;

    private AuditResponse textAuditResponse;

    private VideoTask videoTask;
}
