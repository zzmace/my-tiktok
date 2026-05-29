package org.luckyjourney.entity.vo;

import lombok.Data;
import org.luckyjourney.entity.user.Follow;

@Data
public class FollowVO extends Follow {

    private String nickName;
}
