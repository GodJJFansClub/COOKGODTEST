package com.broadcast.controller;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.broadcast.model.BroadcastVO;
import com.cust.model.CustVO;



@ServerEndpoint(
		
		value="/notifications/{cust_ID}", //not sure
		configurator=GetHttpSessionConfigurator.class,
		encoders = {BroadcastEncoder.class},
		decoders = {BroadcastDecoder.class}
		)

public class BroadcastWebSocket {
	
	private static final List<BroadcastVO> broadcastVO = Collections.synchronizedList(new LinkedList<BroadcastVO>());
	private static final Map<String, Session> sessions = new ConcurrentHashMap<String, Session>();
	
	@OnOpen
	public void onOpen(@PathParam("cust_ID") String cust_ID,Session session)throws IOException, EncodeException{
		
		sessions.put(cust_ID, session);
		for(BroadcastVO broadcast : broadcastVO) {
			session.getBasicRemote().sendObject(broadcast);
			
		}
	}
	 // 有訊息從客戶端傳送過來，儲存到列表中，然後通知所有的客戶端
	@OnMessage
	public void onMessage(Session session, BroadcastVO broadcast) {
		broadcastVO.add(broadcast);
		for(String cust_ID :sessions.keySet()) {
			try {
				Session openSession = sessions.get(cust_ID);
				openSession.getBasicRemote().sendObject(broadcast);
			}catch(IOException | EncodeException ex) {
				sessions.remove(cust_ID);
				
			}
		}
	}
	
	//在onOpen方法里加入參數EndpointConfig config即可獲取HttpSession
	 // 有新的客戶端連線時，儲存此客戶端的session，並且把當前所有的information傳送給它
	
	@OnClose
	public void onClose(Session session)throws IOException, EncodeException{
		String cust_ID =sessions.keySet().toString();
		sessions.remove(cust_ID, session);
	}
	
	
}
