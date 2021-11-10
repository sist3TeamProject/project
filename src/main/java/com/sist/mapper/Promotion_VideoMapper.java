package com.sist.mapper;
import java.util.*;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.SelectKey;
import com.sist.dao.Promotion_VideoDAO;

import com.sist.vo.*;
public interface Promotion_VideoMapper {
	// 목록 : (페이징 => 인라인뷰) : SELECT
	@Select("SELECT no,subject,name,regdate,hit,num "
			 +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
			 +"FROM (SELECT no,subject,name,regdate,hit "
			 +"FROM board_video ORDER BY no DESC)) "
	         +"WHERE num BETWEEN #{start} AND #{end}")
	  
	  public List<PromotionVO> videoListData(Map map);
	  // 총페이지  : SELECT
	  @Select("SELECT CEIL(COUNT(*)/15.0) FROM board_video")
	  public int videoTotalPage();
	  // 추가 (글쓰기)  : INSERT
	  // 번호 => @SelectKey , 서브쿼리 , sequence
	// 데이터 추가 
	  // 시퀀스 마이바이티에서 작업 
	  @SelectKey(keyProperty="no",resultType=int.class,before=true,
			  statement="SELECT NVL(MAX(no)+1,1) as no FROM board_video")
	  @Insert("INSERT INTO board_video VALUES("
				 +"#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0,#{filename},#{filesize},#{filecount})")
	  
	  public void videoInsert(PromotionVO vo);
	  // 내용보기 : SELECT
	  @Update("UPDATE board_video SET "
			 +"hit=hit+1 "
			 +"WHERE no=#{no}")
	  public void videohitIncrement(int no); // 조회수 증가 
	  //상세보기
	  @Select("SELECT no,name,subject,content,regdate,hit,filename,filesize,filecount "
				 +"FROM board_video "
				 +"WHERE no=#{no}")
	  public PromotionVO videoDetailData(int no);
	  //찾기
	// 찾기 => 동적 쿼리 (마이바티스)
	  @Select({
		  "<script>"
		  +"SELECT no,subject,name,regdate,hit "
		  +"FROM board_video "
		  +"WHERE "
		  +"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\">"
	      +"<foreach collection=\"fsArr\" item=\"fd\">"
	        +"<trim prefix=\"OR\">"
	          +"<choose>"
	          +"<when test=\"fd=='N'.toString()\">"
	        		  +"name LIKE '%'||#{ss}||'%'"
	            +"</when>"
	            +"<when test=\"fd=='S'.toString()\">"
	            		+"subject LIKE '%'||#{ss}||'%'"
	            +"</when>"
	            +"<when test=\"fd=='C'.toString()\">"
	            		+"content LIKE '%'||#{ss}||'%'"
	            +"</when>"
	          +"</choose>"
	        +"</trim>"
	      +"</foreach>"
	    +"</trim>"
		  +"</script>"
	  })
	  public List<PromotionVO> videoFindData(Map map);
	  // 수정 : UPDATE
	  // 비밀번호 체크 
	  @Select("SELECT pwd FROM board_video "
			 +"WHERE no=#{no}")
	  public String videoGetPassword(int no);
	  //파일명 전송
	  @Select("SELECT filename,filesize,filecount FROM board_video "
				 +"WHERE no=#{no}")
		  public PromotionVO videoFileInfoData(int no);
	  // 실제 수정 
	  @Update("UPDATE board_video SET "
			 +"name=#{name},subject=#{subject},content=#{content},regdate=SYSDATE "
			 +"WHERE no=#{no}")
	  public void videoUpdate(PromotionVO vo);
	  // 삭제  : DELETE
	  @Delete("DELETE FROM board_video "
			 +"WHERE no=#{no}")
	  public void videoDelete(int no);
	  /*
	   *   CREATE TABLE spring_reply_project(
	    no NUMBER,
	    bno NUMBER,
	    id VARCHAR2(20),
	    name VARCHAR2(34) CONSTRAINT srp_name_nn NOT NULL,
	    msg CLOB CONSTRAINT srp_msg_nn NOT NULL,
	    regdate DATE DEFAULT SYSDATE,
	    group_id NUMBER,
	    group_step NUMBER DEFAULT 0,
	    group_tab NUMBER DEFAULT 0,
	    root NUMBER DEFAULT 0,
	    depth NUMBER DEFAULT 0,
	    CONSTRAINT srp_no_pk PRIMARY KEY(no),
	    CONSTRAINT srp_bno_fk FOREIGN KEY(bno)
	    REFERENCES spring_freeboard(no),
	    CONSTRAINT srp_id_fk FOREIGN KEY(id)
	    REFERENCES project_member(id)
		);
		CREATE SEQUENCE srp_no_seq
		   START WITH 1
		   INCREMENT BY 1
		   NOCACHE
		   NOCYCLE;
	   */
	  // 자유게시판 => 댓글 올리기
	  
}
