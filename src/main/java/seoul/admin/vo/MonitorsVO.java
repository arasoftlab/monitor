package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;
import lombok.*;

@ToString
@Getter
@Setter
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
	private String clear_sum;
		
	private String subject_id;
	private Date regdate;

	private String poll_num;
	
	private String gugun;
	private String sido;
	private String dong;
	
	private String job;
	
	//2017 12 15 추가
	private String email;
	private String memo;
	
	//미제출자확인을 위한 필드
	private String temporary;
	
}
