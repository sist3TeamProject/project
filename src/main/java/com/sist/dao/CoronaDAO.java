package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CoronaMapper;
import com.sist.mapper.Main_coronaMapper;
import com.sist.vo.Corona_ageVO;
import com.sist.vo.Corona_domesticVO;
import com.sist.vo.Corona_listVO;
import com.sist.vo.Corona_privacyVO;
import com.sist.vo.Corona_routeVO;
import com.sist.vo.Main_coronaVO;

@Repository
public class CoronaDAO {
    @Autowired
    private CoronaMapper mapper;
    
    public Corona_domesticVO domesticData(String domestic)
    {
    	return mapper.domesticData(domestic);
    }
    
    public List<Corona_ageVO> ageData()
    {
    	return mapper.ageData();
    }
    
    public List<Corona_routeVO> routeListData()
    {
    	return mapper.routeListData();
    }
    
    public List<Main_coronaVO> cityListData()
    {
    	return mapper.cityListData();
    }
    public List<Corona_listVO> consignListData(Map map)
    {
    	return mapper.consignListData(map);
    }
    public int consignTotalPage(String addr2)
    {
    	return mapper.consignTotalPage(addr2);
    }
    
    public void privacyInsert(Map map)
    {
    	mapper.privacyInsert(map);
    }
    

    public void consignPhzerUpdate(Map map1)
    {
    	mapper.consignPhzerUpdate(map1);
    }
    public void consignModernaUpdate(Map map1)
    {
    	mapper.consignModernaUpdate(map1);
    }
    
    public void consignAstraUpdate(Map map1)
    {
    	mapper.consignAstraUpdate(map1);
    }
    
    public Corona_privacyVO privacyData()
    {
    	return mapper.privacyData();
    }
    
    public Corona_privacyVO privacyCustomData(String birth)
    {
    	return mapper.privacyCustomData(birth);
    }
    
    public Corona_privacyVO privacyCustomData2(int no)
    {
    	return mapper.privacyCustomData2(no);
    }
    
    public void privacyUpdate(Corona_privacyVO vo)
    {
    	mapper.privacyUpdate(vo);
    }
    
    public void PhzerCancelUpdate(Map map1)
    {
    	mapper.PhzerCancelUpdate(map1);
    }
    public void ModernaCancelUpdate(Map map1)
    {
    	mapper.ModernaCancelUpdate(map1);
    }
    public void AstraCancelUpdate(Map map1)
    {
    	mapper.AstraCancelUpdate(map1);
    }
    public void customeDelete(int no)
    {
    	mapper.customeDelete(no);
    }
}
