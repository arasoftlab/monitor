package seoul.member;

import java.util.Date;

import common.vo.CommonVO;

public class MemberVO extends CommonVO{
	private String id;
	private String password;

	private String grade; 
	private String poll_num;
	
	private String gugun;
	private String sido;
	private String dong;
	
	private String sido_cnt;
	
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
	
	private String birthday_ymd;
	
	private String phone_type;
	
	private String secession_disc;
	private Date secession_date;
	
	private String apply_cnt;
	private String selected_cnt;
	private String tmp_sum1;
	
	private Date regdate;
	private Date login_date;
	
	
	
	public void setSido_cnt(String sido_cnt)
	{
		this.sido_cnt = sido_cnt;
	}
	
	public String getSido_cnt()
	{
		return sido_cnt;
	}
	
	
	public Date getSecession_date() {
		return secession_date;
	}
	public void setSecession_date(Date secession_date) {
		this.secession_date = secession_date;
	}
	
	
	public Date getLogin_date() {
		return login_date;
	}
	public void setLogin_date(Date login_date) {
		this.login_date = login_date;
	}
	
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}	

	
	public String getTmp_sum1() {
		return tmp_sum1;
	}
	public void setTmp_sum1(String tmp_sum1) {
		this.tmp_sum1 = tmp_sum1;
	}
	
	public void setAapply_cnt(String apply_cnt)
	{
		this.apply_cnt = apply_cnt;
	}
	
	public String getApply_cnt()
	{
		return apply_cnt;
	}
	
	public void setSelected_cnt(String selected_cnt)
	{
		this.selected_cnt = selected_cnt;
	}
	
	public String getSelected_cnt()
	{
		return selected_cnt;
	}
	
	
	
	public String getSecession_disc(){
		return secession_disc;
	}
	
	public void setSecession_disc(String secession_disc){
		this.secession_disc = secession_disc;
	}
	
	
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


	public String getBirthday_ymd(){
		return birthday_ymd;
	}
	
	public void setBirthday_ymd(String birthday_ymd){
		this.birthday_ymd = birthday_ymd;
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
	
	
	public String getPhone_type(){
		return phone_type;
	}
	
	public void setPhone_type(String phone_type){
		this.phone_type = phone_type;
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
