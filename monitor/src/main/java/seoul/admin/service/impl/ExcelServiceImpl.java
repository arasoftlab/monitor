package seoul.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import seoul.admin.dao.MonitorsDAO;
import seoul.admin.service.AnswersService;
import seoul.admin.service.ExcelService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionVO;

public class ExcelServiceImpl implements ExcelService{
	
	private MonitorsDAO monitorsDAO;
	
	@Autowired
	private MonitorsService monitorsService;
	
	@Autowired
	private AnswersService answersService;

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService 	optionService;
	

	
	public void setMonitorsDAO(MonitorsDAO monitorsDAO) {
		this.monitorsDAO = monitorsDAO;
	}
	
	
	public MonitorsVO getMonitors(MonitorsVO monitorsVO) {		
		monitorsVO = monitorsDAO.getMonitors(monitorsVO);	
		return monitorsVO;
	}
	
	
	@Override
	public List<Object> getAllObjects(String target , String subject_id)
	{	
		List<Object> list = new ArrayList<Object>();
		
		if (target.equals("applicant")) 
		{
			MonitorsVO monitorsVO = new MonitorsVO();			
			monitorsVO.setSubject_id(subject_id);
			
			list.add(monitorsService.getMonitorsList(monitorsVO));
		}
		else if (target.equals("answers"))
		{
			AnswersVO answersVO = new AnswersVO();			
			answersVO.setSubject_id(subject_id);
			
			// 엔서스 VO 리스트 추가
			list.add(answersService.getAnswerList(answersVO));
			
			
     		QuestionVO questionVO = new QuestionVO();
    		questionVO.setSubject_id(subject_id);
    		
    		List<QuestionVO> q_list = questionService.getQuestionList(questionVO);
    		
    		
    		for (int i = 0 ; i < q_list.size() ; i++ )
    		{
    			// option 리스트각 하나당 갖고있는 이미지를 객체에 다시 할당하여 넣어준다.
    			List <OptionVO> optionList = optionService.getOptionList(new OptionVO(q_list.get(i).getQuestion_id()));
    	
    			for (int j =0 ; j < optionList.size() ; j++)
    			{
    				optionList.set(j, optionService.getOption(optionList.get(j)));   
    			}
    			
    			q_list.get(i).setOptionVO(optionList);

    		}
    		
    		list.add(q_list);
			
		}
		
		
		
		return list;
	}
		
}


