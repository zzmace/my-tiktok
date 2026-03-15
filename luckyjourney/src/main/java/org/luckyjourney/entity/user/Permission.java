package org.luckyjourney.entity.user;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.luckyjourney.entity.BaseEntity;

/**
 * <p>
 * 
 * </p>
 *
 * @author xhy
 * @since 2023-10-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Permission extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long pId;

    private String path;

    private String href;

    private String icon;

    private String name;

    private Integer isMenu;

    private String target;

    private Integer sort;

    private Integer state;

    @TableField(exist = false)
    private List<Permission> children;


}
