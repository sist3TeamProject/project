package com.sist.domain.checklist;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ChecklistMapper {

    @Select("select * from (select c.*, rownum num from " +
            "(select * from checklist order by checklist_id) c) " +
            "where num between #{start} and #{end}")
    List<Checklist> getCheckListData(@Param("start") int start, @Param("end") int end);

    @Select("select count(checklist_id) from checklist")
    int getTotalPage();
}
