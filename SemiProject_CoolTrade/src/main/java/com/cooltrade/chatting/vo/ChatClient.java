package com.cooltrade.chatting.vo;

public class ChatClient {
    private String name;
    private String id;

    // 생성자, 게터 및 세터 메서드
    public ChatClient() {
    }

    public ChatClient(String name, String id) {
        this.name = name;
        this.id = id;
    }

    // name 필드의 게터 및 세터
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // id 필드의 게터 및 세터
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
