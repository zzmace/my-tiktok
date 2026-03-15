package org.luckyjourney.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author xhy
 * @since 2023-11-20
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class File extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    // 文件key
    private String fileKey;

    // 文件格式
    private String format;

    // 文件类型
    private String type;

    // 文件大小
    private Long size;

    // 发布者
    private Long userId;

}
