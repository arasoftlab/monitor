package seoul.admin.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import common.SessionContants;
import seoul.admin.service.BBSService;
import seoul.admin.service.CommentService;
import seoul.admin.service.ExcelService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/admin/ex")
public class ExcelController {
	
	@Autowired
	private ExcelService excelService;
	
	//엑셀파일 변환 및 다운로드
	@RequestMapping("excel_transform_controller.do")
	public String excelTransform(@RequestParam String target,@RequestParam String subject_id, Map<String,Object> ModelMap ) throws Exception{
	List<Object> excelList= null;
	    excelList = excelService.getAllObjects(target , subject_id);
	    
	    ModelMap.put("excelList", excelList);
	    ModelMap.put("target", target);
	    return "excelView";
	}
}
