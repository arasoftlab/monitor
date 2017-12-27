package seoul.admin.vo;

import java.util.Date;
import lombok.*;
import common.vo.CommonVO;

@ToString
@Getter
@Setter
public class NoticeVO extends CommonVO{
	private int notice_id;
	private String title;
	private String type;
	private String open;
	private String description;
	private String applyform;
	private String subject_id;
	private Date regDate;
	private int hits;
	private SubjectVO subjectVO;
	
	private String cont_uuid;
	
	private String query;
	private String stype;
	
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeText() {
		String tt = this.getType();
		String typeText = "";
		switch (tt) {
			case "S":
				typeText="단순공지";
				break;
			case "F":
				typeText="현장과제";
				break;
			case "V":
				typeText="설문과제";
				break;
			case "Q":
				typeText="FAQ";
				break;
			default:
				break;
		}
				
		return typeText;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getApplyform() {
		return applyform;
	}
	public void setApplyform(String applyform) {
		this.applyform = applyform;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public SubjectVO getSubjectVO() {
		return subjectVO;
	}
	public void setSubjectVO(SubjectVO subjectVO) {
		this.subjectVO = subjectVO;
	}
	
	
	public String getCont_uuid() {
		return cont_uuid;
	}
	public void setCont_uuid(String cont_uuid) {
		this.cont_uuid = cont_uuid;
	}
	
	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
}
