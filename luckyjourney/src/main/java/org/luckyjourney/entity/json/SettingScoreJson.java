package org.luckyjourney.entity.json;

import lombok.Data;

/**
 * @description: 系统表解析
 * @Author: Xhy
 * @CreateTime: 2023-10-29 14:51
 */
@Data
public class SettingScoreJson {
    // 通过
    ScoreJson successScore;
    // 人工审核
    ScoreJson manualScore;
    // PASS
    ScoreJson passScore;
}
