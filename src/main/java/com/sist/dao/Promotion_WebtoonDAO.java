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
import com.sist.mapper.Promotion_WebtoonMapper;
// 댓글 
@Repository
public class Promotion_WebtoonDAO {
  @Autowired
  private Promotion_WebtoonMapper mapper;
  
  public List<PromotionVO> webtoonListData(Map map)
  {
	  return mapper.webtoonListData(map);
  }
  
  public int webtoonTotalPage()
  {
	  return mapper.webtoonTotalPage();
  }
  
  public void webtoonInsert(PromotionVO vo)
  {
	  mapper.webtoonInsert(vo);
  }
  
  public PromotionVO webtoonDetailData(int no)
  {
	  mapper.webtoonhitIncrement(no);
	  return mapper.webtoonDetailData(no);
  }
  public PromotionVO webtoonFileInfoData(int no)
	{
		return mapper.webtoonFileInfoData(no);
	}
  
  public boolean webtoonDelete(int no,String pwd)
	{
		boolean bCheck=false;
		// 비밀번호 
		String db_pwd=mapper.webtoonGetPassword(no);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.webtoonDelete(no);
		}
		return bCheck;
	}
	// 수정할 데이터를 읽어 온다 
	public PromotionVO webtoonUpdateData(int no)
	{
		return mapper.webtoonDetailData(no);
	}
	// 실제 수정
	public boolean webtoonUpdate(PromotionVO vo)
	{
		boolean bCheck=false;
		// 비밀번호 검색 
		String db_pwd=mapper.webtoonGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.webtoonUpdate(vo);
		}
		return bCheck;
	}
	public List<PromotionVO> webtoonFindData(Map map)
	{
		return mapper.webtoonFindData(map);
	}
} 