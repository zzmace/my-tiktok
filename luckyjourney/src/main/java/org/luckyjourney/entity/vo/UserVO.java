package org.luckyjourney.entity.vo;

import lombok.Data;
import org.luckyjourney.entity.user.User;

/**
 * @description:
 * @Author: Xhy
 * @CreateTime: 2023-10-25 15:40
 */
@Data
public class UserVO{

    private Long id;

    private String nickName;

    private Long avatar;

    private Boolean sex;

    private String description;

    private Long follow;

    private Long fans;
}
