package com.triptrip.board.dto;

import java.time.LocalDateTime;

public class Board {
	private int id;
	private String title;
	private String content;
	private String imgSrc;
	private int userId;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImgSrc() {
		return imgSrc;
	}

	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", content=" + content + ", imgSrc=" + imgSrc + ", userId="
				+ userId + ", createAt=" + createAt + ", updateAt=" + updateAt + "]";
	}
	

}
