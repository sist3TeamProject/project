package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
NNO        NOT NULL NUMBER         
TITLE               VARCHAR2(500)  
CONTENT             CLOB           
WRITER              VARCHAR2(100)  
REGDATE             DATE           
HIT                 NUMBER         
BOARD_FILE          VARCHAR2(2000) 
 */
@Data
public class NoticeVO {
	private int nno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int hit;
	private String boardFile; 
}
