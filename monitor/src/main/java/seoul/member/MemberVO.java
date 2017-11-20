package seoul.member;

import common.vo.CommonVO;

public class MemberVO extends CommonVO{
	private String id;
	private String password;

	private String grade; 
	private String poll_num;


	
	private String gugun;
	private String sido;
	private String dong;
	
	private String sex;
	private String job;
	
	private String query;

	/* 통합 DB를 담을 객체 
	 * 
	 * 저장용으로 쓰이지 않는다. 체크 요망.
	 * 
	 * name 과 phone 의 경우 관리자 회원에만 저장용으로 사용됨 .
	 * */
	private String name;
	private String phone;
	private String email;
	private String birthday;
	
	
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getBirthday(){
		return birthday;
	}
	
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}


	
	
	public String getJob(){
		return job;
	}
	
	public void setJob(String job){
		this.job = job;
	}
	
	
	public String getSex(){
		return sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	
	public String getGugun(){
		return gugun;
	}
	
	public void setGugun(String gugun){
		this.gugun = gugun;
	}
	
	
	public String getSido(){
		return sido;
	}
	
	public void setSido(String sido){
		this.sido = sido;
	}
	

	public String getDong(){
		return dong;
	}
	
	public void setDong(String dong){
		this.dong = dong;
	}
	
	
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
	
	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	
	public String getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(String poll_num) {
		this.poll_num = poll_num;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
