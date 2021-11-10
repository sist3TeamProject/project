package com.sist.manager;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.sist.vo.EmergencyCenterDetailVO;
import com.sist.vo.EmergencyCenterVO;

@Component
public class EmergencyCenterManager {
	public static void main(String[] args) {
		
	}
	//subjects,info => http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytBassInfoInqire?serviceKey=%2FgrqQIBjwBzhg%2BDpx5xMri%2FgHV2WonoWeEE%2B4KmFrBAZY8inA8t97ZauzabRK3YaSj3Vz5%2FTBusnLIMyVUTArA%3D%3D&HPID=A1100063&pageNo=1&numOfRows=10
	public EmergencyCenterDetailVO getHospitalInfo(String hpid,String addr1,String addr2){
		EmergencyCenterDetailVO vo=new EmergencyCenterDetailVO();
		String key="%2FgrqQIBjwBzhg%2BDpx5xMri%2FgHV2WonoWeEE%2B4KmFrBAZY8inA8t97ZauzabRK3YaSj3Vz5%2FTBusnLIMyVUTArA%3D%3D";
		int page=1;
		try {
			String stage1=URLEncoder.encode(addr1,"UTF-8");
			String stage2=URLEncoder.encode(addr2,"UTF-8");
			
			String url="http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfoInqire?serviceKey="
					+key+"&STAGE1="+stage1+"&STAGE2="+stage2+"&pageNo="+page+"&numOfRows=20";
			
			Document doc = Jsoup.connect(url).get();
			
			Elements totalCount = doc.select("response > body > totalCount");
			Elements hpidByApi = doc.select("response > body > items > item > hpid");
			Elements hvec = doc.select("response > body > items > item > hvec");
			Elements hvoc = doc.select("response > body > items > item > hvoc");
			Elements hvncc = doc.select("response > body > items > item > hvncc");
			Elements hvicc = doc.select("response > body > items > item > hvicc");
			Elements hvgc = doc.select("response > body > items > item > hvgc");
			Elements hvctayn = doc.select("response > body > items > item > hvctayn");
			Elements hvmriayn = doc.select("response > body > items > item > hvmriayn");
			Elements hvangioayn = doc.select("response > body > items > item > hvangioayn");
			Elements hvventiayn = doc.select("response > body > items > item > hvventiayn");
			Elements hvamyn = doc.select("response > body > items > item > hvamyn");
			Elements hv11 = doc.select("response > body > items > item > hv11");
			
			int totalpage=(int)Math.ceil(Integer.parseInt(totalCount.get(0).text())/20.0);
			
			while(page<=totalpage) {
				for(int i=0;i<hpidByApi.size();i++) {
					if(hpidByApi.get(i).text().equals(hpid)){
						vo.setHvec(Integer.parseInt(hvec.get(i).text()));
						vo.setHvoc(Integer.parseInt(hvoc.get(i).text()));
						vo.setHvncc(Integer.parseInt(hvncc.get(i).text()));
						vo.setHvicc(Integer.parseInt(hvicc.get(i).text()));
						vo.setHvgc(Integer.parseInt(hvgc.get(i).text()));
						vo.setHvctayn(hvctayn.get(i).text());
						vo.setHvmriayn(hvmriayn.get(i).text());
						vo.setHvangioayn(hvangioayn.get(i).text());
						vo.setHvventiayn(hvventiayn.get(i).text());
						vo.setHvamyn(hvamyn.get(i).text());
						vo.setHv11(hv11.get(i).text());
					}
				}
				page++;
			}
		}catch (Exception e) {
		}
		try {
			String url="http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytBassInfoInqire?serviceKey="
					+key+"&HPID="+hpid+"&pageNo=1&numOfRows=10";
			
			Document doc = Jsoup.connect(url).get();
			
			Elements subjects = doc.select("response > body > items > item > dgidIdName");
			Elements info = doc.select("response > body > items > item > dutyInf");
			
			vo.setSubjects(subjects.get(0).text());
			vo.setInfo(info.get(0).text());
		}catch (Exception e) {}
		return vo;
	}
}
