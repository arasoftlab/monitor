package seoul.admin.service;

import java.util.List;

import common.vo.CommonVO;

/***
 * 2017 12 12 vo로 변경
 * @author JD
 *
 */
public interface ExcelService {
	//인자를 vo로 변경함
	List<Object> getAllObjects(String target , CommonVO commonVO);
	
}
