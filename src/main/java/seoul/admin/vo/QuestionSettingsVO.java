package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;

public class QuestionSettingsVO extends CommonVO{
	private String idx;
	private String question_id;
	private int settings_num;
	private String title;
	private String type;
	private int to_num;
	
	private String cont_uuid;
	
	public QuestionSettingsVO() {}
	public QuestionSettingsVO(String question_id) {
		this.question_id = question_id;
	}
	
	public QuestionSettingsVO(String question_id ,String type) {
		this.question_id = question_id;
		this.type = type;
	}
		
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}

	public int getSettings_num() {
		return settings_num;
	}
	public void setSettings_num(int settings_num) {
		this.settings_num = settings_num;
	}
	
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTo_num() {
		return to_num;
	}
	public void setTo_num(int to_num) {
		this.to_num = to_num;
	}
	
	public String getCont_uuid() {
		return cont_uuid;
	}
	public void setCont_uuid(String cont_uuid) {
		this.cont_uuid = cont_uuid;
	}	
}
