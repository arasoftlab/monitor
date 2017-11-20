// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SubjectController.java

package seoul.admin.controller;

import org.springframework.ui.Model;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.SubjectVO;

public class SubjectController
{

    public SubjectController()
    {
    }

    public String list(Model model, SubjectVO subjectVO)
        throws Exception
    {
        model.addAttribute("list", subjectService.getSubjectList(subjectVO));
        model.addAttribute("vo", subjectVO);
        model.addAttribute("page", subjectVO.getPagingVO());
        return "admin/subjects/list.admin";
    }

    private SubjectService subjectService;
}
