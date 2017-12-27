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
@RequestMapping("/admin/community")
public class AdminCommunityController {
	
	//@Autowired
	//private SubjectService subjectService;
	
	@Autowired
	private BBSService bbsService;
	
	@Autowired
	private CommentService commentService;

	@RequestMapping("alllist.do")
	public String alllist(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{

		bbsVO.setType("");
				
		List<BBSVO> bl = bbsService.getBBSList(bbsVO);
		model.addAttribute("list", bl);
		model.addAttribute("vo", bbsVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		//System.out.println(bl.toString());
		//System.out.println(bbsVO.toString());
		
		return "admin/community/story/list.admin";
	}
	
	@RequestMapping("faqlist.do")
	public String faqlist(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{

		bbsVO.setType("F");
				
		List<BBSVO> bl = bbsService.getBBSList(bbsVO);
		model.addAttribute("list", bl);
		model.addAttribute("vo", bbsVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		//System.out.println(bl.toString());
		//System.out.println(bbsVO.toString());
		
		return "admin/community/story/list.admin";
	}
	
	
	@RequestMapping("photolist.do")
	public String photolist(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		bbsVO.setType("P");
		
		List<BBSVO> list= bbsService.getBBSList(bbsVO);
		
		for (int i=0 ; i < list.size() ; i++)
		{
			list.set(i, bbsService.getBBS(list.get(i),false));   
		}
		
		model.addAttribute("list", list);
		model.addAttribute("vo", bbsVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		return "admin/community/photo/plist.admin";
	}
	
	@RequestMapping("storylist.do")
	public String storylist(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{

		bbsVO.setType("S");
				
		List<BBSVO> bl = bbsService.getBBSList(bbsVO);
		model.addAttribute("list", bl);
		model.addAttribute("vo", bbsVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		
		//System.out.println(bl.toString());
		//System.out.println(bbsVO.toString());
		
		return "admin/community/story/list.admin";
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
		
		bbsVO = bbsService.getBBS(bbsVO, false);		
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
