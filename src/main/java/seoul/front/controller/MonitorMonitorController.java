package seoul.front.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.SessionContants;
import seoul.admin.service.AdminSettingService;
import seoul.admin.service.AnswersService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.SessionUtil;

@Controller
@RequestMapping("/front/monitoring/monitoring")
public class MonitorMonitorController {
	
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private MonitorsService monitorsService;
	
	@Autowired
	private AnswersService answersService;
	
	@Autowired
	private AdminSettingService adminSettingService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		subjectVO.setType("F");
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;

		//MonitorsVO monitorsVO = new MonitorsVO();
						
		if (mem == null)
		{				

		}else{
			subjectVO.setMember_id(mem.getId());
			
			model.addAttribute("member",mem);
			 
		}
			
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());
		return "front/monitor/monitor/list.default";
	}
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
			
		SubjectVO sVO = subjectInfoService.getSubject(subjectVO);
		model.addAttribute("vo", sVO);
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		MonitorsVO monitorsVO = new MonitorsVO();
		
		List<AnswersVO> aL = null;
		int aLength = 0;
		if (mem != null)
		{
			model.addAttribute("m_info" , mem );
			
			
			AdminSettingVO adminSettingVO = new AdminSettingVO();		
			adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		

			model.addAttribute("now_poll" , adminSettingVO.getPoll_num());
			
			monitorsVO.setMember_id(mem.getId());
			monitorsVO.setSubject_id(subjectVO.getSubject_id());
			monitorsVO = monitorsService.getMonitors(monitorsVO);
				
			if (monitorsVO != null)
			{
				model.addAttribute("m_vo" , monitorsVO);
				
				AnswersVO answersVO = new AnswersVO();
				
				answersVO.setMember_id(mem.getId());
				answersVO.setSubject_id(subjectVO.getSubject_id());
				
				aL = answersService.getFrontAnswerList(answersVO);
				
				model.addAttribute("a_list" , aL);
				aLength = aL.size();
			}
		}
		
		//답변선별을 위한 사전 데이터 생성
		int sLength = sVO.getQuestion_cnt();

		
		List<String> unAns = new ArrayList<String>();
		
		//문항에 대해 모든 번호를 기록한다.
		for(int i=0; sLength> i; i++) {			
			unAns.add("N");
		}	
		
		System.out.println(" answer count : " + aLength);
		
		//기록된 번호와 같은 것이 있으면 값을 지운다.
		if(aLength > 0) { // 답변의 갯수가 0보다 크면 하나씩 확인
			for(int a=0; aLength > a; a++) {
				int rN = aL.get(a).getReport_num(); //답변번호를 가져옴
				
				System.out.println(" 처리하는 답변 내용 : " + rN);
				
				if(unAns.get(rN)=="N") {
					unAns.set(rN, "Y");	
				}
			}
		}
	
		model.addAttribute("unAns", unAns);
		System.out.println(" 미응답 번호 : " + unAns.toString());
		
		return "front/monitor/monitor/view.default";
	}
	
	
	@RequestMapping(value="delete.do" , method=RequestMethod.POST)	
	public @ResponseBody Map<String, Object> delete(@ModelAttribute AnswersVO answersVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
				
		
		System.out.println("삭제전 데이터 : " + answersVO.toString());
		
		if (answersService.deleteAnswers(answersVO) > 0) {
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		return resultMap;			
	}
	
}
