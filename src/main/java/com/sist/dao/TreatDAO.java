package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TreatDAO {
	@Autowired
	private TreatMapper mapper;
	
	public List<TreatVO> treatListData()
	{
		return mapper.treatListData();
	}
	
	public List<TreatVO> treat1ListData()
	{
		return mapper.treat1ListData();
	}
	
	public List<TreatVO> treat2ListData()
	{
		return mapper.treat2ListData();
	}
	
	public List<TreatVO> treat3ListData()
	{
		return mapper.treat3ListData();
	}
	
	public List<TreatVO> treat4ListData()
	{
		return mapper.treat4ListData();
	}
	
	public List<TreatVO> treat4ListData_sna()
	{
		return mapper.treat4ListData_sna();
	}
	
	public List<TreatVO> treat4ListData_bee()
	{
		return mapper.treat4ListData_bee();
	}
	
	public List<TreatVO> treat4ListData_spi()
	{
		return mapper.treat4ListData_spi();
	}
	
	public List<TreatVO> treat4ListData_ice()
	{
		return mapper.treat4ListData_ice();
	}
	
	public List<TreatVO> treat4ListData_ice_1()
	{
		return mapper.treat4ListData_ice_1();
	}
	
	public List<Treat_DataVO> tDataListData(Map map)
	{
		return mapper.tDataListData(map);
	}
	
	public int tDataTotalPage()
	{
		return mapper.tDataTotalPage();
	}
	
	public Treat_DataVO tDataDetail(int no)
	{
		return mapper.tDataDetail(no);
	}
	
	public void insertData(Treat_DataVO vo)
	{
		mapper.insertData(vo);
	}
	
	public boolean dataUpdate(Treat_DataVO vo)
	{
		boolean bCheck=false;
		
		String db_pwd=mapper.dataGetPassword(vo.getNo());
		
		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;
			mapper.dataUpdate(vo);
		}
		else
		{
			bCheck=false;
		}
		
		return bCheck;
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	public boolean dataDelete(int no,String pwd)
	{
		boolean bCheck=false;
		
		String db_pwd=mapper.dataGetPassword(no);
		
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			mapper.dataDelete(no);
		}
		else
		{
			bCheck=false;
		}
		
		return bCheck;
	}
	
	public List<Treat_DataVO> dataFindData(Map map)
	{
		return mapper.dataFindData(map);
	}
	
	public int dataFindTotalPage(String title)
	{
		return mapper.dataFindTotalPage(title);
	}

}

















