package com.sist.web.checklist;

import com.sist.domain.checklist.CheckListRepository;
import com.sist.domain.checklist.Checklist;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

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
    public String checklist(@PathVariable int id, Model model, @CookieValue(name = "visited", required = false) String visited, HttpServletResponse response) {

        boolean firstVisit = false;
        Cookie cookie;

        if (visited == null) { // 첫방문 쿠키 없을때
            firstVisit = true;
            cookie = new Cookie("visited", "(" + id + ")");
            cookie.setMaxAge(1 * 24 * 60 * 60);  // day * hour * minute * second
            ;
        } else if(!visited.contains("(" + id +")")){ // 쿠키 있지만 첫방문
            firstVisit = true;
            cookie = new Cookie("visited", visited + "_(" + id + ")");
            cookie.setMaxAge(1 * 24 * 60 * 60);
        } else {
            cookie = new Cookie("visited", visited);
        }
        response.addCookie(cookie);

        Checklist checkList = repository.getCheckList(id, firstVisit);

        model.addAttribute(checkList);
        model.addAttribute("main_jsp", "../checklist/checklist.jsp");
        return "main/main";
    }
}
