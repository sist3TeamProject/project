package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

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
    
    //시도별 확진자
    @Select("SELECT city,totalcount,totaltoday,domestic,overseas,quarantine,quarantinerelease,dying,incidencerate "
    		+ "FROM city_by_infected ")
    public List<Main_coronaVO> cityListData();
    
    //백신 위탁기관
    @Select("SELECT orgcd,phzer,moderna,astrazeneca,orgnm,orgtlno,orgzipaddr,num "
    		+ "FROM (SELECT orgcd,phzer,moderna,astrazeneca,orgnm,orgtlno,orgzipaddr,rownum as num "
    		+ "FROM (SELECT orgcd,phzer,moderna,astrazeneca,orgnm,orgtlno,orgzipaddr "
    		+ "FROM consign_medical WHERE orgzipaddr LIKE '%'||#{addr2}||'%' "
    		+ "ORDER BY orgcd ASC)) "
    		+ "WHERE num BETWEEN #{start} AND #{end}")
    public List<Corona_listVO> consignListData(Map map);
    
    //백신 위탁 페이지
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM consign_medical "
    		+ "WHERE orgzipaddr LIKE '%'||#{addr2}||'%'")
    public int consignTotalPage(String addr2);
    
    //백신예약자정보추가
    @Insert("INSERT INTO vaccine_privacy VALUES(va_sequence.NEXTVAL,#{name},#{birth},#{address},#{email},#{receive},#{orgnm},#{regdate},#{time},#{vaccine},#{caddress},#{post})")
    public void privacyInsert(Map map);
    
    @Update("UPDATE consign_medical SET phzer = phzer-1 WHERE orgcd=#{orgcd}")
    public void consignPhzerUpdate(Map map1);
    
    @Update("UPDATE consign_medical SET moderna = moderna-1 WHERE orgcd=#{orgcd}")
    public void consignModernaUpdate(Map map1);
    @Update("UPDATE consign_medical SET astrazeneca = astrazeneca-1 WHERE orgcd=#{orgcd}")
    public void consignAstraUpdate(Map map1);
    //예약결과
    @Select("SELECT no,orgnm,regdate,time,vaccine,caddress " + 
    		"FROM (SELECT no,orgnm,regdate,time,vaccine,caddress " + 
    		"FROM vaccine_privacy ORDER BY no DESC) " + 
    		"WHERE ROWNUM=1 ")
    public Corona_privacyVO privacyData();
    
    
    @Select("SELECT no,orgnm,regdate,time,vaccine,caddress " 
    		+ "FROM vaccine_privacy "
    		+ "WHERE birth=#{birth} ")
    public Corona_privacyVO privacyCustomData(String birth);
    
    @Select("SELECT no,orgnm,regdate,time,vaccine,caddress " 
    		+ "FROM vaccine_privacy "
    		+ "WHERE no=#{no} ")
    public Corona_privacyVO privacyCustomData2(int no);
    
    @Update("UPDATE vaccine_privacy SET orgnm=#{orgnm},regdate=#{regdate},time=#{time},vaccine=#{vaccine},caddress=#{caddress} WHERE no=#{no}")
    public void privacyUpdate(Corona_privacyVO vo);
    
    @Update("UPDATE consign_medical SET phzer = phzer+1 WHERE orgnm=#{orgnm}")
    public void PhzerCancelUpdate(Map map1);
    
    @Update("UPDATE consign_medical SET moderna = moderna+1 WHERE orgnm=#{orgnm}")
    public void ModernaCancelUpdate(Map map1);
    @Update("UPDATE consign_medical SET astrazeneca = astrazeneca+1 WHERE orgnm=#{orgnm}")
    public void AstraCancelUpdate(Map map1);
    
    
    @Delete("DELETE FROM vaccine_privacy WHERE no=#{no}")
    public void customeDelete(int no);
}
