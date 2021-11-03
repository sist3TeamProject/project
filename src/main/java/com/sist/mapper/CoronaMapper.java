package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.Corona_ageVO;
import com.sist.vo.Corona_domesticVO;
import com.sist.vo.Corona_routeVO;
import com.sist.vo.Main_coronaVO;

public interface CoronaMapper {
	//국내 확진현황
    @Select("SELECT total_count as totalCount,total_occur as totalOccur,domestic,overseas,release,today_release as todayRelease,quarantine,today_quarantine todayQuarantine,dying,today_dying as todayDying "
    		+ "FROM domestic_infected "
    		+ "WHERE domestic=#{domestic}")
    public Corona_domesticVO domesticData(String domestic);
    //연령별 확진자
    @Select("SELECT age,infected,dying,lethality "
    		+ "FROM infected_by_age ")
    public List<Corona_ageVO> ageData();
    //확진자 동선
    @Select("SELECT area,gu,type,address,day,disinfect "
    		+ "FROM infected_route")
    public List<Corona_routeVO> routeListData();
    
    @Select("SELECT city,totalcount,totaltoday,domestic,overseas,quarantine,quarantinerelease,dying,incidencerate "
    		+ "FROM city_by_infected ")
    public List<Main_coronaVO> cityListData();
}
