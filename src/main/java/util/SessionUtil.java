package util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import common.SessionContants;

public class SessionUtil {
 
	 public static Object getAttribute(String name) throws Exception {
	  return (Object)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	 }
	 
 
	 public static void setAttribute(String name, Object object) throws Exception {
	  RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
	 }
 
	 public static void removeAttribute(String name) throws Exception {
	  RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	 }
 
	 public static String getSessionId() throws Exception  {
	  return RequestContextHolder.getRequestAttributes().getSessionId();
	 }
 
	 public static boolean isAlive() throws Exception{
		 boolean returnVal = false;
		 if(!BaseUtil.isEmpty(SessionUtil.getAttribute(SessionContants.MEMBER))){
			 returnVal = true;
		 }
		 return returnVal;
	 }
	 
	 public static boolean isAlive_admin() throws Exception{
		 boolean returnVal = false;
		 if(!BaseUtil.isEmpty(SessionUtil.getAttribute(SessionContants.ADMIN))){
			 returnVal = true;
		 }
		 return returnVal;
	 }
 
	 public static boolean checkAuth(String idx) throws Exception{
		 boolean returnVal = false;
		 return returnVal;
	 }


}
