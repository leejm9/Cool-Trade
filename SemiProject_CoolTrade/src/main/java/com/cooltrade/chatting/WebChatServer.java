package com.cooltrade.chatting;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServlet;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.cooltrade.chatting.vo.ChatClient;
import com.cooltrade.member.model.service.MemberService;
import com.cooltrade.member.model.vo.Member;



@ServerEndpoint("/webChatServer")
public class WebChatServer extends HttpServlet {
	private static Map<Session,ChatClient> users = Collections.synchronizedMap(new HashMap<Session, ChatClient>());
	
	
	
	@OnMessage
	public void onMsg(String message, Session session) throws IOException{
		String userName = users.get(session).getName();
		System.out.println(userName + " : " + message);
		
		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				if(!currentSession.equals(session)){
					currentSession.getBasicRemote().sendText(userName + " : " + message);
				}
			}
		}
		
	}
	
	@OnOpen
	public void onOpen(Session session ){
		//System.out.println(uno);
		//Member m = new MemberService().selectMember(Integer.parseInt(uno));
		
		String userName = "dd";
		
		
		
		ChatClient client = new ChatClient();
		System.out.println(session);
		client.setName(userName);
		
		System.out.println(session + " connect");
		
		users.put(session, client);
		sendNotice(userName + "님이 입장하셨습니다. 현재 사용자 " + users.size() + "명");
	}
	
	
	public void sendNotice(String message){
		String userName = "server";
		System.out.println(userName + " : " + message);
		
		synchronized (users) {
			Iterator<Session> it = users.keySet().iterator();
			while(it.hasNext()){
				Session currentSession = it.next();
				try {
					currentSession.getBasicRemote().sendText(userName + " : " + message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
		String userName = users.get(session).getName();
		users.remove(session);
		sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + users.size() + "명");
	}

}