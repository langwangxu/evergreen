package org.anran.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anran.common.util.PageList;
import org.anran.model.Vip;
import org.anran.model.VipSearchModel;
import org.anran.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import flexjson.JSONSerializer;

@Controller
@RequestMapping(value="/vip")
public class VipController extends BaseController {
	
	@Autowired
	private VipService vipService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)  
	public String showVipList(){
		return "vip/vipShowList";
	}
	
	@RequestMapping(value = "/mg/list", method = RequestMethod.GET)  
	public String showVipMgList(){
		return "vip/vipManageList";
	}
	
	//根据名称或者卡号模糊查询vip会员信息
	/*	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody PageList<Vip> showVipLists(@RequestBody VipSearchModel vsm) {
		PageList<Vip> plist = vipService.queryVipPage(vsm);
		return plist;
	}*/
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
	}
	
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
	
	//指向vip添加页面
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addToVipPage(HttpServletRequest request){
		List<String> cardL = vipService.getMaxCard();
		if(cardL!=null&&cardL.size()>0){
			request.setAttribute("maxcard", cardL.get(0));
		}
		return "vip/addVip";
	}
	
	//添加vip记录
	@RequestMapping(value = "/save", method=RequestMethod.PUT)  
	public String addVip(HttpServletRequest request,Vip vip) {
		String nowDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		vip.setCreateTime(nowDate);
		vip.setUpdateTime(nowDate);
		vipService.addVip(vip);
		String targetUrl = "/vip/list";
        return "redirect:"+targetUrl;
	}
	
	//指向vip修改页面
	@RequestMapping(value="/{id}/edit")  
	public String editToVipPage(@PathVariable Integer id,HttpServletRequest request) {
		Vip vip = vipService.getVipById(id);
		request.setAttribute("vip", vip);
		return "vip/updateVip";
	}
	
	//更改vip信息
	@RequestMapping(value="/{id}/update",method=RequestMethod.PUT)  
	public String updateViewSpace(@PathVariable Integer id,HttpServletRequest request, Vip vip) {
		vip.setId(id);
		vip.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		vipService.updateVip(vip);
		String targetUrl = "/vip/list";
        return "redirect:"+targetUrl;
	}
	
	// 删除vip信息
	@RequestMapping(value="/{id}/delete",method=RequestMethod.GET)  
	public String deleteViewSpace(@PathVariable Integer id) {
		vipService.deleteVip(id);
		String targetUrl = "/vip/list";
        return "redirect:"+targetUrl;
	}
}
