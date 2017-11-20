package seoul.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.SessionContants;
import seoul.admin.service.BBSService;
import seoul.admin.service.CommentService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/admin/community/photo")
public class CommunityPhotoController {
	
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private BBSService bbsService;
	
	@Autowired
	private CommentService commentService;

	
	@RequestMapping("plist.do")
	public String plist(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		bbsVO.setType("P");
		
		List<BBSVO> list= bbsService.getBBSList(bbsVO);
		
		for (int i=0 ; i < list.size() ; i++)
		{
			list.set(i, bbsService.getBBS(list.get(i),false));   
		}
		
		model.addAttribute("list", list);
//		model.addAttribute("vo", noticeVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		return "admin/community/photo/plist.admin";
	}
	
	@RequestMapping("pmodify.do")
	public String pmodify(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
		}
		
		if(!BaseUtil.isEmpty(bbsVO.getCont_uuid())){
			bbsVO = bbsService.getBBS(bbsVO, false);
			model.addAttribute("vo", bbsVO);
		}
		else{
			bbsVO.setBbs_id("0");			
			model.addAttribute("vo", bbsVO);
		}

		
		return "admin/community/photo/pmodify.admin";
	}
	@RequestMapping("pview.do")
	public String pview(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
		}
		
		if(!BaseUtil.isEmpty(bbsVO.getCont_uuid())){
			bbsVO = bbsService.getBBS(bbsVO, false);
			model.addAttribute("vo", bbsVO);
		}
		else{
			bbsVO.setBbs_id("0");			
			model.addAttribute("vo", bbsVO);
		}
		
		return "admin/community/photo/pview.admin";
	}
}
