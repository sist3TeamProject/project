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
        int rowSize = 10;
        int start = (page * rowSize) - (rowSize - 1);

        List<Checklist> list = em.createQuery("select c from Checklist c order by c.checklistId", Checklist.class)
                .setFirstResult(start)
                .setMaxResults(rowSize)
                .getResultList();

        Integer totalList = em.createQuery("select count(c.checklistId) from Checklist c", Long.class)
                .getSingleResult().intValue();

        int totalPage = (int) Math.ceil(totalList / 10.0);

        boolean prev = page > 1;   //페이지 감소하는 버튼 출력여부
        boolean next = page < totalPage; // 페이지 증가버튼 출력여부

        int endPage = page + 2;
        if (endPage >= totalPage)
            endPage = totalPage;

        int startPage = endPage - 4;
        if (startPage < 1)
            startPage = 1;

        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("checklistData", list);
    }


}
