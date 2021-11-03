package com.sist.domain.checklist;

import lombok.Getter;

import javax.persistence.*;

@Entity
@Getter
public class Checklist {

    @Id
    @Column(name = "CHECKLIST_ID")
    private int checklistId; // PK

    private String title; // 제목

    @Lob
    private String content; // 내용

    private String department; // 진료 부서

    private int hit; // 조회수
}
