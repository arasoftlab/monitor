package seoul.front.controller;

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

import common.SessionContants;
import seoul.admin.service.BBSService;
import seoul.admin.service.CommentService;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.CommentVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/front/community")
public class CommunityController {
	
	@Autowired
	private BBSService bbsService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/photo/photo_list.do")
	public String photo_list(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
				
		bbsVO.setType("P");
		
		List<BBSVO> list= bbsService.getBBSList(bbsVO);
		
		for (int i=0 ; i < list.size() ; i++)
		{
			list.set(i, bbsService.getBBS(list.get(i),false));   
		}
		
		model.addAttribute("list", list);
//		model.addAttribute("vo", noticeVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		return "front/community/photo/list.default";
	}
	
	@RequestMapping("/photo/write.do")
	public String write(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{

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
		
		return "front/community/photo/write.default";
	}
	
	@RequestMapping("/photo/view.do")
	public String view(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
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
		
		return "front/community/photo/view.default";
	}
	
	
	@RequestMapping("/story/story_list.do")
	public String story_list(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
		//이야기 게시판은 S 
		bbsVO.setType("S");
		
		model.addAttribute("list", bbsService.getBBSList(bbsVO));
//		model.addAttribute("vo", noticeVO);
		model.addAttribute("page", bbsVO.getPagingVO());
		return "front/community/story/list.default";
	}
	
	@RequestMapping("/story/write.do")
	public String story_write(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		
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
		
		return "front/community/story/write.default";
	}
	
	@RequestMapping("/story/save.do")
	public @ResponseBody Map<String, Object> save(@ModelAttribute BBSVO bbsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(bbsService.saveBBS(bbsVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping("/story/delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute BBSVO bbsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(bbsService.deleteBBS(bbsVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}	
	
	@RequestMapping("/story/view.do")
	public String story_view(Model model, @ModelAttribute BBSVO bbsVO , 
			@RequestParam(value="password", defaultValue="") String password) throws Exception{

		bbsVO = bbsService.getBBS(bbsVO, true);		
		model.addAttribute("vo", bbsVO);
		
		if (bbsVO.getIs_password() != null)
		{
			if (bbsVO.getPassword().equals(password))
				model.addAttribute("is_secret", "Y");	
			else
				model.addAttribute("is_secret", "N");
		}
		
		CommentVO commentVO = new CommentVO();		

		
		commentVO.setQuery("bbs_id="+bbsVO.getBbs_id());
		List<CommentVO> list = commentService.getCommentList(commentVO);		
//		model.addAttribute("c_list", commentService.getCommentList(commentVO));

		model.addAttribute("c_list", list);
		model.addAttribute("c_cnt", list.size());
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{
			model.addAttribute("member_id", mem.getId());
		}
		
		return "front/community/story/view.default";
	}
	
	
	// 댓글 달기 
	@RequestMapping("/commentinsert.do")
	public @ResponseBody Map<String, Object> commentinsert(@ModelAttribute CommentVO commentVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(commentService.saveComment(commentVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 댓글 달기 
	@RequestMapping("/commentdelete.do")
	public @ResponseBody Map<String, Object> commentdelete(@ModelAttribute CommentVO commentVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(commentService.deleteComment(commentVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	@RequestMapping("/story/secret.do")
	public String secret(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
				
		model.addAttribute("vo",bbsVO);
		
		return "front/community/story/secret.ajax";
	}
	
	@RequestMapping("/story/secret_chk.do")
	public @ResponseBody Map<String, Object> secret_chk(Model model, @ModelAttribute BBSVO bbsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		String temp = bbsVO.getPassword();
		
		BBSVO bbs_temp = bbsService.getBBS(bbsVO,false);
		
		if(bbs_temp.getPassword().equals(temp)){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
