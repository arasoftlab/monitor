package seoul.admin.controller;

import java.util.ArrayList;
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

import seoul.admin.service.MonitorsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.SubjectVO;

@Controller
@RequestMapping("/admin/subject/applicant")
public class SubjectApplicantController {
	
	@Autowired
	private MonitorsService monitorsService;
	
	
	@Autowired
	private SubjectInfoService subjectinfoService;
	
	@RequestMapping("apply.do")
	public @ResponseBody Map<String, Object> apply(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="is_select") String is_select ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MonitorsVO monitorsVO = new MonitorsVO();
			
			monitorsVO.setIdx(arrayParams.get(i));
			monitorsVO.setIs_selection(is_select);
			
			System.out.println(" 동작정보 : " + is_select);
			
			if(is_select.equals("D")) {
				System.out.println("삭제:" + monitorsVO.getIdx() );
				monitorsService.deleteMonitors(monitorsVO);
			}else {
				System.out.println("수정:" + monitorsVO.getIdx() );
				if (!(monitorsService.updateMonitorsApply(monitorsVO) > 0))
				{
					// 한번이라도 업데이트가 실패하면 실패를 리턴함.
					resultMap.put("result", "fail");
					return resultMap;
				}
				
			}
		}
		
	
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
	
	@RequestMapping("team_change.do")
	public @ResponseBody Map<String, Object> team_change(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="team_num") String team_num ,
			@RequestParam(value="description_arr[]") List<String> disc_arrayParams) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MonitorsVO monitorsVO = new MonitorsVO();
			
			monitorsVO.setIdx(arrayParams.get(i));
			monitorsVO.setTeam_num(team_num.trim());
			monitorsVO.setDescription(disc_arrayParams.get(i));
			
			if (!(monitorsService.updateMonitors(monitorsVO) > 0))
			{
				// 한번이라도 업데이트가 실패하면 실패를 리턴함.
				resultMap.put("result", "fail");
				return resultMap;
			}
		}
		
	
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute MonitorsVO monitorsVO) throws Exception{

		SubjectVO subjectVO = new SubjectVO();		
		subjectVO.setSubject_id(monitorsVO.getSubject_id());
		
		System.out.println(monitorsVO.toString());
		System.out.println(subjectVO.toString());
		
		List<MonitorsVO> list = monitorsService.getMonitorsList(monitorsVO);
		List<MonitorsVO> list2 = monitorsService.getMonitorsApplyList(monitorsVO);
		
		model.addAttribute("temp", list);
		model.addAttribute("list", list2);
		model.addAttribute("vo", subjectinfoService.getSubject(subjectVO));
		
		//model.addAttribute("apply_total" , monitorsService.getMonitorsCnt(monitorsVO));
		
		model.addAttribute("page", monitorsVO.getPagingVO());
		model.addAttribute("now_page", monitorsVO);

		//model.addAttribute("total_cnt" , monitorsService.getMonitorsCnt(monitorsVO));
		
		return "admin/subjects/applicant/view.admin";
	}
	
	@RequestMapping("team_view.do")
	public String team_view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		SubjectVO vo = subjectinfoService.getSubject(subjectVO);
		
		MonitorsVO monitorsVO = new MonitorsVO();		
		monitorsVO.setSubject_id(subjectVO.getSubject_id());

		List<Integer> apply_list = new  ArrayList<Integer>();
		List<Integer> selected_list = new ArrayList<Integer>();
		
		// 신청 카운트 & 선정카운트 가져오기.
		for (int i = 0 ; i < vo.getTeam_cnt() ; i++)
		{
			monitorsVO.setQuery("team_num="+(i+1) );
			apply_list.add( monitorsService.getMonitorsCnt(monitorsVO));
			
			monitorsVO.setQuery("team_num="+(i+1)+" AND is_selection = 'Y' " );
			selected_list.add(monitorsService.getMonitorsCnt(monitorsVO));
		}
		
		
		model.addAttribute("apply_list",apply_list);
		model.addAttribute("selected_list",selected_list);
		model.addAttribute("vo", subjectinfoService.getSubject(subjectVO));

		return "admin/subjects/applicant/team_view.ajax";
	}	
}
