package com.broadcast.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.broadcast.model.BroadcastVO;



@ServerEndpoint(
		value="/notifications", //not sure
		encoders = {BroadcastEncoder.class},
		decoders = {BroadcastDecoder.class}
		)

public class BroadcastWebSocket {
	
	private static final List<BroadcastVO> broadcastVO = Collections.synchronizedList(new LinkedList<BroadcastVO>());
	private static final Set<Session>sessions = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage
	public void onMessage(Session session, BroadcastVO broadcast) {
		broadcastVO.add(broadcast);
		for(Session openSession : sessions) {
			try {
				openSession.getBasicRemote().sendObject(broadcast);
			}catch(IOException | EncodeException ex) {
				sessions.remove(openSession);
				
			}
		}
	}
	
	@OnOpen
	public void onOpen(Session session)throws IOException, EncodeException{
		sessions.add(session);
		for(BroadcastVO broadcast : broadcastVO) {
			session.getBasicRemote().sendObject(broadcast);
			
		}
	}
	
	@OnClose
	public void onClose(Session session)throws IOException, EncodeException{
		sessions.remove(session);
	}
	
	
}
