package common.vo;

import lombok.*;

@ToString
@Setter
@Getter
public class PagingVO {
	private int pageSize = 10;
	private int pageUnit = 10;
	private int pageNum;
	private int totalRows;
	private int totalPage;
	private int startRow;
	private int nextPageRow;
	
	public PagingVO(int totalRows) {
		this.totalRows = totalRows;
		this.totalPage = (totalRows/pageSize) + ((totalRows % pageSize) > 0 ? 1:0);
		//System.out.println(" 계산된 0T : " + totalPage);
	}
	
	public PagingVO(int pageNum, int totalRows) {
		this.pageNum = pageNum;
		this.totalRows = totalRows;
		this.totalPage = (totalRows / this.pageSize) + ((totalRows % this.pageSize) > 0 ? 1:0);
		this.startRow = pageNum ==1 ? 1 : ((pageNum-1) * pageSize) + 1;
		this.nextPageRow = startRow + pageSize -1;
		//System.out.println(" 계산된 1S : " + startRow);
		//System.out.println(" 계산된 1E : " + nextPageRow);
	}
	
	public PagingVO(int pageSize, int pageNum, int totalRows) {
		this.pageSize = (pageSize == 0 ? totalRows : pageSize);
		this.pageNum = pageNum;
		this.totalRows = totalRows;
		this.totalPage = (totalRows / pageSize) + ((totalRows % pageSize) > 0 ? 1:0);
		this.startRow = pageNum ==1 ? 1 : ((pageNum-1) * pageSize) + 1;
		//System.out.println(" 계산된 2S : " + startRow);
		this.nextPageRow = startRow + pageSize -1;
		//System.out.println(" 계산된 2E : " + nextPageRow);
	}
	
	public int getStartRow() {
		//pageNum = pageNum > totalPage ? totalPage : pageNum;
		this.startRow = pageNum ==1 ? 1 : ((pageNum-1) * pageSize) + 1;
		//System.out.println(" 계산된 3S : " + startRow);
		this.nextPageRow = startRow + pageSize -1;
		//System.out.println(" 계산된 3E : " + nextPageRow);
		return startRow;
	}
	
	public int getNextPageRow() {
		return startRow + pageSize -1;
	}
	
}
