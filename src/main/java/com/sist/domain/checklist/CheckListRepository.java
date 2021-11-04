package com.sist.domain.checklist;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class CheckListRepository {

    /*private final ChecklistMapper mapper;

    public void getCheckListData(int page, Model model) {

        int rowSize = 8;
        int start = (page * rowSize) - (rowSize - 1);
        int end = page * rowSize;

        List<Checklist> checkListData = mapper.getCheckListData(start, end);
        int totalPage = mapper.getTotalPage();

        model.addAttribute("checklistData", checkListData);
        model.addAttribute("totalPage", totalPage);
    }*/

    @PersistenceContext
    private EntityManager em;

    public void getAllCheckList(int page, Model model) {
        int rowSize = 7;
        int start = (page * rowSize) - (rowSize - 1);
        int displayNum = 5;

        List<Checklist> list = em.createQuery("select c from Checklist c order by c.checklistId", Checklist.class)
                .setFirstResult(start)
                .setMaxResults(rowSize)
                .getResultList();

        Integer totalList = em.createQuery("select count(c.checklistId) from Checklist c", Long.class)
                .getSingleResult().intValue();

        int totalPage = (int) Math.ceil(totalList / (double)rowSize);

        int endPage = ((int)Math.ceil((page / (double)displayNum)) * displayNum);

        int startPage = endPage - displayNum + 1;

        if (endPage > totalPage)
            endPage = totalPage;

        if (startPage < 0)
            startPage = 1;

        boolean prev = startPage != 1;   //페이지 감소하는 버튼 출력여부
        boolean next = endPage < totalPage; // 페이지 증가버튼 출력여부


        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("checklistData", list);
    }

    public Checklist getCheckList(int id) {

        Checklist checklist = em.find(Checklist.class, id);

        return checklist;
    }


}
