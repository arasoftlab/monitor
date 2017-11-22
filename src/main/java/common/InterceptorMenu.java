package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import util.BaseUtil;

public class InterceptorMenu extends HandlerInterceptorAdapter{
	
	public void postHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler, 
			ModelAndView modelAndView)throws Exception {
		
		this.setRequestURL(request);
	}
	
	private void setRequestURL(HttpServletRequest request){
		String url = null;
		if(!BaseUtil.isEmpty(request.getRequestURI())){
			url =  request.getRequestURI().toString();
			request.setAttribute("menu", BaseUtil.getMenuVO(url));
		}
	}
	
	
}
