package seoul.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.service.BBSService;
import seoul.admin.service.NoticeService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

@Controller
@RequestMapping("/front/")
public class MainController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private BBSService bbsService;
	
	@RequestMapping("main.do")
	public String main(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{		
		
		noticeVO.setPageSize(5);

		//Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		//MemberVO mem = (MemberVO)ret;
		
		SubjectVO subjectVO = new SubjectVO();
		
		subjectVO.setPageSize(5);
		
		BBSVO bbsVO = new BBSVO();
		
		bbsVO.setPageSize(5);
		bbsVO.setType("S");
		
		model.addAttribute("c_list", bbsService.getBBSList(bbsVO));		
		bbsVO.setType("P");
		
		List<BBSVO> list = bbsService.getBBSList(bbsVO);
		
		for (int i=0 ; i < list.size() ; i++)
		{
			list.set(i, bbsService.getBBS(list.get(i),false));   
		}
		
		model.addAttribute("p_list", list);		
		
		noticeVO.setQuery("OPEN = 'Y' ");
		
		model.addAttribute("n_list", noticeService.getNoticeList(noticeVO));
		model.addAttribute("s_list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", noticeVO);
		//model.addAttribute("page", noticeVO.getPagingVO());
		return "front/main.main";
	}
	
	@RequestMapping("sitemap.do")
	public String sitemap(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{		
		
		
		return "front/sitemap.main";
	}
	
}
