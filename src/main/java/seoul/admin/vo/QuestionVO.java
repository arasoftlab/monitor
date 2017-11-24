package seoul.admin.vo;

import java.util.Date;
import java.util.List;

import common.vo.CommonVO;
import lombok.ToString;

@ToString
public class QuestionVO extends CommonVO{
	private String question_id;
	private String subject_id;
	private int question_num;
	private String title;
	private String description;
	private String type;
	private int next_num;
	private int required_cnt;
	private int required_sum;
	private String close_comment;
	private Date regDate;
	private int from_num;
	private int to_num;
	private List<OptionVO> optionVO;
	private List<QuestionSettingsVO> questionSettingsVO;
	
	private String cont_uuid;

	private String cont_type;
	
//	private int form;
	
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeText() {
		String typeText = "";
		if("S".equals(type)){
			typeText = "단일 응답형";
		}else if("C".equals(type)){
			typeText = "분기 응답형";
		}else if("M".equals(type)){
			typeText = "중복(복수) 응답형";
		}else if("O".equals(type)){
			typeText = "서열(순서) 응답형";
		}else if("R".equals(type)){
			typeText = "척도 응답형";
		}else if("W".equals(type)){
			typeText = "서술 응답형";
		}else if("B".equals(type)){
			typeText = "게시판(정보제공)형";
		}else if("T".equals(type)){
			typeText = "파일 첨부형";
		}
		return typeText;
	}
	public int getNext_num() {
		return next_num;
	}
	public void setNext_num(int next_num) {
		this.next_num = next_num;
	}
	public int getRequired_cnt() {
		return required_cnt;
	}
	public void setRequired_cnt(int required_cnt) {
		this.required_cnt = required_cnt;
	}
	public int getRequired_sum() {
		return required_sum;
	}
	public void setRequired_sum(int required_sum) {
		this.required_sum = required_sum;
	}
	public String getClose_comment() {
		return close_comment;
	}
	public void setClose_comment(String close_comment) {
		this.close_comment = close_comment;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getFrom_num() {
		return from_num;
	}
	public void setFrom_num(int from_num) {
		this.from_num = from_num;
	}
	public int getTo_num() {
		return to_num;
	}
	public void setTo_num(int to_num) {
		this.to_num = to_num;
	}
	public List<OptionVO> getOptionVO() {
		return optionVO;
	}
	public void setOptionVO(List<OptionVO> optionVO) {
		this.optionVO = optionVO;
	}

	public List<QuestionSettingsVO> getQuestionSettingsVO() {
		return questionSettingsVO;
	}
	public void setQuestionSettingsVO(List<QuestionSettingsVO> questionSettingsVO) {
		this.questionSettingsVO = questionSettingsVO;
	}
	
	public String getCont_uuid() {
		return cont_uuid;
	}
	public void setCont_uuid(String cont_uuid) {
		this.cont_uuid = cont_uuid;
	}	

	public String getCont_type() {
		return cont_type;
	}
	public void setCont_type(String cont_type) {
		this.cont_type = cont_type;
	}	
	
	
/*	
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	*/
	
}
