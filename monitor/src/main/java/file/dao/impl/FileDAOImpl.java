package file.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import file.dao.FileDAO;
import file.vo.FileMappingVO;
import file.vo.FileVO;

public class FileDAOImpl extends SqlSessionDaoSupport implements FileDAO{

	@Override
	public int updateFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().update("file.updateFileMapping", fileMappingVO);
	}
	
	@Override
	public int insertFile(FileVO fileVO) {
		return getSqlSession().insert("file.insertFile", fileVO);
	}

	@Override
	public int insertFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().insert("file.insertFileMapping", fileMappingVO);
	}

	@Override
	public int deleteFile(FileVO fileVO) {
		return getSqlSession().delete("file.deleteFile", fileVO);
	}

	@Override
	public int deleteFileMapping(FileMappingVO fileMappingVO) {
		return getSqlSession().delete("file.deleteFileMapping", fileMappingVO);
	}

	@Override
	public List<FileVO> getFileList(FileMappingVO fileMappingVO) {
		return getSqlSession().selectList("file.getFileList", fileMappingVO);
	}

	@Override
	public FileVO getFile(FileVO fileVO) {
		return getSqlSession().selectOne("file.getFile", fileVO);
	}
	
	@Override
	public FileVO getFileFromUFN(FileVO fileVO) {
		return getSqlSession().selectOne("file.getFileFromUFN", fileVO);
	}	
		
	

}
