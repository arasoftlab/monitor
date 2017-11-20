package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class AnswersVO extends CommonVO{
	
	private String answers_id;
	private String subject_id;
	private String questions;
	private String answers;
	private String member_id;
	private String temporary;
	private Date regdate;
	private String query;


	private String poll_num;
	
	private String team_num;
	
	private String member_name;
	
	private String phone;

	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	
	
	public String getTeam_num() {
		return team_num;
	}
	public void setTeam_num(String team_num) {
		this.team_num = team_num;
	}
	
	
	public String getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(String poll_num) {
		this.poll_num = poll_num;
	}
	
	public void setAnswers_id(String answers_id)
	{
		this.answers_id = answers_id;
	}
	
	public String getAnswers_id()
	{
		return answers_id;
	}
	
	public void setSubject_id(String subject_id)
	{
		this.subject_id = subject_id;
	}
	
	public String getSubject_id()
	{
		return subject_id;
	}

	
	public void setAnswers(String answers) {
		this.answers = answers;
	}
	
	public String getAnswers() {
		return answers;
	}

	
	public void setQuestions(String questions) {
		this.questions = questions;
	}
	
	public String getQuestions() {
		return questions;
	}

	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setTemporary(String tempporary) {
		this.temporary = tempporary;
	}
	
	public String getTemporary() {
		return temporary;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
}
