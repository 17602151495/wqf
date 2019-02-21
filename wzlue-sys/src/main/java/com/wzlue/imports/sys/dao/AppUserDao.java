package com.wzlue.imports.sys.dao;

import com.wzlue.imports.common.base.BaseDao;
import com.wzlue.imports.sys.entity.AppUserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-23 15:22:06
 */
@Mapper
public interface AppUserDao extends BaseDao<AppUserEntity> {

    AppUserEntity queryByMobile(String mobile);
}
