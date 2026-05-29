package org.luckyjourney.entity.vo;

import lombok.Data;
import org.luckyjourney.entity.user.User;

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
