package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class MonitorsMemberVO extends CommonVO{

	private String poll_num;
	private String member_id;
	private String title;
	private Date submit_s_date;
	private Date submit_e_date;
	private String question_cnt;
	private String apply_cnt;
	private String pay_sum;
	private Date pay_date;
	
	private String query;

	
	
	public String getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(String poll_num) {
		this.poll_num = poll_num;
	}
	

	
	public void setAapply_cnt(String apply_cnt)
	{
		this.apply_cnt = apply_cnt;
	}
	
	public String getApply_cnt()
	{
		return apply_cnt;
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
	
	
	
	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public void setQuestion_cnt(String qestion_cnt)
	{
		this.question_cnt = qestion_cnt;
	}
	
	public String getQuestion_cnt()
	{
		return question_cnt;
	}

	


	public String getPay_sum() {
		return pay_sum;
	}
	
	public void setPay_sum(String pay_sum) {
		this.pay_sum = pay_sum;
	}
	
	
	public Date getPay_date() {
		return pay_date;
	}
	
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}	
	
	
	
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	
	
}
