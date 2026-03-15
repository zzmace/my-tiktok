package org.luckyjourney.entity.vo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

/**
 * @description:
 * @Author: Xhy
 * @CreateTime: 2023-10-24 15:57
 */
@Data
public class BasePage {

    private Long page = 1L;
    private Long limit = 15L;

    public IPage page(){
        return new Page(page == null ? 1L : this.page,limit == null ? 15L : this.limit);
    }
}
