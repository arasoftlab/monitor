package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class MonitorsVO extends CommonVO{
	
	private String idx;
	private String member_id;
	private String member_name;
	private String address;
	private String birth;
	private String phone;
	
	private String query;

	private String team_num;
	private String description;
	private String is_selection;
	
	private String apply_cnt;
	private String selected_cnt;
	
	private String tmp_sum1;
		
	private String subject_id;
	private Date regdate;

	private String poll_num;
	
	private String gugun;
	private String sido;
	private String dong;
	
	private String job;
	

	public String getJob(){
		return job;
	}
	
	public void setJob(String job){
		this.job = job;
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

	

	public String getTmp_sum1() {
		return tmp_sum1;
	}
	public void setTmp_sum1(String tmp_sum1) {
		this.tmp_sum1 = tmp_sum1;
	}
	
	
	
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
	
	public void setSelected_cnt(String selected_cnt)
	{
		this.selected_cnt = selected_cnt;
	}
	
	public String getSelected_cnt()
	{
		return selected_cnt;
	}
	
	
	public void setIs_selection(String is_selection)
	{
		this.is_selection = is_selection;
	}
	
	public String getIs_selection()
	{
		return is_selection;
	}
	
	public void setIdx(String idx)
	{
		this.idx = idx;
	}
	
	public String getIdx()
	{
		return idx;
	}
	
	
	public void setTeam_num(String team_num)
	{
		this.team_num = team_num;
	}
	
	public String getTeam_num()
	{
		return team_num;
	}
	
	
	public void setSubject_id(String subject_id)
	{
		this.subject_id = subject_id;
	}
	
	public String getSubject_id()
	{
		return subject_id;
	}

	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return address;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	public String getBirth() {
		return birth;
	}
	
	public void setBirth(String birth) {
		this.birth = birth;
	}	
	
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	public String getQuery(){
		return query;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	
	
	
	public void setApply_cnt(String apply_cnt) {
		this.apply_cnt = apply_cnt;
	}
	
}
