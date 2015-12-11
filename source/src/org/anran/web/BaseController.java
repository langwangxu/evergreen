package org.anran.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.Assert;

/**
 * 所有Controller的基类
 * @author momo
 * @see
 *
 */
public class BaseController {
	protected static final String ERROR_MSG_KEY = "errorMsg";
	
	public final String getAppbaseUrl(HttpServletRequest request,String url){
		Assert.hasLength(url, "url不能为空");
		Assert.isTrue(url.startsWith("/"), "必须以/打头");
		return request.getContextPath() + url;
	}
}
