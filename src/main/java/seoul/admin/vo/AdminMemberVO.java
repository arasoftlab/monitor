package seoul.admin.vo;

import java.util.Date;

import common.vo.CommonVO;
import lombok.*;

@ToString
@Setter
@Getter
public class AdminMemberVO extends CommonVO {
	
	private String id;
	private String name;
	private String phone;
	private String password;
	private String dept;
	private String allowip;
	private Date createdate;

	
}