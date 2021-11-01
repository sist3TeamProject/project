package com.sist.dao;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TreatDAO {
	@Autowired
	private TreatMapper mapper;
	
	public List<TreatVO> treatListData(Map map)
	{
		return mapper.treatListData(map);
	}

}
