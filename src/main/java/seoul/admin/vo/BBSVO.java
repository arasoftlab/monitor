package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class BBSVO extends CommonVO{
	private String bbs_id;
	private String title;
	private String type;
	private String open;
	private String description;
	private String is_password;
	private String member_id;
	private String member_name;
	private String password;
	private Date regdate;
	private int hits;
	
	private String cont_uuid;
	
	private String query;
	
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
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
		String typeText="";
		if("S".equals(type)) typeText="단순공지";
		else if("F".equals(type)) typeText="현장과제";
		else typeText="설문과제";
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
	public String getIs_password() {
		return is_password;
	}
	public void setIs_password(String is_password) {
		this.is_password = is_password;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public void setQuery(String query){
		this.query = query;
	}
}
