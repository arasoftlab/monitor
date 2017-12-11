package common.vo;

import lombok.*;

@ToString
@Setter
@Getter
public class PagingVO {
	private int pageSize = 10;
	private int pageNum = 1;
	private int totalRows = 0;
	private int totalPage = 0;
	
	public PagingVO(int totalRows) {
		this.pageSize = 10;
		this.totalRows = totalRows;
		this.totalPage = (totalRows/pageSize) + ((totalRows%pageSize) > 0 ? 1:0);
	}
	
	public PagingVO(int pageNum, int totalRows) {
		this.pageSize = 10;
		this.pageNum = pageNum;
		this.totalRows = totalRows;
		this.totalPage = (totalRows/pageSize) + ((totalRows%pageSize) > 0 ? 1:0);
	}
	
	public PagingVO(int pageSize, int pageNum, int totalRows) {
		this.pageSize = (pageSize == 0 ? totalRows : pageSize);
		this.pageNum = pageNum;
		this.totalRows = totalRows;
		this.totalPage = (totalRows/pageSize) + ((totalRows%pageSize) > 0 ? 1:0);
	}
	
	public int getStartRow() {
		if (pageNum <= 0)
			pageNum = 1;
		return (pageNum - 1) * pageSize;
	}
	
	public int getNextPageRow() {
		return getStartRow() + pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}
	
	public int getTotalRows() {
		return totalRows;
	}
	
	public int getTotalPage(){
		return totalPage;
	}
	public int getStartRows(){
		return totalRows-((pageNum-1)*pageSize);
	}
}
