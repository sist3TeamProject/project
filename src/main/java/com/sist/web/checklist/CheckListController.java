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

@Controller
@RequiredArgsConstructor
public class CheckListController {

    private final CheckListRepository repository;

    @GetMapping("checklist/checklist.do")
    public String checklistAll(Model model, @RequestParam(defaultValue = "1") int page) {

        repository.getAllCheckList(page, model);


        model.addAttribute("main_jsp", "../checklist/checklistdata.jsp");
        return "main/main";
    }

    @GetMapping("/{id}/checklist.do")
    public String checklist(@PathVariable int id, Model model) {

        Checklist checkList = repository.getCheckList(id);
        model.addAttribute(checkList);

        model.addAttribute("main_jsp", "../checklist/checklist.jsp");
        return "main/main";
    }
}
