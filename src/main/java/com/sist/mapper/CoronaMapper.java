package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
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
    
    @Select("SELECT no,id,msg,dbday,vaccine,up,down,num "
    		+ "FROM (SELECT /*+ INDEX_DESC(vaccine_reply vr_no_pk) */ no,id,msg,TO_CHAR(regdate,'yyyy-mm-dd HH\"시\" MM\"분\"') as dbday,vaccine,up,down,rownum as num "
    		+ "FROM vaccine_reply) "
    		+ "WHERE num BETWEEN #{start} AND #{end}")
    public List<ReplyVO> replyListData(Map map);
    
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM vaccine_reply")
    public int replyTotalPage();
    
    @SelectKey(keyProperty="no", resultType=int.class , before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM vaccine_reply")
    @Insert("INSERT INTO vaccine_reply(no,id,msg,vaccine,regdate,group_id) VALUES(#{no},#{id},#{msg},#{vaccine},"
    		+ "SYSDATE,(SELECT NVL(MAX(group_id)+1,1) FROM vaccine_reply))")
    public void replyInsert(ReplyVO vo);
    
    @Delete("DELETE FROM vaccine_reply WHERE no=#{no}")
    public void replyDelete(int no);
    
    @Update("UPDATE vaccine_reply SET msg=#{msg} WHERE no=#{no}")
    public void replyUpdate(ReplyVO vo);
    

    
    @Select("SELECT group_id,group_step,group_tab "
   		 +"FROM vaccine_reply "
   		 +"WHERE no=#{no}")
     public ReplyVO ReplyParentInfoData(int no);
     // 2. step 변경  : UPDATE 
     @Update("UPDATE vaccine_reply SET "
   		 +"group_step=group_step+1 "
   		 +"WHERE group_id=#{group_id} AND group_step>#{group_step}")
     public void ReplyStepIncrement(ReplyVO vo);
     // 3. insert : INSERT
     @Insert("INSERT INTO vaccine_reply(no,bno,id,name,msg,group_id,group_step,group_tab,root) "
   		 +"VALUES(srp_no_seq.nextval,#{bno},#{id},#{name},#{msg},"
   		 +"#{group_id},#{group_step},#{group_tab},#{root})")
     public void Reply2Insert(ReplyVO vo);
     // 4. depth 증가 : UPDATE 
     @Update("UPDATE vaccine_reply SET "
   		 +"depth=depth+1 "
   		 +"WHERE no=#{no}")
     public void ReplyDepthIncrement(int no);
     
     // 댓글 삭제  트랜잭션 대상 
     // 1. depth,root 읽기  SELECT
     @Select("SELECT depth,root "
   		 +"FROM vaccine_reply "
   		 +"WHERE no=#{no}")
     public ReplyVO DepthInfoData(int no);
     // 2. depth==0 삭제  , depth!=0 수정  DELETE/UPADTE
     @Delete("DELETE FROM vaccine_reply "
   		 +"WHERE no=#{no}")
     public void ReplyDelete(int no);
     @Update("UPDATE vaccine_reply SET "
   		 +"msg='관리자가 삭제한 댓글입니다.' "
   		 +"WHERE no=#{no}")
     public void ReplyMsgUpdate(int no);
     // 3. depth 감소  UPDATE 
     @Update("UPDATE vaccine_reply SET "
   		 +"depth=depth-1 "
   		 +"WHERE no=#{no}")
     public void ReplyDepthDecrement(int no);
}
