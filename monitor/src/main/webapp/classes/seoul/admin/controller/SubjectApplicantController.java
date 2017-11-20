// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SubjectApplicantController.java

package seoul.admin.controller;

import java.util.*;
import org.springframework.ui.Model;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.SubjectVO;

public class SubjectApplicantController
{

    public SubjectApplicantController()
    {
    }

    public Map apply(Model model, List arrayParams, String is_select)
        throws Exception
    {
        Map resultMap = new HashMap();
        for(int i = 0; i < arrayParams.size(); i++)
        {
            MonitorsVO monitorsVO = new MonitorsVO();
            monitorsVO.setIdx((String)arrayParams.get(i));
            monitorsVO.setIs_selection(is_select);
            if(monitorsService.updateMonitorsApply(monitorsVO) <= 0)
            {
                resultMap.put("result", "fail");
                return resultMap;
            }
        }

        resultMap.put("result", "success");
        return resultMap;
    }

    public Map team_change(Model model, List arrayParams, String team_num, List disc_arrayParams)
        throws Exception
    {
        Map resultMap = new HashMap();
        for(int i = 0; i < arrayParams.size(); i++)
        {
            MonitorsVO monitorsVO = new MonitorsVO();
            monitorsVO.setIdx((String)arrayParams.get(i));
            monitorsVO.setTeam_num(Integer.parseInt(team_num));
            monitorsVO.setDescription((String)disc_arrayParams.get(i));
            if(monitorsService.updateMonitors(monitorsVO) <= 0)
            {
                resultMap.put("result", "fail");
                return resultMap;
            }
        }

        resultMap.put("result", "success");
        return resultMap;
    }

    public String view(Model model, MonitorsVO monitorsVO)
        throws Exception
    {
        SubjectVO subjectVO = new SubjectVO();
        subjectVO.setSubject_id(monitorsVO.getSubject_id());
        List list = monitorsService.getMonitorsList(monitorsVO);
        model.addAttribute("list", monitorsService.getMonitorsApplyList(monitorsVO));
        model.addAttribute("vo", subjectinfoService.getSubject(subjectVO));
        model.addAttribute("apply_total", Integer.valueOf(monitorsService.getMonitorsCnt(monitorsVO)));
        model.addAttribute("page", monitorsVO.getPagingVO());
        model.addAttribute("now_page", monitorsVO);
        model.addAttribute("total_cnt", Integer.valueOf(monitorsService.getMonitorsCnt(monitorsVO)));
        return "admin/subjects/applicant/view.admin";
    }

    public String team_view(Model model, SubjectVO subjectVO)
        throws Exception
    {
        SubjectVO vo = subjectinfoService.getSubject(subjectVO);
        MonitorsVO monitorsVO = new MonitorsVO();
        monitorsVO.setSubject_id(subjectVO.getSubject_id());
        List apply_list = new ArrayList();
        List selected_list = new ArrayList();
        for(int i = 0; i < vo.getTeam_cnt(); i++)
        {
            monitorsVO.setQuery((new StringBuilder("team_num=")).append(i + 1).toString());
            apply_list.add(Integer.valueOf(monitorsService.getMonitorsCnt(monitorsVO)));
            monitorsVO.setQuery((new StringBuilder("team_num=")).append(i + 1).append(" AND is_selection = 'Y' ").toString());
            selected_list.add(Integer.valueOf(monitorsService.getMonitorsCnt(monitorsVO)));
        }

        model.addAttribute("apply_list", apply_list);
        model.addAttribute("selected_list", selected_list);
        model.addAttribute("vo", subjectinfoService.getSubject(subjectVO));
        return "admin/subjects/applicant/team_view.ajax";
    }

    private MonitorsService monitorsService;
    private SubjectInfoService subjectinfoService;
}
