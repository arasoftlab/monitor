package seoul.front.controller;

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

import com.nhncorp.lucy.security.xss.XssFilter;

import common.SessionContants;
import seoul.admin.service.AdminSettingService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.member.MemberVO;
import util.SessionUtil;

@Controller
@RequestMapping("/front/notice/all")
public class NoticeAllController {
	
	@Autowired
	private MonitorsService monitorsService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminSettingService adminSettingService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		
		
		// xss 필터 적용
        XssFilter xssFilter = XssFilter.getInstance("/lucy-xss-superset.xml");
        noticeVO.setSearchText(xssFilter.doFilter(noticeVO.getSearchText()));
         
		System.out.println("공지 내역 확인 : " + noticeVO.toString());
		
		switch (noticeVO.getStype()) {
			case "Q":
				noticeVO.setQuery(" type = 'Q' AND OPEN = 'Y' ");
				break;
			case "S":
				noticeVO.setQuery(" type in ('F', 'V') AND OPEN = 'Y' ");
				break;
			default:
				noticeVO.setQuery(" OPEN = 'Y' ");
				break;
		}
        
		//noticeVO.setQuery("OPEN = 'Y' ");
		noticeVO.setPageSize(10);
		List<NoticeVO> nl = noticeService.getNoticeList(noticeVO);
				
		model.addAttribute("list", nl);
		model.addAttribute("vo", noticeVO);

		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
			
			model.addAttribute("m_info" , mem);
		}
		
		model.addAttribute("page", noticeVO.getPagingVO());
		return "front/notice/all/list.default";
	}
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		String stype = noticeVO.getStype();
		
		NoticeVO nvo = noticeService.getNotice(noticeVO, true);
		nvo.setStype(stype);
		
		model.addAttribute("vo", nvo);
		System.out.println("공지체크2 뷰 :" + nvo.toString());
		
		
		
		noticeVO = noticeService.getNotice(noticeVO, false);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();		
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		
		
		MonitorsVO monitorsVO = new MonitorsVO();
		
		model.addAttribute("s_vo" , monitorsVO);
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
			model.addAttribute("member_poll", mem.getPoll_num());
			
			model.addAttribute("m_info" , mem);
			
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
				model.addAttribute("list", list);
				
			}
		}
				
		return "front/notice/all/view.default";
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
		String stype = noticeVO.getStype();
		
		NoticeVO nvo = noticeService.getNotice(noticeVO, true);
		nvo.setStype(stype);
		
		model.addAttribute("vo", nvo);
		
		System.out.println("공지체크3 수 :" + nvo.toString());
		
		noticeVO = noticeService.getNotice(noticeVO, false);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();		
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		

		MonitorsVO monitorsVO = new MonitorsVO();
		
		model.addAttribute("s_vo" , monitorsVO);
		
		if (mem != null)
		{
			monitorsVO.setMember_id(mem.getId());
			monitorsVO.setSubject_id(noticeVO.getSubjectVO().getSubject_id());
			monitorsVO = monitorsService.getMonitors(monitorsVO);
			
			model.addAttribute("member_id", mem.getId());
			model.addAttribute("member_poll", mem.getPoll_num());
			
			model.addAttribute("m_info" , mem);
			
			model.addAttribute("now_poll" , adminSettingVO.getPoll_num());
			
			if (monitorsVO != null)
			{
				model.addAttribute("m_vo" , monitorsVO);
			}
			
			MonitorsVO monitorsVO_temp = new MonitorsVO();
			monitorsVO_temp.setSubject_id(noticeVO.getSubjectVO().getSubject_id());
			model.addAttribute("apply_total" , monitorsService.getMonitorsCnt(monitorsVO_temp));
							
			List<MonitorsVO> list = monitorsService.getMonitorsList(monitorsVO_temp);				
			model.addAttribute("list", list);
			
		}
				
		return "front/notice/all/modify.default";
	}
	
}
