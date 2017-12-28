package seoul.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.NoticeService;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/notice/")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		noticeVO.setPageSize(15);
		model.addAttribute("list", noticeService.getNoticeList(noticeVO));
		model.addAttribute("vo", noticeVO);
		model.addAttribute("page", noticeVO.getPagingVO());
		return "admin/notice/list.admin";
	}
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		model.addAttribute("vo", noticeService.getNotice(noticeVO, false));
		return "admin/notice/view.admin";
	}
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		
		if(!BaseUtil.isEmpty(noticeVO.getNotice_id()) && noticeVO.getNotice_id() != 0){
			noticeVO = noticeService.getNotice(noticeVO, false);
			model.addAttribute("vo", noticeVO);
			model.addAttribute("unLinkedSubjectList", noticeService.getUnLinkedSubjectList(noticeVO));
		}
		else{
			model.addAttribute("unLinkedSubjectList", noticeService.getUnLinkedSubjectList(noticeVO));			
			noticeVO.setType("");
			model.addAttribute("vo", noticeVO);		
		}

		return "admin/notice/modify.admin";
	}
	
	@RequestMapping("save.do")
	public @ResponseBody Map<String, Object> save(@ModelAttribute NoticeVO noticeVO) throws Exception{
		
		System.out.println(" 저장되는 공지 내용 확인 : " + noticeVO);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int nVO = noticeService.saveNotice(noticeVO);
		
		if(nVO > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute NoticeVO noticeVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(noticeService.deleteNotice(noticeVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
 
	@RequestMapping("unlinkrefresh.do")
	public String unlinkrefresh(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{		
		
		List<SubjectVO> retList =  noticeService.getUnLinkedSubjectList(noticeVO);
				
		model.addAttribute("vo", noticeVO);
		model.addAttribute("unLinkedSubjectList", retList);
		
		return "admin/notice/unlinkajax.ajax";
	}
}
