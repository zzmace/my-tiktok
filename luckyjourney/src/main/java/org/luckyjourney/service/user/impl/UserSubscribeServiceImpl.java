package org.luckyjourney.service.user.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.luckyjourney.entity.user.UserRole;
import org.luckyjourney.entity.user.UserSubscribe;
import org.luckyjourney.mapper.user.UserRoleMapper;
import org.luckyjourney.mapper.user.UserSubscribeMapper;
import org.luckyjourney.service.user.UserRoleService;
import org.luckyjourney.service.user.UserSubscribeService;
import org.springframework.stereotype.Service;

/**
 * @description:
 * @Author: Xhy
 * @CreateTime: 2023-11-01 15:05
 */
@Service
public class UserSubscribeServiceImpl  extends ServiceImpl<UserSubscribeMapper, UserSubscribe> implements UserSubscribeService {
}
