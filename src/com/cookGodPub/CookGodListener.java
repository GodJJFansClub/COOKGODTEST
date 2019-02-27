package com.cookGodPub;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class CookGodListener implements ServletContextListener{


	@Override
	public void contextInitialized(ServletContextEvent event) {
		Map< String, String> foodTypeMap = new HashMap< String, String>();
		foodTypeMap.put("g0", "肉");
		foodTypeMap.put("g1", "蔬果");
		foodTypeMap.put("g2", "海鮮");
		foodTypeMap.put("g3", "米,麵,粉");
		foodTypeMap.put("g4", "南北雜貨");
				
		Map<String, String> mallStatusMap = new HashMap<String, String>();
		mallStatusMap.put("p0", "審核不通過");
		mallStatusMap.put("p1", "審核通過");
		mallStatusMap.put("p2", "未審核");
		mallStatusMap.put("p3", "下架");
		mallStatusMap.put("p4", "上架");
		
		Map<String, String> foodSupStatusMap = new HashMap<String, String>();
		foodSupStatusMap.put("s0", "未審核");
		foodSupStatusMap.put("s1", "審核通過");
		foodSupStatusMap.put("s2", "審核不過");
		foodSupStatusMap.put("s3", "解除合作");
		
		Map<String, String> mallOrStatusMap = new HashMap<String, String>();
		mallOrStatusMap.put("o0", "未付款");
		mallOrStatusMap.put("o1", "未出貨");
		mallOrStatusMap.put("o2", "已出貨");
		mallOrStatusMap.put("o3", "送達");
		mallOrStatusMap.put("o4", "訂單完成");
		
		
		ServletContext servletContext = event.getServletContext();
		servletContext.setAttribute("foodTypeMap", foodTypeMap);
		servletContext.setAttribute("mallStatusMap", mallStatusMap);
		servletContext.setAttribute("mallOrStatusMap", mallOrStatusMap);
		servletContext.setAttribute("foodSupStatusMap", foodSupStatusMap);

	}

}
