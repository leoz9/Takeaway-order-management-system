package com.ischoolbar.programmer.controller.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.Food;
import com.ischoolbar.programmer.entity.FoodCategory;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.FoodCategoryService;
import com.ischoolbar.programmer.service.FoodService;

/**
 * ��Ʒ��Ϣ��̨���������
 * @author llq
 *
 */
@RequestMapping("/admin/food")
@Controller
public class FoodController {
	
	@Autowired
	private FoodCategoryService foodCategoryService;
	
	@Autowired
	private FoodService foodService;
	
	/**
	 * ��Ʒ��Ϣ�б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("food/list");
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 9999);
		model.addObject("foodCategoryList", foodCategoryService.findList(queryMap));
		return model;
	}
	
	/**
	 * ģ����ҳ��ѯ��Ʒ��Ϣ
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="categoryId",required=false) Long categoryId,
			Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		if(categoryId != null && categoryId.longValue() != -1){
			queryMap.put("categoryId", categoryId);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", foodService.findList(queryMap));
		ret.put("total", foodService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * ��Ʒ��Ϣ���
	 * @param food
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Food food){
		Map<String, String> ret = new HashMap<String, String>();
		if(food == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(food.getName())){
			ret.put("type", "error");
			ret.put("msg", "��Ʒ��Ϣ���Ʋ���Ϊ��!");
			return ret;
		}
		if(food.getCategoryId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����������!");
			return ret;
		}
		if(foodService.add(food) <= 0){
			ret.put("type", "error");
			ret.put("msg", "��Ʒ��Ϣ���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ���");
		return ret;
	}
	
	/**
	 * ��Ʒ��Ϣ�༭
	 * @param food
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Food food){
		Map<String, String> ret = new HashMap<String, String>();
		if(food == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(food.getName())){
			ret.put("type", "error");
			ret.put("msg", "��Ʒ��Ϣ���Ʋ���Ϊ��!");
			return ret;
		}
		if(food.getCategoryId() == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ����������!");
			return ret;
		}
		if(foodService.edit(food) <= 0){
			ret.put("type", "error");
			ret.put("msg", "��Ʒ��Ϣ�޸�ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ���");
		return ret;
	}
	
	/**
	 * ��Ʒ��Ϣɾ��
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ��Ҫɾ������Ϣ!");
			return ret;
		}
		try {
			if(foodService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "��Ʒ��Ϣɾ��ʧ�ܣ�����ϵ����Ա!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "�ò�Ʒ��Ϣ�´��ڶ�����Ϣ������ɾ����ض�����Ϣ!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "ɾ���ɹ���");
		return ret;
	}
}
