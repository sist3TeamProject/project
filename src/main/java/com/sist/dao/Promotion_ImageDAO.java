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
import com.sist.mapper.Promotion_ImageMapper;
// 댓글 
@Repository
public class Promotion_ImageDAO {
  @Autowired
  private Promotion_ImageMapper mapper;
  
  public List<PromotionVO> imageListData(Map map)
  {
	  return mapper.imageListData(map);
  }
  
  public int imageTotalPage()
  {
	  return mapper.imageTotalPage();
  }
  
  public void imageInsert(PromotionVO vo)
  {
	  mapper.imageInsert(vo);
  }
  
  public PromotionVO imageDetailData(int no)
  {
	  mapper.hitIncrement(no);
	  return mapper.imageDetailData(no);
  }
  public PromotionVO imageFileInfoData(int no)
	{
		return mapper.imageFileInfoData(no);
	}
  
  public boolean imageDelete(int no,String pwd)
	{
		boolean bCheck=false;
		// 비밀번호 
		String db_pwd=mapper.imageGetPassword(no);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.imageDelete(no);
		}
		return bCheck;
	}
	// 수정할 데이터를 읽어 온다 
	public PromotionVO imageUpdateData(int no)
	{
		return mapper.imageDetailData(no);
	}
	// 실제 수정
	public boolean imageUpdate(PromotionVO vo)
	{
		boolean bCheck=false;
		// 비밀번호 검색 
		String db_pwd=mapper.imageGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.imageUpdate(vo);
		}
		return bCheck;
	}
	public List<PromotionVO> imageFindData(Map map)
	{
		return mapper.imageFindData(map);
	}
} 