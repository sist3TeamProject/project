package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
	
	@Select("SELECT no,title,content,regdate,name,hit,num "
			+ "FROM (SELECT /*+ INDEX_ASC(emergency_treat_data etd_no_pk) */no,title,content,regdate,name,hit,rownum as num "
			+ "FROM emergency_treat_data) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<Treat_DataVO> tDataListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM emergency_treat_data")
	public int tDataTotalPage();
	
	@Select("SELECT * FROM emergency_treat_data "
			+ "WHERE no=#{no}")
	public Treat_DataVO tDataDetail(int no);
	
	@Insert("INSERT INTO emergency_treat_data(no,title,name,content,pwd) "
			 +"VALUES(#{no},#{title},#{name},#{content},#{pwd})")
	public void insertData(Treat_DataVO vo);
	
	@Select("SELECT pwd FROM emergency_treat_data "
			 +"WHERE no=#{no}")
	public String dataGetPassword(int no);
	 
	@Update("UPDATE emergency_treat_data SET "
			 +"title=#{title},content=#{content} "
			 +"WHERE no=#{no}")
	public void dataUpdate(Treat_DataVO vo);
	
	@Delete("DELETE FROM emergency_treat_data "
			+"WHERE no=#{no}")
	public void dataDelete(int no);
	
	@Select("SELECT no,title,content,regdate,hit,num "
	         + "FROM (SELECT no,title,content,regdate,hit,rownum as num "
	         + "FROM (SELECT /*+ INDEX_ASC(emergency_treat_data etd_no_pk) */no,title,content,regdate,hit "
	         + "FROM emergency_treat_data WHERE title LIKE '%'||#{ss}||'%')) "
	         + "WHERE num BETWEEN #{start} AND #{end}")
	public List<Treat_DataVO> dataFindData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM emergency_treat_data "
	         + "WHERE title LIKE '%'||#{title}||'%'")
	public int dataFindTotalPage(String title);
	
	

}















