package util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import common.SessionContants;

public class SessionUtil {
	/**
	  * attribute 값을 가져 오기 위한 method
	  * 
	  * @param String  attribute key name 
	  * @return Object attribute obj
	 */
	 public static Object getAttribute(String name) throws Exception {
	  return (Object)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	 }
	 
	 /**
	  * attribute 설정 method
	  * 
	  * @param String  attribute key name 
	  * @param Object  attribute obj
	  * @return void
	 */
	 public static void setAttribute(String name, Object object) throws Exception {
	  RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
	 }
	 
	 /**
	  * 설정한 attribute 삭제 
	  * 
	  * @param String  attribute key name 
	  * @return void
	 */
	 public static void removeAttribute(String name) throws Exception {
	  RequestContextHolder.getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	 }
	 
	 /**
	  * session id 
	  * 
	  * @param void
	  * @return String SessionId 값
	 */
	 public static String getSessionId() throws Exception  {
	  return RequestContextHolder.getRequestAttributes().getSessionId();
	 }
	 
	 /**
	  * 세션이 살아 있는지 여부
	  * @return
	  * @throws Exception
	  */
	 public static boolean isAlive() throws Exception{
		 boolean returnVal = false;
		 if(!BaseUtil.isEmpty(SessionUtil.getAttribute(SessionContants.MEMBER))){
			 returnVal = true;
		 }
		 return returnVal;
	 }
	 
	 /**
	  * 세션 및 권한 체크
	  * @param memEmail1
	  * @param memEmail2
	  * @return
	  * @throws Exception
	  */
	 public static boolean checkAuth(String idx) throws Exception{
		 boolean returnVal = false;
		 return returnVal;
	 }


}
