package seoul.admin.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import seoul.admin.service.ExcelService;

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
