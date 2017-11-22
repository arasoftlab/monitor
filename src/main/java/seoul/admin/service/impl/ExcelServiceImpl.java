package seoul.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import seoul.admin.dao.MonitorsDAO;
import seoul.admin.service.AnswersService;
import seoul.admin.service.ExcelService;
import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MemberManagerVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionVO;
import seoul.member.MemberService;

public class ExcelServiceImpl implements ExcelService{
	
	private MonitorsDAO monitorsDAO;
	
	
	@Autowired
	private MonitorsService monitorsService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AnswersService answersService;

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService 	optionService;
	
	@Autowired
	private MonitorApplyService monitorApplyService;

	
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
			
			monitorsVO.setPageSize(10000);
			
			list.add(monitorsService.getMonitorsApplyList(monitorsVO));
		}
		else if (target.equals("applicant_apply"))
		{
			MonitorsVO monitorsVO = new MonitorsVO();			
			monitorsVO.setSubject_id(subject_id);
			
			monitorsVO.setPageSize(10000);
			monitorsVO.setIs_selection("Y");
			
			list.add(monitorsService.getMonitorsApplyList(monitorsVO));
		}
		else if (target.equals("answers"))
		{
			AnswersVO answersVO = new AnswersVO();			
			answersVO.setSubject_id(subject_id);
			
			answersVO.setPageSize(10000);
 
			list.add(answersService.getAnswerList(answersVO));
			
			
     		QuestionVO questionVO = new QuestionVO();
    		questionVO.setSubject_id(subject_id);
    		
    		List<QuestionVO> q_list = questionService.getQuestionList(questionVO);
    		
    		
    		for (int i = 0 ; i < q_list.size() ; i++ )
    		{
 
    			List <OptionVO> optionList = optionService.getOptionList(new OptionVO(q_list.get(i).getQuestion_id()));
    	
    			for (int j =0 ; j < optionList.size() ; j++)
    			{
    				optionList.set(j, optionService.getOption(optionList.get(j)));   
    			}
    			
    			q_list.get(i).setOptionVO(optionList);

    		}
    		
    		list.add(q_list);
			
		}else if (target.equals("memberManager")){
			
			MemberManagerVO memberManagerVO = new MemberManagerVO();
			
			memberManagerVO.setPageSize(10000);
			memberManagerVO.setQuery("grade='secession'");
			
			List<MemberManagerVO> m_list = memberService.getMemberManagerlist(memberManagerVO);
			
			list.add(m_list);
		}else if (target.equals("money")){
			
			MonitorApplyVO monitorApplyVO = new MonitorApplyVO();
						
			monitorApplyVO.setQuery("subject_id = '"+subject_id+"'");

			monitorApplyVO.setPageSize(10000);
			
			list.add(monitorApplyService.getMonitorApplyList(monitorApplyVO));
		}
		
		
		
		
		return list;
	}
		
}


