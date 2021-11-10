package com.sist.service;

import java.util.List;

import com.sist.vo.NoticeVO;

public interface NoticeService {
	
	//게시글 등록
	public void register(NoticeVO notice);
	
	//상세보기
	public NoticeVO get(int no);
	
	//수정
	public boolean modify(NoticeVO notice);
	
	//삭제
	public boolean remove(int no);
	
	//목록 조회
	public List<NoticeVO> getList();
}
