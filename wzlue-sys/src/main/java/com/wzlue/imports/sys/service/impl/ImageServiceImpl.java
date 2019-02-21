package com.wzlue.imports.sys.service.impl;

import com.wzlue.imports.sys.dao.ImageDao;
import com.wzlue.imports.sys.entity.ImageEntity;
import com.wzlue.imports.sys.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("imageService")
public class ImageServiceImpl implements ImageService {
	@Autowired
	private ImageDao imageDao;
	
	@Override
	public ImageEntity queryObject(Integer id){
		return imageDao.queryObject(id);
	}
	
	@Override
	public List<ImageEntity> queryList(Map<String, Object> map){
		return imageDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return imageDao.queryTotal(map);
	}
	
	@Override
	public void save(ImageEntity image){
		imageDao.save(image);
	}
	
	@Override
	public void update(ImageEntity image){
		imageDao.update(image);
	}
	
	@Override
	public void delete(Integer id){
		imageDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		imageDao.deleteBatch(ids);
	}

	@Override
	public void saveList(List<ImageEntity> list) {
		imageDao.saveList(list);
	}

    @Override
    public void deleteByCode(Map<String, Object> params) {
        imageDao.deleteByCode(params);
    }

    @Override
    public void deleteByCodeBatch(List<Map<String, Object>> list) {
        imageDao.deleteByCodeBatch(list);
    }

}
