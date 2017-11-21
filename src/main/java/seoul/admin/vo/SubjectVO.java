package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class SubjectVO extends CommonVO{
	private String subject_id;
	private String title;
	private String reqdep;
	private String type;
	private Date apply_s_date;
	private Date apply_e_date;
	private Date submit_s_date;
	private Date submit_e_date;
	private int question_cnt;
	private int team_cnt;
	private int men_cnt;
	private int men_total;
	private String pay_yn;
	private int pay_sum;
	private Date pay_date;
	private String description;
	private Date regdate;
	private String close_comment;
	private String status;
	
	
	/*
	 * subjectMoney only  
	 * */
	private int apply_cnt;
	private int send_cnt;

	/*
	 * subjectMoney only  
	 * */
	
	private String cont_uuid;
	
	private String query; 
	
	
	public int getApply_cnt() {
		return apply_cnt;
	}
	public void setApply_cnt(int apply_cnt) {
		this.apply_cnt = apply_cnt;
	}
	
	public int getSend_cnt() {
		return send_cnt;
	}
	public void setSend_cnt(int send_cnt) {
		this.send_cnt = send_cnt;
	}
	
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
	
	
	
	public SubjectVO() {}
	public SubjectVO(String subject_id) {
		this.subject_id=subject_id;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReqdep() {
		return reqdep;
	}
	public void setReqdep(String reqdep) {
		this.reqdep = reqdep;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getApply_s_date() {
		return apply_s_date;
	}
	public void setApply_s_date(Date apply_s_date) {
		this.apply_s_date = apply_s_date;
	}
	public Date getApply_e_date() {
		return apply_e_date;
	}
	public void setApply_e_date(Date apply_e_date) {
		this.apply_e_date = apply_e_date;
	}
	public Date getSubmit_s_date() {
		return submit_s_date;
	}
	public void setSubmit_s_date(Date submit_s_date) {
		this.submit_s_date = submit_s_date;
	}
	public Date getSubmit_e_date() {
		return submit_e_date;
	}
	public void setSubmit_e_date(Date submit_e_date) {
		this.submit_e_date = submit_e_date;
	}
	public int getQuestion_cnt() {
		return question_cnt;
	}
	public void setQuestion_cnt(int question_cnt) {
		this.question_cnt = question_cnt;
	}
	public int getTeam_cnt() {
		return team_cnt;
	}
	public void setTeam_cnt(int team_cnt) {
		this.team_cnt = team_cnt;
	}
	public int getMen_cnt() {
		return men_cnt;
	}
	public void setMen_cnt(int men_cnt) {
		this.men_cnt = men_cnt;
	}
	public int getMen_total() {
		return men_total;
	}
	public void setMen_total(int men_total) {
		this.men_total = men_total;
	}
	public String getPay_yn() {
		return pay_yn;
	}
	public void setPay_yn(String pay_yn) {
		this.pay_yn = pay_yn;
	}
	public int getPay_sum() {
		return pay_sum;
	}
	public void setPay_sum(int pay_sum) {
		this.pay_sum = pay_sum;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getClose_comment() {
		return close_comment;
	}
	public void setClose_comment(String close_comment) {
		this.close_comment = close_comment;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}	
	
	public String getCont_uuid() {
		return cont_uuid;
	}
	public void setCont_uuid(String cont_uuid) {
		this.cont_uuid = cont_uuid;
	}	
	
	
	
	
}
