package org.anran.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.Assert;

/**
 * ����Controller�Ļ���
 * @author momo
 * @see
 *
 */
public class BaseController {
	protected static final String ERROR_MSG_KEY = "errorMsg";
	
	public final String getAppbaseUrl(HttpServletRequest request,String url){
		Assert.hasLength(url, "url����Ϊ��");
		Assert.isTrue(url.startsWith("/"), "������/��ͷ");
		return request.getContextPath() + url;
	}
}
