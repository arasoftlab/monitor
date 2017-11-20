package file.vo;

public class FileMappingVO {
	private String data_id;
	private String file_id;
	public FileMappingVO() {}
	public FileMappingVO(String file_id) {
		this.file_id = file_id;
	}
	public FileMappingVO(String data_id, String file_id) {
		this.data_id=data_id;
		this.file_id=file_id;
	}
	
	public String getData_id() {
		return data_id;
	}
	public void setData_id(String data_id) {
		this.data_id = data_id;
	}
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
}
