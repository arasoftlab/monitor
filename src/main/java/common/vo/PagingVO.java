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
		//TODO 페이징 시작부의 문제를 이곳에서 처리해야 함
		if (this.pageNum <= 0)
			this.pageNum = 1;
		int spage = 0;
		spage = this.pageNum * this.pageSize;
		spage = spage == this.pageSize ? 1 : spage + 1;
		return spage;
	}
	
	public int getNextPageRow() {
		return (getStartRow() + this.pageSize) -1;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public int getPageNum() {
		return this.pageNum;
	}
	
	public int getTotalRows() {
		return this.totalRows;
	}
	
	public int getTotalPage(){
		return this.totalPage;
	}
	public int getStartRows(){
		return this.totalRows-((this.pageNum-1) * this.pageSize);
	}
}
