package seoul.admin.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.vo.CommonVO;
import seoul.admin.service.ExcelService;

@Controller
@RequestMapping("/admin/ex")
public class ExcelController {
	
	@Autowired
	private ExcelService excelService;
	
	/***
	 * vo 형태로 변경함
	 * @param target
	 * @param subject_id
	 * @param commonVO
	 * @param ModelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("excel_transform_controller.do")
	public String excelTransform(@RequestParam String target,
			@RequestParam String subject_id, 
			CommonVO commonVO,
			Map<String,Object> ModelMap ) throws Exception{
		
	//System.out.println(commonVO.toString());
	
	List<Object> excelList= null;
	    excelList = excelService.getAllObjects(target , commonVO);
	    
	    ModelMap.put("excelList", excelList);
	    ModelMap.put("target", target);
	    return "excelView";
	}
}
