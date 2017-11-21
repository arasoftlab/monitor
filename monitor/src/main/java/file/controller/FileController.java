package file.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

//import util.BaseUtil;
import file.service.FileService;
import file.vo.FileVO;
import util.BaseUtil;

//import file.vo.FileVO;

@Controller
@RequestMapping("/file/")
public class FileController {
	
	private static final String SYNC = "SYNC";
	
	@Autowired
	private FileService fileService;
	
	@RequestMapping(method = RequestMethod.POST, value = "fileSize.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE )
	public @ResponseBody ResponseEntity<JsonObject> fileSize(HttpServletRequest req) throws IOException {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		JsonObject obj = new JsonObject();
		String fileSize;
		try {
			fileSize = fileService.fileSize(req);
		} catch (Exception e) {
			// TODO 파일사이즈체크중 발생하는 오류
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "application/json;charset=UTF-8");
			obj.addProperty("result", "시스템 오류가 발생하였습니다. 오류코드는 FC500-56 입니다.\n관리자에게 이코드를 알려주십시요.");
			obj.addProperty("status", "508");
			
			return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
			
			
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		resultMap.put("result", "success");
		resultMap.put("fileSize", fileSize);
		obj.addProperty("result", "success");
		obj.addProperty("fileSize", fileSize);
		
		return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
		
	}
	
	
	@RequestMapping(method = RequestMethod.POST, value = "fileUpdate.do")
	public @ResponseBody Map<String, Object> fileUpdate(
			@RequestParam(value="data_id",required=false) String data_id,
			HttpServletRequest req,
			HttpSession session) throws IOException {
		//JSONObject obj = new JSONObject();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("fileVO", fileService.updateFile(req, session, data_id));
		resultMap.put("result", "success");
		//obj.put("fileVO", fileService.updateFile(req, session, data_id));
		//obj.put("result", "success");
		//JSONObject obj = new JSONObject(resultMap);
		return resultMap;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "fileUpload.do")
	public @ResponseBody ResponseEntity<JsonObject> fileUpload(
			@RequestParam(value="data_id",required=false) String data_id,
			HttpServletRequest req,
			HttpSession session) throws IOException {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		JsonObject obj = new JsonObject();
		Gson gson = new Gson();
		
		
		MultipartHttpServletRequest mfr =  (MultipartHttpServletRequest) req;
		Iterator <String> iterator = mfr.getFileNames();

		MultipartFile mf = mfr.getFile(iterator.next());
		
		System.out.println(mf.getOriginalFilename());
		System.out.println(mf.getContentType());
		System.out.println(mf.getBytes());
		
		FileVO fvo = new FileVO();
		System.out.println(data_id);
		System.out.println(req.getParameterValues("image"));
		System.out.println(req.getDispatcherType());
		try {
			fvo = fileService.saveFile(req, session, data_id);
		} catch (Exception e) {
			// TODO 파일저장중 발생하는 오류

			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
			obj.addProperty("result", "시스템 오류가 발생하였습니다. 오류코드는 FC500-112 입니다.\n관리자에게 이코드를 알려주십시요.");
			obj.addProperty("status", "508");
			//JsonObject obj = new JsonObject(resultMap);
			return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		resultMap.put("result", "success");
		resultMap.put("fileVO", fvo);
		obj.addProperty("result", "success");
		obj.add("fileVO", gson.toJsonTree(fvo));
		//JSONObject obj = new JSONObject(resultMap);
		return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
		
		//resultMap.put("fileVO", fvo);
		//resultMap.put("result", "success");
		
		//System.out.println(fvo.toString());
		
		//return resultMap;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "deleteFile.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody ResponseEntity<JsonObject> deleteFile(
			@RequestParam(value="fileListId",required=true) String fileListId) throws IOException {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		JsonObject obj = new JsonObject();
		//Gson gson = new Gson();
		int effectRows = 0;
		
		try {
			for(String file_id : fileListId.split(",")){
				effectRows += fileService.deleteFile(file_id);
			}
		} catch (Exception e) {
			// TODO 파일삭제중 발생하는 오류
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
			obj.addProperty("result", "시스템 오류가 발생하였습니다. 오류코드는 FC500-163 입니다.\n관리자에게 이코드를 알려주십시요.");
			obj.addProperty("status", "508");
			//JSONObject obj = new JSONObject(resultMap);
			return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
		}
		
		String rstV = null;
		if(effectRows > 0){
			rstV = "success";
		}else{
			rstV = "false";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=UTF-8");
		resultMap.put("status",  "200");
		resultMap.put("result", rstV);
		obj.addProperty("status",  "200");
		obj.addProperty("result", rstV);
		//JSONObject obj = new JSONObject(resultMap);
		return new ResponseEntity<JsonObject>(obj, responseHeaders, HttpStatus.CREATED);
		//return resultMap;
	}
	
	/**
	 * 	
	 * Desc : file 
	 * @Mehtod Name : fileDown
	 * @param fileId
	 * @param req
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(method = RequestMethod.POST, value="fileDown.do")
	public void fileDown(
			@RequestParam(value="file_id",required=true) String file_id,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		//System.out.println("file_id : " + file_id);
		synchronized(SYNC){
			fileService.downloadFile(file_id, response, request);
		}
	}

	@RequestMapping(method = RequestMethod.POST, value="fileDownFromUFN.do")
	public void fileDownFromUFN(
			@RequestParam(value="file_id",required=true) String file_id,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println("file_id : " + file_id);
		synchronized(SYNC){
			fileService.downloadFileFromUFN(file_id, response, request);
		}
	}
	
	/**
	 * 
	 *  Desc : smartEditorHtml5 
	 *  @Mehtod Name : smartEditorFileUploadHtml5
	 *  @param req
	 *  @param response
	 *  @param model
	 *  @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST, value = "smartEditorFileUploadHtml5.do")
	public void smartEditorFileUploadHtml5(
			HttpServletRequest req, 
			HttpServletResponse response,
			HttpSession session,
			Model model) throws Exception {		
			
		String returnUrl = null;
		
		Enumeration<?> eHeader = req.getHeaderNames();
	    while (eHeader.hasMoreElements()) {
	        String hName = (String)eHeader.nextElement();
	        String hValue = req.getHeader(hName);
	        System.out.println(hName + " : " + hValue);
	    }
	    
	    String fileName = req.getHeader("file-name");
		fileName = java.net.URLDecoder.decode(fileName,"UTF-8");
		int fileSize = Integer.parseInt(req.getHeader("file-size"));
		String fileType = req.getHeader("file-Type");
		
		FileVO uploadFile = new FileVO();
		
		uploadFile.setOrgFileName(fileName);
		uploadFile.setFileSize(fileSize);
		uploadFile.setFileType(fileType);
		
		uploadFile = fileService.jindoFileUpload(req, uploadFile);
				
		if(!BaseUtil.isEmpty(uploadFile)){
			returnUrl = "&bNewLine=true&sFileName="+uploadFile.getOrgFileName()+"&sFileURL=/monitor/"+uploadFile.getSavePath()+"/"+uploadFile.getUnqFileName();
		}else{
			returnUrl = "";
		}
		
		byte[] rtn = returnUrl.getBytes();
		response.setContentType("text/html; charset=UTF-8;");
		OutputStream outStream = response.getOutputStream();
		outStream.write(rtn);
		outStream.close();		
	}
}
