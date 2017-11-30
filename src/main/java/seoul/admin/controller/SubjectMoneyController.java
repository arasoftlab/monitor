package seoul.admin.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.SubjectVO;

@Controller
@RequestMapping("/admin/subject/money")
public class SubjectMoneyController {
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SubjectInfoService subjectinfoService;
	
	@Autowired
	private MonitorApplyService monitorApplyService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute MonitorApplyVO monitorApplyVO) throws Exception{
		
		monitorApplyVO.setQuery("subject_id = '"+monitorApplyVO.getSubject_id()+"'");
		
		List<MonitorApplyVO> list = monitorApplyService.getMonitorApplyList(monitorApplyVO);
		
		SubjectVO subjectVO  = new SubjectVO();
		
		subjectVO.setSubject_id(monitorApplyVO.getSubject_id());
		
		model.addAttribute("s_vo" , subjectinfoService.getSubject(subjectVO));
		
		model.addAttribute("list" , list);
				
		model.addAttribute("vo", monitorApplyVO);
		model.addAttribute("page", monitorApplyVO.getPagingVO());

		return "admin/subjects/money/s_list.admin";
	}
	
	
	@RequestMapping("all_list.do")
	public String all_list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		//List<SubjectVO> list = subjectService.getSubjectMoneyList(subjectVO);
		
		model.addAttribute("list" , subjectService.getSubjectMoneyList(subjectVO));
				
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());

		return "admin/subjects/money/list.admin";
	}
	
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());

		return "admin/subjects/money/view.admin";
	}
	
	@RequestMapping("apply.do")
	public @ResponseBody Map<String, Object> apply(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="is_select") String is_select ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MonitorApplyVO monitorApplyVO = new MonitorApplyVO();
			
			monitorApplyVO.setIdx(arrayParams.get(i));
			//subjectVO.setIs_selection(is_select);
			
			System.out.println(" 동작정보 : " + is_select);
			
			if(is_select.equals("D")) {
				System.out.println("삭제:" + monitorApplyVO.getIdx() );
				monitorApplyService.deleteMonitorApply(monitorApplyVO);
			}else {
				//System.out.println("수정:" + monitorsVO.getIdx() );
				//if (!(subjectinfoService.updateMonitorsApply(monitorsVO) > 0))
				//{
					// 한번이라도 업데이트가 실패하면 실패를 리턴함.
				//	resultMap.put("result", "fail");
				//	return resultMap;
				//}
				
			}
		}
		
	
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
}
