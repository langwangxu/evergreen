package org.anran.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/home")
public class HomeController extends BaseController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)  
	public String testIndex(HttpServletRequest request){
		request.setAttribute("yep", "ÐíÄ«°²È»");
		return "home/index";
	}
	
}
