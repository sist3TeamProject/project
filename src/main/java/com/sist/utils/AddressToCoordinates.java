package com.sist.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

public class AddressToCoordinates {

	private static final String url = "http://dapi.kakao.com/v2/local/search/address.json?query=";
	private static final String key = "KakaoAK API";

	public static String change(String address) {
		String json = "";
		try {
			URL search = new URL(url + URLEncoder.encode(address, "UTF-8"));

			HttpURLConnection con = (HttpURLConnection) search.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", key);

			Charset charset = Charset.forName("UTF-8");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));

			String read;
			StringBuffer response = new StringBuffer();
			while ((read = in.readLine()) != null) {
				response.append(read);
			}
			json = response.toString();
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		return json;
	}
}