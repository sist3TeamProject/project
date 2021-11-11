package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import com.sist.vo.*;
public interface TreatMapper {
	@Select("SELECT no,title,poster,sub1,sub2 "
			+ "FROM emergency_treat "
			+ "ORDER BY no ASC")
	public List<TreatVO> treatListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat1 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat1ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat2 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat2ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat3 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat3ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no<=2 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=3 AND no<=6 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_sna();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=7 AND no<=9 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_bee();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=10 AND no<=11 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_spi();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=12 AND no<=15 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_ice();
	
	@Select("SELECT * "
			+ "FROM emergency_treat4 "
			+ "WHERE no>=16 AND no<=19 "
			+ "ORDER BY no ASC")
	public List<TreatVO> treat4ListData_ice_1();
	
	 @Select("SELECT no,subject,name,regdate,hit,num "
			 +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
			 +"FROM (SELECT no,subject,name,regdate,hit "
			 +"FROM emergency_treat_data ORDER BY no DESC)) "
	         +"WHERE num BETWEEN #{start} AND #{end}")
	public List<Treat_DataVO> tDataListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM emergency_treat_data")
	public int tDataTotalPage();
	
	@SelectKey(keyProperty="no",resultType=int.class,before=true,
			  statement="SELECT NVL(MAX(no)+1,1) as no FROM emergency_treat_data")
	@Insert("INSERT INTO emergency_treat_data VALUES("
			 +"#{no},#{subject},#{content},SYSDATE,#{name},0,#{pwd},#{filename},#{filesize},#{filecount})")
	public void insertData(Treat_DataVO vo);
	
	@Update("UPDATE emergency_treat_data SET "
			 +"hit=hit+1 "
			 +"WHERE no=#{no}")
	public void tDataHitIncreement(int no);
	
	@Select("SELECT * FROM emergency_treat_data "
			+ "WHERE no=#{no}")
	public Treat_DataVO tDataDetail(int no);
	
	
	@Select("SELECT pwd FROM emergency_treat_data "
			 +"WHERE no=#{no}")
	public String tDataGetPassword(int no);
	 
	@Update("UPDATE emergency_treat_data SET "
			 +"name=#{name},subject=#{subject},content=#{content} "
			 +"WHERE no=#{no}")
	public void dataUpdate(Treat_DataVO vo);
	
	@Select("SELECT filename,filesize,filecount FROM emergency_treat_data "
			 +"WHERE no=#{no}")
	public Treat_DataVO tDataFileInfoData(int no);
	
	@Delete("DELETE FROM emergency_treat_data "
			+"WHERE no=#{no}")
	public void dataDelete(int no);
	
	@Select("SELECT no,name,subject,regdate,hit,num "
			+ "FROM (SELECT no,name,subject,regdate,hit,rownum as num "
			+ "FROM (SELECT /*+ INDEX_ASCemergency_treat_data etd_no_pk) */no,name,subject,regdate,hit "
			+ "FROM emergency_treat_data "
			+ "WHERE subject LIKE '%'||#{ss}||'%')) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<Treat_DataVO> tDataFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM emergency_treat_data "
	         + "WHERE subject LIKE '%'||#{ss}||'%'")
	public int tDataFindTotalPage(String ss);
	

	
	

}















