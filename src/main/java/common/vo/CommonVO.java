package common.vo;

import java.util.List;
import file.vo.FileVO;

public class CommonVO {
	private int rn;
	private String searchCategory;
	private String searchText;
	private String ord = "regdate desc";
	private List<FileVO> fileList;
	private String fileListId[];
	private int pageNum = 1;
	private int pageSize = 10;
	private PagingVO pagingVO;
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public List<FileVO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileVO> fileList) {
		this.fileList = fileList;
	}
	public String[] getFileListId() {
		return fileListId;
	}
	public void setFileListId(String[] fileListId) {
		this.fileListId = fileListId;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public PagingVO getPagingVO() {
		return pagingVO;
	}
	public void setPagingVO(PagingVO pagingVO) {
		this.pagingVO = pagingVO;
	}
	
}
