package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;
import lombok.*;

@ToString
@Getter
@Setter
public class CommentVO extends CommonVO{
	private String comm_id;
	private String is_secret;
	private String description;
	private String member_id;
	private String bbs_id;
	
	private Date regdate;
	
	private String cont_uuid;
	
	private String query;
	
	
	
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	
	
	
	public String getComm_id() {
		return comm_id;
	}
	public void setComm_id(String comm_id) {
		this.comm_id = comm_id;
	}
	public String getIs_secret() {
		return is_secret;
	}
	public void setIs_secret(String is_secret) {
		this.is_secret = is_secret;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
