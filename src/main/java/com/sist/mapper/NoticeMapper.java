package com.sist.mapper;

import java.util.List;

import com.sist.vo.NoticeVO;

public interface NoticeMapper {
	
//	@Select("SELECT * FROM egen_nnotice WHERE nnno > 0")
	public List<NoticeVO> getList();

	
	public void insert(NoticeVO notice);
	
	public void insertSelectKey(NoticeVO notice);
	
	public NoticeVO read(int nno);
	
	public int delete(int nno);
	
	public int update(NoticeVO notice);
	
	
}
