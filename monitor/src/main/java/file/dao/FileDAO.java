package file.dao;

import java.util.List;

import file.vo.FileMappingVO;
import file.vo.FileVO;

public interface FileDAO {
	
	int updateFileMapping(FileMappingVO fileMappingVO);
	
	int insertFile(FileVO fileVO);

	int insertFileMapping(FileMappingVO fileMappingVO);

	int deleteFile(FileVO fileVO);

	int deleteFileMapping(FileMappingVO fileMappingVO);

	List<FileVO> getFileList(FileMappingVO fileMappingVO);

	FileVO getFile(FileVO fileVO);
	
	FileVO getFileFromUFN(FileVO fileVO);
}
