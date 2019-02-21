package com.wzlue.imports.schedule.dao;

import com.wzlue.imports.common.base.BaseDao;
import com.wzlue.imports.schedule.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务日志
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月1日 下午10:30:02
 */
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}
