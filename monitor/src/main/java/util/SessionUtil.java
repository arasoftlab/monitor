package util;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import common.SessionContants;

public class SessionUtil {
	/**
	  * attribute  method
	  * 
	  * @param String  attribute key name 
	  * @return Object attribute obj
	 */
	 public static Object getAttribute(String name) throws Exception {
	  return (Object)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	 }
	 
	 /**
	  * attribute  method
	  * 
	  * @param String  attribute key name 
	  * @param Object  attribute obj
	  * @return void
	 */
	 public static void setAttribute(String name, Object object) throws Exception {
	  RequestContextHolder.getRequestAttributes().setAttribute(name, object, RequestAttributes.SCOPE_SESSION);
	 }
	 
	 /**
	  *  
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
	  * @return String SessionId ��
	 */
	 public static String getSessionId() throws Exception  {
	  return RequestContextHolder.getRequestAttributes().getSessionId();
	 }
	 
	 /**
	  *  
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
	  *  
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
