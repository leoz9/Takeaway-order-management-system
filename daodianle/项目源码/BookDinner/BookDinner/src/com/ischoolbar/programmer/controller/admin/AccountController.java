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

import com.ischoolbar.programmer.entity.Account;
import com.ischoolbar.programmer.entity.FoodCategory;
import com.ischoolbar.programmer.page.admin.Page;
import com.ischoolbar.programmer.service.AccountService;

/**
 * �ͻ���Ϣ��̨���������
 * @author llq
 *
 */
@RequestMapping("/admin/account")
@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	/**
	 * �ͻ���Ϣ�б�ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("account/list");
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
			Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", accountService.findList(queryMap));
		ret.put("total", accountService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * �ͻ���Ϣ���
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Account account){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ŀͻ���Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "�ͻ���Ϣ���Ʋ���Ϊ��!");
			return ret;
		}
		if(isExist(account.getName(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "�������Ѿ����ڣ��뻻һ��!");
			return ret;
		}
		if(accountService.add(account) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�ͻ���Ϣ���ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ���");
		return ret;
	}
	
	/**
	 * �ͻ���Ϣ�༭
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Account account){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ�Ŀͻ���Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "�ͻ���Ϣ���Ʋ���Ϊ��!");
			return ret;
		}
		if(isExist(account.getName(), account.getId())){
			ret.put("type", "error");
			ret.put("msg", "�������Ѿ����ڣ��뻻һ��!");
			return ret;
		}
		if(accountService.edit(account) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�ͻ���Ϣ�޸�ʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "��ӳɹ���");
		return ret;
	}
	
	/**
	 * �ͻ���Ϣɾ��
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "��ѡ��Ҫɾ���ķ�����Ϣ!");
			return ret;
		}
		try {
			if(accountService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "�ͻ���Ϣɾ��ʧ�ܣ�����ϵ����Ա!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "�ÿͻ���Ϣ�´��ڶ�����Ϣ������ɾ����ض�����Ϣ!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "ɾ���ɹ���");
		return ret;
	}
	
	/**
	 * �ж��û����Ƿ����
	 * @param name
	 * @param id
	 * @return
	 */
	private boolean isExist(String name,Long id){
		Account account = accountService.findByName(name);
		if(account == null)return false;
		if(account.getId().longValue() == id.longValue())return false;
		return true;
	}
}
