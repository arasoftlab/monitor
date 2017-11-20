package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;


public class MemberManagerVO extends CommonVO{
	private String id;
	private String poll_num;
	private String grade;

	
	private String query;
 
	private String job1;
	private String job2;
	private String job3;
	private String job4;
	private String job5;
	private String job6;
	private String job7;
	private String job8;	
	private String job9;	
 
	private String name;
	
	private String phone;
	private String phone_type;

	
	
	private Date regdate;
	private String birthday;
	
	private String apply_cnt;
	private String selection_cnt;
	
	private Date login_date;

	private Date secession_date;
	private String secession_disc;

	private String sex;
	
	private String email;

	private String sido;
	private String gugun;
	private String dong;

	private String job;
	
	public String getPhone_type(){
		return phone_type;
	}
	
	public void setPhone_type(String phone_type){
		this.phone_type = phone_type;
	}
	
	
	public String getSex(){
		return sex;
	}
	
	public void setSex(String sex){
		this.sex = sex;
	}
	
	
	public String getJob(){
		return job;
	}
	
	public void setJob(String job){
		this.job = job;
	}	

	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	
	public String getSido(){
		return sido;
	}
	
	public void setSido(String sido){
		this.sido = sido;
	}
	
	public String getGugun(){
		return gugun;
	}
	
	public void setGugun(String gugun){
		this.gugun = gugun;
	}
	
	public String getDong(){
		return dong;
	}
	
	public void setDong(String dong){
		this.dong = dong;
	}
	
	
	public String getSecession_disc(){
		return secession_disc;
	}
	
	public void setSecession_disc(String secession_disc){
		this.secession_disc = secession_disc;
	}
	
	public Date getSecession_date() {
		return secession_date;
	}
	public void setSecession_date(Date secession_date) {
		this.secession_date = secession_date;
	}

	
	
	public String getJob1(){
		return job1;
	}
	
	public void setJob1(String job1){
		this.job1 = job1;
	}

	public String getJob2(){
		return job2;
	}
	
	public void setJob2(String job2){
		this.job2 = job2;
	}
	
	public String getJob3(){
		return job3;
	}
	
	public void setJob3(String job3){
		this.job3 = job3;
	}

	public String getJob4(){
		return job4;
	}
	
	public void setJob4(String job4){
		this.job4 = job4;
	}
	

	public String getJob5(){
		return job5;
	}
	
	public void setJob5(String job5){
		this.job5 = job5;
	}

	public String getJob6(){
		return job6;
	}
	
	public void setJob6(String job6){
		this.job6 = job6;
	}
	
	public String getJob7(){
		return job7;
	}
	
	public void setJob7(String job7){
		this.job7 = job7;
	}

	public String getJob8(){
		return job8;
	}
	
	public void setJob8(String job8){
		this.job8 = job8;
	}
	
	public String getJob9(){
		return job9;
	}
	
	public void setJob9(String job9){
		this.job9 = job9;
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	public String getPhone(){
		return phone;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}	
	
	public String getBirthday(){
		return birthday;
	}
	
	public void setBirthday(String birthday){
		this.birthday = birthday;
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
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
 
	public String getApply_cnt() {
		return apply_cnt;
	}
	public void setApply_cnt(String apply_cnt) {
		this.apply_cnt = apply_cnt;
	}
	
	public String getSelection_cnt() {
		return selection_cnt;
	}
	public void setSelection_cnt(String selection_cnt) {
		this.selection_cnt = selection_cnt;
	}
	
	public Date getLogin_date() {
		return login_date;
	}
	public void setLogindate(Date login_date) {
		this.login_date = login_date;
	}
	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	
}
