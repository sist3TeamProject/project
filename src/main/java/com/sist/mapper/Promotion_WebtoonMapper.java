package com.sist.mapper;

import java.util.*;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.SelectKey;
import com.sist.dao.Promotion_WebtoonDAO;

import com.sist.vo.*;
public interface Promotion_WebtoonMapper {
	// 목록 : (페이징 => 인라인뷰) : SELECT
	@Select("SELECT no,subject,name,regdate,hit,num "
			 +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
			 +"FROM (SELECT no,subject,name,regdate,hit "
			 +"FROM board_webtoon ORDER BY no DESC)) "
	         +"WHERE num BETWEEN #{start} AND #{end}")
	  
	  public List<PromotionVO> webtoonListData(Map map);
	  // 총페이지  : SELECT
	  @Select("SELECT CEIL(COUNT(*)/15.0) FROM board_webtoon")
	  public int webtoonTotalPage();
	  // 추가 (글쓰기)  : INSERT
	  // 번호 => @SelectKey , 서브쿼리 , sequence
	// 데이터 추가 
	  // 시퀀스 마이바이티에서 작업 
	  @SelectKey(keyProperty="no",resultType=int.class,before=true,
			  statement="SELECT NVL(MAX(no)+1,1) as no FROM board_webtoon")
	  @Insert("INSERT INTO board_webtoon VALUES("
				 +"#{no},#{name},#{subject},#{content},#{pwd},SYSDATE,0,#{filename},#{filesize},#{filecount})")
	  
	  public void webtoonInsert(PromotionVO vo);
	  // 내용보기 : SELECT
	  @Update("UPDATE board_webtoon SET "
			 +"hit=hit+1 "
			 +"WHERE no=#{no}")
	  public void webtoonhitIncrement(int no); // 조회수 증가 
	  //상세보기
	  @Select("SELECT no,name,subject,content,regdate,hit,filename,filesize,filecount "
				 +"FROM board_webtoon "
				 +"WHERE no=#{no}")
	  public PromotionVO webtoonDetailData(int no);
	  //찾기
	// 찾기 => 동적 쿼리 (마이바티스)
	  @Select({
		  "<script>"
		  +"SELECT no,subject,name,regdate,hit "
		  +"FROM board_webtoon "
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
	  public List<PromotionVO> webtoonFindData(Map map);
	  // 수정 : UPDATE
	  // 비밀번호 체크 
	  @Select("SELECT pwd FROM board_webtoon "
			 +"WHERE no=#{no}")
	  public String webtoonGetPassword(int no);
	  //파일명 전송
	  @Select("SELECT filename,filesize,filecount FROM board_webtoon "
				 +"WHERE no=#{no}")
		  public PromotionVO webtoonFileInfoData(int no);
	  // 실제 수정 
	  @Update("UPDATE board_webtoon SET "
			 +"name=#{name},subject=#{subject},content=#{content},regdate=SYSDATE "
			 +"WHERE no=#{no}")
	  public void webtoonUpdate(PromotionVO vo);
	  // 삭제  : DELETE
	  @Delete("DELETE FROM board_webtoon "
			 +"WHERE no=#{no}")
	  public void webtoonDelete(int no);
	  
}
