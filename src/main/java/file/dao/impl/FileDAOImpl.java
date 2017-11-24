package file.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import file.dao.FileDAO;
import file.vo.FileMappingVO;
import file.vo.FileVO;

public class FileDAOImpl extends SqlSessionDaoSupport implements FileDAO{


	public int updateFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().update("file.updateFileMapping", fileMappingVO);
	}
	

	public int insertFile(FileVO fileVO) {
		return getSqlSession().insert("file.insertFile", fileVO);
	}


	public int insertFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().insert("file.insertFileMapping", fileMappingVO);
	}


	public int deleteFile(FileVO fileVO) {
		return getSqlSession().delete("file.deleteFile", fileVO);
	}


	public int deleteFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().delete("file.deleteFileMapping", fileMappingVO);
	}


	public List<FileVO> getFileList(FileMappingVO fileMappingVO) {
		return getSqlSession().selectList("file.getFileList", fileMappingVO);
	}


	public FileVO getFile(FileVO fileVO) {
		return getSqlSession().selectOne("file.getFile", fileVO);
	}
	

	public FileVO getFileFromUFN(FileVO fileVO) {
		return getSqlSession().selectOne("file.getFileFromUFN", fileVO);
	}	
		
	

}
