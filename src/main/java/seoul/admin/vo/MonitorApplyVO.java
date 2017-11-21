package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class MonitorApplyVO extends CommonVO{
	
	private String idx;
	private String member_id;
	private String team;
	private String bank;
	private String bank_num;
	
	private String subject_id;
	private Date regdate;

	private String query;
	
	private String pay;
	
	private String member_name;
	private String gugun;
	private String sido;
	private String dong;
	private String send_cnt;
	private String phone;
	private String birth;
	
	
	public void setPay(String pay)
	{
		this.pay = pay;
	}
	
	public String getPay()
	{
		return pay;
	}

	
	
	public void setIdx(String idx)
	{
		this.idx = idx;
	}
	
	public String getIdx()
	{
		return idx;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_id() {
		return member_id;
	}
		
	
	public void setTeam(String team)
	{
		this.team = team;
	}
	
	public String getTeam()
	{
		return team;
	}
	
	public String getBank() {
		return bank;
	}
	
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	
	public void setBank_num(String bank_num)
	{
		this.bank_num = bank_num;
	}
	
	public String getBank_num()
	{
		return bank_num;
	}
	
	public void setSubject_id(String subject_id)
	{
		this.subject_id = subject_id;
	}
	
	public String getSubject_id()
	{
		return subject_id;
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getSend_cnt() {
		return send_cnt;
	}

	public void setSend_cnt(String send_cnt) {
		this.send_cnt = send_cnt;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	
}
