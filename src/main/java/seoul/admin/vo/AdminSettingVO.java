package seoul.admin.vo;

import java.util.Date;
import lombok.*;

@ToString
@Setter
@Getter
public class AdminSettingVO{
	
	private String poll_num;
	private Date poll_start_date;	
	private Date poll_end_date;	
	
	
	
	public String getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(String poll_num) {
		this.poll_num = poll_num;
	}
	
	public Date getPoll_end_date() {
		return poll_end_date;
	}
	public void setPoll_end_date(Date poll_end_date) {
		this.poll_end_date = poll_end_date;
	}


	public Date getPoll_start_date() {
		return poll_start_date;
	}
	public void setPoll_start_date(Date poll_start_date) {
		this.poll_start_date = poll_start_date;
	}	
	
}
