package com.sist.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sist.utils.AddressToCoordinates;

@Component
public class JsonManager {

	public List<String> coordinatesJson(String address) {
		List<String> list = new ArrayList<String>();
		try {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = jsonParser.parse(AddressToCoordinates.change(address)).getAsJsonObject();
			JsonArray arr = jsonObject.get("documents").getAsJsonArray();
			for (int i = 0; i < arr.size(); i++) {
				JsonObject tmp = arr.get(i).getAsJsonObject();
				list.add(tmp.get("y").getAsString());
				list.add(tmp.get("x").getAsString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}