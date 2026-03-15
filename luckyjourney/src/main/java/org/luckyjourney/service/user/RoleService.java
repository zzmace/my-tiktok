package org.luckyjourney.service.user;

import org.luckyjourney.entity.user.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import org.luckyjourney.entity.user.Tree;
import org.luckyjourney.entity.vo.AssignRoleVO;
import org.luckyjourney.entity.vo.AuthorityVO;
import org.luckyjourney.util.R;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xhy
 * @since 2023-10-24
 */
public interface RoleService extends IService<Role> {

    List<Tree> tree();

    R removeRole(String id);

    R gavePermission(AuthorityVO authorityVO);

    R gaveRole(AssignRoleVO assignRoleVO);

}
