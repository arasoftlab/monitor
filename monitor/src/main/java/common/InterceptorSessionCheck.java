package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import util.SessionUtil;

public class InterceptorSessionCheck extends HandlerInterceptorAdapter{
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		
		if(!SessionUtil.isAlive()){
			response.sendRedirect(request.getContextPath()+"/member/loginView.do");
			return false;
		}
		
		return true;
	}
}
