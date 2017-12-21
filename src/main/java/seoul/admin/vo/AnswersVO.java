package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;
import lombok.*;

@ToString
@Getter
@Setter
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
	private String job;
	private String birth;
	
	//과제수를 위해 추가
	private int report_num;

}
