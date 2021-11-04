package com.sist.web.checklist;

import com.sist.domain.checklist.CheckListRepository;
import com.sist.domain.checklist.Checklist;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

//@Controller
//@RequiredArgsConstructor
public class CheckListController {

    private final CheckListRepository repository;

    @GetMapping("checklist/checklist.do")
    public String checklist(Model model, @RequestParam(defaultValue = "1") int page) {

        repository.getAllCheckList(page, model);

        model.addAttribute("test", "test");

        model.addAttribute("main_jsp", "../checklist/checklistdata.jsp");
        return "main/main";

    }
}
