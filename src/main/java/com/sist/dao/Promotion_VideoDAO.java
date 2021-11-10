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
import com.sist.mapper.Promotion_VideoMapper;
// 댓글 
@Repository
public class Promotion_VideoDAO {
  @Autowired
  private Promotion_VideoMapper mapper;
  
  public List<PromotionVO> videoListData(Map map)
  {
	  return mapper.videoListData(map);
  }
  
  public int videoTotalPage()
  {
	  return mapper.videoTotalPage();
  }
  
  public void videoInsert(PromotionVO vo)
  {
	  mapper.videoInsert(vo);
  }
  
  public PromotionVO videoDetailData(int no)
  {
	  mapper.videohitIncrement(no);
	  return mapper.videoDetailData(no);
  }
  public PromotionVO videoFileInfoData(int no)
	{
		return mapper.videoFileInfoData(no);
	}
  
  public boolean videoDelete(int no,String pwd)
	{
		boolean bCheck=false;
		// 비밀번호 
		String db_pwd=mapper.videoGetPassword(no);
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.videoDelete(no);
		}
		return bCheck;
	}
	// 수정할 데이터를 읽어 온다 
	public PromotionVO videoUpdateData(int no)
	{
		return mapper.videoDetailData(no);
	}
	// 실제 수정
	public boolean videoUpdate(PromotionVO vo)
	{
		boolean bCheck=false;
		// 비밀번호 검색 
		String db_pwd=mapper.videoGetPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.videoUpdate(vo);
		}
		return bCheck;
	}
	public List<PromotionVO> videoFindData(Map map)
	{
		return mapper.videoFindData(map);
	}
} 