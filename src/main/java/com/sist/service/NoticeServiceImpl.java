package com.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.mapper.NoticeMapper;
import com.sist.vo.NoticeVO;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public void register(NoticeVO notice) {
		mapper.insertSelectKey(notice);
	}
	
	//조회
	@Override
	public NoticeVO get(int nno) {
		// TODO Auto-generated method stub
		return mapper.read(nno);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		// TODO Auto-generated method stub
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(int nno) {
		// TODO Auto-generated method stub
		return mapper.delete(nno) == 1;
	}

	@Override
	public List<NoticeVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}
	
	

}
