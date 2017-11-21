package crontab;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	/**
	 * 1. 오후 05:50:00에 호출이 되는 스케쥴러 
	 * 현재 두번씩 호출되는 문제가 있음...
	 */
	@Scheduled(cron = "0 25 13 * * *")
	@Async
	public void cronTest1(){
		System.out.println("오후 05:50:00에 호출이 됩니다 ");
	}
	
}