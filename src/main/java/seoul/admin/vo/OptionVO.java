package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter 
@Setter
public class OptionVO extends CommonVO{
	private String options_id;
	private String question_id;
	private int options_num;
	private String type;
	private String label_front;
	private String label_rear;
	private String label_1;
	private String label_2;
	private String label_3;
	private String label_4;
	private String label_5;
	private String keyword;
	private String descyn;
	private int next_num;
	private String endpoint;
	private String sumpoint;
	private int form;
	private Date regdate;
	private int to_num;
	private String examrequire;
	
	private String cont_uuid;
	
	public OptionVO() {}
	public OptionVO(String question_id) {
		this.question_id = question_id;
	}
 
	public OptionVO(String question_id , int form) {
		this.question_id = question_id;
		this.form = form;
	}
	
	
	public String getOptions_id() {
		return options_id;
	}
	public void setOptions_id(String options_id) {
		this.options_id = options_id;
	}
	public String getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}
	public int getOptions_num() {
		return options_num;
	}
	public void setOptions_num(int options_num) {
		this.options_num = options_num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLabel_front() {
		return label_front;
	}
	public void setLabel_front(String label_front) {
		this.label_front = label_front;
	}
	public String getLabel_rear() {
		return label_rear;
	}
	public void setLabel_rear(String label_rear) {
		this.label_rear = label_rear;
	}
	public String getLabel_1() {
		return label_1;
	}
	public void setLabel_1(String label_1) {
		this.label_1 = label_1;
	}
	public String getLabel_2() {
		return label_2;
	}
	public void setLabel_2(String label_2) {
		this.label_2 = label_2;
	}
	public String getLabel_3() {
		return label_3;
	}
	public void setLabel_3(String label_3) {
		this.label_3 = label_3;
	}
	public String getLabel_4() {
		return label_4;
	}
	public void setLabel_4(String label_4) {
		this.label_4 = label_4;
	}
	public String getLabel_5() {
		return label_5;
	}
	public void setLabel_5(String label_5) {
		this.label_5 = label_5;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getDescyn() {
		return descyn;
	}
	public void setDescyn(String descyn) {
		this.descyn = descyn;
	}
	public int getNext_num() {
		return next_num;
	}
	public void setNext_num(int next_num) {
		this.next_num = next_num;
	}
	public String getEndpoint() {
		return endpoint;
	}
	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}
	public String getSumpoint() {
		return sumpoint;
	}
	public void setSumpoint(String sumpoint) {
		this.sumpoint = sumpoint;
	}
	public int getForm() {
		return form;
	}
	public void setForm(int form) {
		this.form = form;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
