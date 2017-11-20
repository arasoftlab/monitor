package util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.springframework.web.multipart.MultipartFile;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;

import common.vo.MenuVO;

public class BaseUtil {
	
	private static String SEOUL = "monitor";
	private static final int BUFFER_SIZE = 4096;
	
	/**
	 * Disposition �����ϱ�.
	 * 
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void setDisposition(String filename, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
					"\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			// throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix
				+ encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}

	/**
	 * ������ ���� ���.
	 * 
	 * @param request
	 * @return ""
	 */
	public String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}
	
	public static String uuid(){
		return UUID.randomUUID().toString();
	}
	
	public static final boolean isEmpty(Object obj) {
		if (obj == null) {
			return true;
		} else if ("".equals(obj)) {
			return true;
		} else if (obj instanceof Object[]) {
			for (Object v : ((Object[])obj)) {
				if (!isEmpty(v)) return false;
			}
			return true;
		} else return false;
	}
	
	/**
	 * ���� �⵵
	 * @return
	 */
	public static final int currentYear() {
	    Calendar cal = Calendar.getInstance();
	    return cal.get(Calendar.YEAR);
	}
	public static final int currentMonth() {
	    Calendar cal = Calendar.getInstance();
	    return cal.get(Calendar.MONTH)+1;
	}
	
	/**
	 * 
	 * Desc : ���ڸ����� ������ ���� 0�� �ٿ��ش�.
	 * @Mehtod Name : addZeroString
	 * @param value
	 * @return
	 */
	public static final String addZeroString(int value){
		String result = String.format("%02d", value);				
		return result;
	}
	
	/**
	 * ��ȣ tag �� ��ȯ
	 * @param str
	 * @return
	 */
	public static String htmlTags(String str) {
		if(isEmpty(str)) return "";
		else {
			str = str.replaceAll("<javascript", "&lt;javascript");
			str = str.replaceAll("<script", "&lt;script");
			str = str.replaceAll("<iframe", "&lt;iframe");
			str = str.replaceAll("<vbscript", "&lt;vbscript");
			str = str.replaceAll("<applet", "&lt;applet");
			str = str.replaceAll("<embed", "&lt;embed");
			str = str.replaceAll("<object", "&lt;object");
			str = str.replaceAll("<frame", "&lt;frame");
			
			str = str.replaceAll("</javascript", "&lt;/javascript");
			str = str.replaceAll("</script", "&lt;/script");
			str = str.replaceAll("</iframe", "&lt;/iframe");
			str = str.replaceAll("</vbscript", "&lt;/vbscript");
			str = str.replaceAll("</applet", "&lt;/applet");
			str = str.replaceAll("</embed", "&lt;/embed");
			str = str.replaceAll("</object", "&lt;/object");
			str = str.replaceAll("</frame", "&lt;/frame");
		}
		return str;
	}
	
	/**
	 * ����Ǿ� �ִ� Tag�� <,> �� �ٲپ��ش�.
	 * @param str
	 * @return
	 */
	public static String restorestripTags(String str) {
		if(isEmpty(str)) return "";
		else {
			str = str.replaceAll("&lt;", "<");
			str = str.replaceAll("&gt;", ">");	
			str = str.replaceAll("&quot;", "'");
			str = str.replaceAll("&amp;", "&");
			str = str.replaceAll("&#39;", "\'");
			str = str.replaceAll("\r\n", "<br>");
		}
		return str;
	}
	
	/**
	 * �ؽ�Ʈ ���ڿ� ���̸�ŭ �����ֱ�
	 * @param str
	 * @param endIndex
	 * @return
	 */
	public static String cutStrByByte(String str, Integer endIndex){
		int en = 0;
		int ko = 0;
		int etc = 0;
		char[] string = str.toCharArray();

		for(int j=0; j<string.length; j++){
			if(string[j] >= 'A' && string[j] <= 'z') en++;
			else if (string[j]>='\uAC00' && string[j]<='\uD7A3') ko += 2;
			else etc+= 2;
		}

		if(en+ko+etc > endIndex){		
			StringBuffer sbStr = new StringBuffer(endIndex);
			int iTotal=0;
			for(char c: str.toCharArray()){
				iTotal+=String.valueOf(c).getBytes().length;
				if(iTotal>endIndex){
					break;
				}
				sbStr.append(c);
			}
			return sbStr.toString()+"...";
		}else{
			return str;
		}
	}
	
	public static MenuVO getMenuVO(String url){
		MenuVO menu = new MenuVO();
		String[] category = null;
		
		category = url.split("/");
		
		int rootIndex = 0;
		
		for(int i=0; i<category.length; i++){
			if(category[i].equals(SEOUL)){
				rootIndex = i;
			}
			
			if(category[i].endsWith(".do")){
				category[i] = category[i].substring(0, category[i].lastIndexOf("."));
			}
		}
		
		if(rootIndex > 0){
			if(category.length > rootIndex+1) menu.setDepth1(category[rootIndex+1]);
			if(category.length > rootIndex+2) menu.setDepth2(category[rootIndex+2]);
			if(category.length > rootIndex+3) menu.setDepth3(category[rootIndex+3]);
			if(category.length > rootIndex+4) menu.setDepth4(category[rootIndex+4]);
		}else{
			if(category.length > rootIndex+1) menu.setDepth1(category[rootIndex+1]);
			if(category.length > rootIndex+2) menu.setDepth2(category[rootIndex+2]);
			if(category.length > rootIndex+3) menu.setDepth3(category[rootIndex+3]);
			if(category.length > rootIndex+4) menu.setDepth4(category[rootIndex+4]);
		}
		
		return menu;
	}

	public static String findMimeType(String orgFileName) {
		return new MimetypesFileTypeMap().getContentType(orgFileName);
	}
	
	public static String findMimeTypeByTika(MultipartFile multipartFile) {
		Tika tika = new Tika();
		String mimeType = "";
		try {
			mimeType = tika.detect(multipartFile.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mimeType;
	}

	public static long parseRfc2616Date(String header) {
		if (header == null || header.length() != 29) {
			return -1;
		}
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, parseInt2(header, 5));
		cal.set(Calendar.MONTH, toMonth(header.substring(8, 11)));
		cal.set(Calendar.YEAR, parseInt4(header, 12));
		cal.set(Calendar.HOUR_OF_DAY, parseInt2(header, 17));
		cal.set(Calendar.MINUTE, parseInt2(header, 20));
		cal.set(Calendar.SECOND, parseInt2(header, 23));
		cal.set(Calendar.ZONE_OFFSET, 0);
		return cal.getTimeInMillis();
	}
	
	private static final int parseInt2(String s, int idx) {
		char ch0 = s.charAt(idx);
		char ch1 = s.charAt(idx + 1);
		return (ch0 - '0') * 10 + (ch1 - '0');
	}
	private static final int parseInt4(String s, int idx) {
		char ch0 = s.charAt(idx);
		char ch1 = s.charAt(idx + 1);
		char ch2 = s.charAt(idx + 2);
		char ch3 = s.charAt(idx + 3);

		return (ch0 - '0') * 1000 + (ch1 - '0') * 100 + (ch2 - '0') * 10 + (ch3 - '0');
	}
	
	private static final int toMonth(String mon) {
		switch (mon.charAt(0)) {
		case 'J':
			char ch2 = mon.charAt(2);
			return ch2 == 'n' ? Calendar.JANUARY : (ch2 == 'n' ? Calendar.JUNE : Calendar.JULY);
		case 'F':
			return Calendar.FEBRUARY;
		case 'M':
			return mon.charAt(2) == 'r' ? Calendar.MARCH : Calendar.MAY;
		case 'A':
			return mon.charAt(1) == 'p' ? Calendar.APRIL : Calendar.AUGUST;
		case 'S':
			return Calendar.SEPTEMBER;
		case 'O':
			return Calendar.OCTOBER;
		case 'N':
			return Calendar.NOVEMBER;
		case 'D':
			return Calendar.DECEMBER;
		}
		return 0;
	}

	public static void transfer(FileInputStream fileInputStream,
			ServletOutputStream outputStream, boolean b) {
		try {
			byte[] buf = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = fileInputStream.read(buf)) != -1) {
				outputStream.write(buf, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileInputStream.close();
				if (b)
					outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
