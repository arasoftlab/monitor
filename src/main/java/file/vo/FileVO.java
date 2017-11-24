package file.vo;

import lombok.ToString;

@ToString
public class FileVO {
	
	private String file_id;
	private String unqFileName;
	private String orgFileName;
	private String savePath;
	private int fileSize;
	private String fileType;
	
	private Double fileSizeKB;
	private Double fileSizeMB;
	
	public FileVO() {}
	
	public FileVO(String file_id) {
		this.setFile_id(file_id);
	}

	public FileVO(String file_id,int type) {
		this.setUnqFileName(file_id);
	}
	
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}

	public String getUnqFileName() {
		return unqFileName;
	}
	public void setUnqFileName(String unqFileName) {
		this.unqFileName = unqFileName;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSizeKB = (double) Math.round(fileSize/1024d*100d)/100d;
		this.fileSizeMB = (double) Math.round(fileSize/(1024d*1024d)*100d)/100d;
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public Double getFileSizeKB() {
		return fileSizeKB;
	}
	
	public Double getFileSizeMB() {
		return fileSizeMB;
	}

}
