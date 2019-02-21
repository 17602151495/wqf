package com.wzlue.imports.sys.service.impl;

import com.wzlue.imports.sys.dao.SysDictDao;
import com.wzlue.imports.sys.entity.SysDictEntity;
import com.wzlue.imports.sys.service.SysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("sysDictService")
public class SysDictServiceImpl implements SysDictService {
	@Autowired
	private SysDictDao sysDictDao;
	
	@Override
	public SysDictEntity queryObject(Long id){
		return sysDictDao.queryObject(id);
	}

	@Override
	public List<SysDictEntity> queryListNotPage(String name) {
		return sysDictDao.queryListNotPage(name);
	}

	@Override
	public List<SysDictEntity> queryList(Map<String, Object> map){
		return sysDictDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysDictDao.queryTotal(map);
	}
	
	@Override
	public void save(SysDictEntity sysDict){
		sysDictDao.save(sysDict);
	}
	
	@Override
	public void update(SysDictEntity sysDict){
		sysDictDao.update(sysDict);
	}
	
	@Override
	public void delete(Long id){
		sysDictDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		sysDictDao.deleteBatch(ids);
	}

	@Override
	public List<SysDictEntity> queryByType(String type) {
		Map<String,Object> map = new HashMap<>();
		map.put("type",type);
		map.put("sidx","order_num");
		map.put("order","asc");
		return sysDictDao.queryList(map);
	}

	@Override
	public SysDictEntity queryByTypeAndName(String type, String name) {
		return sysDictDao.queryByTypeAndName(type, name);
	}

	@Override
	public SysDictEntity query(SysDictEntity sysDictEntity) {
		return sysDictDao.query(sysDictEntity);
	}

	@Override
	public SysDictEntity queryObjectByPar(SysDictEntity sysDictEntity) {
		return sysDictDao.queryObjectByPar(sysDictEntity);
	}

	@Override
	public List<SysDictEntity> getByType() {
		return sysDictDao.getByType();
	}

	@Override
	public SysDictEntity queryByTypeAndCode(String type, String currency) {
		Map<String,Object> params=new HashMap<>(16);
		params.put("code",currency);
		params.put("type",type);
		return sysDictDao.queryByTypeAndCode(params);
	}

	@Override
	public Integer queryCountByTypeAndName(String type, String name) {
		return sysDictDao.queryCountByTypeAndName(type, name);
	}
}
