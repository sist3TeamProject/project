package com.sist.dao;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Propagation;
//import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Executable;
import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.Promotion_AudioMapper;
// 댓글 
@Repository
public class Promotion_AudioDAO {
  @Autowired
  private Promotion_AudioMapper mapper;
  
  public List<PromotionVO> audioListData(Map map)
  {
	  return mapper.audioListData(map);
  }
  
  public int audioTotalPage()
  {
	  return mapper.audioTotalPage();
  }
  
  public void audioInsert(PromotionVO vo)
  {
	  mapper.audioInsert(vo);
  }
  
  public PromotionVO audioDetailData(int no)
  {
	  mapper.audiohitIncrement(no);
	  return mapper.audioDetailData(no);
  }
  public PromotionVO audioFileInfoData(int no)
	{
		return mapper.audioFileInfoData(no);
	}
  
  public boolean audioDelete(int no,String pwd)
	{
		boolean bCheck=false;
		// 비밀번호 
		String db_pwd=mapper.audioGetPassword(no);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.audioDelete(no);
		}
		return bCheck;
	}
	// 수정할 데이터를 읽어 온다 
	public PromotionVO audioUpdateData(int no)
	{
		return mapper.audioDetailData(no);
	}
	// 실제 수정
	public boolean audioUpdate(PromotionVO vo)
	{
		boolean bCheck=false;
		// 비밀번호 검색 
		String db_pwd=mapper.audioGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.audioUpdate(vo);
		}
		return bCheck;
	}
	public List<PromotionVO> audioFindData(Map map)
	{
		return mapper.audioFindData(map);
	}
} 