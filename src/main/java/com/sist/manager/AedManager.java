package com.sist.manager;


import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.sist.vo.AedVO;

@Component
public class AedManager {

	public List<AedVO> aed_map()
	{
		List<AedVO> list = new ArrayList<AedVO>();
		
		try {
			int k=1;
			for(int i=1;i<100;i++) 
			{
				for(int j=1;j<100;j++)
				{
					String url = "http://apis.data.go.kr/B552657/AEDInfoInqireService/getAedFullDown?serviceKey="
							+ "iTIfrAVDWjD3nZqfj7sHlKJG7Vbr2CbyinnGOpwFBgJuBNM5g96ltVNISlvWzJpHnJ0YZ9YtJ425rvsyhP0yWg%3D%3D&pageNo="+String.valueOf(i)+"&numOfRows="+String.valueOf(j);
					Document doc = Jsoup.connect(url).get();
					
					Elements title = doc.select("response > body > items > item > org");
					Elements addr1 = doc.select("response > body > items > item > buildAddress");
					Elements sido = doc.select("response > body > items > item > sido");
					Elements gugun = doc.select("response > body > items > item > gugun");
					Elements addr2 = doc.select("response > body > items > item > buildPlace");
					Elements lat = doc.select("response > body > items > item > wgs84Lat");
					Elements lon = doc.select("response > body > items > item > wgs84Lon");
					
					
					for(int z=0;z<title.size();z++)
					{
						System.out.println("title="+title.get(z).text());
						System.out.println("addr1="+sido.get(z).text()+" "+gugun.get(z).text()+" "+addr1.get(z).text());
						System.out.println("addr2="+sido.get(z).text()+" "+gugun.get(z).text()+" "+addr2.get(z).text());
						System.out.println("lat="+lat.get(z).text());
						System.out.println("lon="+lon.get(z).text());
						System.out.println("k="+k);
						k++;
						System.out.println("=======================================");
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
}
