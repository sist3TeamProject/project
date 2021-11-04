package com.sist.domain.checklist;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
public class Checklist {

    @Id
    @Column(name = "CHECKLIST_ID")
    private int checklistId; // PK

    private String title; // 제목

    @Lob
    private String content; // 내용

    private String department; // 진료 부서

    private int hit; // 조회수

    public void hitCountUp() {
        hit = hit + 1;
    }

    @Override
    public String toString() {
        return "Checklist{" +
                "checklistId=" + checklistId +
                ", title='" + title + '\'' +
                ", department='" + department + '\'' +
                ", hit=" + hit +
                '}';
    }
}
