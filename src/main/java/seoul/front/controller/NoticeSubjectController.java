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
import common.vo.PagingVO;
import seoul.admin.service.AdminSettingService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/front/notice/subject")
public class NoticeSubjectController {
	
	@Autowired
	private MonitorsService monitorsService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminSettingService adminSettingService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		
		noticeVO.setQuery("type != 'S' AND OPEN = 'Y' ");
		List<NoticeVO> list = noticeService.getNoticeListSubjectOnly(noticeVO);
				
		//한번에 두개를 받아와서 합쳐 준다. f 형태 v 형태 
		
		model.addAttribute("list", list);
		model.addAttribute("vo", noticeVO);
		
		PagingVO page = noticeVO.getPagingVO();
		
		model.addAttribute("page", noticeVO.getPagingVO());
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
		}
		
		return "front/notice/subject/list.default";
	}
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		model.addAttribute("vo", noticeService.getNotice(noticeVO, true));
		
		noticeVO = noticeService.getNotice(noticeVO, false);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();		
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		
		
		MonitorsVO monitorsVO = new MonitorsVO();
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
			model.addAttribute("member_poll", mem.getPoll_num());
			
			model.addAttribute("now_poll" , adminSettingVO.getPoll_num());
			
						
			if (noticeVO.getSubjectVO() != null)
			{
				monitorsVO.setMember_id(mem.getId());
				monitorsVO.setSubject_id(noticeVO.getSubjectVO().getSubject_id());
								
				monitorsVO = monitorsService.getMonitors(monitorsVO);
			
				if (monitorsVO != null)
				{
					model.addAttribute("m_vo" , monitorsVO);
				}			
				
				MonitorsVO monitorsVO_temp = new MonitorsVO();
				monitorsVO_temp.setSubject_id(noticeVO.getSubjectVO().getSubject_id());
				model.addAttribute("apply_total" , monitorsService.getMonitorsCnt(monitorsVO_temp));
				
				
				List<MonitorsVO> list = monitorsService.getMonitorsList(monitorsVO_temp);				
				model.addAttribute("list", monitorsService.getMonitorsApplyList(monitorsVO_temp));

				
			}
		}
				
		return "front/notice/subject/view.default";
	}
	
	@RequestMapping(value="apply.do" , method=RequestMethod.POST)	
	public @ResponseBody Map<String, Object> apply(@ModelAttribute MonitorsVO monitorsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			//MonitorsVO monitorsVO = new MonitorsVO();	
			monitorsVO.setMember_id(mem.getId());
			monitorsVO.setPoll_num(mem.getPoll_num());
			//monitorsVO.setSubject_id(subject_id);
			
			//monitorsVO = monitorsService.getMonitors(monitorsVO);
			
			if (monitorsService.insertMonitors(monitorsVO) > 0) {
				resultMap.put("result", "success");
			}else{
				resultMap.put("result", "fail");
			}
			
		}else{
			resultMap.put("result", "sess_error");
		}

		return resultMap;
	}
	
	@RequestMapping(value="delete.do" , method=RequestMethod.POST)	
	public @ResponseBody Map<String, Object> delete(@ModelAttribute MonitorsVO monitorsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
				
		if (monitorsService.deleteMonitors(monitorsVO) > 0) {
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		return resultMap;			
	}
	@RequestMapping(value="update.do" , method=RequestMethod.POST)	
	public @ResponseBody Map<String, Object> update(@ModelAttribute MonitorsVO monitorsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			//MonitorsVO monitorsVO = new MonitorsVO();	
			monitorsVO.setMember_id(mem.getId());
			//monitorsVO.setSubject_id(subject_id);
			//monitorsVO = monitorsService.getMonitors(monitorsVO);
			
			if (monitorsService.updateMonitors(monitorsVO) > 0) {
				resultMap.put("result", "success");
			}else{
				resultMap.put("result", "fail");
			}
			
		}else{
			resultMap.put("result", "sess_error");
		}
		
		return resultMap;	
	}
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		
		model.addAttribute("vo", noticeService.getNotice(noticeVO, false));

		noticeVO = noticeService.getNotice(noticeVO, false);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		MonitorsVO monitorsVO = new MonitorsVO();
		
		if (mem != null)
		{
			monitorsVO.setMember_id(mem.getId());
			monitorsVO.setSubject_id(noticeVO.getSubjectVO().getSubject_id());
			monitorsVO = monitorsService.getMonitors(monitorsVO);
			
			if (monitorsVO != null)
			{
				model.addAttribute("m_vo" , monitorsVO);
			}
		}
				
		return "front/notice/subject/modify.default";
	}
	
}
