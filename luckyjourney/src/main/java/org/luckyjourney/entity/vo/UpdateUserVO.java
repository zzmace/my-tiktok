package org.luckyjourney.entity.vo;

import lombok.Data;
import org.luckyjourney.config.QiNiuConfig;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @description: 修改用户信息
 * @Author: Xhy
 * @CreateTime: 2023-11-04 15:41
 */
@Data
public class UpdateUserVO {

    @NotBlank(message = "昵称不可为空")
    private String nickName;

    private Long avatar;

    private Boolean sex;

    private String description;

    private Long defaultFavoritesId;



}
