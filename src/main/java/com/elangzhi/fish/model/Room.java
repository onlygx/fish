package com.elangzhi.fish.model;

import java.util.List;

public class Room {
    private Long id;

    private String name;

    private Long parentId;

    private Long gameId;

    /**
     * 下级列表
     */
    private List<Room> child;

    public List<Room> getChild() {
        return child;
    }

    public void setChild(List<Room> child) {
        this.child = child;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }
}