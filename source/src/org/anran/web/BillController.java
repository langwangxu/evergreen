package org.anran.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anran.common.util.PageList;
import org.anran.model.Account;
import org.anran.model.AccountSearchModel;
import org.anran.model.Vip;
import org.anran.model.VipSearchModel;
import org.anran.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import flexjson.JSONSerializer;

@Controller
@RequestMapping(value="/bill")
public class BillController extends BaseController {
	
	@Autowired
	private VipService vipService;
	
	/**
	 * @see 在vip列表页面，点击某个vip的姓名进入到这里
	 * @param id
	 * @param request
	 * @return 通过传入的vip的id查询vip及关联的账户信息
	 */
	@RequestMapping(value = "/{id}/show", method = RequestMethod.GET)  
	public String toOneBillList(@PathVariable Integer id,HttpServletRequest request){
		request.setAttribute("vipid", id);
		return "bill/billShowList";
	}
	
	/**
	 * @see 在账单列表页面，点击“管理账户记录”进入到这里
	 * @param id
	 * @param request
	 * @return 通过传入的vip的id查询vip及关联的账户信息
	 */
	@RequestMapping(value = "/{id}/mg/show", method = RequestMethod.GET)  
	public String toManageBillList(@PathVariable Integer id,HttpServletRequest request){
		request.setAttribute("vipid", id);
		return "bill/billManageList";
	}
	
	//根据vip的id查询vip会员信息和账单信息 --非ResponseBody方式
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public void showOneBillList(@RequestBody AccountSearchModel asm,HttpServletResponse response) {
		Vip oneVip = vipService.getVipById(asm.getVipId());
		PageList<Account> plist = vipService.queryAccountPage(asm);
		Map<String, Object> accMap= new HashMap<String,Object>();
		accMap.put("vip", oneVip);
		accMap.put("acc", plist);
		response.setCharacterEncoding("utf-8");
		JSONSerializer serializer = new JSONSerializer();
		String res_data = serializer.exclude("acc.items.vip").exclude("*.class").serialize(accMap);
		try {
			response.getWriter().write(res_data);
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	//根据名称或者卡号模糊查询vip会员息
	/*	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody PageList<Vip> showVipLists(@RequestBody VipSearchModel vsm) {
		PageList<Vip> plist = vipService.queryVipPage(vsm);
		return plist;
	}
	//根据名称或者卡号模糊查询vip会员信息 --非ResponseBody方式
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public void showVipLists(@RequestBody VipSearchModel vsm,HttpServletResponse response) {
		PageList<Vip> plist = vipService.queryVipPage(vsm);
		response.setCharacterEncoding("utf-8");
		JSONSerializer serializer = new JSONSerializer();
		String res_data = serializer.include("items").exclude("*.class").serialize(plist);
		try {
			response.getWriter().write(res_data);
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	//根据名称或者卡号模糊查询vip会员信息
/*	@RequestMapping(value = "/mg/search", method = RequestMethod.POST)
	public void showVipMgLists(@RequestBody VipSearchModel vsm) {
		return vipService.queryVipPage(vsm);
	}*/
	
/*	
 * ----------------------------------------------------------------------------------------------------------------------------------------------------
 * @RequestMapping(value = "/list", method = RequestMethod.GET)  
	public String showVipList(HttpServletRequest request,Model model,@ModelAttribute("vipsearch")VipSearchModel vipSearchModel){
		model.addAttribute("vipSearchModel", vipSearchModel);
        int pageNo = ServletRequestUtils.getIntParameter(request, PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);//请求的是第几页，默认第1页
        int pageSize = ServletRequestUtils.getIntParameter(request, PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);//每页请求几行，默认10行      
        model.addAttribute("contentModel", vipService.listVipPage(vipSearchModel.getName(), vipSearchModel.getCard(), pageNo, pageSize));
		return "vip/vipShowList";
	}*/
	
/*	@RequestMapping(value = "/manage/list", method = RequestMethod.GET)  
	public String showVipManageList(HttpServletRequest request,Model model,@ModelAttribute("vipmsearch")VipSearchModel vipSearchModel){
		model.addAttribute("vipSearchModel", vipSearchModel);
        int pageNo = ServletRequestUtils.getIntParameter(request, PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
        int pageSize = ServletRequestUtils.getIntParameter(request, PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);      
        model.addAttribute("contentModel", vipService.listVipPage(vipSearchModel.getName(), vipSearchModel.getCard(), pageNo, pageSize));
        return "vip/vipManageList";
	}*/
	
	/*
	public String manageVipList(HttpServletRequest request){
		List<Vip> vipLists = vipService.getAllVips();
		request.setAttribute("vipLists", vipLists);
		return "vip/vipManageList";
	}
	
	// 根据名称或者卡号模糊查询vip会员信息
	@RequestMapping(value = "/list/search",method=RequestMethod.PUT)
	public String queryVipList(HttpServletRequest request) {
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		List<Vip> vipLists = vipService.queryViewSpaceByNC(name,card);
		request.setAttribute("vipLists", vipLists);
		return "vip/vipShowList";
	}
	
	// 根据名称或者卡号模糊查询vip会员信息
	@RequestMapping(value = "/manager/search",method=RequestMethod.PUT)
	public String queryVipManager(HttpServletRequest request) {
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		List<Vip> vipLists = vipService.queryViewSpaceByNC(name,card);
		request.setAttribute("vipLists", vipLists);
		return "vip/vipManageList";
	}*/
	
	//指向bill添加页面
	@RequestMapping(value="/{id}/add", method = RequestMethod.GET)
	public String addToBillPage(@PathVariable Integer id,HttpServletRequest request){
		request.setAttribute("vipid", id);
		return "bill/addBill";
	}
	
	//添加vip记录
	@RequestMapping(value = "/save", method=RequestMethod.POST)  
	public String addVip(@RequestParam("vipId") int vipId,
			@RequestParam("consumerNum") int consumerNum,
			@RequestParam("dinnerType") int dinnerType,
			@RequestParam("consumeTime") String consumeTime,
			@RequestParam("memo") String memo) {
		Account acc = new Account();
		acc.getVip().setId(vipId);
		acc.setConsumerNum(consumerNum);
		acc.setDinnerType(dinnerType);
		acc.setConsumeTime(consumeTime);
		acc.setMemo(memo);
		String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		acc.setCreateTime(nowDate);
		acc.setUpdateTime(nowDate);
		vipService.addBill(acc);
		String targetUrl = "/bill/"+vipId+"/show";
        return "redirect:"+targetUrl;
	}
	
	//指向账单修改页面
	@RequestMapping(value="/{id}/edit",method=RequestMethod.GET)  
	public String editToBillPage(@PathVariable Integer id,
			HttpServletRequest request) {
		Account account = vipService.getBillById(id);
		request.setAttribute("account", account);
		return "bill/updateBill";
	}
	
	//更改账单信息
	@RequestMapping(value="/{id}/update",method=RequestMethod.POST)  
	public String updateViewSpace(@PathVariable Integer id,
			@RequestParam("vipId") int vid,
			HttpServletRequest request, 
			Account acc) {
		acc.setId(id);
		acc.getVip().setId(vid);
		acc.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		vipService.updateBill(acc);
		String targetUrl = "/bill/"+vid+"/show";
        return "redirect:"+targetUrl;
	}
	
	//删除账单信息
	@RequestMapping(value="/{id}/delete",method=RequestMethod.GET)  
	public String deleteViewSpace(@PathVariable Integer id) {
		int vid = vipService.deleteBill(id);
		System.out.println("the momo vid is : "+vid);
		String targetUrl = "/bill/"+vid+"/show";
        return "redirect:"+targetUrl;
	}
}
