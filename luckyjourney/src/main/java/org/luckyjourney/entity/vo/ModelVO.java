package org.luckyjourney.entity.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @description: 模型
 * @Author: Xhy
 * @CreateTime: 2023-10-25 17:49
 */
@Data
public class ModelVO {

    private Long userId;
    // 兴趣视频分类
    private List<String> labels;
}
