package com.sist.vo;
/*
 *  NO         NOT NULL NUMBER        
	ID                  VARCHAR2(100) 
	NAME                VARCHAR2(100) 
	MSG                 CLOB          
	REGDATE             DATE          
	VACCINE             NUMBER        
	UP                  NUMBER        
	DOWN                NUMBER        
	GROUP_ID            NUMBER        
	GROUP_STEP          NUMBER        
	GROUP_TAB           NUMBER        
	ROOT                NUMBER        
	DEPTH               NUMBER   
 */

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReplyVO {
    private int no,vaccine,up,down,group_id,group_step,group_tab,root,depth;
    private String id,msg,dbday;
    private Date regdate;
}
