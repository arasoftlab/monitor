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

import seoul.admin.service.NoticeService;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionVO;
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
		
		List<NoticeVO> list = noticeService.getNoticeList(noticeVO);
		
		List<NoticeVO> n_list = noticeService.getNoticeList(noticeVO);
				
		for (int i = 0 ; i < n_list.size() ; i++ )
		{
			n_list.set(i, noticeService.getNotice(n_list.get(i),false)); 
		}
		
		for (int i = 0 ; i < n_list.size() ; i++ ){
			list.get(i).setSubjectVO(n_list.get(i).getSubjectVO());
		}
		
		model.addAttribute("list", list);
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

		if(!BaseUtil.isEmpty(noticeVO.getNotice_id())){
			noticeVO = noticeService.getNotice(noticeVO, false);
			model.addAttribute("vo", noticeVO);
			model.addAttribute("unLinkedSubjectList", noticeService.getUnLinkedSubjectList(noticeVO));
		}
		else{
			noticeVO.setNotice_id("0");
			
			model.addAttribute("vo", noticeVO);
			model.addAttribute("unLinkedSubjectList", noticeService.getUnLinkedSubjectList(noticeVO));			
		}

		return "admin/notice/modify.admin";
	}
	
	@RequestMapping("save.do")
	public @ResponseBody Map<String, Object> save(@ModelAttribute NoticeVO noticeVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(noticeService.saveNotice(noticeVO) > 0){
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
	
	// 과제 리스트를 특정 타입값으로 가져 오는 컨트롤
	// 해당 타입에 맞는 링크되지 않은 리스트가 1개 이하일때 실패
	@RequestMapping("unlinkrefresh.do")
	public String unlinkrefresh(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{		
		
		List<SubjectVO> retList =  noticeService.getUnLinkedSubjectList(noticeVO);
				
		model.addAttribute("vo", noticeVO);
		model.addAttribute("unLinkedSubjectList", retList);
		
		return "admin/notice/unlinkajax.ajax";
	}
}
