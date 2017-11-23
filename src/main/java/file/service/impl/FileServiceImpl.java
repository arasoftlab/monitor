package file.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import util.BaseUtil;
import file.dao.FileDAO;
import file.service.FileService;
import file.vo.FileMappingVO;
import file.vo.FileVO;

public class FileServiceImpl implements FileService{
	
	private Logger log;
	
	private FileDAO fileDAO;
	
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	private static final String LAST_MODIFIED = "Last-Modified";
	private static final String IF_NONE_MATCH = "If-None-Match";
	private static final String IF_MODIFIED_SINCE = "If-Modified-Since";
	
	public String fileSize(HttpServletRequest req) {
		long size = 0;
		String fileSize = null;

		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest) req;   
		Iterator<String> fileNames = multipartRequest.getFileNames();	 	
		
		while(fileNames.hasNext()){
			String variableName = fileNames.next();	 					
			List<MultipartFile> multipartFiles = multipartRequest.getFiles(variableName);

			for (MultipartFile multipartFile : multipartFiles){

				if (!multipartFile.isEmpty()){	
					size = multipartFile.getSize();
					fileSize = Integer.toString((int)size);
				}
			}
		}
		
		return fileSize;
	}
	
	public FileVO saveFile(HttpServletRequest req, HttpSession session, String data_id) {
		FileVO fileVO = this.fileUpload(req, session);
		
		
		if(!BaseUtil.isEmpty(data_id)){
			FileMappingVO fileMappingVO = new FileMappingVO();
			fileMappingVO.setData_id(data_id);
			fileMappingVO.setFile_id(fileVO.getFile_id());
			fileDAO.insertFileMapping(fileMappingVO);
			
		}
		
		return fileVO;
	}

	public FileVO updateFile(HttpServletRequest req, HttpSession session, String data_id) {
		FileVO fileVO = this.fileUpload(req, session);
		
		
		if(!BaseUtil.isEmpty(data_id)){
			FileMappingVO fileMappingVO = new FileMappingVO();
			fileMappingVO.setData_id(data_id);
			fileMappingVO.setFile_id(fileVO.getFile_id());
			fileDAO.updateFileMapping(fileMappingVO);
			
		}
		
		return fileVO;
	}
	
	public int deleteFile(String file_idx) {
		int effectRows = 0;
		effectRows += fileDAO.deleteFile(new FileVO(file_idx));
		effectRows += fileDAO.deleteFileMapping(new FileMappingVO(file_idx));
		return effectRows;
	}

	private FileVO fileUpload(HttpServletRequest req, HttpSession session) {
		FileVO fileVO = new FileVO();		
		String savePath = "/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth());
		String uploadPath = req.getServletContext().getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
		String orgFileName = "";
		String unqFileName = "";
		int fileSize = 0;
		
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest) req;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		MultipartFile multipartFile = null;
		

		
		while(fileNames.hasNext()){
			File dir = new File(uploadPath);
			if(!dir.exists()) dir.mkdirs();
		
			multipartFile = multipartRequest.getFile(fileNames.next());
			
	        log.debug("------------- file start -------------");
	        log.debug("name : " + multipartFile.getName());
	        log.debug("filename : " + multipartFile.getOriginalFilename());
	        log.debug("size : " + multipartFile.getSize());
	        log.debug("-------------- file end --------------\n");

	        if(!multipartFile.isEmpty()){
				
			System.out.println(multipartFile.isEmpty());
				orgFileName = multipartFile.getOriginalFilename();
				unqFileName = System.currentTimeMillis()+"."+orgFileName.split("\\.")[orgFileName.split("\\.").length-1];
				fileSize = (int) multipartFile.getSize();
				String fileType = BaseUtil.findMimeTypeByTika(multipartFile);
				
				try {
					multipartFile.transferTo(new File(uploadPath+"/"+unqFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				fileVO.setFile_id(BaseUtil.uuid());
				fileVO.setUnqFileName(unqFileName);
				fileVO.setOrgFileName(orgFileName);
				fileVO.setSavePath(savePath);
				fileVO.setFileSize(fileSize);
				fileVO.setFileType(fileType);
				
				fileDAO.insertFile(fileVO);
				
			}else {
				System.out.println("정보가 없습니다.");
			}
		}
		return fileVO;
	}

	public FileVO jindoFileUpload(HttpServletRequest req, FileVO uploadFile) throws IOException {
		String webSavePath = "/upload/" + BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth());
//		String savePath = req.getRealPath(webSavePath);
		String savePath = req.getSession().getServletContext().getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
		
		
		String newFileName = new SimpleDateFormat("yyyyMMddHHmmss0SSS").format(new Date());  
		String originalName = uploadFile.getOrgFileName();
		
		int i = originalName.lastIndexOf(".");  			

		
		originalName = originalName.replace(originalName.substring(i, originalName.length()), originalName.substring(i, originalName.length()).toLowerCase());
		String uploadFileName = newFileName + originalName.substring(i, originalName.length()); 
		
		File uploadDir = new File(savePath);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		File mkfile = new File(uploadDir, uploadFileName);

		InputStream in = req.getInputStream();
		OutputStream outFile = new FileOutputStream(mkfile);
		byte[] buf = new byte[1024*2];
		int size = 0;
		while((size=in.read(buf)) != -1){
			outFile.write(buf, 0, size);
		}
		outFile.close();
		in.close();

		FileVO fileVO = new FileVO();
		
		fileVO.setOrgFileName(uploadFile.getOrgFileName());
		fileVO.setUnqFileName(uploadFileName);
		fileVO.setFileSize(uploadFile.getFileSize());
		fileVO.setFileType(uploadFile.getFileType());
		fileVO.setSavePath(webSavePath);
		fileVO.setFile_id(BaseUtil.uuid());  
		fileDAO.insertFile(fileVO);
		
		return fileVO;
	}

	public void downloadFile(String file_id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		
		FileVO info = fileDAO.getFile(new FileVO(file_id));
		File tf = new File(request.getSession().getServletContext().getRealPath(info.getSavePath()+"/"+info.getUnqFileName()));
		boolean isFile = tf.exists();
		
		//파일이 존재하지 않을때 값을 널을 리턴하도록 하여 에러 방지토록 수정
		if(!isFile) {
			response.sendError(508, "해당하는 파일이 서버에 존재하지 않습니다. 관리자에게 문의하여 주십시요.");

			String message = "<script type='text/javascript'>"; 
			message += "alert('해당하는 파일이 서버에 존재하지 않습니다. 관리자에게 문의하여 주십시요.');";
			message += "history.go(-1);";
			message += "</script>";
			byte[] error = message.getBytes();
			
			response.setContentType("text/html; charset=UTF-8;");
			OutputStream outStream = response.getOutputStream();
			outStream.write(error);
			outStream.close();
			return;
			
		}
		
		
		if ("".equals(file_id) ) {
			String message = "<script type='text/javascript'>"; 
			message += "alert('다운로드할 파일이 없습니다. 다운로드할 파일의 이름을 확인해 주세요.');";
			message += "history.go(-1);";
			message += "</script>";
			byte[] error = message.getBytes();
			
			response.setContentType("text/html; charset=UTF-8;");
			OutputStream outStream = response.getOutputStream();
			outStream.write(error);
			outStream.close();		
			
		}else {
			
			System.out.println("Inside File PUT ");
	
			String fileName = info.getOrgFileName();
			response.setHeader("Pragma", "public");
			response.setContentLength((int)info.getFileSize());    
	
			if(info.getFileType() == null || !info.getFileType().startsWith("image")){    
				String strClient=request.getHeader("user-agent");
				response.setContentType("application/x-msdownload; charset=UTF-8;");
				if(strClient.indexOf("MSIE 5.5")>-1) {
					 
					fileName = URLEncoder.encode(fileName, "UTF8");
					response.setHeader("Accept-Ranges", "bytes");
					response.setHeader("Content-Disposition", "filename=\""+ fileName + "\";");
				}else if(strClient.indexOf("Trident")>-1){
					 
					response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + ";");
				}else {
					 
					fileName = new String(fileName.getBytes("UTF-8"), "8859_1"); 
					response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
					response.setHeader("Content-Transfer-Encoding", "binary;");
				}        
			}else {
				boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;
				
				if(MSIE){
					fileName = URLEncoder.encode(fileName, "UTF8");
				}else{
					fileName = new String(fileName.getBytes("UTF-8"), "8859_1"); 
				}
				
				response.setContentType(info.getFileType());
			    response.setHeader("Accept-Ranges", "bytes");
			    response.setHeader("Content-Transfer-Encoding", "binary;");
			    response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
			}
			
			if(info.getSavePath() != null){
	
				BaseUtil.transfer(new FileInputStream(
						request.getSession().getServletContext().getRealPath(info.getSavePath()+"/"+info.getUnqFileName())), response.getOutputStream(), false);
				response.flushBuffer();
			}
		
		}	
	}

	public void downloadFileFromUFN(String file_id, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		if ("".equals(file_id)) {
			String message = "<script type='text/javascript'>"; 
			message += "alert('파일 전송 오류');";
			message += "history.go(-1);";
			message += "</script>";
			byte[] error = message.getBytes();
			response.setContentType("text/html; charset=UTF-8;");
			OutputStream outStream = response.getOutputStream();
			outStream.write(error);
			outStream.close();		
		}
		
		FileVO info = fileDAO.getFileFromUFN(new FileVO(file_id,0));
		  
		if (info == null || !cacheHeaders(request, response, info)) {
			return;
		}else{
			
		}
		  
		String fileName = info.getOrgFileName();
		
		
		response.setHeader("Pragma", "public");
		response.setContentLength((int)info.getFileSize());    

		if(info.getFileType() == null || !info.getFileType().startsWith("image")){    
			String strClient=request.getHeader("user-agent");
			response.setContentType("application/x-msdownload; charset=UTF-8;");
			if(strClient.indexOf("MSIE 5.5")>-1) {
				 
				fileName = URLEncoder.encode(fileName, "UTF8");
				response.setHeader("Accept-Ranges", "bytes");
				response.setHeader("Content-Disposition", "filename=\""+ fileName + "\";");
			}else if(strClient.indexOf("Trident")>-1){
				 
				response.setHeader("Content-Disposition", "attachment; filename="+ java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "\\ ") + ";");
			}else {
				 
				fileName = new String(fileName.getBytes("UTF-8"), "8859_1"); 
				response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
				response.setHeader("Content-Transfer-Encoding", "binary;");
			}        
		}else {
			boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;
			
			if(MSIE){
				fileName = URLEncoder.encode(fileName, "UTF8");
			}else{
				fileName = new String(fileName.getBytes("UTF-8"), "8859_1"); 
			}
			
			response.setContentType(info.getFileType());
		    response.setHeader("Accept-Ranges", "bytes");
		    response.setHeader("Content-Transfer-Encoding", "binary;");
		    response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\";");
		}
		
		
		if(info.getSavePath() != null){
			BaseUtil.transfer(new FileInputStream(request.getSession().getServletContext().getRealPath(info.getSavePath()+"/"+info.getUnqFileName())), response.getOutputStream(), false);
			response.flushBuffer();
		}
	}

	
	private boolean cacheHeaders(
			HttpServletRequest req,
			HttpServletResponse response, FileVO info) throws Exception{
		String etag = null;
		long lastModified = 0;
		int contentLength = (int)info.getFileSize();
		if (lastModified != -1 && contentLength != -1) {
			etag = "W/\"" + contentLength + "-" + lastModified + "\"";
		}
		response.setHeader("Cache-Control", "public, max-age=3600");
		response.setDateHeader("Expires", System.currentTimeMillis() + (1 * 3600 * 1000));
    
		String ifNoneMatch = req.getHeader(IF_NONE_MATCH);
		if (ifNoneMatch != null && etag != null && ifNoneMatch.indexOf(etag) != -1) {
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			return false;
		}
		long ifModifiedSince = -1;

		ifModifiedSince = BaseUtil.parseRfc2616Date(req.getHeader(IF_MODIFIED_SINCE));
		
		if (ifModifiedSince > -1 && lastModified > 0 && lastModified <= (ifModifiedSince + 999)) {
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			return false;
		}
		if (lastModified > 0) response.setDateHeader(LAST_MODIFIED, lastModified);
		return true;
	}



}
