package com.ischoolbar.programmer.controller.home;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.Account;
import com.ischoolbar.programmer.service.AccountService;
import com.ischoolbar.programmer.service.OrderService;

/**
 * ǰ̨�û�������
 * @author llq
 *
 */
@RequestMapping("/home/user")
@Controller
public class HomeAccountController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AccountService accountService;
	
	
	
	/**
	 * �û�������ҳ
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpServletRequest request,Model model){
		Object attribute = request.getSession().getAttribute("account");
		if(attribute == null){
			return "redirect:login";
		}
		Account loginedAccount = (Account)attribute;
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("accountId", loginedAccount.getId());
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 999);
		model.addAttribute("orderList", orderService.findList(queryMap));
		return "home/user/index";
	}
	/**
	 * �û���¼ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView login(ModelAndView model){
		model.setViewName("home/user/login");
		return model;
	}
	
	/**
	 * �û�ע��ҳ��
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/registe",method=RequestMethod.GET)
	public ModelAndView registe(ModelAndView model){
		model.setViewName("home/user/registe");
		return model;
	}
	
	/**
	 * ��ȡ�û�������Ϣ
	 * @return
	 */
	@RequestMapping(value="/get_user_address",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> getFoodList(HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		Object attribute = request.getSession().getAttribute("account");
		if(attribute == null){
			ret.put("type", "error");
			ret.put("msg", "���ȵ�¼");
			return ret;
		}
		Account account = (Account) attribute;
		ret.put("type", "success");
		ret.put("name", account.getRealName());
		ret.put("address", account.getAddress());
		ret.put("phone", account.getPhone());
		return ret;
	}
	
	
	/**
	 * �û�ע��
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/registe",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> registe(Account account){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ��");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "�û�������Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "���벻��Ϊ�գ�");
			return ret;
		}
		if(isExist(account.getName(), 0l)){
			ret.put("type", "error");
			ret.put("msg", "���û����Ѿ����ڣ�");
			return ret;
		}
		if(accountService.add(account) <= 0){
			ret.put("type", "error");
			ret.put("msg", "ע��ʧ�ܣ�����ϵ����Ա��");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "ע��ɹ�!");
		return ret;
	}
	
	/**
	 * �û���¼
	 * @param account
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> login(Account account,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ��");
			return ret;
		}
		if(StringUtils.isEmpty(account.getName())){
			ret.put("type", "error");
			ret.put("msg", "�û�������Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "���벻��Ϊ�գ�");
			return ret;
		}
		Account findByName = accountService.findByName(account.getName());
		if(findByName == null){
			ret.put("type", "error");
			ret.put("msg", "�û��������ڣ�");
			return ret;
		}
		if(!findByName.getPassword().equals(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "�������");
			return ret;
		}
		request.getSession().setAttribute("account", findByName);
		ret.put("type", "success");
		ret.put("msg", "��¼�ɹ�!");
		return ret;
	}
	
	
	@RequestMapping(value="/update_info",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updateInfo(Account account,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(account == null){
			ret.put("type", "error");
			ret.put("msg", "����д��ȷ����Ϣ��");
			return ret;
		}
		if(StringUtils.isEmpty(account.getAddress())){
			ret.put("type", "error");
			ret.put("msg", "��ַ����Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPhone())){
			ret.put("type", "error");
			ret.put("msg", "�ֻ��Ų���Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getRealName())){
			ret.put("type", "error");
			ret.put("msg", "��ʵ���Ʋ���Ϊ�գ�");
			return ret;
		}
		if(StringUtils.isEmpty(account.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "���벻��Ϊ�գ�");
			return ret;
		}
		Object attribute = request.getSession().getAttribute("account");
		if(attribute == null){
			ret.put("type", "error");
			ret.put("msg", "����δ��¼��");
			return ret;
		}
		Account loginedAccount = (Account)attribute;
		loginedAccount.setAddress(account.getAddress());
		loginedAccount.setPassword(account.getPassword());
		loginedAccount.setPhone(account.getPhone());
		loginedAccount.setRealName(account.getRealName());
		if(accountService.edit(loginedAccount) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�޸�ʧ�ܣ�����ϵ����Ա��");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "�޸ĳɹ�!");
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
