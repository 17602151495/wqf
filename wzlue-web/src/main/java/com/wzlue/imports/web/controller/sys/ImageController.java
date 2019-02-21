package com.wzlue.imports.web.controller.sys;

import com.wzlue.imports.common.base.Query;
import com.wzlue.imports.common.base.R;
import com.wzlue.imports.common.utils.MapUtils;
import com.wzlue.imports.common.utils.PageUtils;
import com.wzlue.imports.sys.entity.ImageEntity;
import com.wzlue.imports.sys.service.ImageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;


/**
 * 图片表
 * 
 * @author py
 * @email sunlightcs@gmail.com
 * @date 2018-05-28 13:33:27
 */
@RestController
@RequestMapping("/sys/image")
public class ImageController extends AbstractController{
	@Autowired
	private ImageService imageService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ImageEntity> imageList = imageService.queryList(query);
		int total = imageService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(imageList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

    /**
     * 列表
     */
    @RequestMapping("/test")
    public String test(@RequestParam Map<String, Object> params){
        return "{}";
    }
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:image:info")
	public R info(@PathVariable("id") Integer id){
		ImageEntity image = imageService.queryObject(id);
		
		return R.ok().put("image", image);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:image:save")
	public R save(@RequestBody ImageEntity image){
		imageService.save(image);
		return R.ok();
	}

	/**
	 * 保存集合
	 */
	@RequestMapping("/saveList")
	public R saveList(@RequestBody Map<String,Object> map){
		List<Map<String,Object>> listMap= (List<Map<String, Object>>) map.get("images");
        if(listMap.size()==0){
            return R.ok();
        }
		List<ImageEntity> images=new ArrayList<>();
		//遍历获取文件上传路径，并添加到images对象中作为入参
		for (Map<String, Object> item : listMap) {
			try {
				ImageEntity ie= (ImageEntity) MapUtils.convertMap(ImageEntity.class,item);
				images.add(ie);
			} catch (Exception e) {
			}
		}
		if(images.size()>=0){
			imageService.saveList(images);
		}
		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:image:update")
	public R update(@RequestBody ImageEntity image){
		imageService.update(image);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:image:delete")
	public R delete(@RequestBody Integer[] ids){
		imageService.deleteBatch(ids);
		
		return R.ok();
	}
	/**
	 * 删除根据code和图片类型picType去删除图片
	 */
	@RequestMapping("/deleteByCode")
	@RequiresPermissions("sys:image:delete")
	public R deleteByCode(@RequestBody Map<String,Object> params){
		imageService.deleteByCode(params);
		return R.ok();
	}
    /**
     * 删除根据code和图片类型picType去删除图片
     */
    @RequestMapping("/deleteByCodeBatch")
    @RequiresPermissions("sys:image:delete")
    public R deleteByCodeBatch(@RequestBody Map<String,Object> params){
        List<Map<String,Object>> list= (List<Map<String, Object>>) params.get("images");
        imageService.deleteByCodeBatch(list);
        return R.ok();
    }
	
}
