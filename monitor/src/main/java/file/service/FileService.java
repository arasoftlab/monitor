package file.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import file.vo.FileVO;

public interface FileService {
	
	FileVO updateFile(HttpServletRequest req, HttpSession session, String data_id);
	
	String fileSize(HttpServletRequest req);
	
	FileVO saveFile(HttpServletRequest req, HttpSession session, String file_idx );

	int deleteFile(String file_idx);

	FileVO jindoFileUpload(HttpServletRequest req, FileVO uploadFile) throws IOException;

	void downloadFile(String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception;

	void downloadFileFromUFN(String id, HttpServletResponse response,
			HttpServletRequest request) throws Exception;
		
}
