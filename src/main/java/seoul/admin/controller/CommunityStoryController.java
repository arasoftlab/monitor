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
//import seoul.admin.service.SubjectService;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.CommentVO;
//import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/admin/community/story")
public class CommunityStoryController {
	
	//@Autowired
	//private SubjectService subjectService;
	
	@Autowired
	private BBSService bbsService;
	
	@Autowired
	private CommentService commentService;

	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{

		//이야기 게시판은 S 
		bbsVO.setType("S");
				
		model.addAttribute("list", bbsService.getBBSList(bbsVO));
//		model.addAttribute("vo", noticeVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		return "admin/community/story/list.admin";
	}
	
	@RequestMapping("smodify.do")
	public String smodify(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
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
		
		return "admin/community/story/smodify.admin";
	}
	@RequestMapping("sview.do")
	public String sview(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		bbsVO = bbsService.getBBS(bbsVO, true);		
		model.addAttribute("vo", bbsVO);
		
		
		
		CommentVO commentVO = new CommentVO();		

		
		commentVO.setQuery("bbs_id="+bbsVO.getBbs_id());
		List<CommentVO> list = commentService.getCommentList(commentVO);		
		model.addAttribute("c_list", list);
		model.addAttribute("c_cnt", list.size());
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
		}
		
		return "admin/community/story/sview.admin";
	}
}
