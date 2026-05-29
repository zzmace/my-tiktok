package org.luckyjourney.entity.vo;

import lombok.Data;

import javax.validation.constraints.Min;

@Data
public class Model {
    private String label;
    private Long videoId;
    /**
     * 暴漏的接口只有根据停留时长 {@link org.luckyjourney.controller.CustomerController#updateUserModel}
     */

    private Double score;
}
